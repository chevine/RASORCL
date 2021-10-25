select rpd.CITY_STATE_ORIGINAL
, REGEXP_REPLACE(rpd.CITY_STATE_ORIGINAL, '^([A-Za-z ]+)([ ]*[,]+[ ]*)([A-Za-z]{2})([ ]*)', '\3') AS STATE
, COUNT(*)
FROM RAS.RAS_PROPERTY_DESCRIPTION rpd
WHERE rpd.OWNER_STATE = '?? ' 
AND REGEXP_INSTR(rpd.CITY_STATE_ORIGINAL, '^([A-Za-z ]+)([ ]*[,]+[ ]*)([A-Za-z]{2})([ ]+$)') >= 1
GROUP BY rpd.CITY_STATE_ORIGINAL, REGEXP_REPLACE(rpd.CITY_STATE_ORIGINAL, '^([A-Za-z ]+)([ ]*[,]+[ ]*)([A-Za-z]{2})([ ]+$)', '\3')
ORDER BY COUNT(*) DESC;


UPDATE RAS.RAS_PROPERTY_DESCRIPTION
SET OWNER_STATE = REGEXP_REPLACE(CITY_STATE_ORIGINAL, '^([A-Za-z ]+)([ ]*[,]+[ ]*)([A-Za-z]{2})([ ]*)', '\3')
WHERE OWNER_STATE = '?? ' 
AND REGEXP_INSTR(CITY_STATE_ORIGINAL, '^([A-Za-z ]+)([ ]*[,]+[ ]*)([A-Za-z]{2})([ ]+$)') >= 1;

