select * from hr;

alter table hr
change column ï»¿id emp_id varchar(20) Null;

UPDATE hr 
SET birthdate = CASE
    WHEN birthdate REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{1}/[0-9]{2}/[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%y'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{4}/[0-9]{2}/[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%Y/%m/%d'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%y'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%Y-%m-%d'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{2}.[0-9]{2}.[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m.%d.%y'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{2}.[0-9]{2}.[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m.%d.%Y'), '%Y-%m-%d')
    WHEN birthdate REGEXP '^[0-9]{4}.[0-9]{2}.[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%Y.%m.%d'), '%Y-%m-%d')
    ELSE NULL -- Sets birthdate to NULL if format doesn't match any known pattern
END 
WHERE birthdate IS NOT NULL;

select * from hr where birthdate = null;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr 
SET hire_date = CASE
    WHEN hire_date  REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{1}/[0-9]{2}/[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%m/%d/%y'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{4}/[0-9]{2}/[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%Y/%m/%d'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%m-%d-%y'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%m-%d-%Y'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%Y-%m-%d'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{2}.[0-9]{2}.[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%m.%d.%y'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{2}.[0-9]{2}.[0-9]{4}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%m.%d.%Y'), '%Y-%m-%d')
    WHEN hire_date REGEXP '^[0-9]{4}.[0-9]{2}.[0-9]{2}$' 
        THEN DATE_FORMAT(STR_TO_DATE(hire_date , '%Y.%m.%d'), '%Y-%m-%d')
    ELSE NULL -- Sets hire_date to NULL if format doesn't match any known pattern
END 
WHERE hire_date  IS NOT NULL;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '', date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')), '0000-00-00')
WHERE true;

SELECT termdate from hr;

SET sql_mode = 'ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;


ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

describe hr;




