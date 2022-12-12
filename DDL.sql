CREATE DATABASE IF NOT EXISTS assingment_2;

USE assingment_2;

DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS feedback;
DROP PROCEDURE IF EXISTS duplicate_remove;

CREATE TABLE salary (
	sid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	basic INT,
	perks INT,
	tax INT
);

CREATE TABLE feedback (
	course VARCHAR(50),
	quality INT,
	details VARCHAR(100)
);

DELIMITER $$
CREATE PROCEDURE duplicate_remove()
BEGIN

-- declare variables to store cursor values
DECLARE vcourse VARCHAR(50);
DECLARE vquality INT;
DECLARE vdetails VARCHAR(50);
DECLARE vdellim INT;

-- declare variable for continue handler
DECLARE finished INTEGER DEFAULT 0;

-- declare the cursor
DECLARE dl_cr CURSOR
		FOR SELECT course, quality, details, COUNT(*) - 1 AS DelLim
			FROM feedback
            GROUP BY course, quality, details
            HAVING COUNT(*) > 1;
-- Here, the value of DelLim helps us delete all but one record of duplicate entries

DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

OPEN dl_cr; 

DelDuplicate: LOOP
        FETCH dl_cr INTO vcourse, vquality, vdetails, vdellim;
		
        IF finished = 1 THEN 
		    LEAVE DelDuplicate;
        END IF;
        
        SET @vquery = CONCAT('DELETE FROM feedback 
                              WHERE course =''', vcourse,''' 
                              AND quality = ', vquality,' 
                              AND details = ''', vdetails,''' 
                              LIMIT ', vdellim);
		
        PREPARE qry FROM @vquery;
        EXECUTE qry; 
END LOOP DelDuplicate;

CLOSE dl_cr;

END $$
DELIMITER ;