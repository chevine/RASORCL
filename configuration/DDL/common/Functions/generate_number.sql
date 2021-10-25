CREATE OR REPLACE FUNCTION GENERATE_NUMBER 
(
  NUMBER_WIDTH IN NUMBER DEFAULT 9 
) RETURN NUMBER AS 
    random_number number;
BEGIN
    SELECT TRUNC(dbms_random.value(100000000,999999999)) INTO random_number
    FROM dual;
    
    return random_number;
END GENERATE_NUMBER;
/
