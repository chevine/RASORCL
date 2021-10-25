DROP VIEW RAS.LANDLORD_PROFILE_VW;

CREATE VIEW RAS.LANDLORD_PROFILE_VW
AS
    SELECT rl.FIRST_NAME
    , rl.MIDDLE_NAME
    , rl.LAST_NAME
    , rl.GROSS_INCOME
    , rl.ADDRESS
    , rl.CITY
    , rl.STATE
    , rl.ZIP_CODE
    , rl.COUNTRY
    , ll.TAX_YEAR
    , ll.LANDLORD_TAX_ID
    , ll.PROPERTY_COUNT
    , ll.RENTAL_INCOME_RECEIVED
    , tnt.TOTAL_RENTAL_PAYMENTS
    , ll.RENTAL_INCOME_RECEIVED - tnt.TOTAL_RENTAL_PAYMENTS AS RENTAL_INCOME_DIFFERENCE
    , ll.TOTAL_DEDUCTIONS
    , ll.PROPERTY_TAXES
    FROM (
        -- Generate the property statistics for all of the landlord properties
        SELECT rp.TAX_YEAR
        , rp.LANDLORD_TAX_ID
        , COUNT(rp.PROPERTY_ID) AS PROPERTY_COUNT
        , SUM(rp.RENTAL_INCOME_RECEIVED) AS RENTAL_INCOME_RECEIVED
        , SUM(rp.TOTAL_DEDUCTIONS) AS TOTAL_DEDUCTIONS
        , SUM(rp.PROPERTY_TAXES) AS PROPERTY_TAXES
        FROM RAS.RAS_PROPERTY rp
        GROUP BY rp.TAX_YEAR, rp.LANDLORD_TAX_ID
    ) ll
    JOIN (
-- Determine the total rental payments to a landlord
        SELECT ll.TAX_YEAR
        , ll.LANDLORD_TAX_ID
        , ll.FIRST_NAME
        , ll.LAST_NAME
        , COUNT(*) AS PROPERTY_COUNT
        , SUM(ll.TOTAL_RENTAL_PAYMENTS) AS TOTAL_RENTAL_PAYMENTS
        FROM (
            -- For each landlord's property, generate the tenant statistics
            SELECT rp.TAX_YEAR
            , rp.LANDLORD_TAX_ID
            , rl.FIRST_NAME
            , rl.LAST_NAME
            , rp.PROPERTY_ID
            , tnt.TOTAL_RENTAL_PAYMENTS
            FROM RAS.RAS_PROPERTY rp
            JOIN RAS.RAS_LANDLORD rl ON (rl.TAX_YEAR = rp.TAX_YEAR AND rl.TAXID = rp.LANDLORD_TAX_ID)
            JOIN (
                SELECT pwtv.TAX_YEAR
                , pwtv.PROPERTY_ID
                , SUM(pwtv.TOTAL_RENTAL_PAYMENTS) AS TOTAL_RENTAL_PAYMENTS
                FROM RAS.PROPERTIES_WITH_TENANTS_VW pwtv
                GROUP BY pwtv.TAX_YEAR, pwtv.PROPERTY_ID
            ) tnt ON (tnt.TAX_YEAR = rp.TAX_YEAR AND tnt.PROPERTY_ID = rp.PROPERTY_ID)
        ) ll
        GROUP BY ll.TAX_YEAR, ll.LANDLORD_TAX_ID, ll.FIRST_NAME, ll.LAST_NAME
    ) tnt ON (tnt.TAX_YEAR = ll.TAX_YEAR AND tnt.LANDLORD_TAX_ID = ll.LANDLORD_TAX_ID)
    JOIN RAS.RAS_LANDLORD rl ON (rl.TAX_YEAR = ll.TAX_YEAR AND rl.TAXID = ll.LANDLORD_TAX_ID);
