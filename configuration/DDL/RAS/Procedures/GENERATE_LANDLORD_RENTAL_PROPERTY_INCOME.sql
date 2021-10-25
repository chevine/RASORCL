create or replace PROCEDURE GENERATE_LANDLORD_RENTAL_PROPERTY_INCOME 
(
  HOUSEHOLD_COUNT IN NUMBER DEFAULT 1 
) AS 
BEGIN
    UPDATE RAS.RAS_PROPERTY
    SET RENTAL_INCOME_RECEIVED = landlord_property_income()
    WHERE RENTAL_INCOME_RECEIVED = 0;
    
END GENERATE_LANDLORD_RENTAL_PROPERTY_INCOME;
