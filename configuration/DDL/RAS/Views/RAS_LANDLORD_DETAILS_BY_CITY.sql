SELECT rm.STATE
, rm.COUNTY
, rm.MUNICIPALITY
, rlrd.TAX_YEAR
, rlrd.FIRST_NAME
, rlrd.LAST_NAME
, rlrd.GROSS_INCOME
, rlrd.ADDRESS
, rlrd.CITY
, rlrd.STATE
, rpd.PROPERTY_LOCATION
, rpd.PROPERTY_CITY
FROM RAS.RAS_PROPERTY rp
JOIN RAS.RAS_MUNICIPALITY rm ON (rm.STATE = rp.STATE AND rm.CODE = rp.MUNICIPALITY_CODE)
JOIN RAS.RAS_LANDLORD rlrd ON (rlrd.TAX_YEAR = rp.TAX_YEAR AND rlrd.TAXID = rp.LANDLORD_TAX_ID)
JOIN RAS.RAS_PROPERTY_BASE_YEAR rpby ON (rpby.TAX_YEAR = rp.TAX_YEAR AND rpby.PROPERTY_ID = rp.PROPERTY_ID)
JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_ID = rpby.PROPERTY_ID)
ORDER BY rm.STATE, rm.COUNTY, rm.MUNICIPALITY, rpd.PROPERTY_LOCATION
