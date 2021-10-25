INSERT INTO RAS.RAS_AUDIT( AUDIT_NAME, DESCRIPTION, VIOLATION_POINTS, DEFAULT_STATUS ) 
        VALUES( 'OWNER_PROPERTY_CITY_MISMATCH', 'The owner does not live in the same city as the property.', 10, 'CONFIRMED' );

INSERT INTO RAS.RAS_AUDIT( AUDIT_NAME, DESCRIPTION, VIOLATION_POINTS, DEFAULT_STATUS ) 
        VALUES( 'OWNER_RESIDES_AT_DIFF_PROPERTY', 'The owner lives in the same city as the property and the address is different.', 5, 'CONFIRMED' );

INSERT INTO RAS.RAS_AUDIT( AUDIT_NAME, DESCRIPTION, VIOLATION_POINTS, DEFAULT_STATUS ) 
        VALUES( 'OWNER_PROVIDED_PO_BOX', 'The owner address has provided a post office box as the owner''s mailing address.', 10, 'CONFIRMED' );

INSERT INTO RAS.RAS_AUDIT( AUDIT_NAME, DESCRIPTION, VIOLATION_POINTS, DEFAULT_STATUS ) 
        VALUES( 'TWO_HOUSE_NUMBERS', 'The property has at least two house numbers associated to it.', 2, 'UNKNOWN' );

INSERT INTO RAS.RAS_AUDIT( AUDIT_NAME, DESCRIPTION, VIOLATION_POINTS, DEFAULT_STATUS ) 
        VALUES( 'OWNED_BY_LLC', 'The property is owned by a LLC entity.', 8, 'CONFIRMED' );



