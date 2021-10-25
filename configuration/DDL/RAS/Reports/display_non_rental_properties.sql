SELECT rm.COUNTY AS COUNTY
, rm.MUNICIPALITY AS MUNICIPALITY
, rpd.OWNER_NAME
, rpd.PROPERTY_LOCATION
, rpd.OWNER_ADDRESS
, rpd.OWNER_CITY
, rpd.OWNER_STATE
FROM RAS.RAS_MUNICIPALITY rm
JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.STATE = rm.STATE AND rpd.MUNICIPALITY_CODE = rm.CODE)
LEFT JOIN RAS.RAS_PROPERTY rp ON (rp.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rp.PROPERTY_ID = rpd.PROPERTY_ID)
JOIN RAS.RAS_AUDIT_VIOLATION rav ON (rav.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rav.PROPERTY_ID = rpd.PROPERTY_ID)
WHERE rm.COUNTY LIKE 'Union County%'
AND rm.code = '2012'
AND rp.PROPERTY_ID IS NULL
ORDER BY rm.COUNTY, rm.MUNICIPALITY;