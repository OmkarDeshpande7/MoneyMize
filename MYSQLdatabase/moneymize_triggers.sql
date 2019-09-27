DELIMITER //

DROP TRIGGER IF EXISTS onpersonalevent//

CREATE TRIGGER onpersonalevent  after insert on personalevent for each row 
BEGIN
	update user set wallet=wallet - new.amount where phone=new.lender;
    update user set wallet=wallet + new.amount where phone=new.borrower;
END //


DROP TRIGGER IF EXISTS ondeletepersonalevent//

CREATE TRIGGER ondeletepersonalevent  before delete on personalevent for each row 
BEGIN
	update user set wallet=wallet + old.amount where phone=old.lender;
    update user set wallet=wallet - old.amount where phone=old.borrower;
    INSERT INTO personaleventlog values (old.amount,"paid",old.lender,old.borrower,old.eventId);
END //


DROP TRIGGER IF EXISTS ondailyexpensesum//

CREATE TRIGGER ondailyexpensesum  before insert on dailyexpenses for each row 
BEGIN
	SET new.amount=new.breakfast + new.lunch + new.dinner + new.extras;
   
END //
DELIMITER ;



