ALTER TABLE USER_ROLES DISABLE CONSTRAINT FK_USER_ROLES_UNIT ;
ALTER TABLE KRA_USER DISABLE CONSTRAINT FK_USER_UNIT_NUMBER_KRA ;
ALTER TABLE AWARD_REPORT_TRACKING DISABLE CONSTRAINT AWARD_REPORT_TRACKING_FK1 ;
ALTER TABLE UNIT_ADMINISTRATOR DISABLE CONSTRAINT FK1_UNIT_ADMINISTRATOR_KRA ;
ALTER TABLE PROTOCOL_UNITS DISABLE CONSTRAINT FK_PROTOCOL_UNITS_2 ;
ALTER TABLE PROPOSAL_UNITS DISABLE CONSTRAINT FK_PROPOSAL_UNITS_UNIT_NUMBER ;
ALTER TABLE PROPOSAL_LOG DISABLE CONSTRAINT FK_LEAD_UNIT ;
ALTER TABLE INSTITUTE_RATES DISABLE CONSTRAINT FK_INST_RATES_UNIT_NUMBER_KRA ;
ALTER TABLE INSTITUTE_LA_RATES DISABLE CONSTRAINT FK_INSTITUTE_LA_RATES_UNIT_KRA ;
ALTER TABLE AWARD_PERSON_UNITS DISABLE CONSTRAINT FK_APU_UNIT ;
ALTER TABLE UNIT_FORMULATED_COST DISABLE CONSTRAINT FK_UNIT_FORMULATED_COST_1 ;
ALTER TABLE FIN_OBJECT_CODE_MAPPING DISABLE CONSTRAINT FK_UNIT_NUMBER ;
ALTER TABLE COMMITTEE DISABLE CONSTRAINT FK_COMMITTEE_2 ;
ALTER TABLE NEGOTIATION_UNASSOC_DETAIL DISABLE CONSTRAINT NEGOTIATION_UNASSOC_DETAIL_FK2 ;
ALTER TABLE AWARD DISABLE CONSTRAINT FK_AWARD_UNIT ;
ALTER TABLE IACUC_PROTOCOL_UNITS DISABLE CONSTRAINT FK_IACUC_PROTOCOL_UNITS_UNIT ;                                
TRUNCATE TABLE UNIT
/
INSERT INTO UNIT(UNIT_NUMBER,UNIT_NAME,ORGANIZATION_ID,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,PARENT_UNIT_NUMBER,OBJ_ID,ACTIVE_FLAG)
SELECT UNIT_NUMBER,UNIT_NAME,ORGANIZATION_ID,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,PARENT_UNIT_NUMBER,sys_guid(),ACTIVE_FLAG
FROM UNIT@KC_STAG_DB_LINK
/
TRUNCATE TABLE UNIT_ADMINISTRATOR
/
INSERT INTO UNIT_ADMINISTRATOR(UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
SELECT UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,sys_guid()
FROM UNIT_ADMINISTRATOR@KC_STAG_DB_LINK
/
ALTER TABLE USER_ROLES ENABLE CONSTRAINT FK_USER_ROLES_UNIT ;
ALTER TABLE KRA_USER ENABLE CONSTRAINT FK_USER_UNIT_NUMBER_KRA ;
ALTER TABLE AWARD_REPORT_TRACKING ENABLE CONSTRAINT AWARD_REPORT_TRACKING_FK1 ;
ALTER TABLE UNIT_ADMINISTRATOR ENABLE CONSTRAINT FK1_UNIT_ADMINISTRATOR_KRA ;
ALTER TABLE PROTOCOL_UNITS ENABLE CONSTRAINT FK_PROTOCOL_UNITS_2 ;
ALTER TABLE PROPOSAL_UNITS ENABLE CONSTRAINT FK_PROPOSAL_UNITS_UNIT_NUMBER ;
ALTER TABLE PROPOSAL_LOG ENABLE CONSTRAINT FK_LEAD_UNIT ;
ALTER TABLE INSTITUTE_RATES ENABLE CONSTRAINT FK_INST_RATES_UNIT_NUMBER_KRA ;
ALTER TABLE INSTITUTE_LA_RATES ENABLE CONSTRAINT FK_INSTITUTE_LA_RATES_UNIT_KRA ;
ALTER TABLE AWARD_PERSON_UNITS ENABLE CONSTRAINT FK_APU_UNIT ;
ALTER TABLE UNIT_FORMULATED_COST ENABLE CONSTRAINT FK_UNIT_FORMULATED_COST_1 ;
ALTER TABLE FIN_OBJECT_CODE_MAPPING ENABLE CONSTRAINT FK_UNIT_NUMBER ;
ALTER TABLE COMMITTEE ENABLE CONSTRAINT FK_COMMITTEE_2 ;
ALTER TABLE NEGOTIATION_UNASSOC_DETAIL ENABLE CONSTRAINT NEGOTIATION_UNASSOC_DETAIL_FK2 ;
ALTER TABLE AWARD ENABLE CONSTRAINT FK_AWARD_UNIT ;
ALTER TABLE IACUC_PROTOCOL_UNITS ENABLE CONSTRAINT FK_IACUC_PROTOCOL_UNITS_UNIT ;                                