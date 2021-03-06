create or replace PROCEDURE POPULATE_RAS_INDIVIDUAL_FILER AS 
BEGIN
    INSERT INTO RAS.RAS_INDIVIDUAL_FILER(
    TAX_YEAR, TAXID, PROPERTY_ID, FIRST_NAME, MIDDLE_NAME, LAST_NAME
    , OWN_RENTAL_PROPERTY, IS_BUSINESS_TAXID, IS_TENANT, GROSS_INCOME
    , OWNER_NAME_ORIGINAL
    )
    SELECT person.TAX_YEAR AS TAX_YEAR
    , generate_number AS TAX_ID
    , paddr.PROPERTY_ID AS PROPERTY_ID
    , EXTRACT_NAME_PART(person.OWNER_NAME, 'FIRST') AS FIRST_NAME
    , EXTRACT_NAME_PART(person.OWNER_NAME, 'MIDDLE') AS MIDDLE_NAME
    , EXTRACT_NAME_PART(person.OWNER_NAME, 'LAST') AS LAST_NAME
    , 'N' AS OWN_RENTAL_PROPERTY
    , 'N' AS IS_BUSINESS_TAXID
    , 'N' AS IS_TENANT
    , 0 AS GROSS_INCOME
    , person.OWNER_NAME AS OWNER_NAME_ORIGINAL
    FROM (
        SELECT rpd.LOAD_TAX_YEAR AS TAX_YEAR
        , rpd.OWNER_NAME
        , rpd.OWNER_ADDRESS
        , rpd.CITY_STATE_ORIGINAL
        , rpd.MUNICIPALITY_CODE
        , COUNT(*) property_count
        FROM RAS.RAS_PROPERTY_DESCRIPTION  rpd
        JOIN RAS.RAS_PROPERTY_TYPE rpt ON (rpt.PROPERTY_TYPE = rpd.PROPERTY_TYPE)
        LEFT JOIN RAS.RAS_INDIVIDUAL_FILER rif ON (rif.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rif.OWNER_NAME_ORIGINAL = rpd.OWNER_NAME)
        WHERE rpt.PROPERTY_CLASS IN ('2', '3A', '3B', '4A', '4B', '4C' )
        AND rpd.MUNICIPALITY_CODE = '2012'
        --AND (rpd.OWNER_NAME LIKE 'NEW MEADOW %' OR rpd.OWNER_NAME LIKE 'MILLER%CHEVINE%')
        AND rif.OWNER_NAME_ORIGINAL IS NULL
        GROUP BY rpd.LOAD_TAX_YEAR, rpd.OWNER_NAME, rpd.OWNER_ADDRESS, rpd.CITY_STATE_ORIGINAL, rpd.MUNICIPALITY_CODE
        ORDER BY rpd.LOAD_TAX_YEAR, rpd.OWNER_NAME, rpd.OWNER_ADDRESS, rpd.CITY_STATE_ORIGINAL, rpd.MUNICIPALITY_CODE
        FETCH FIRST 10000 ROWS ONLY
    ) person
    LEFT JOIN (
        SELECT rpd.LOAD_TAX_YEAR
        , rpd.PROPERTY_ID
        , rpd.MUNICIPALITY_CODE
        , rpd.OWNER_NAME
        , rpd.OWNER_ADDRESS
        , rpd.CITY_STATE_ORIGINAL
        FROM RAS.RAS_PROPERTY_DESCRIPTION rpd
        WHERE rpd.PROPERTY_LOCATION = rpd.OWNER_ADDRESS
    ) paddr ON (paddr.OWNER_NAME = person.OWNER_NAME AND paddr.OWNER_ADDRESS = person.OWNER_ADDRESS)
    LEFT JOIN RAS.RAS_INDIVIDUAL_FILER rif ON (rif.TAX_YEAR = person.TAX_YEAR AND rif.OWNER_NAME_ORIGINAL = person.OWNER_NAME)
    WHERE rif.TAXID IS NULL;
END POPULATE_RAS_INDIVIDUAL_FILER;
