INSERT INTO RAS.RAS_INDIVIDUAL_FILER(
  TAX_YEAR
, TAXID
, PROPERTY_ID
, FIRST_NAME
, MIDDLE_NAME
, LAST_NAME
, OWN_RENTAL_PROPERTY
, IS_BUSINESS_TAXID
, IS_TENANT
, GROSS_INCOME
, OWNER_NAME_ORIGINAL
, OWNER_ADDRESS_ORIGINAL
, OWNER_CITY_ORIGINAL
)
SELECT 
  '2018' AS TAX_YEAR
, generate_number() AS TAX_ID
, 0 AS PROPERTY_ID
, tn.FIRST_NAME
, '' AS MIDDLE_NAME
, tn.LAST_NAME
, 'N' AS OWN_RENTAL_PROPERTY
, 'N' AS IS_BUSINESS_TAXID
, 'Y' AS IS_TENANT
, 0 AS GROSS_INCOME
, 'TENANT' AS OWNER_NAME_ORIGINAL
, 'TENANT' AS OWNER_ADDRESS_ORIGINAL
, 'TENANT' AS OWNER_CITY_ORIGINAL
FROM RAS.TENANT_NAME tn
LEFT JOIN RAS.RAS_INDIVIDUAL_FILER rif ON (rif.FIRST_NAME = tn.FIRST_NAME AND rif.LAST_NAME = tn.LAST_NAME)
WHERE rif.FIRST_NAME IS NULL
FETCH NEXT 1000 ROWS ONLY
