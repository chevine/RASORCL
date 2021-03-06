INSERT INTO RAS.RAS_PROPERTY_DESCRIPTION
( STATE, MUNICIPALITY_CODE
, PROPERTY_TYPE, IS_RENTAL_PROPERTY
, PROPERTY_COUNTRY, PROPERTY_CITY, PROPERTY_LOCATION
, OWNER_NAME, OWNER_CITY, OWNER_STATE, OWNER_ADDRESS, OWNER_ZIPCODE
, OWNER_COUNTRY, CITY_STATE_ORIGINAL, TAX_ACCOUNT_NUMBER
, PROPERTY_CLASS, NUMBER_OF_APARTMENTS
, BLOCK, LOT, CENSUS_TRACT, CENSUS_BLOCK
, YEAR_CONSTRUCTED, DEED_BOOK, DEED_PAGE, DEED_DATE
, LOAD_TAX_YEAR
)
SELECT 'NJ' AS PROPERTY_STATE
, mnj.CODE AS MUNICIPALITY_CODE
, rpt.PROPERTY_TYPE AS PROPERTY_TYPE
, 'N' AS IS_RENTAL_PROPERTY
, 'US' AS PROPERTY_COUNTRY
, mnj.MUNICIPALITY AS PROPERTY_CITY
, pinj.PROPERTY_LOCATION
, pinj.OWNER_NAME
, pinj.CITY_STATE AS OWNER_CITY
, '??' AS OWNER_STATE
, pinj.STREET_ADDRESS AS OWNER_ADDRESS
, pinj.ZIP_CODE
, '??' OWNER_COUNTRY
, pinj.CITY_STATE CITY_STATE_ORIGINAL
, pinj.TAX_ACCOUNT_NUMBER
, pinj.PROPERTY_CLASS
, 0 NUMBER_OF_APARTMENTS
, pinj.BLOCK
, pinj.LOT
, pinj.CENSUS_TRACT
, pinj.CENSUS_BLOCK
, pinj.YEAR_CONSTRUCTED
, pinj.DEED_BOOK
, pinj.DEED_PAGE
, NVL2(pinj.DEED_DATE,TO_CHAR(TO_DATE(pinj.DEED_DATE,'MMDDRR'),'MM-DD-RRRR'),NULL) AS DEED_DATE_RR
, '2018' AS LOAD_TAX_YEAR
FROM RAS_STG.PROPERTY_INFO_NJ pinj
JOIN RAS.RAS_PROPERTY_TYPE rpt ON (rpt.PROPERTY_CLASS = pinj.PROPERTY_CLASS)
JOIN RAS_STG.MUNICIPALITY_NJ mnj ON (mnj.CODE = pinj.COUNTY_DISTRICT)
LEFT JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.MUNICIPALITY_CODE = pinj.COUNTY_DISTRICT AND rpd.PROPERTY_LOCATION = pinj.PROPERTY_LOCATION AND rpd.block = pinj.BLOCK AND rpd.lot = pinj.LOT AND rpd.DEED_BOOK = pinj.DEED_BOOK AND rpd.DEED_PAGE = pinj.DEED_PAGE AND rpd.owner_name = pinj.OWNER_NAME AND rpd.tax_account_number = pinj.TAX_ACCOUNT_NUMBER)
WHERE rpd.PROPERTY_LOCATION IS NULL
--AND pinj.OWNER_NAME LIKE 'MILLER%CHEVINE%'
FETCH NEXT 300000 ROWS ONLY;

