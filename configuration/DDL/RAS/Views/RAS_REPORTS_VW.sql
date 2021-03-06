DROP VIEW RAS.RAS_REPORTS_VW;

CREATE VIEW RAS.RAS_REPORTS_VW
AS
    SELECT rrc.NAME AS CATEGORY
    , rr.REPORT_NAME
    , rr.AUDIT_POINTS
    , rr.DESCRIPTION AS REPORT_DESCRIPTION
    , rrc.DESCRIPTION AS CATEGORY_DESCRIPTION
    , rr.ADF_VIEW_OBJECT
    FROM RAS.RAS_REPORT_CATEGORY rrc
    JOIN RAS.RAS_REPORT rr ON (rr.CATEGORY_ID = rrc.CATEGORY_ID);
