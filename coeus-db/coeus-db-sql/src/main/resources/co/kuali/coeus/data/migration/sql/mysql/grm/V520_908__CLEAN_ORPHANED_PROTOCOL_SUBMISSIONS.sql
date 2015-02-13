delete from IACUC_PROTOCOL_SUBMISSION WHERE PROTOCOL_NUMBER NOT IN (SELECT PROTOCOL_NUMBER FROM IACUC_PROTOCOL);
CREATE INDEX IACUC_PROTOCOL_NUMBER_IDX on IACUC_PROTOCOL(PROTOCOL_NUMBER);
CREATE INDEX IACUC_PROTOCOL_NUMBER_IDX on IACUC_PROTOCOL_SUBMISSION(PROTOCOL_NUMBER);
ALTER TABLE IACUC_PROTOCOL_SUBMISSION ADD CONSTRAINT FK_IACUC_PROTOCOL_NUMBER FOREIGN KEY (PROTOCOL_NUMBER) REFERENCES IACUC_PROTOCOL(PROTOCOL_NUMBER);
