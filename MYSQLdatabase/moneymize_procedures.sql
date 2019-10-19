DELIMITER //
DROP PROCEDURE IF EXISTS saveuser//
CREATE PROCEDURE saveuser (IN phoneno char(11) ,IN pass varchar(20),IN email varchar(30),IN name varchar(30),IN wallet int) 						
BEGIN
	INSERT INTO user values(phoneno,email,name,wallet,pass);
END //



DROP PROCEDURE IF EXISTS savegroupevent//
CREATE PROCEDURE savegroupevent (IN description varchar(100),IN edate date,IN totalamt int,IN eowner char(11)) 
BEGIN
	INSERT INTO groupevent(description,date,totalAmt,owner) values(description,edate,totalamt,eowner);
	select *  from groupevent where owner=eowner and  description=description and date=edate and totalAmt=totalamt;
END //



DROP PROCEDURE IF EXISTS insertuseringroup//
CREATE PROCEDURE insertuseringroup (IN amount int,IN eid int,IN user CHAR(11),IN id int)
BEGIN
	INSERT INTO useringroup(amount,eventId,user) values(amount,eid,user);
    delete from pendinggrouprequests where pid = id;
END //

DROP PROCEDURE IF EXISTS insertuseringrouprequest//
CREATE PROCEDURE insertuseringrouprequest (IN amount int,IN eid int,IN user CHAR(11))
BEGIN
	INSERT INTO pendinggrouprequests(amount,user,eid) values(amount,user,eid);
END //


DROP PROCEDURE IF EXISTS adduseringroup//
CREATE PROCEDURE adduseringroup (IN amt int,IN eid int,IN user char(11)) 
BEGIN
	INSERT INTO useringroup(amount,eventId,user) values(amt,eid,user);
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
	INSERT INTO dailycategory(expenseId,category,amount) values((select expenseId from dailyexpenses where user=phones and Date = CURRENT_DATE),category,amount);
	update user set wallet = wallet - amount where phone = phones;
	update dailyexpenses SET total_amount=total_amount + amount where user=phones and Date = CURRENT_DATE;

END //




DROP PROCEDURE IF EXISTS insertinpersonalevent//
CREATE PROCEDURE insertinpersonalevent (IN id int,IN message varchar(100)) 
BEGIN
	IF EXISTS (SELECT * FROM personalevent WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id)) then
		Update personalevent set amount=amount + (select amount from pendingpersonalrequests  WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id)) WHERE lender=(select lender from pendingpersonalrequests where pid=id) and borrower=(select borrower from pendingpersonalrequests where pid=id);
		ELSE
		INSERT INTO personalevent (amount,lender,borrower) values ((select amount from pendingpersonalrequests where pid = id),(select lender from pendingpersonalrequests where pid = id),(select borrower from pendingpersonalrequests where pid = id));
		end if;
        insert into notification(time,descreption,user) values(NOW(),message,(select lender from pendingpersonalrequests where pid=id));
		delete from pendingpersonalrequests where pid=id;
END //


DROP PROCEDURE IF EXISTS paymoney//
CREATE PROCEDURE paymoney (IN id int) 
BEGIN	
	delete from personalevent where eid=id;
END //

DROP PROCEDURE IF EXISTS paygroupmoney//
CREATE PROCEDURE paygroupmoney (IN id int,IN userr varchar(11)) 
BEGIN	
	update user set wallet = wallet - (select amount from useringroup where pid = id) where phone=userr;
	delete from useringroup where pid=id;
END //

DROP PROCEDURE IF EXISTS addParent//
CREATE PROCEDURE addParent (IN parent varchar(11),IN child varchar(11)) 
BEGIN	
			IF EXISTS (SELECT * FROM supervisor WHERE child=child ) then
				update supervisor set parent=parent where child=child;
			ELSE
				insert into supervisor values (parent,child);
			end if;
END //


DROP PROCEDURE IF EXISTS ifParent//
CREATE PROCEDURE ifParent (IN uesr varchar(11)) 
BEGIN	
			select EXISTS (SELECT * FROM supervisor WHERE parent=user);			
END //


DROP PROCEDURE IF EXISTS addfriend//
CREATE PROCEDURE addfriend (IN uesr1 varchar(11),IN uesr2 varchar(11)) 
BEGIN	
			IF NOT EXISTS(SELECT * FROM friends WHERE (user1=user1 and user2=user2) or (user1=user2 and user2=user1)) then
						insert into friends values (user1,user2);
					end if;
END //


DROP PROCEDURE IF EXISTS getLatestDaily//
CREATE PROCEDURE getLatestDaily (IN euser varchar(11)) 
BEGIN	
	select * from dailyexpenses where user = euser order by Date limit 12;
END //

DROP PROCEDURE IF EXISTS getLatestMonthly//
CREATE PROCEDURE getLatestMonthly (IN euser varchar(11)) 
BEGIN	
	select SUM(total_amount),MONTHNAME(Date) from dailyexpenses where user = euser group by MONTH(Date) order by Date limit 12;
END //


DROP PROCEDURE IF EXISTS findfriends//
CREATE PROCEDURE findfriends (IN euser varchar(11)) 
BEGIN	
	if EXISTS(select user1 from friends where user1=euser) then
	SELECT name,wallet from user where phone in (select user2 from friends where user1=euser);
	
	elseif EXISTS(select user2 from friends where user2=euser) then
	SELECT name,wallet from user where phone in (select user1 from friends where user2=euser);
	
	ELSE
		SELECT name,wallet from user where phone=(select user2 from friends where user1="0");

	end if;
END //


DELIMITER ;