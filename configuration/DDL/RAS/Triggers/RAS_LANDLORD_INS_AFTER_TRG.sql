CREATE OR REPLACE TRIGGER RAS_LANDLORD_INS_BEFORE_TRG 
AFTER INSERT ON RAS.RAS_LANDLORD FOR EACH ROW
BEGIN
    -- If the landlord does not exist in RAS_INDIVIDUAL_FILER, insert the landlord into RAS_INDIVIDUAL_FILER.
    MERGE
    INTO RAS.RAS_INDIVIDUAL_FILER target
    USING dual
    ON (target.TAX_YEAR = :NEW.TAX_YEAR
        AND target.OWNER_NAME_ORIGINAL = :NEW.OWNER_NAME_ORIGINAL 
        AND target.OWNER_ADDRESS_ORIGINAL = :NEW.ADDRESS 
        AND target.OWNER_CITY_ORIGINAL = :NEW.CITY
        )
    WHEN NOT MATCHED THEN
        INSERT (
                TAX_YEAR, TAXID, PROPERTY_ID
                , FIRST_NAME, MIDDLE_NAME, LAST_NAME
                , OWN_RENTAL_PROPERTY, IS_BUSINESS_TAXID, IS_TENANT, GROSS_INCOME
                , OWNER_NAME_ORIGINAL, OWNER_ADDRESS_ORIGINAL, OWNER_CITY_ORIGINAL
        )
        VALUES(:NEW.TAX_YEAR, :NEW.TAXID, 0
                , :NEW.FIRST_NAME, :NEW.MIDDLE_NAME, :NEW.LAST_NAME
                , 'N', :NEW.IS_BUSINESS_TAXID, 'N', 0
                , :NEW.OWNER_NAME_ORIGINAL, :NEW.ADDRESS, :NEW.CITY
        );
        
    -- Insert all of the landlord properties into RAS_RAS_PROPERTY
    /*******************************************************************************************************
    MERGE
    INTO RAS.RAS_PROPERTY target
    USING dual
    ON (target.TAX_YEAR = :NEW.TAX_YEAR
        AND target.LANDLORD_TAX_ID = :NEW.OWNER_NAME_ORIGINAL 
        )
    WHEN NOT MATCHED THEN
        INSERT (
            TAX_YEAR, LANDLORD_TAX_ID, PROPERTY_ID
            , PERCENTAGE_OWNED, RENTAL_INCOME_RECEIVED, NUMBER_OF_PROPERTY_OWNERS
            ,  TOTAL_DEDUCTIONS, PROPERTY_TAXES
        )
        SELECT :NEW.TAX_YEAR, :NEW.TAXID, PROPERTY_ID
        FROM RAS.PROPERTY_DESCRIPTION rpd
        LEFT OUTER JOIN RAS.RAS_PROPERTY rp ON (rpd.LOAD_TAX_YEAR = :NEW.TAX_YEAR AND rpd.OWNER_NAME = :NEW.OWNER_NAME_ORIGINAL
                AND rpd.OWNER_CITY = :NEW.CITY AND rpd.OWNER_ADDRESS = :NEW.ADDRESSS
                )
        WHERE rpd.OWNER_NAME, rpd.OWNER_ADDRESS, rpd.OWNER_CITY
    *******************************************************************************************************/
        
END;

