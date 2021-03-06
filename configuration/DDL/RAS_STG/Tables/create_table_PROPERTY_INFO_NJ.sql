
DROP TABLE RAS_STG.PROPERTY_INFO_NJ;

CREATE TABLE RAS_STG.PROPERTY_INFO_NJ 
   (
	"COUNTY_DISTRICT" CHAR(4 BYTE) NOT NULL ENABLE, 
	"BLOCK" CHAR(9 BYTE) NOT NULL ENABLE, 
	"LOT" CHAR(9 BYTE) NOT NULL ENABLE, 
	"QUALIFIER" CHAR(11 BYTE) NOT NULL ENABLE, 
	"RECORD_ID" CHAR(2 BYTE) NOT NULL ENABLE, 
	"FILLER_1" CHAR(2 BYTE) NOT NULL ENABLE, 
	"TRANSACTION_DATE" CHAR(6 BYTE) NOT NULL ENABLE, 
	"TRANSACTION_UPDATE_NO" CHAR(4 BYTE), 
	"TAX_ACCOUNT_NUMBER" CHAR(8 BYTE) NOT NULL ENABLE, 
	"PROPERTY_CLASS" CHAR(3 BYTE) NOT NULL ENABLE, 
	"PROPERTY_LOCATION" CHAR(25 BYTE) NOT NULL ENABLE, 
	"BUILDING_DESCRIPTION" CHAR(15 BYTE) NOT NULL ENABLE, 
	"LAND_DESCRIPTION" CHAR(20 BYTE) NOT NULL ENABLE, 
	"CALCULATED_ACREAGE" CHAR(9 BYTE) NOT NULL ENABLE, 
	"ADDITION_LOTS1" CHAR(20 BYTE) NOT NULL ENABLE, 
	"ADDITION_LOTS2" CHAR(20 BYTE) NOT NULL ENABLE, 
	"ZONING" CHAR(4 BYTE) NOT NULL ENABLE, 
	"TAX_MAP_PAGE_NUMBER" CHAR(4 BYTE) NOT NULL ENABLE, 
	"OWNER_NAME" CHAR(35 BYTE) NOT NULL ENABLE, 
	"STREET_ADDRESS" CHAR(25 BYTE) NOT NULL ENABLE, 
	"CITY_STATE" CHAR(25 BYTE) NOT NULL ENABLE, 
	"ZIP_CODE" CHAR(9 BYTE) NOT NULL ENABLE, 
	"NUMBER_OF_OWNERS" CHAR(4 BYTE) NOT NULL ENABLE, 
	"DEDUCTION_AMOUNT" CHAR(6 BYTE) NOT NULL ENABLE, 
	"FILLER2" CHAR(1 BYTE) NOT NULL ENABLE, 
	"BANK_CODE" CHAR(5 BYTE) NOT NULL ENABLE, 
	"MORTGAGE_ACCOUNT_NUMBER" CHAR(10 BYTE) NOT NULL ENABLE, 
	"DEED_BOOK" CHAR(5 BYTE) NOT NULL ENABLE, 
	"DEED_PAGE" CHAR(5 BYTE) NOT NULL ENABLE, 
	"SALES_PRICE_CODE" CHAR(1 BYTE) NOT NULL ENABLE, 
	"DEED_DATE" CHAR(6 BYTE) NULL, 
	"SALE_PRICE" CHAR(9 BYTE) NOT NULL ENABLE, 
	"SALE_ASSESSMENT" CHAR(9 BYTE) NOT NULL ENABLE, 
	"SALE_SR1A_UN_CODE" CHAR(2 BYTE) NOT NULL ENABLE, 
	"SOCIAL_SECURITY_NO" CHAR(9 BYTE) NOT NULL ENABLE, 
	"SCHOOL_TAX_OVERAGE" CHAR(9 BYTE) NOT NULL ENABLE, 
	"NO_OF_DWELLINGS" CHAR(2 BYTE) NOT NULL ENABLE, 
	"NO_OF_COMMERCIAL_DW" CHAR(2 BYTE) NOT NULL ENABLE, 
	"MULTIPLE_OCCUPANCY" CHAR(1 BYTE) NOT NULL ENABLE, 
	"PERCENT_OWNED_CODE" CHAR(1 BYTE) NOT NULL ENABLE, 
	"REBATE_CODE" CHAR(2 BYTE) NOT NULL ENABLE, 
	"DELINQUENT_CODE" CHAR(1 BYTE) NOT NULL ENABLE, 
	"EPL_OWN" CHAR(2 BYTE) NOT NULL ENABLE, 
	"EPL_USE" CHAR(2 BYTE) NOT NULL ENABLE, 
	"EPL_DESC" CHAR(3 BYTE) NOT NULL ENABLE, 
	"INITIAL_DATE" CHAR(6 BYTE) NOT NULL ENABLE, 
	"FURTHER_DATE" CHAR(6 BYTE) NOT NULL ENABLE, 
	"STATUTE_NUMBER" CHAR(12 BYTE) NOT NULL ENABLE, 
	"FACILITY_NAME" CHAR(20 BYTE) NOT NULL ENABLE, 
	"BUILDING_CLASS_CODE" CHAR(5 BYTE) NOT NULL ENABLE, 
	"YEAR_CONSTRUCTED" CHAR(4 BYTE) NOT NULL ENABLE, 
	"ASSESSMENT_CODE" CHAR(1 BYTE) NOT NULL ENABLE, 
	"LAND_VALUE" CHAR(9 BYTE) NOT NULL ENABLE, 
	"IMPROVEMENT_VALUE" CHAR(9 BYTE) NOT NULL ENABLE, 
	"NET_VALUE" CHAR(9 BYTE) NOT NULL ENABLE, 
	"SPECIAL_TAX_CODE1" CHAR(3 BYTE) NOT NULL ENABLE, 
	"SPECIAL_TAX_CODE2" CHAR(3 BYTE) NOT NULL ENABLE, 
	"SPECIAL_TAX_CODE3" CHAR(3 BYTE) NOT NULL ENABLE, 
	"SPECIAL_TAX_CODE4" CHAR(3 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_CODE1" CHAR(1 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_AMT1" CHAR(8 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_CODE2" CHAR(1 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_AMT2" CHAR(8 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_CODE3" CHAR(1 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_AMT3" CHAR(8 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_CODE4" CHAR(1 BYTE) NOT NULL ENABLE, 
	"EXEMPTION_AMT4" CHAR(8 BYTE) NOT NULL ENABLE, 
	"SENIOR_CITIZENS_CNT" CHAR(4 BYTE), 
	"VETERANS_CNT" CHAR(4 BYTE), 
	"WIDOWS_CNT" CHAR(4 BYTE), 
	"SURV_SPOUSE_CNT" CHAR(3 BYTE), 
	"DISABLED_CNT" CHAR(3 BYTE), 
	"USER_FIELD1" CHAR(4 BYTE), 
	"USER_FIELD2" CHAR(4 BYTE), 
	"OLD_PROPERTY_ID" CHAR(29 BYTE), 
	"CENSUS_TRACT" CHAR(5 BYTE), 
	"CENSUS_BLOCK" CHAR(4 BYTE), 
	"PROPERTY_USE_CODE" CHAR(3 BYTE), 
	"PROPERTY_FLAGS" CHAR(10 BYTE), 
	"REBATE_RESPONSE_FLG" CHAR(1 BYTE), 
	"REBATE_BASE_YEAR" CHAR(4 BYTE), 
	"REBATE_BASE_YEAR_TAX" CHAR(9 BYTE), 
	"REBATE_BASE_YEAR_NET_VAL" CHAR(9 BYTE), 
	"FILLER3" CHAR(5 BYTE), 
	"LAST_YEAR_TAX" CHAR(9 BYTE), 
	"CURRENT_YEAR_TAX" CHAR(9 BYTE), 
	"NON_MUNICIPAL_HALF1" CHAR(9 BYTE), 
	"NON_MUNICIPAL_HALF2" CHAR(9 BYTE), 
	"MUNICIPAL_HALF1" CHAR(9 BYTE), 
	"MUNICIPAL_HALF2" CHAR(9 BYTE), 
	"NON_MUNICIPAL_HALF3" CHAR(9 BYTE), 
	"MUNICIPAL_HALF3" CHAR(9 BYTE), 
	"BILL_STATUS_FLAG" CHAR(1 BYTE), 
	"ESTIMATED_QTR3_TAX" CHAR(9 BYTE) NOT NULL ENABLE, 
	"PRIOR_YEAR_NET_VALUE" CHAR(9 BYTE), 
	"STATEMENT_OF_STATE_AID_AMT" CHAR(9 BYTE)
--	CONSTRAINT "FK_STATE_PROPERTY_CLASS_NJ" FOREIGN KEY (STATE, "PROPERTY_CLASS")
--	REFERENCES "RAS"."PROPERTY_CLASS_NJ" (STATE, "CLASS_CODE") ENABLE,
--	CONSTRAINT "FK_COUNTY_DISTRICT_NJ" FOREIGN KEY (STATE, "COUNTY_DISTRICT")
--	REFERENCES "RAS"."MUNICIPALITY_NJ" (STATE, "CODE") ENABLE
   );

ALTER TABLE RAS_STG.PROPERTY_INFO_NJ
ADD CONSTRAINT "FK_STATE_PROPERTY_CLASS_NJ" FOREIGN KEY ("PROPERTY_CLASS")
REFERENCES RAS_STG.PROPERTY_CLASS_NJ ("CLASS_CODE");

ALTER TABLE RAS_STG.PROPERTY_INFO_NJ
ADD CONSTRAINT "FK_COUNTY_DISTRICT_NJ" FOREIGN KEY ("COUNTY_DISTRICT")
REFERENCES RAS_STG.MUNICIPALITY_NJ ("CODE");
/********************************************************************
*********************************************************************/

/*********************************
SELECT pinfo.COUNTY_DISTRICT
FROM PROPERTY_INFO_NJ pinfo
LEFT JOIN MUNICIPALITY_NJ mnj ON (mnj.code = pinfo.COUNTY_DISTRICT)
where mnj.CODE is null;

*****************************/
