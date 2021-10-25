SELECT  
    RAS_LANDLORD.taxYear taxYear,  
    RAS_LANDLORD.taxId taxId,  
    RAS_LANDLORD.firstName firstName,  
    RAS_LANDLORD.middleName middleName,  
    RAS_LANDLORD.lastName lastName,  
    RAS_LANDLORD.grossIncome grossIncome,  
    RAS_PROPERTY.percentageOwned percentageOwned,  
    RAS_PROPERTY.rentalIncomeReceived rentalIncomeReceived,  
    SUM(RAS_HOUSEHOLD_UNIT.totalRentalPaymentsByResident) totalRentalPaymentsByResident  
FROM  
    ((((RAS_LANDLORD JOIN RAS_REPORT_CATEGORY ON RAS_REPORT_CATEGORY.name = 'LANDLORD') JOIN RAS_REPORT ON RAS_REPORT_CATEGORY.categoryId = RAS_REPORT.categoryId) JOIN RAS_PROPERTY ON RAS_LANDLORD.taxYear = RAS_PROPERTY.taxYear AND RAS_LANDLORD.taxId = RAS_PROPERTY.landlordTaxId) LEFT JOIN RAS_AUDIT_ISSUE ON RAS_LANDLORD.taxYear = RAS_AUDIT_ISSUE.taxYear AND RAS_LANDLORD.taxId = RAS_AUDIT_ISSUE.taxId AND RAS_REPORT.categoryId = RAS_AUDIT_ISSUE.categoryId AND RAS_REPORT.reportId = RAS_AUDIT_ISSUE.reportId) LEFT JOIN RAS_HOUSEHOLD_UNIT ON RAS_PROPERTY.taxYear = RAS_HOUSEHOLD_UNIT.taxYear AND RAS_PROPERTY.propertyId = RAS_HOUSEHOLD_UNIT.propertyId  
GROUP BY  
    RAS_LANDLORD.taxYear,  
    RAS_LANDLORD.taxId,  
    RAS_LANDLORD.firstName,  
    RAS_LANDLORD.middleName,  
    RAS_LANDLORD.lastName,  
    RAS_LANDLORD.grossIncome,  
    RAS_PROPERTY.percentageOwned,  
    RAS_PROPERTY.rentalIncomeReceived  
HAVING  
    RAS_PROPERTY.rentalIncomeReceived > SUM(ISNULL(RAS_HOUSEHOLD_UNIT.totalRentalPaymentsByResident,0))
