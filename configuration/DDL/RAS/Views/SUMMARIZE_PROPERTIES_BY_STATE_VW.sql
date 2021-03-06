DROP VIEW RAS.SUMMARIZE_PROPERTIES_BY_STATE_VW;

CREATE VIEW RAS.SUMMARIZE_PROPERTIES_BY_STATE_VW
AS
    SELECT rpivw.TAX_YEAR
    , rpivw.PROPERTY_STATE
    , rpivw.PROPERTY_DESCRIPTION
    , SUM(rpivw.RENTAL_INCOME_RECEIVED) AS RENTAL_INCOME_RECEIVED
    , SUM(rpivw.TOTAL_TENANT_RENTAL_PAYMENTS) AS TOTAL_TENANT_RENTAL_PAYMENTS
    , SUM(rpivw.RENTAL_INCOME_RECEIVED - rpivw.TOTAL_TENANT_RENTAL_PAYMENTS) AS RENTAL_INCOME_DIFFERENCE
    , COUNT(1) AS PROPERTY_COUNT
    FROM RAS.PROPERTY_INFO_VW rpivw
    GROUP BY rpivw.TAX_YEAR, rpivw.PROPERTY_STATE, rpivw.PROPERTY_DESCRIPTION;
