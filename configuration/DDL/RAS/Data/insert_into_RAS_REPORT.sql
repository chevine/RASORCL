TRUNCATE TABLE RAS.RAS_REPORT;

-- Landlord Reports
INSERT INTO RAS.RAS_REPORT VALUES(1, 1, 'Landlord Rental Income Historical Trends', 10, 'XXX', 'The oldest reported income of the current landlord(s) should be similar to the latest reported income of the last landlord(s).  If the reported rental incomes are not within a certain range of each other, the current landlord(s) and the previous landlord(s) should be audited.');
INSERT INTO RAS.RAS_REPORT VALUES(3, 1, 'Landlord Missing Rental Income', 10, 'XXX', 'Review the past reported income to confirm that landlord has consistently reported rental income for the property.  There should not be any missing years.');
INSERT INTO RAS.RAS_REPORT VALUES(4, 1, 'Landlord Did Not Report All Tenants', 10, 'XXX', 'Tenants that have not been reported by landlords');
INSERT INTO RAS.RAS_REPORT VALUES(5, 1, 'Landlord Rental Income Inconsistent', 10, 'XXX', 'Rental income, from previous years, is not consistent with current year');
INSERT INTO RAS.RAS_REPORT VALUES(6, 1, 'Rental Properties Missing Landlordds', 10, 'RPT_RENTAL_PROPERTY_MISSING_LANDLORD', 'Landlord owns property that has not been reported as rental property');
INSERT INTO RAS.RAS_REPORT VALUES(7, 1, 'Landlord Missing Yearly Rental Income', 10, 'XXX', 'Based upon the number of years that a landlord has owned a property, confirm that the landlord has reported rental income for those number of years.');
INSERT INTO RAS.RAS_REPORT VALUES(8, 1, 'Landlord Rental Income More Than Reported By All Tenants', 10, 'XXX', 'When the total rental income is more than the total rental payments by all of tenants for the property, some of the tenants did not report the correct amounts or at least one of the tenants did not file a tax return.');
INSERT INTO RAS.RAS_REPORT VALUES(9, 1, 'Landlord Rental Income Mismatch', 5, 'RPT_RENTAL_INCOME_DIFFERENCE', 'Based upon the landlords ownership of the property, the income reported by landlord is less than the total rental payments reported by all of the tenants for the property.');

-- Tenant Reports
INSERT INTO RAS.RAS_REPORT VALUES(20, 2, 'Rental Payment Higher Than Expected For Gross Income', 10, 'XXX', 'Based upon the tenant''s income and the rental payment, the rental payment should not be more than the expected percentage.');
INSERT INTO RAS.RAS_REPORT VALUES(21, 2, 'Tenant Has Made Payments To sublandlord That Has Not Reported The Correct Rental Income', 10, 'XXX', 'If the tenant makes payments to a person/organization that does not own the property, confirm that the sublandlord has reported rental income and rental payments.');
INSERT INTO RAS.RAS_REPORT VALUES(22, 2, 'Rental Payment and Rental Income Between Lessor and Lessee Does Not Match', 10, 'XXX', 'Confirm that the rental income for the lessor matches the rental payments from the lesssee.');
INSERT INTO RAS.RAS_REPORT VALUES(23, 2, 'Tenant Has Not Filed A Tax Return', 10, 'XXX', 'For each tenant that has been provided by a landlord, identify the tenants that have not filed a tax return.');

-- Property Reports
INSERT INTO RAS.RAS_REPORT VALUES(40, 3, 'Property Ownership Not 100%', 5, 'RPT_PROPERTY_OWNERSHIP_ISSUE_VW', 'Properties where  at least one landlord has not reported rental income.  Each landlord must report his/her ownership.  If the total ownership is not equal to 100 for all of owners, a discrepancy has been detected.');
INSERT INTO RAS.RAS_REPORT VALUES(41, 3, 'Ownership Is Not 100%', 1, 'RPT_PROPERTY_OWNERSHIP_NOT_100_PCT_VW', 'Properties where total landlord ownership is not equal to 100%.');
INSERT INTO RAS.RAS_REPORT VALUES(42, 3, 'High Number Of Tenants', 1, 'XXX', 'Properties that have a very high number of residents');
INSERT INTO RAS.RAS_REPORT VALUES(43, 3, 'Landlord Rental Income More Than Rental Payments', 1, 'XXX', 'If the total amount of reported income by the landlords is more than the total amount of rental payments by tax filers, at least one of the tenants has not filed a tax return or has reported the wrong amount.');
INSERT INTO RAS.RAS_REPORT VALUES(44, 3, 'Tenants Exist and Landlord Does Not Exist', 1, 'XXX', 'If at least one tax filer has reported rental payments for a property, there must be at least one landlord that has reported rental income for the rental property.');
INSERT INTO RAS.RAS_REPORT VALUES(45, 3, 'Landlord Does Not Exist', 1, 'XXX', 'Excluding certain properties, e.g., public buildings, identify properties that have not been associated to an owner.');
INSERT INTO RAS.RAS_REPORT VALUES(46, 3, 'Tenant Has Reported Landlord That Does Not Exist', 1, 'RPT_PROPERTY_WITHOUT_LANDLORD_VW', 'For each landlord that has been provided by a tenant, confirm that the landlord has reported rental income for that property.');
INSERT INTO RAS.RAS_REPORT VALUES(47, 3, 'Property Description Does Not Match', 1, 'XXX', 'The property description provided by a landlord or a tenant does not match the property description provided by the tax assessor.');
INSERT INTO RAS.RAS_REPORT VALUES(48, 3, 'Property May Not Be Vacant', 1, 'XXX', 'If the property is not the primary residence of the owner and the property does not have any tenants, additional information is required to determine how it is used.');
INSERT INTO RAS.RAS_REPORT VALUES(49, 3, 'Rental Income For Property Is Not Consistent', 1, 'XXX', 'Review the past reported incomes to ensure that landlords have consistently reported rental income and the reported rental incomes are increasing consistently.');
INSERT INTO RAS.RAS_REPORT VALUES(50, 3, 'Property Is On A Block That Has A High Number Of Fraudulent Activities', 1, 'XXX', 'For each "block" that has more than 5 properties that have fraudulent activities, conduct an inspection of the properties on that block.');
