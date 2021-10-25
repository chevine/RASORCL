-------------------------------------------------------------------------------
-- Change all occurrences of 'NEW JERSEY' to 'NJ'
SELECT CITY_STATE
, REGEXP_REPLACE(CITY_STATE, 'NEW JERSEY', 'NJ')
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE TRIM(CITY_STATE) LIKE '%NEW JERSEY'
GROUP BY CITY_STATE, REGEXP_REPLACE(CITY_STATE, 'NEW JERSEY', 'NJ')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(CITY_STATE, 'NEW JERSEY', 'NJ')
WHERE TRIM(CITY_STATE) LIKE '%NEW JERSEY';
/************************************************************
************************************************************/


-------------------------------------------------------------------------------
-- Change all occurrences where where the state contains at least one period
SELECT CITY_STATE
, REGEXP_REPLACE(CITY_STATE, 'N[.]?J[.]?', 'NJ')
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(CITY_STATE, 'N[.]?J[.]?') > 0
AND REGEXP_INSTR(CITY_STATE, 'NJ') <= 0
GROUP BY CITY_STATE, REGEXP_REPLACE(CITY_STATE, 'N[.]?J[.]?', 'NJ')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(CITY_STATE, 'N[.]?J[.]?', 'NJ')
WHERE REGEXP_INSTR(CITY_STATE, 'N[.]?J[.]?') > 0
AND REGEXP_INSTR(CITY_STATE, 'NJ') <= 0;
/************************************************************
************************************************************/





-------------------------------------------------------------------------------
-- Change all occurrences of 'N J' to 'NJ'
SELECT CITY_STATE
, REGEXP_REPLACE(CITY_STATE, 'N[ ]+J', 'NJ')
, COUNT(*) AS COUNT
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(CITY_STATE, 'N[ ]+J') > 0
GROUP BY CITY_STATE, REGEXP_REPLACE(CITY_STATE, 'N[ ]+J', 'NJ')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(CITY_STATE, 'N[ ]+J', 'NJ')
WHERE REGEXP_INSTR(CITY_STATE, 'N[ ]+J') > 0;
/************************************************************
************************************************************/







-------------------------------------------------------------------------------
-- Change all occurrences where a comma does not seperate the city and 'NJ'.
SELECT CITY_STATE
, REGEXP_REPLACE(CITY_STATE, '[ ]+NJ', ',NJ')
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(CITY_STATE, ',') <= 0
AND REGEXP_INSTR(CITY_STATE, '[ ]+NJ') > 0
GROUP BY CITY_STATE, REGEXP_REPLACE(CITY_STATE, '[ ]+NJ', ',NJ')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(CITY_STATE, '[ ]+NJ', ',NJ')
WHERE REGEXP_INSTR(CITY_STATE, ',') <= 0
AND REGEXP_INSTR(CITY_STATE, '[ ]+NJ') > 0;
/************************************************************
************************************************************/


-------------------------------------------------------------------------------
-- Change all occurrences that match the following conditions
-- 1. A comma does not exist in CITY_STATE
-- 2. There is at least one embedded space
-- 3. There are only two words seperated by at least one embbedded space
SELECT CITY_STATE
, REGEXP_REPLACE(TRIM(CITY_STATE), '[ ]+', ', ')
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(CITY_STATE, ',') <= 0
AND REGEXP_INSTR(TRIM(CITY_STATE), '^[A-Za-z]+[ ]+[A-Za-z]{2}$') > 0
AND CITY_STATE NOT LIKE '%WASHINGTON%DC%'
GROUP BY CITY_STATE, REGEXP_REPLACE(TRIM(CITY_STATE), '[ ]+', ',')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(TRIM(CITY_STATE), '[ ]+', ', ')
WHERE REGEXP_INSTR(CITY_STATE, ',') <= 0
AND REGEXP_INSTR(TRIM(CITY_STATE), '^[A-Za-z]+[ ]+[A-Za-z]{2}$') > 0
AND CITY_STATE NOT LIKE '%WASHINGTON%DC%';
/************************************************************
************************************************************/

-------------------------------------------------------------------------------
-- Change all occurrences of ('N.J.', 'N. J.') to 'NJ'
SELECT CITY_STATE
, REGEXP_REPLACE(CITY_STATE, '[Nn]\.[Jj]\.', 'NJ')
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(CITY_STATE, '[Nn]\.[Jj]\.') > 0
GROUP BY CITY_STATE, REGEXP_REPLACE(CITY_STATE, '[Nn]\.[Jj]\.', 'NJ')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(CITY_STATE, '[Nn]\.[Jj]\.', 'NJ')
WHERE REGEXP_INSTR(CITY_STATE, '[Nn]\.[Jj]\.') > 0;
/************************************************************
************************************************************/


-------------------------------------------------------------------------------
-- Change all occurrences of ('N.Y.', 'N. Y.') to 'NY'
SELECT CITY_STATE
, REGEXP_REPLACE(CITY_STATE, '[Nn]\.[Yy]\.', 'NY')
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(CITY_STATE, '[Nn]\.[Yy]\.') > 0
GROUP BY CITY_STATE, REGEXP_REPLACE(CITY_STATE, '[Nn]\.[Yy]\.', 'NY')
ORDER BY COUNT(*) DESC;


UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(CITY_STATE, '[Nn]\.[Yy]\.', 'NY')
WHERE REGEXP_INSTR(CITY_STATE, '[Nn]\.[Yy]\.') > 0;
/************************************************************
************************************************************/


-------------------------------------------------------------------------------
-- Correct the spelling of PRINCETON JCT
SELECT CITY_STATE
, REGEXP_REPLACE(TRIM(CITY_STATE),'PRINCETONJ', 'PRINCETON J') NEW_CITY_STATE
, MAX(length(REGEXP_REPLACE(TRIM(CITY_STATE),'PRINCETONJ', 'PRINCETON J'))) AS MAX
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE UPPER(CITY_STATE) LIKE 'PRINCETON%J%N%'
GROUP BY CITY_STATE, REGEXP_REPLACE(TRIM(CITY_STATE),'PRINCETONJ', 'PRINCETON J')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(TRIM(CITY_STATE),'PRINCETONJ', 'PRINCETON J')
WHERE UPPER(CITY_STATE) LIKE 'PRINCETON%J%N%';

-------------------------------------------------------------------------------
--  The CITY_STATE does not have a comma between city and state
SELECT CITY_STATE
, REGEXP_REPLACE(TRIM(CITY_STATE),'([ ])+([A-Za-z][A-Za-z])$',',\2') NEW_CITY_STATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE INSTR(CITY_STATE, ',') <=0
AND REGEXP_INSTR(TRIM(CITY_STATE),'([ ])+([A-Za-z]){2}$') >= 1
GROUP BY CITY_STATE, REGEXP_REPLACE(TRIM(CITY_STATE),'([ ])+([A-Za-z][A-Za-z])$',',\2')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(TRIM(CITY_STATE),'([ ])+([A-Za-z][A-Za-z])$',',\2')
WHERE INSTR(CITY_STATE, ',') <=0
AND REGEXP_INSTR(TRIM(CITY_STATE),'([ ])+([A-Za-z]){2}$') >= 1;
/************************************************************
************************************************************/


-------------------------------------------------------------------------------
-- Change CITY_STATE where the state has at least one period in the state abbreviation
SELECT CITY_STATE
, REGEXP_REPLACE(RTRIM(CITY_STATE),'([A-Za-z])([\.])$','\1') NEW_CITY_STATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),'([A-Za-z])([\.])$') >= 1
GROUP BY CITY_STATE, REGEXP_REPLACE(RTRIM(CITY_STATE),'([A-Za-z])([\.])$','\1')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(RTRIM(CITY_STATE),'([A-Za-z])([\.])$','\1')
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),'([A-Za-z])([\.])$') >= 1;
/************************************************************
************************************************************/

-------------------------------------------------------------------------------
-- Change CITY_STATE where the state has at least one period in the state abbreviation
SELECT CITY_STATE
, REGEXP_REPLACE(RTRIM(CITY_STATE),',[ ]?([A-Za-z])([\.])([A-Za-z])$',',\1\3') NEW_CITY_STATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),',[ ]?([A-Za-z])([\.])([A-Za-z])$') >= 1
GROUP BY CITY_STATE, REGEXP_REPLACE(RTRIM(CITY_STATE),',[ ]?([A-Za-z])([\.])([A-Za-z])$',',\1\3')
ORDER BY COUNT(*) DESC;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(RTRIM(CITY_STATE),',[ ]?([A-Za-z])([\.])([A-Za-z])$',',\1\3')
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),',[ ]?([A-Za-z])([\.])([A-Za-z])$') >= 1;
/************************************************************
************************************************************/



-------------------------------------------------------------------------------
-- Change CITY_STATE where the last character is not alpha
-- These entries have to be resolved manually.
SELECT CITY_STATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),'[A-Za-z]$') <= 0
GROUP BY CITY_STATE
ORDER BY COUNT(*) DESC;
/************************************************************
************************************************************/


-------------------------------------------------------------------------------
-- Change CITY_STATE where the length of the state abbreviation is more than two
SELECT CITY_STATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),',[ ]?[A-Za-z]{3,}$') >= 1
GROUP BY CITY_STATE
ORDER BY COUNT(*) DESC;


UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(RTRIM(CITY_STATE),'TEXAS','TX')
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),',[ ]?[A-Za-z]{3,}$') >= 1
AND REGEXP_INSTR(CITY_STATE,'TEXAS') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(RTRIM(CITY_STATE),'OHIO','OH')
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),',[ ]?[A-Za-z]{3,}$') >= 1
AND REGEXP_INSTR(CITY_STATE,'OHIO') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET CITY_STATE = REGEXP_REPLACE(RTRIM(CITY_STATE),'FLORIDA','FL')
WHERE REGEXP_INSTR(RTRIM(CITY_STATE),',[ ]?[A-Za-z]{3,}$') >= 1
AND REGEXP_INSTR(CITY_STATE,'FLORIDA') >= 1;

-------------------------------------------------------------------------------
-- Change all occurrences for DEED_DATE from '000000' to NULL
SELECT DEED_DATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE DEED_DATE = '000000'
GROUP BY DEED_DATE;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET DEED_DATE = '010150' -- 01/01/1950
WHERE DEED_DATE = '000000';

-------------------------------------------------------------------------------
-- Change all of the invalid dates
SELECT DEED_DATE
, REGEXP_REPLACE(DEED_DATE,'([01][469])3[1-9]([0-9]{2})','\130\2') AS NEW_DEED_DATE
, COUNT(*)
FROM ras_stg.PROPERTY_INFO_NJ
WHERE regexp_instr(DEED_DATE,'([01][469])3[1-9]([0-9]{2})') >= 1
GROUP BY DEED_DATE, REGEXP_REPLACE(DEED_DATE,'([01][469])3[1-9]([0-9]{2})','\130\2')
ORDER BY DEED_DATE;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET DEED_DATE = REGEXP_REPLACE(DEED_DATE,'([01][469])3[1-9]([0-9]{2})','\130\2')
WHERE regexp_instr(DEED_DATE,'([01][469])3[1-9]([0-9]{2})') >= 1

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET DEED_DATE = '022815'
WHERE DEED_DATE = '022915';


SELECT DEED_DATE
, REGEXP_REPLACE(DEED_DATE,'02(3[0-9])([0-9]{2})','0228\2') AS NEW_DEED_DATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(DEED_DATE,'02(3[0-9])([0-9]{2})') >= 1
GROUP BY DEED_DATE, REGEXP_REPLACE(DEED_DATE,'02(3[0-9])([0-9]{2})','0228\2')
ORDER BY DEED_DATE;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET DEED_DATE = REGEXP_REPLACE(DEED_DATE,'02(3[0-9])([0-9]{2})','0228\2')
WHERE REGEXP_INSTR(DEED_DATE,'02(3[0-9])([0-9]{2})') >= 1;


SELECT DEED_DATE
, REGEXP_REPLACE(DEED_DATE,'11(3[1-9])([0-9]{2})','1130\2') AS NEW_DEED_DATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(DEED_DATE,'11(3[1-9])([0-9]{2})') >= 1
GROUP BY DEED_DATE, REGEXP_REPLACE(DEED_DATE,'11(3[1-9])([0-9]{2})','1130\2')
ORDER BY DEED_DATE;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET DEED_DATE = REGEXP_REPLACE(DEED_DATE,'11(3[1-9])([0-9]{2})','1130\2')
WHERE REGEXP_INSTR(DEED_DATE,'11(3[1-9])([0-9]{2})') >= 1;



-------------------------------------------------------------------------------
-- Change all of the invalid dates for non-leap years
SELECT DEED_DATE
, REGEXP_REPLACE(DEED_DATE,'([0-9]{4})([0-9]{2})','0228\2') AS NEW_DEED_DATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(DEED_DATE,'02(29|[3-9]{2})([0-9][048])') >= 1
AND (
    MOD(TO_NUMBER(TO_CHAR(TO_DATE(REGEXP_REPLACE(DEED_DATE,'([0-9]{4})([0-9]{2})','\2'),'RR'),'YYYY')),4) >= 1
)
GROUP BY DEED_DATE, REGEXP_REPLACE(DEED_DATE,'([0-9]{4})([0-9]{2})','0228\2')
ORDER BY DEED_DATE;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET DEED_DATE = REGEXP_REPLACE(DEED_DATE,'([0-9]{4})([0-9]{2})','0228\2')
WHERE REGEXP_INSTR(DEED_DATE,'02(29|[3-9]{2})([0-9][048])') >= 1
AND (
    MOD(TO_NUMBER(TO_CHAR(TO_DATE(REGEXP_REPLACE(DEED_DATE,'([0-9]{4})([0-9]{2})','\2'),'RR'),'YYYY')),4) >= 1
)


SELECT DEED_DATE
, REGEXP_REPLACE(DEED_DATE,'0229([0-9]{2})','0228\1') AS NEW_DEED_DATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(DEED_DATE,'0229([0-9]{2})') >= 1
GROUP BY DEED_DATE, REGEXP_REPLACE(DEED_DATE,'0229([0-9]{2})','0228\1')
ORDER BY DEED_DATE;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET DEED_DATE = REGEXP_REPLACE(DEED_DATE,'0229([0-9]{2})','0228\1')
WHERE REGEXP_INSTR(DEED_DATE,'0229([0-9]{2})') >= 1;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Change CITY_STATE when  a comma does not seperate the city and the state
SELECT CITY_STATE
, COUNT(*)
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(TRIM(CITY_STATE),'( )+([A-Z]{2})$') >= 1
GROUP BY CITY_STATE
ORDER BY COUNT(*) DESC;

-- The following are not eliminated:
-- LAKEWOOD NJ.
-- HALSTEAD PENN.    


-------------------------------------------------------------------------------
-- If a value does not exist for TAX_ACCOUNT_NUMBER, provide a default value.
SELECT TAX_ACCOUNT_NUMBER
, COUNT(*) AS COUNT
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE TRIM(TAX_ACCOUNT_NUMBER) IS NULL
GROUP BY TAX_ACCOUNT_NUMBER;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET TAX_ACCOUNT_NUMBER = 'UNKNOWN'
WHERE TRIM(TAX_ACCOUNT_NUMBER) IS NULL;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------










-------------------------------------------------------------------------------
-- The comma is missing between the city and the state
--SELECT CITY_STATE
--, INSTR( RTRIM(CITY_STATE), ' ', -2)
--FROM PROPERTY_INFO_NJ
--WHERE CITY_STATE NOT LIKE '%,%'







-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of PLACE to PL
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' PLACE', ' PL')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' PLACE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' PLACE', ' PL')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' PLACE') >= 1;


-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of STREET to ST
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' STREET', ' ST')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' STREET') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' STREET', ' ST')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' STREET') >= 1;


-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of AVENUE to AVE
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' AVENUE', ' AVE')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' AVENUE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' AVENUE', ' AVE')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' AVENUE') >= 1;


-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of COURT to CT
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' COURT', ' CT')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' COURT') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' COURT', ' CT')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' COURT') >= 1;

-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of DRIVE to DR
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' DRIVE', ' DR')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' DRIVE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' DRIVE', ' DR')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' DRIVE') >= 1;

-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of ROAD to RD
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' ROAD', ' RD')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' ROAD') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' ROAD', ' RD')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' ROAD') >= 1;


-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of LANE to LN
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' LANE', ' LN')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' LANE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' LANE', ' LN')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' LANE') >= 1;


-------------------------------------------------------------------------------
-- In STREET_ADDRESS, change all occurrences of LANE to LN
SELECT STREET_ADDRESS
, REGEXP_REPLACE(STREET_ADDRESS, ' PARKWAY', ' PKWY')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(STREET_ADDRESS, ' PARKWAY') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET STREET_ADDRESS = REGEXP_REPLACE(STREET_ADDRESS, ' PARKWAY', ' PKWY')
WHERE REGEXP_INSTR(STREET_ADDRESS, ' PARKWAY') >= 1;


-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------









-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of PLACE to PL
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' PLACE', ' PL')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' PLACE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' PLACE', ' PL')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' PLACE') >= 1;


-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of STREET to ST
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' STREET', ' ST')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' STREET') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' STREET', ' ST')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' STREET') >= 1;


-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of AVENUE to AVE
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' AVENUE', ' AVE')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' AVENUE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' AVENUE', ' AVE')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' AVENUE') >= 1;


-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of COURT to CT
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' COURT', ' CT')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' COURT') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' COURT', ' CT')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' COURT') >= 1;

-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of DRIVE to DR
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' DRIVE', ' DR')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' DRIVE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' DRIVE', ' DR')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' DRIVE') >= 1;

-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of ROAD to RD
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' ROAD', ' RD')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' ROAD') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' ROAD', ' RD')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' ROAD') >= 1;

-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of LANE to LN
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' LANE', ' LN')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' LANE') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' LANE', ' LN')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' LANE') >= 1;

-------------------------------------------------------------------------------
-- In PROPERTY_LOCATION, change all occurrences of PARKWAY to PKWY
SELECT PROPERTY_LOCATION
, REGEXP_REPLACE(PROPERTY_LOCATION, ' PARKWAY', ' PKWY')
FROM RAS_STG.PROPERTY_INFO_NJ
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' PARKWAY') >= 1;

UPDATE RAS_STG.PROPERTY_INFO_NJ
SET PROPERTY_LOCATION = REGEXP_REPLACE(PROPERTY_LOCATION, ' PARKWAY', ' PKWY')
WHERE REGEXP_INSTR(PROPERTY_LOCATION, ' PARKWAY') >= 1;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

