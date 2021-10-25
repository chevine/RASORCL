SELECT DISTINCT AC.landlordTaxId 
, RAS_PROPERTY_DESCRIPTION.address, RAS_PROPERTY_DESCRIPTION.city, RAS_PROPERTY_DESCRIPTION.state 
, AC.actualYrCount, YC.yearCount 
, AC.actualYrCount - YC.yearCount yearsMissing 
FROM  
( 
    SELECT landlordTaxId, propertyId 
    , convert(int,max(taxYear)) - convert(int,min(taxYear)) actualYrCount 
    FROM RAS_LL_RENTAL_INCOME 
    GROUP BY landlordTaxId, propertyId 
) AC 
JOIN ( 
    SELECT landlordTaxId, propertyId, count(*) yearCount 
    FROM RAS_LL_RENTAL_INCOME LLRI 
    GROUP BY landlordTaxId, propertyId 
) YC ON (AC.landlordTaxId = YC.landlordTaxId AND AC.propertyId = YC.propertyId) 
JOIN RAS_REPORT_CATEGORY ON RAS_REPORT_CATEGORY.name = 'LANDLORD' 
JOIN RAS_REPORT ON RAS_REPORT_CATEGORY.categoryId = RAS_REPORT.categoryId AND RAS_REPORT.reportName = 'Landlord Missing Yearly Rental Income' 
LEFT JOIN RAS_AUDIT_ISSUE RAI ON ( RAI.taxId = AC.landlordTaxId AND RAI.categoryId = RAS_REPORT.categoryId AND RAI.reportId = RAS_REPORT.reportId) 
JOIN RAS_PROPERTY_DESCRIPTION ON AC.propertyId = RAS_PROPERTY_DESCRIPTION.propertyId 
--WHERE RAI.taxId IS NULL
