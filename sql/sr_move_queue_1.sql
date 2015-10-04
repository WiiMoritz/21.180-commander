use asupcouk_asup;
Drop procedure if exists sr_move_queue_1;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;

-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE  asupcouk_asup . sr_move_queue_1  (sr_gameno INT)
BEGIN
sproc:BEGIN

-- Process income orders as generated by SR_MOVE_QUEUE_INCM
-- Should be called by the SR_MOVE_QUEUE macro
-- $Id: sr_move_queue_1.sql 242 2014-07-13 13:48:48Z paul $
DECLARE proc_name TEXT DEFAULT "SR_MOVE_QUEUE_1";
DECLARE sr_turnno INT DEFAULT 0;
DECLARE sr_phaseno INT DEFAULT 0;
DECLARE sr_userno INT;
DECLARE sr_terrno INT DEFAULT 0;
DECLARE sr_major INT DEFAULT 0;
DECLARE sr_minor INT DEFAULT 0;
DECLARE last_userno INT DEFAULT 0;
DECLARE sr_troops_paid INT DEFAULT 0;
DECLARE sr_troops_unpaid INT DEFAULT 0;
DECLARE sr_pay_boomer INT DEFAULT 0;
DECLARE sr_pay_major INT DEFAULT 0;
DECLARE sr_pay_minor INT DEFAULT 0;
DECLARE sr_cash INT DEFAULT 0;
DECLARE sr_restart_cost INT DEFAULT 0;
DECLARE sr_pay_company CHAR(1) DEFAULT 'N';
DECLARE sr_companies_paid INT DEFAULT 0;
DECLARE sr_companies_amount INT DEFAULT 0;
DECLARE sr_companies_unpaid INT DEFAULT 0;
DECLARE sr_cardno INT DEFAULT 0;
DECLARE sr_running CHAR(1);
DECLARE sr_resource TEXT;
DECLARE sr_resource_amount INT DEFAULT 0;
DECLARE sr_minerals_paid CHAR(1) DEFAULT 'N';
DECLARE sr_oil_paid CHAR(1) DEFAULT 'N';
DECLARE sr_grain_paid CHAR(1) DEFAULT 'N';

DECLARE done INT DEFAULT 0;

DECLARE terrs CURSOR FOR
Select userno, terrno, major, minor
From sp_board
Where gameno=sr_gameno
 and userno > 0
Order By userno, terrno, major desc, minor desc
;

DECLARE comps CURSOR For
Select userno, cardno, running, res_type, Case When trading='Trading' Then res_amount Else 0 End As res_amount
From sv_companies
Where gameno=sr_gameno
 and userno>0
Order by userno, res_amount desc;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

-- Check game is valid
IF (sr_gameno not in (Select gameno From sp_game Where phaseno=1)) THEN
    Insert Into sp_old_orders (gameno, ordername, order_code)
    Values (sr_gameno, proc_name, Concat("<FAIL><Reason>Invalid game or phase</Reason><Game>",sr_gameno,"</Game></FAIL>"));
    LEAVE sproc;
END IF;
Select turnno, phaseno, company_restart_cost Into sr_turnno, sr_phaseno, sr_restart_cost From sp_game Where gameno=sr_gameno;

-- Add on income from board to resources
Create Temporary Table tmp_incm As
Select r.userno
       ,Sum(Length(p.terrtype)=4) As terrs
       ,Sum(Length(p.terrtype)=3) As sea_terrs
       ,Count(r2.userno) As sup_terrs
From sp_resource r
Left Join sp_board b On r.gameno=b.gameno and r.userno=b.userno
Left Join sp_places p On b.terrno=p.terrno
Left Join sp_powers w On p.terrtype=w.terrtype
Left Join sp_resource r2 On r2.gameno=r.gameno and w.powername=r2.powername
Where r.gameno=sr_gameno
 and r.dead != 'Y'
Group By r.userno
;

Update sp_resource r
Join tmp_incm t on r.userno=t.userno
Set cash=cash+sup_terrs*200+(terrs-sup_terrs)*100+sea_terrs*50
Where r.gameno=sr_gameno
;

Insert Into sp_message_queue (gameno, userno, message)
Select sr_gameno, userno
       ,Concat("You have received ",sup_terrs*200+(terrs-sup_terrs)*100," from "
              ,Case When sup_terrs > 1 Then Concat(sup_terrs," Superpower territories")
                    Else "1 Superpower territory"
               End
			  ,Case When terrs-sup_terrs > 0 and sea_terrs = 0 Then " and "
                    When terrs-sup_terrs > 0 and sea_terrs > 0 Then ", "
					Else ""
			   End
              ,Case When terrs-sup_terrs > 1 Then Concat(terrs-sup_terrs," other territories")
                    When terrs-sup_terrs = 1 Then "1 other territory"
                    Else ""
               End
			  ,Case When sea_terrs > 0 Then " and "
                    Else ""
			   End
              ,Case When sea_terrs > 1 Then Concat(sea_terrs," seas.")
                    When sea_terrs = 1 Then "1 sea."
                    Else "."
               End
              )
From tmp_incm
;

Drop table tmp_incm;

-- Add bonds
Update sp_resource Set cash=cash+2000+(sr_turnno-3)*500, boomer_money='Y'
Where gameno=sr_gameno
 and userno in (
    Select userno
    From sp_orders
    Where gameno=sr_gameno
     and ordername='SR_ORDERXML'
     and ExtractValue(order_code,'//Bond')='Y'
    )
;

Update sp_message_queue
Set message = Concat(message,' You have cashed in your bond worth ',2000+(sr_turnno-3)*500,'.')
Where gameno=sr_gameno
 and userno in (
    Select userno
    From sp_orders
    Where gameno=sr_gameno
     and ordername='SR_ORDERXML'
     and ExtractValue(order_code,'//Bond')='Y'
    )
;

-- Pay interest
Update sp_resource r
Join sp_orders o On r.gameno=o.gameno and r.userno=o.userno and turnno=sr_turnno and phaseno=sr_phaseno and o.ordername='SR_ORDERXML'
Set cash = cash - ExtractValue(order_code,'/PAYSALARIES/PayBank/Cost')
 ,interest = interest - ExtractValue(order_code,'/PAYSALARIES/PayBank/Cost')
Where r.gameno=sr_gameno
;

Update sp_message_queue m
Join sp_orders o On m.gameno=o.gameno and m.userno=o.userno and turnno=sr_turnno and phaseno=sr_phaseno and o.ordername='SR_ORDERXML'
Set message = Concat(message,' You paid ',ExtractValue(order_code,'/PAYSALARIES/PayBank/Cost'),' loan interest.')
Where m.gameno=sr_gameno
 and ExtractValue(order_code,'/PAYSALARIES/PayBank/Cost') > 0
;

-- Repay loan
Update sp_resource r
Join sp_orders o On r.gameno=o.gameno and r.userno=o.userno and turnno=sr_turnno and phaseno=sr_phaseno and o.ordername='SR_ORDERXML'
Set cash = cash - ExtractValue(order_code,'/PAYSALARIES/PayBank/Repay')
 ,loan = loan - ExtractValue(order_code,'/PAYSALARIES/PayBank/Repay')
Where r.gameno=sr_gameno
;

Update sp_message_queue m
Join sp_orders o On m.gameno=o.gameno and m.userno=o.userno and turnno=sr_turnno and phaseno=sr_phaseno and o.ordername='SR_ORDERXML'
Set message = Concat(message,' You repaid ',ExtractValue(order_code,'/PAYSALARIES/PayBank/Repay'),' of your loan.')
Where m.gameno=sr_gameno
 and ExtractValue(order_code,'/PAYSALARIES/PayBank/Repay') > 0
;


-- Process troops in territories
Set done=0;
Set last_userno=0;
OPEN terrs;
read_loop: LOOP
    FETCH FROM terrs INTO sr_userno, sr_terrno, sr_major, sr_minor;

    -- Message at end of processing
    IF sr_userno != last_userno or done=1 THEN
        Update sp_message_queue
        Set message = Concat(message
                            ,Case
                              When sr_troops_paid > 1 Then Concat(' You have paid ',sr_troops_paid,' troops costing ',sr_troops_paid*10,'.')
                              When sr_troops_paid = 1 Then Concat(' You have paid 1 troop costing 10.')
                              Else ''
                             End
                            ,Case
                              When sr_troops_unpaid > 1 Then Concat(' You did not pay ',sr_troops_unpaid,' troops who have now disbanded.')
                              When sr_troops_unpaid = 1 Then Concat(' You did not pay 1 troop who has now disbanded.')
                              Else ''
                             End
                            )
        Where gameno=sr_gameno
         and userno=last_userno
         and last_userno > 0
        ;
        Set sr_troops_paid=0;
        Set sr_troops_unpaid=0;
    END IF;

    -- Stop processing
    IF done THEN LEAVE read_loop; END IF;

    -- Get orders and available cash
    Select ExtractValue(order_code,Concat('/PAYSALARIES/PayTroops/Boomers[../Terrno/text()="',sr_terrno,'"]'))
           ,ExtractValue(order_code,Concat('/PAYSALARIES/PayTroops/Major[../Terrno/text()="',sr_terrno,'"]'))
           ,ExtractValue(order_code,Concat('/PAYSALARIES/PayTroops/Minor[../Terrno/text()="',sr_terrno,'"]'))
           ,cash
    Into sr_pay_boomer, sr_pay_major, sr_pay_minor, sr_cash
    From sp_orders o
    Left Join sp_resource r
    On o.gameno=r.gameno and o.userno=r.userno
    Where o.gameno=sr_gameno
     and o.userno=sr_userno
     and turnno=sr_turnno
     and phaseno=sr_phaseno
     and ordername='SR_ORDERXML'
    ;

    -- Ensure enough cash to pay, and no over payment
    Set sr_pay_minor = Least(sr_pay_minor,sr_cash/10,sr_minor);
    Set sr_pay_major = Least(sr_pay_major,(sr_cash/10)-sr_pay_minor,sr_major);

    -- Remove cash
    Update sp_resource Set cash=cash-(sr_pay_major+sr_pay_minor)*10 Where gameno=sr_gameno and userno=sr_userno;

    IF @sr_debug='P' THEN 
		Select "Paying troops", sr_userno, sr_terrno, sr_pay_boomer, sr_pay_major,sr_major, sr_pay_minor, sr_minor;
    END IF;
    -- Update troops
    Update sp_board
    Set major = Greatest(sr_pay_boomer,Least(sr_pay_major, sr_major)), minor = Least(sr_pay_minor,sr_minor)
    Where gameno=sr_gameno and terrno=sr_terrno
    ;

    -- Add totals
    Set sr_troops_paid = sr_troops_paid + sr_pay_minor + sr_pay_major;
    Set sr_troops_unpaid = sr_troops_unpaid + (sr_minor-sr_pay_minor) + (sr_major-sr_pay_major-sr_pay_boomer);

    -- Change last userno market
    Set last_userno=sr_userno;
END LOOP;
CLOSE terrs;

-- Pay companies
Set done=0;
Set last_userno=0;
OPEN comps;
read_loop: LOOP
    FETCH FROM comps INTO sr_userno, sr_cardno, sr_running, sr_resource, sr_resource_amount;

    -- Message at end of processing
    IF sr_userno != last_userno or done=1 THEN
        Update sp_message_queue
        Set message = Concat(message
                            ,Case
                              When sr_companies_paid > 1 Then Concat(' You have paid ',sr_companies_paid,' companies costing ',sr_companies_amount,'.')
                              When sr_companies_paid = 1 Then Concat(' You have paid 1 company costing ',sr_companies_amount,'.')
                              Else ''
                             End
                            ,Case
                              When sr_companies_unpaid > 1 Then Concat(' You did not pay ',sr_companies_unpaid,' companies, which are now shut down.')
                              When sr_companies_unpaid = 1 Then Concat(' You did not pay 1 company which is now shut down.')
                              Else ''
                             End
                            )
        Where gameno=sr_gameno
         and userno=last_userno
         and last_userno > 0
        ;
        -- Add bonus resources
        Update sp_resource
        Set
         minerals=minerals+Case When sr_minerals_paid='Y' Then resource_tech Else 0 End
         ,oil=oil+Case When sr_oil_paid='Y' Then resource_tech Else 0 End
         ,grain=grain+Case When sr_grain_paid='Y' Then resource_tech Else 0 End
        Where gameno=sr_gameno
         and userno=last_userno
        ;
        -- Reset variables
        Set sr_companies_paid=0;
        Set sr_companies_amount=0;
        Set sr_companies_unpaid=0;
        Set sr_minerals_paid='N';
        Set sr_oil_paid='N';
        Set sr_grain_paid='N';
    END IF;

    -- Stop processing
    IF done THEN LEAVE read_loop; END IF;

    -- Get orders and available cash
    Select ExtractValue(order_code,Concat('/PAYSALARIES/PayCompany/Running[../Cardno/text()="',sr_cardno,'"]'))
           ,cash
    Into sr_pay_company, sr_cash
    From sp_orders o
    Left Join sp_resource r
    On o.gameno=r.gameno and o.userno=r.userno
    Where o.gameno=sr_gameno
     and o.userno=sr_userno
     and turnno=sr_turnno
     and phaseno=sr_phaseno
     and ordername='SR_ORDERXML'
    ;

    -- Ensure company can be paid
    IF sr_cash < 50 + Case When sr_running='N' Then sr_restart_cost Else 0 End THEN Set sr_pay_company = 'N'; END IF;

    -- Remove cash
    IF sr_pay_company = 'Y' THEN
        -- Update company card
        Update sp_cards Set running='Y' Where gameno=sr_gameno and cardno=sr_cardno;
        -- Update resources
        IF sr_resource = 'MINERALS' THEN
                Update sp_resource
                Set minerals=minerals+sr_resource_amount
                    ,cash=cash - 50 - Case When sr_running='N' Then sr_restart_cost Else 0 End
                Where gameno=sr_gameno and userno=sr_userno
                ;
                Set sr_minerals_paid='Y';
        ELSEIF sr_resource = 'OIL' THEN
                Update sp_resource
                Set oil=oil+sr_resource_amount
                    ,cash=cash - 50 - Case When sr_running='N' Then sr_restart_cost Else 0 End
                Where gameno=sr_gameno and userno=sr_userno
                ;
                Set sr_oil_paid='Y';
        ELSE
                Update sp_resource
                Set grain=grain+sr_resource_amount
                    ,cash=cash - 50 - Case When sr_running='N' Then sr_restart_cost Else 0 End
                Where gameno=sr_gameno and userno=sr_userno
                ;
                Set sr_grain_paid='Y';
        END IF;
        -- Update totals
        Set sr_companies_paid = sr_companies_paid + 1;
        Set sr_companies_amount = sr_companies_amount + 50 + Case When sr_running='N' Then sr_restart_cost Else 0 End;
    ELSE
        -- Stop company
        Update sp_cards Set running='N' Where gameno=sr_gameno and cardno=sr_cardno;
        -- Update totals
        Set sr_companies_unpaid = sr_companies_unpaid + 1;
    END IF;

    -- Change last userno market
    Set last_userno=sr_userno;
END LOOP;
CLOSE comps;

-- Add final balance to message
Update sp_message_queue m
Join sp_resource r
On m.gameno=r.gameno and m.userno=r.userno
Set message = Concat(message,' Your new balance is ',cash,'.')
Where m.gameno=sr_gameno
;

-- /* */
END sproc;
END
$$

Delimiter ;
/*
-- Set board to end of turn, and move along to generate orders
Drop Temporary Table If Exists tmp_incm;
Delete from sp_orders Where gameno=48;
Delete from sp_messages;
Delete From sp_message_queue;
Update sp_game Set turnno=3, phaseno=7, process=null Where Gameno=48;
Update sp_resource Set interest=0 Where gameno=48;
Update sp_resource Set loan=2000, interest=200,cash=10000,boomer_money='N', minerals=0, oil=0, grain=0 Where powername='Europe' and gameno=48;
Update sp_resource Set loan=3000,cash=50 Where powername='South America' and gameno=48;
Update sp_resource Set cash=4464 Where powername='Africa' and gameno=48;
Update sp_resource Set cash=205 Where powername='Arabia' and gameno=48;
Update sp_resource Set cash=1413 Where powername='Australia' and gameno=48;
Update sp_resource Set cash=3905 Where powername='Canada' and gameno=48;
Update sp_resource Set cash=0 Where powername='China' and gameno=48;
Update sp_resource Set cash=13740 Where powername='North America' and gameno=48;
Update sp_resource Set cash=10181 Where powername='Russia' and gameno=48;
Update sp_cards Set running=Case When rand() < 0.25 Then 'N' Else 'Y' End Where gameno=48 and userno>0;
Call sr_take_territory(48,'Nanling','China',0,200);
Call sr_move_queue(48,'N');

-- Process next orders
Select powername, r.userno, loan, extractvalue(order_code,'//PayBank/Cost'), cash, boomer_money, extractvalue(order_code,'//Bond')
From sp_resource r
Left Join sp_orders o On r.userno=o.userno and r.gameno=o.gameno and o.ordername='SR_ORDERXML'
Where r.gameno=48
Order By powername
;
-- Take a bond
Update sp_orders
Set order_code=UpdateXML(order_code,'//Bond',sf_fxml('Bond','Y'))
Where userno=3227 and gameno=48 and ordername='SR_ORDERXML'
;
-- Check over payment fixed
Update sp_orders
Set order_code=UpdateXML(order_code,'//PayTroops[text()="Tibet"]/Minor',sf_fxml('Minor','200'))
Where userno=3244 and gameno=48 and ordername='SR_ORDERXML'
;

-- Run procedure
Call sr_move_queue_1(48);

Select powername, r.userno, cash, extractvalue(order_code,'//Bond')
From sp_resource r
Left Join sp_orders o On r.userno=o.userno and r.gameno=o.gameno and o.ordername='SR_ORDERXML'
Where r.gameno=48
Order By powername
;
Select * from sp_message_queue;
*/