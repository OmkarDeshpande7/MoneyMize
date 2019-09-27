DELIMITER //
DROP FUNCTION IF EXISTS checkpass//

CREATE FUNCTION checkpass (phoneno char(11) ,pass varchar(20)) RETURNS tinyint(1) DETERMINISTIC
BEGIN
DECLARE val tinyint(1);
IF ((SELECT password from user where phone=phoneno) = pass) THEN
	SET val=1;
ELSE
	SET VAL=0;
END IF;
RETURN val;
END //

DELIMITER ;
