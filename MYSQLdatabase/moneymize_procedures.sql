DELIMITER //
DROP PROCEDURE IF EXISTS saveuser//

CREATE PROCEDURE saveuser (IN phoneno char(11) ,IN pass varchar(20),IN email varchar(30),IN name varchar(30),IN wallet int) 						
BEGIN
	INSERT INTO user values(phoneno,email,name,wallet,pass);
END //


DROP PROCEDURE IF EXISTS savegroupevent//

CREATE PROCEDURE savegroupevent (IN id int ,IN description varchar(100),IN edate date,IN totalamt int,IN owner char(11)) 
BEGIN
	INSERT INTO groupevent values(id,description,edate,totalamt,owner);
END //


DROP PROCEDURE IF EXISTS savepersonalevent//

CREATE PROCEDURE savepersonalevent (IN amount int ,IN status varchar(10),IN lender char(11),IN borrower char(11)) 
BEGIN
	INSERT INTO personalevent values(amount,status,lender,borrower);
END //


DROP PROCEDURE IF EXISTS savedailyexpenses//

CREATE PROCEDURE savedailyexpenses (IN phones varchar(11),IN amount int,IN category varchar(30)) 
BEGIN
IF NOT EXISTS (select * from dailyexpenses where Date = CURRENT_DATE and user = phones) then
	INSERT INTO dailyexpenses(user,Date,total_amount) values(phones,CURRENT_DATE,0);
	end if;
	INSERT INTO dailycategory(expenseId,user,category,amount) values((select expenseId from dailyexpenses where user=phones),phones,category,amount);
	update user set wallet = wallet - amount where phone = phones;
END //





DROP PROCEDURE IF EXISTS insertinpersonalevent//

CREATE PROCEDURE insertinpersonalevent (IN id int) 
BEGIN
	IF EXISTS (SELECT * FROM personalevent WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id)) then
		Update personalevent set amount=amount + (select amount from pendingpersonalrequests  WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id)) WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id);
		ELSE
		INSERT INTO personalevent (amount,lender,borrower) values ((select amount from pendingpersonalrequests where pid = id),(select lender from pendingpersonalrequests where pid = id),(select borrower from pendingpersonalrequests where pid = id));
		end if;
		update user set wallet = wallet - (select amount from pendingpersonalrequests where pid = id) where phone=(select lender from pendingpersonalrequests where pid=id);
		update user set wallet = wallet + (select amount from pendingpersonalrequests where pid = id) where phone=(select borrower from pendingpersonalrequests where pid=id);
		delete from pendingpersonalrequests where pid=id;
END //


DROP PROCEDURE IF EXISTS paymoney//

CREATE PROCEDURE paymoney (IN id int) 
BEGIN
	
		update user set wallet = wallet - (select amount from personalevent where eid = id) where phone=(select borrower from personalevent where eid=id);
		update user set wallet = wallet + (select amount from personalevent where eid = id) where phone=(select lender from personalevent where eid=id);
		delete from personalevent where eid=id;
END //





DELIMITER ;
