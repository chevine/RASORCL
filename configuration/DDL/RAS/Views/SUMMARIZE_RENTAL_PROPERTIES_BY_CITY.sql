DROP VIEW RAS.SUMMARIZE_RENTAL_PROPERTIES_BY_CITY;

CREATE VIEW RAS.SUMMARIZE_RENTAL_PROPERTIES_BY_CITY
AS
    SELECT rpc.STATE
    , rpc.COUNTY
    , rpc.MUNICIPALITY
    , rpc.TAX_YEAR
    , rpc.PROPERTY_COUNT
    , rpc.RENTAL_INCOME_RECEIVED
    , tnt.TOTAL_RENTAL_PAYMENTS
    , rpc.RENTAL_INCOME_RECEIVED - tnt.TOTAL_RENTAL_PAYMENTS AS RENTAL_INCOME_DIFFERENCE
    , rpc.NUMBER_OF_PROPERTY_OWNERS
    , rpc.TOTAL_DEDUCTIONS
    , rpc.PROPERTY_TAXES
    FROM (
        SELECT rm.STATE
        , rm.COUNTY
        , rm.MUNICIPALITY
        , rp.TAX_YEAR
        , COUNT(*) AS PROPERTY_COUNT
        , SUM(rp.RENTAL_INCOME_RECEIVED) AS RENTAL_INCOME_RECEIVED
        , SUM(rp.NUMBER_OF_PROPERTY_OWNERS) AS NUMBER_OF_PROPERTY_OWNERS
        , SUM(rp.TOTAL_DEDUCTIONS) AS TOTAL_DEDUCTIONS
        , SUM(rp.PROPERTY_TAXES) AS PROPERTY_TAXES
        FROM RAS.RAS_PROPERTY rp
        JOIN RAS.RAS_MUNICIPALITY rm ON (rm.STATE = rp.STATE AND rm.CODE = rp.MUNICIPALITY_CODE)
        GROUP BY rm.STATE, rm.COUNTY, rm.MUNICIPALITY, rp.TAX_YEAR
    ) rpc
    JOIN (
        SELECT pwtv.STATE
        , pwtv.COUNTY
        , pwtv.MUNICIPALITY
        , pwtv.TAX_YEAR
        , count(*) AS HOUSEHOLD_COUNT
        , SUM(pwtv.GROSS_INCOME) AS GROSS_INCOME
        , SUM(pwtv.TOTAL_RENTAL_PAYMENTS) AS TOTAL_RENTAL_PAYMENTS
        FROM RAS.PROPERTIES_WITH_TENANTS_VW pwtv
        GROUP BY pwtv.STATE, pwtv.COUNTY, pwtv.MUNICIPALITY, pwtv.TAX_YEAR
    ) tnt ON (tnt.STATE = rpc.STATE AND tnt.COUNTY = rpc.COUNTY AND tnt.MUNICIPALITY = rpc.MUNICIPALITY AND tnt.TAX_YEAR = rpc.TAX_YEAR);
