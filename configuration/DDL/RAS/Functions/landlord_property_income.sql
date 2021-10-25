create or replace FUNCTION landlord_property_income 
(
  HOUSEHOLD_COUNT IN NUMBER DEFAULT 1  
) RETURN NUMBER AS income number;
BEGIN
    SELECT TRUNC(dbms_random.value(1800,3500), -2) * 12 * household_count INTO INCOME
    FROM dual;
    
    RETURN income;
END landlord_property_income;
/
