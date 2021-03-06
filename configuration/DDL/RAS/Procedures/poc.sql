SELECT rpd.LOAD_TAX_YEAR
, rpd.PROPERTY_ID
, rpd.MUNICIPALITY_CODE
, rpd.OWNER_NAME
, rpd.PROPERTY_LOCATION
FROM RAS.RAS_PROPERTY_DESCRIPTION rpd
WHERE rpd.PROPERTY_LOCATION = rpd.OWNER_ADDRESS
--AND rpd.MUNICIPALITY_CODE = '2012'
--AND rpd.OWNER_NAME LIKE 'MILLER%CHEVINE%'
AND rpd.OWNER_NAME LIKE 'RODRIGUEZ%JOSE%';                    


select count(*)
FROM RAS.RAS_PROPERTY_DESCRIPTION  rpd
JOIN RAS.RAS_PROPERTY_TYPE rpt ON (rpt.PROPERTY_TYPE = rpd.PROPERTY_TYPE)
WHERE rpd.MUNICIPALITY_CODE = '2012'
AND rpt.PROPERTY_CLASS IN ('2', '3A', '3B', '4A', '4B', '4C' )
 
        SELECT rpd.LOAD_TAX_YEAR
        , rpd.PROPERTY_ID
        , rpd.MUNICIPALITY_CODE
        , rpd.OWNER_NAME
        , rpd.OWNER_ADDRESS
        , rpd.CITY_STATE_ORIGINAL
        --SELECT COUNT(*)
        FROM RAS.RAS_PROPERTY_DESCRIPTION rpd
        WHERE rpd.PROPERTY_LOCATION = rpd.OWNER_ADDRESS

