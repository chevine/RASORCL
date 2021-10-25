INSERT INTO RAS_AUDIT_STATUS(STATUS_ID, AUDIT_STATUS, DESCRIPTION) VALUES(1, 'CONFIRMED', 'The audit violation should be considered to be valid.');
INSERT INTO RAS_AUDIT_STATUS(STATUS_ID, AUDIT_STATUS, DESCRIPTION) VALUES(2, 'UNCONFIRMED', 'The possibility exists that the audit violation is valid.');
INSERT INTO RAS_AUDIT_STATUS(STATUS_ID, AUDIT_STATUS, DESCRIPTION) VALUES(3, 'INVALID', 'The tenant/landlord has provided proof that the audit violation is not valid.');
INSERT INTO RAS_AUDIT_STATUS(STATUS_ID, AUDIT_STATUS, DESCRIPTION) VALUES(4, 'UNKNOWN', 'Additional information is required to confirm that the violation is valid.');
INSERT INTO RAS_AUDIT_STATUS(STATUS_ID, AUDIT_STATUS, DESCRIPTION) VALUES(5, 'DISMISS', 'The audit violation has been dismissed.');
