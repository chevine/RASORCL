--------------------------------------------------------------------------------
-- The owner does not live in the same city as the property.
-- AUDIT_NAME: OWNER_PROPERTY_CITY_MISMATCH
INSERT INTO RAS.RAS_AUDIT_VIOLATION (TAX_YEAR, PROPERTY_ID, AUDIT_ID, STATUS_ID)
SELECT rpd.LOAD_TAX_YEAR
, rpd.PROPERTY_ID
, ra.AUDIT_ID
, rastat.STATUS_ID
FROM RAS.RAS_PROPERTY_TYPE rpt
JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_TYPE = rpt.PROPERTY_TYPE)
JOIN RAS.RAS_AUDIT ra ON (ra.AUDIT_NAME = 'OWNER_PROPERTY_CITY_MISMATCH')
JOIN RAS.RAS_AUDIT_STATUS rastat ON (rastat.AUDIT_STATUS = ra.DEFAULT_STATUS)
LEFT JOIN RAS.RAS_AUDIT_VIOLATION rav ON (rav.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rav.PROPERTY_ID = rpd.PROPERTY_ID AND rav.AUDIT_ID = ra.AUDIT_ID)
WHERE rpt.PROPERTY_CLASS IN ('2', '3A', '3B', '4A', '4B', '4C')
--AND rpd.PROPERTY_CITY = 'PLAINFIELD CITY'
AND SUBSTR(TRIM(rpd.PROPERTY_CITY),1,REGEXP_INSTR(TRIM(rpd.PROPERTY_CITY),'[, ]')-1) != SUBSTR(TRIM(rpd.OWNER_CITY),1,REGEXP_INSTR(TRIM(rpd.OWNER_CITY),'[, ]')-1)
AND rav.TAX_YEAR IS NULL
FETCH NEXT 100000 ROWS ONLY;




--------------------------------------------------------------------------------
-- The owner lives in the same city as the property and the address is different.
-- AUDIT_NAME: OWNER_RESIDES_AT_DIFF_PROPERTY

INSERT INTO RAS.RAS_AUDIT_VIOLATION (TAX_YEAR, PROPERTY_ID, AUDIT_ID, STATUS_ID)
SELECT rpd.LOAD_TAX_YEAR
, rpd.PROPERTY_ID
, ra.AUDIT_ID
, rastat.STATUS_ID
FROM RAS.RAS_PROPERTY_TYPE rpt
JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_TYPE = rpt.PROPERTY_TYPE)
JOIN RAS.RAS_AUDIT ra ON (ra.AUDIT_NAME = 'OWNER_RESIDES_AT_DIFF_PROPERTY')
JOIN RAS.RAS_AUDIT_STATUS rastat ON (rastat.AUDIT_STATUS = ra.DEFAULT_STATUS)
LEFT JOIN RAS.RAS_AUDIT_VIOLATION rav ON (rav.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rav.PROPERTY_ID = rpd.PROPERTY_ID AND rav.AUDIT_ID = ra.AUDIT_ID)
WHERE rpt.PROPERTY_CLASS IN ('2', '3A', '3B', '4A', '4B', '4C')
AND REGEXP_INSTR(UPPER(rpd.OWNER_ADDRESS),'BOX') <= 0
AND SUBSTR(TRIM(rpd.PROPERTY_CITY),1,REGEXP_INSTR(TRIM(rpd.PROPERTY_CITY),'[, ]')-1) = SUBSTR(TRIM(rpd.OWNER_CITY),1,REGEXP_INSTR(TRIM(rpd.OWNER_CITY),'[, ]')-1)
AND REGEXP_REPLACE(TRIM(rpd.PROPERTY_LOCATION),'([-0-9])+','') != REGEXP_REPLACE(TRIM(rpd.OWNER_ADDRESS),'([-0-9])+','')
--AND rpd.PROPERTY_CITY = 'PLAINFIELD CITY'
AND rav.TAX_YEAR IS NULL
FETCH NEXT 100000 ROWS ONLY;
--------------------------------------------------------------------------------
-- The owner address has provided a post office box as the owner's mailing address.
-- AUDIT_NAME: OWNER_PROVIDED_PO_BOX
INSERT INTO RAS.RAS_AUDIT_VIOLATION (TAX_YEAR, PROPERTY_ID, AUDIT_ID, STATUS_ID)
SELECT rpd.LOAD_TAX_YEAR
, rpd.PROPERTY_ID
, ra.AUDIT_ID
, rastat.STATUS_ID
FROM RAS.RAS_PROPERTY_TYPE rpt
JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_TYPE = rpt.PROPERTY_TYPE)
JOIN RAS.RAS_AUDIT ra ON (ra.AUDIT_NAME = 'OWNER_PROVIDED_PO_BOX')
JOIN RAS.RAS_AUDIT_STATUS rastat ON (rastat.AUDIT_STATUS = ra.DEFAULT_STATUS)
LEFT JOIN RAS.RAS_AUDIT_VIOLATION rav ON (rav.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rav.PROPERTY_ID = rpd.PROPERTY_ID AND rav.AUDIT_ID = ra.AUDIT_ID)
WHERE rpt.PROPERTY_CLASS IN ('2', '3A', '3B', '4A', '4B', '4C')
--AND rpd.PROPERTY_CITY = 'PLAINFIELD CITY'
AND REGEXP_INSTR(UPPER(rpd.OWNER_ADDRESS),'BOX( )+[0-9]') >= 1
AND rav.TAX_YEAR IS NULL
FETCH NEXT 100000 ROWS ONLY;

--------------------------------------------------------------------------------
-- The property has at least two house numbers associated to it.
-- AUDIT_NAME: TWO_HOUSE_NUMBERS
INSERT INTO RAS.RAS_AUDIT_VIOLATION (TAX_YEAR, PROPERTY_ID, AUDIT_ID, STATUS_ID)
SELECT rpd.LOAD_TAX_YEAR
, rpd.PROPERTY_ID
, ra.AUDIT_ID
, rastat.STATUS_ID
FROM RAS.RAS_PROPERTY_TYPE rpt
JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_TYPE = rpt.PROPERTY_TYPE)
JOIN RAS.RAS_AUDIT ra ON (ra.AUDIT_NAME = 'TWO_HOUSE_NUMBERS')
JOIN RAS.RAS_AUDIT_STATUS rastat ON (rastat.AUDIT_STATUS = ra.DEFAULT_STATUS)
LEFT JOIN RAS.RAS_AUDIT_VIOLATION rav ON (rav.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rav.PROPERTY_ID = rpd.PROPERTY_ID AND rav.AUDIT_ID = ra.AUDIT_ID)
WHERE rpt.PROPERTY_CLASS IN ('2', '3A', '3B', '4A', '4B', '4C')
--AND rpd.PROPERTY_CITY = 'PLAINFIELD CITY'
AND REGEXP_INSTR(TRIM(rpd.PROPERTY_LOCATION), '([0-9 ])+([-]+)([0-9 ])+') >= 1
AND rav.TAX_YEAR IS NULL
FETCH NEXT 100000 ROWS ONLY;
--------------------------------------------------------------------------------
-- The property is owned by a LLC entity.
INSERT INTO RAS.RAS_AUDIT_VIOLATION (TAX_YEAR, PROPERTY_ID, AUDIT_ID, STATUS_ID)
SELECT rpd.LOAD_TAX_YEAR
, rpd.PROPERTY_ID
, ra.AUDIT_ID
, rastat.STATUS_ID
FROM RAS.RAS_PROPERTY_TYPE rpt
JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_TYPE = rpt.PROPERTY_TYPE)
JOIN RAS.RAS_AUDIT ra ON (ra.AUDIT_NAME = 'OWNED_BY_LLC')
JOIN RAS.RAS_AUDIT_STATUS rastat ON (rastat.AUDIT_STATUS = ra.DEFAULT_STATUS)
LEFT JOIN RAS.RAS_AUDIT_VIOLATION rav ON (rav.TAX_YEAR = rpd.LOAD_TAX_YEAR AND rav.PROPERTY_ID = rpd.PROPERTY_ID AND rav.AUDIT_ID = ra.AUDIT_ID)
WHERE rpt.PROPERTY_CLASS IN ('2', '3A', '3B', '4A', '4B', '4C')
--AND rpd.PROPERTY_CITY = 'PLAINFIELD CITY'
AND REGEXP_INSTR(rpd.OWNER_NAME,'([ ,.]+)LLC') >= 1
AND rav.TAX_YEAR IS NULL
FETCH NEXT 100000 ROWS ONLY;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
