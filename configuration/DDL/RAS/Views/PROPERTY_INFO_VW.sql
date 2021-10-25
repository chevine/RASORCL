DROP VIEW RAS.PROPERTY_INFO_VW;

CREATE VIEW RAS.PROPERTY_INFO_VW
AS
    SELECT rpby.TAX_YEAR
    , rpby."STATE" AS PROPERTY_STATE 
    , rm.COUNTY AS PROPERTY_COUNTY
    , rm.MUNICIPALITY AS PROPERTY_MUNICIPALITY
    , rpd.PROPERTY_LOCATION
    , rpt.PROPERTY_DESCRIPTION
    , rpd.BLOCK
    , rpd.LOT
    , rpivw.LANDLORD_TAX_ID
    , COALESCE(rpivw.PERCENTAGE_OWNED, 100) AS PERCENTAGE_OWNED
    , COALESCE(rpivw.RENTAL_INCOME_RECEIVED, 0) AS RENTAL_INCOME_RECEIVED
    , COALESCE(spwtbpvw.TOTAL_TENANT_RENTAL_PAYMENTS, 0) AS TOTAL_TENANT_RENTAL_PAYMENTS
    , COALESCE(rpivw.RENTAL_INCOME_RECEIVED, 0) - COALESCE(spwtbpvw.TOTAL_TENANT_RENTAL_PAYMENTS, 0) AS RENTAL_INCOME_DIFFERENCE
    , COALESCE(rpivw.TOTAL_DEDUCTIONS, 0) AS TOTAL_DEDUCTIONS
    , COALESCE(rpivw.PROPERTY_TAXES, 0) AS PROPERTY_TAXES
    , rpd.OWNER_NAME
    , rpd.OWNER_CITY
    , rpd.OWNER_ADDRESS
    , rpd.OWNER_ZIPCODE
    , rpd.OWNER_STATE
    , rpd.OWNER_COUNTRY
    , rpd.TAX_ACCOUNT_NUMBER AS PROPERTY_ACCOUNT_NUMBER
    , rpd.YEAR_CONSTRUCTED
    , rpd.DEED_BOOK
    , rpd.DEED_PAGE
    , rpd.DEED_DATE
    , rpd.LONGITUDE
    , rpd.LATITUDE
    , rpd.PROPERTY_ID
    FROM RAS.RAS_PROPERTY_BASE_YEAR rpby
    JOIN RAS.RAS_MUNICIPALITY rm ON (rm."STATE" = rpby."STATE" AND rm.CODE = rpby.CODE)
    JOIN RAS.RAS_PROPERTY_DESCRIPTION rpd ON (rpd.PROPERTY_ID = rpby.PROPERTY_ID AND rpd."STATE" = rpby."STATE" AND rpd.MUNICIPALITY_CODE = rpby.CODE)
    JOIN RAS.RAS_PROPERTY_TYPE rpt ON (rpt.PROPERTY_CLASS = rpd.PROPERTY_CLASS)
    LEFT JOIN RAS.RENTAL_PROPERTY_INFO_VW rpivw ON (rpivw.TAX_YEAR = rpby.TAX_YEAR AND rpivw.PROPERTY_ID = rpby.PROPERTY_ID)
    LEFT JOIN RAS.SUMMARIZE_PROPERTIES_WITH_TENANTS_BY_PROPERTY_VW spwtbpvw ON (spwtbpvw.TAX_YEAR = rpby.TAX_YEAR AND spwtbpvw."STATE" = rpby."STATE" AND spwtbpvw.PROPERTY_ID = rpby.PROPERTY_ID)
    ;