create or replace FUNCTION EXTRACT_NAME_PART 
(
  FULL_NAME IN VARCHAR2 
, NAME_PART IN VARCHAR2 DEFAULT 'LAST'
) RETURN VARCHAR2 AS 
EXTRACTED_NAME_PART VARCHAR2(255);
BEGIN
-- The function assumes that the format of FULL_NAME is defined as
-- follows: LAST_NAME, FIRST_NAME MIDDLE_NAME.

  IF NAME_PART = 'LAST' THEN
    SELECT TRIM(REGEXP_REPLACE(TRIM(FULL_NAME), '([A-Za-z]+)([,])([-A-Z &%]+)', '\1')) INTO EXTRACTED_NAME_PART FROM DUAL;
  ELSE
    IF NAME_PART = 'FIRST' THEN
        SELECT TRIM(REGEXP_REPLACE(TRIM(FULL_NAME), '([A-Za-z]+)([,])([-A-Z &%]+)', '\3')) INTO EXTRACTED_NAME_PART FROM DUAL;
    ELSE
       IF NAME_PART = 'MIDDLE' THEN
        SELECT ' ' INTO EXTRACTED_NAME_PART FROM DUAL;
       ELSE
        SELECT FULL_NAME INTO EXTRACTED_NAME_PART FROM DUAL;
       END IF;
    END IF;
  END IF;
  RETURN EXTRACTED_NAME_PART;
END EXTRACT_NAME_PART;
