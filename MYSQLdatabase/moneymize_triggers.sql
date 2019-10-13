DELIMITER //

DROP TRIGGER IF EXISTS onpersonalevent//

CREATE TRIGGER onpersonalevent  after insert on personalevent for each row 
BEGIN
	update user set wallet=wallet - new.amount where phone=new.lender;
    update user set wallet=wallet + new.amount where phone=new.borrower;
	insert into allLog values (new.amount,CONCAT("You Borrowed money from ",(select name from user where phone=new.lender)),new.borrower);
	insert into allLog values (new.amount,CONCAT("You lent money to ",(select name from user where phone=new.borrower)),new.lender);
END //



DROP TRIGGER IF EXISTS ongroupevent//
CREATE TRIGGER ongroupevent  after insert on groupevent for each row 
BEGIN
	update user set wallet=wallet - new.totalAmt where phone=new.owner;
	insert into allLog values (new.totalAmt,CONCAT("You created group event ",new.description),new.owner);
END //


DROP TRIGGER IF EXISTS onuseringroup//

CREATE TRIGGER onuseringroup  after insert on useringroup for each row 
BEGIN
	insert into allLog values (new.amount,CONCAT("You participated in group event ",(select description from groupevent where eventId=new.eventId)),new.user);
END //


DROP TRIGGER IF EXISTS ondeletepersonalevent//
CREATE TRIGGER ondeletepersonalevent  before delete on personalevent for each row 
BEGIN
	update user set wallet=wallet + old.amount where phone=old.lender;
    update user set wallet=wallet - old.amount where phone=old.borrower;
	insert into allLog values (old.amount,CONCAT("You paid pending amount to ",(select name from user where phone=old.lender)),old.borrower);
	insert into allLog values (old.amount,CONCAT((select name from user where phone=old.lender)," paid your pending amount"),old.lender);
END //




DROP TRIGGER IF EXISTS ondailyexpensesum//

CREATE TRIGGER ondailyexpensesum  before insert on dailycategory for each row 
BEGIN
	insert into allLog values (new.amount,CONCAT("You spent money on ",new.category),(select user from dailyexpenses where expenseId=new.expenseId)); 
END //



DELIMITER ;



