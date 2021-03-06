DROP VIEW RAS.SUMMARIZE_RENTAL_PROPERTIES_BY_STATE;

CREATE VIEW RAS.SUMMARIZE_RENTAL_PROPERTIES_BY_STATE
AS
    SELECT st.STATE 
    , st.TAX_YEAR
    , st.PROPERTY_COUNT
    , st.RENTAL_INCOME_RECEIVED
    , st.TOTAL_RENTAL_PAYMENTS
    , st.RENTAL_INCOME_DIFFERENCE AS RENTAL_INCOME_DIFFERENCE
    , st.NUMBER_OF_PROPERTY_OWNERS
    , st.TOTAL_DEDUCTIONS
    , st.PROPERTY_TAXES
    FROM (
        SELECT srpbc.STATE 
        , srpbc.TAX_YEAR
        , SUM(srpbc.PROPERTY_COUNT) AS PROPERTY_COUNT
        , SUM(srpbc.RENTAL_INCOME_RECEIVED) AS RENTAL_INCOME_RECEIVED
        , SUM(srpbc.TOTAL_RENTAL_PAYMENTS) AS TOTAL_RENTAL_PAYMENTS
        , SUM(srpbc.RENTAL_INCOME_DIFFERENCE) AS RENTAL_INCOME_DIFFERENCE
        , SUM(srpbc.NUMBER_OF_PROPERTY_OWNERS) AS NUMBER_OF_PROPERTY_OWNERS
        , SUM(srpbc.TOTAL_DEDUCTIONS) AS TOTAL_DEDUCTIONS
        , SUM(srpbc.PROPERTY_TAXES) AS PROPERTY_TAXES
        FROM RAS.SUMMARIZE_RENTAL_PROPERTIES_BY_COUNTY srpbc
        GROUP BY srpbc.STATE, srpbc.TAX_YEAR
    ) st
