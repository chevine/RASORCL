DROP VIEW PROPERTY_VIOLATION_VW;
CREATE VIEW PROPERTY_VIOLATION_VW
AS
    SELECT rav.TAX_YEAR
    , ra.AUDIT_NAME
    , ra.VIOLATION_POINTS
    , ras.AUDIT_STATUS
    , ras.DESCRIPTION
    , rav.PROPERTY_ID
    FROM RAS.RAS_AUDIT_VIOLATION rav
    JOIN RAS.RAS_AUDIT ra ON (ra.AUDIT_ID = rav.AUDIT_ID)
    JOIN RAS.RAS_AUDIT_STATUS ras ON (ras.STATUS_ID = rav.STATUS_ID);
