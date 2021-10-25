SELECT OWNER_NAME
, TRIM(REGEXP_REPLACE(TRIM(OWNER_NAME), '([A-Za-z]+)([,])([-A-Z &%]+)', '\3')) AS FIRST_NAME
, '' AS MIDDLE_NAME
, REGEXP_REPLACE(TRIM(OWNER_NAME), '([A-Za-z]+)([,])([-A-Z &%]+)', '\1') AS LAST_NAME
FROM RAS.RAS_PROPERTY_DESCRIPTION rpd
WHERE rpd.MUNICIPALITY_CODE = '2012';
