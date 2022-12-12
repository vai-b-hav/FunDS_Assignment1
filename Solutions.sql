USE assingment_2;

-- Asnwer 1
SELECT 
      sid
    , basic + perks - (COALESCE(tax, 0) * basic / 100) AS `Net Salary`
FROM salary;

-- Answer 2
-- Alternative 1
DROP TEMPORARY TABLE IF EXISTS del_temp; 
CREATE TEMPORARY TABLE del_temp SELECT DISTINCT * FROM feedback;

TRUNCATE TABLE feedback;

INSERT INTO feedback
SELECT * FROM del_temp;

DROP TEMPORARY TABLE del_temp; 

-- Alternative 2
CALL duplicate_remove;	-- Refer DDL Script for SP Definition

SELECT * FROM feedback;