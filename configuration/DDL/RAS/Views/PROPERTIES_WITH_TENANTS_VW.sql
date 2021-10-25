DROP VIEW RAS.PROPERTIES_WITH_TENANTS_VW;

CREATE VIEW RAS.PROPERTIES_WITH_TENANTS_VW
AS
    SELECT rm.STATE 
    , rm.COUNTY
    , rm.MUNICIPALITY
    , rptt.TAX_YEAR
    , rif.FIRST_NAME
    , rif.LAST_NAME
    , rif.TAXID
    , rif.GROSS_INCOME
    , rptt.TOTAL_RENTAL_PAYMENTS
    , rpd.PROPERTY_LOCATION
    , rpd.PROPERTY_CITY
    , rpd.PROPERTY_COUNTRY
    , rpt.PROPERTY_DESCRIPTION AS PROPERTY_TYPE
    , rpd.CENSUS_TRACT
    , rpd.CENSUS_BLOCK
    , rpd.YEAR_CONSTRUCTED
    , rpd.BLOCK
    , rpd.LOT
    , rpd.PROPERTY_ID
    , rpd.LONGITUDE
    , rpd.LATITUDE
    FROM RAS.RAS_PROPERTY_TO_TENANT rptt
    JOIN RAS.RAS_MUNICIPALITY rm ON (rm.STATE = rptt.STATE AND rm.CODE = rptt.MUNICIPALITY_CODE)
    JOIN RAS.RAS_INDIVIDUAL_FILER rif ON (rif.TAX_YEAR = rptt.TAX_YEAR AND rif.TAXID = rptt.TENANT_TAX_ID)
    JOIN RAS.RAS_PROPERTY_BASE_YEAR rpby ON (rptt.TAX_YEAR = rpby.TAX_YEAR AND rptt.PROPERTY_ID = rpby.PROPERTY_ID)
    JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_ID = rpby.PROPERTY_ID)
    JOIN RAS.RAS_PROPERTY_TYPE rpt ON (rpt.PROPERTY_TYPE = rpd.PROPERTY_TYPE);
