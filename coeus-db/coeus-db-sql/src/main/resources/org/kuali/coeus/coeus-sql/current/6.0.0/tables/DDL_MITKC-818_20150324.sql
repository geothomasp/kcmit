CREATE TABLE WL_ABSENTEE
   (ABSENTEE_ID NUMBER(12,0) NOT NULL ENABLE, 
	PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	LEAVE_START_DATE DATE, 
	LEAVE_END_DATE DATE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
    CONSTRAINT PK_ABSENTEE PRIMARY KEY (ABSENTEE_ID))
/	
CREATE TABLE WL_CAPACITY                    
   (WLCAPACITY_ID NUMBER(12,0) NOT NULL ENABLE,
    PERSON_ID VARCHAR2(9) NOT NULL ENABLE, 
	CAPACITY NUMBER(3,0) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 	
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_WLCAPACITY_ID  PRIMARY KEY (WLCAPACITY_ID))
/	
CREATE TABLE WL_ASSIGNED_BY
   (ASSIGNED_BY_CODE VARCHAR2(2) NOT NULL ENABLE, 
	DESCRIPTION VARCHAR2(50), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_ASSIGNED_BY PRIMARY KEY (ASSIGNED_BY_CODE))
/	
CREATE TABLE WL_CURRENT_LOAD 
   (LOAD_ID NUMBER(12,0) NOT NULL ENABLE,
    ROUTING_NUMBER VARCHAR2(10), 
	PROPOSAL_NUMBER VARCHAR2(8), 
	ORIG_APPROVER VARCHAR2(40), 
	ORIG_USER_ID VARCHAR2(100), 
	PERSON_ID VARCHAR2(40), 
	USER_ID VARCHAR2(100), 
	SPONSOR_CODE VARCHAR2(8), 
	SPONSOR_GROUP VARCHAR2(50), 
	COMPLEXITY NUMBER(5,2), 
	LEAD_UNIT VARCHAR2(8), 
	ACTIVE_FLAG VARCHAR2(3), 
	ARRIVAL_DATE DATE, 
	INACTIVE_DATE DATE, 
	REROUTED_FLAG VARCHAR2(3), 
	ASSIGNED_BY VARCHAR2(2), 
	UPDATE_TIMESTAMP DATE, 
	UPDATE_USER VARCHAR2(60),
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	LAST_APPROVER VARCHAR2(40),
    CONSTRAINT PK_LOAD_ID PRIMARY KEY (LOAD_ID))
/	
CREATE TABLE WL_FLEXIBILITY 
   (FLEXIBILITY_ID NUMBER(12,0) NOT NULL ENABLE,
    PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	SPONSOR_GROUP VARCHAR2(50), 
	FLEXIBILITY NUMBER(4,2), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_FLEXIBILITY_ID PRIMARY KEY (FLEXIBILITY_ID))
/	
CREATE TABLE WL_LOAD_SIMULATION 
   (SIM_ID NUMBER(4,0), 
	DESCRIPTION VARCHAR2(200), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_LOAD_SIMULATION_ID PRIMARY KEY (SIM_ID))
/	
CREATE TABLE WL_OPTIMIZATION_DATA 
   (OPTIMIZATION_ID NUMBER(12,0) NOT NULL ENABLE,
    PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	SPONSOR_GROUP VARCHAR2(50) NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_OPTIMIZATION_ID PRIMARY KEY (OPTIMIZATION_ID))
/	
CREATE TABLE WL_PROP_AGGREGATOR_COMPLEXITY 
   (COMPLEXITY_ID NUMBER(12,0) NOT NULL ENABLE,
    AGGREGATOR_USER_ID VARCHAR2(100) NOT NULL ENABLE, 
	AGGREGATOR_PERSON_ID VARCHAR2(40), 
	AVERAGE_ERROR_COUNT NUMBER(8,4), 
	COMPLEXITY NUMBER(4,0), 
	PROPOSAL_COUNT NUMBER(6,0),
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_COMPLEXITY_ID PRIMARY KEY (COMPLEXITY_ID))
/	
CREATE TABLE WL_PROP_AGGREGATOR_ERR_COUNT
   (COUNT_ID NUMBER(12,0) NOT NULL ENABLE,
    PROPOSAL_NUMBER VARCHAR2(8) NOT NULL ENABLE, 
	ROUTING_NUMBER VARCHAR2(10), 
	AGGREGATOR_USER_ID VARCHAR2(100), 
	AGGREGATOR_PERSON_ID VARCHAR2(40), 
	ROUTING_START_DATE DATE, 
	NUM_OF_ERRORS NUMBER(4,0),
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,		
	CONSTRAINT PK_COUNT_ID PRIMARY KEY (COUNT_ID))
/	
CREATE TABLE WL_PROP_CANNED_REVIEW_COMMENTS
   (CANNED_REVIEW_COMMENT_CODE NUMBER(3,0) NOT NULL ENABLE, 
	DESCRIPTION VARCHAR2(2000 BYTE) NOT NULL ENABLE, 
	SPONSOR_GROUP VARCHAR2(50 BYTE), 
	SPONSOR_TYPE_CODE NUMBER(3,0), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_PROP_CANNED_REVIEW_COMMENTS PRIMARY KEY (CANNED_REVIEW_COMMENT_CODE))
/	
CREATE TABLE WL_PROP_REV_COMM_LAST_YEAR 
   (REV_COMM_ID NUMBER(12,0) NOT NULL ENABLE,
   PROPOSAL_NUMBER VARCHAR2(8) NOT NULL ENABLE, 
   INST_PROPOSAL_NUMBER VARCHAR2(8), 
   DEV_PROPOSAL_NUMBER VARCHAR2(8), 
   CA_ID VARCHAR2(40), 
   CA_NAME VARCHAR2(120), 
   AL_ID VARCHAR2(40), 
   AL_NAME VARCHAR2(120), 
   CR_ID VARCHAR2(40), 
   CR_NAME VARCHAR2(120), 
   CANNED_REVIEW_COMMENT_CODE NUMBER(3,0), 
   DESCRIPTION VARCHAR2(2000), 
   SPONSOR_GROUP VARCHAR2(50), 
   SPONSOR_TYPE_CODE NUMBER(3,0), 
   CA_FLAG NUMBER, 
   AL_FLAG NUMBER, 
   CR_FLAG NUMBER, 
   AGGREGATOR_ID VARCHAR2(40), 
   AGGREGATOR_NAME VARCHAR2(120), 
   SPONSOR_CODE VARCHAR2(6), 
   DL_ID VARCHAR2(40), 
   DL_NAME VARCHAR2(120), 
   ROUTING_START_DATE DATE,
   VER_NBR NUMBER(8) NOT NULL ENABLE,
   OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
   CONSTRAINT PK_REV_COMM_ID PRIMARY KEY (REV_COMM_ID))
/   
CREATE TABLE WL_PROP_REVIEW_ACTION 
   (REVIEW_ACTION_CODE NUMBER(3,0) NOT NULL ENABLE, 
	DESCRIPTION VARCHAR2(200) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_PROP_REVIEW_ACTION PRIMARY KEY (REVIEW_ACTION_CODE))
/	
CREATE TABLE WL_PROP_REVIEW_COMMENTS 
   (PROP_REV_COMM_ID NUMBER(12,0) NOT NULL ENABLE, 
    PROPOSAL_NUMBER VARCHAR2(8) NOT NULL ENABLE, 
	REVIEW_NUMBER NUMBER(3,0) NOT NULL ENABLE, 
	PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	COMMENT_NUMBER NUMBER(3,0) NOT NULL ENABLE, 
	CANNED_REVIEW_COMMENT_CODE NUMBER(3,0), 
	COMMENTS VARCHAR2(2000), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	MENTOR_PERSON_ID VARCHAR2(40),
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_PROP_REV_COMM_ID PRIMARY KEY (PROP_REV_COMM_ID))
/	
CREATE TABLE WL_PROP_REVIEW_ROLE
   (REVIEW_ROLE_CODE NUMBER(3,0) NOT NULL ENABLE, 
	DESCRIPTION VARCHAR2(200) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_PROP_REVIEW_ROLE PRIMARY KEY (REVIEW_ROLE_CODE))
/	
CREATE TABLE WL_PROP_REVIEW_TIME_SPENT 
   (REVIEW_TIME_SPENT_CODE NUMBER(3,0) NOT NULL ENABLE, 
	DESCRIPTION VARCHAR2(200) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_PROP_REVIEW_TIME_SPENT PRIMARY KEY (REVIEW_TIME_SPENT_CODE))
/	
CREATE TABLE WL_REVIEW_ASSIGNMENTS 
   (REV_ASSIGNMENT_ID NUMBER(12,0) NOT NULL ENABLE,
    ROUTING_NUMBER VARCHAR2(10) NOT NULL ENABLE, 
	PROPOSAL_NUMBER VARCHAR2(8) NOT NULL ENABLE, 
	SPONSOR_CODE VARCHAR2(8), 
	ORIG_APPROVER VARCHAR2(60), 
	NEW_APPROVER VARCHAR2(60), 
	ASSIGNED_BY VARCHAR2(1), 
	ASSIGNED_TIMESTAMP DATE NOT NULL ENABLE, 
	IS_FIRST_MAP VARCHAR2(1), 
	IS_FIRST_ROUTNIG VARCHAR2(1), 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_REV_ASSIGNMENT_ID PRIMARY KEY (REV_ASSIGNMENT_ID))
/	
CREATE TABLE WL_SUBMISSION_VEHICLE 
   (SUBMISSION_VEHICLE_CODE NUMBER(3,0) NOT NULL ENABLE, 
	DESCRIPTION VARCHAR2(200) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_SUBMISSION_VEHICLE PRIMARY KEY (SUBMISSION_VEHICLE_CODE))
/	
CREATE TABLE WL_PROP_REVIEW_DETAILS 
   (PROP_REV_DET_ID NUMBER(12,0) NOT NULL ENABLE, 
    PROPOSAL_NUMBER VARCHAR2(8) NOT NULL ENABLE, 
	REVIEW_NUMBER NUMBER(3,0) NOT NULL ENABLE, 
	PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	ROUTING_NUMBER VARCHAR2(10), 
	REVIEW_ACTION_CODE NUMBER(3,0), 
	REVIEW_ROLE_CODE NUMBER(3,0), 
	REVIEW_TIME_SPENT_CODE NUMBER(3,0), 
	TIME_SPENT_ASSIS_DLC_CODE NUMBER(3,0), 
	SUBMISSION_VEHICLE_CODE NUMBER(3,0), 
	REVIEWED_DEAN_OFFICE_FLAG VARCHAR2(1), 
	COMMENTS VARCHAR2(2000), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,		
	CONSTRAINT PK_PROP_REVIEW_DETAILS PRIMARY KEY (PROP_REV_DET_ID),
	CONSTRAINT FK1_PROP_REVIEW_DETAILS FOREIGN KEY (REVIEW_ACTION_CODE)
	REFERENCES WL_PROP_REVIEW_ACTION (REVIEW_ACTION_CODE) ENABLE, 
	CONSTRAINT FK2_PROP_REVIEW_DETAILS FOREIGN KEY (REVIEW_ROLE_CODE)
	REFERENCES WL_PROP_REVIEW_ROLE (REVIEW_ROLE_CODE) ENABLE, 
	CONSTRAINT FK3_PROP_REVIEW_DETAILS FOREIGN KEY (REVIEW_TIME_SPENT_CODE)
	REFERENCES WL_PROP_REVIEW_TIME_SPENT (REVIEW_TIME_SPENT_CODE) ENABLE, 
	CONSTRAINT FK4_PROP_REVIEW_DETAILS FOREIGN KEY (TIME_SPENT_ASSIS_DLC_CODE)
	REFERENCES WL_PROP_REVIEW_TIME_SPENT (REVIEW_TIME_SPENT_CODE) ENABLE, 
	CONSTRAINT FK5_PROP_REVIEW_DETAILS FOREIGN KEY (SUBMISSION_VEHICLE_CODE)
	REFERENCES WL_SUBMISSION_VEHICLE (SUBMISSION_VEHICLE_CODE) ENABLE )
/	
CREATE TABLE WL_SIM_CAPACITY 
   (SIM_CAPACITY_ID NUMBER(12,0) NOT NULL ENABLE, 
	SIM_ID NUMBER(4,0), 
	PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	CAPACITY NUMBER(3,0) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_SIM_CAPACITY PRIMARY KEY (SIM_CAPACITY_ID))
/	
CREATE TABLE WL_SIM_CURRENT_LOAD
   (SIM_CURRENT_LOAD_ID NUMBER(12,0) NOT NULL ENABLE, 
	SIM_ID NUMBER(4,0), 
	ROUTING_NUMBER VARCHAR2(10), 
	PROPOSAL_NUMBER VARCHAR2(8), 
	POC_PERSON_ID VARCHAR2(40), 
	POC_USER_ID VARCHAR2(100), 
	APPROVER_USER_ID VARCHAR2(100), 
	APPROVER_PERSON_ID VARCHAR2(40), 
	SIM_PERSON_ID VARCHAR2(40), 
	SIM_USER_ID VARCHAR2(100), 
	SPONSOR_CODE VARCHAR2(8), 
	SPONSOR_GROUP VARCHAR2(50), 
	COMPLEXITY NUMBER(5,2), 
	LEAD_UNIT VARCHAR2(8), 
	ACTIVE_FLAG VARCHAR2(3), 
	ARRIVAL_DATE DATE, 
	INACTIVE_DATE DATE, 
	REROUTED_FLAG VARCHAR2(3), 
	ASSIGNED_BY VARCHAR2(2), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_SIM_CURRENT_LOAD PRIMARY KEY (SIM_CURRENT_LOAD_ID) )
/	
CREATE TABLE WL_SIM_FLEXIBILITY 
   (SIM_FLEXIBILITY_ID NUMBER(12,0) NOT NULL ENABLE, 
	SIM_ID NUMBER(4,0), 
	PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	SPONSOR_GROUP VARCHAR2(50), 
	FLEXIBILITY NUMBER(4,2), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_SIM_FLEXIBILITY PRIMARY KEY (SIM_FLEXIBILITY_ID))
/	
CREATE TABLE WL_SIM_HEADER 
   (SIM_ID NUMBER(4,0) NOT NULL ENABLE, 
	DESCRIPTION VARCHAR2(200), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(8 BYTE) NOT NULL ENABLE, 
	SIM_START_DATE DATE, 
	SIM_END_DATE DATE, 
	SIM_RUN_STATUS_CODE VARCHAR2(3), 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_LOAD_SIMULATION PRIMARY KEY (SIM_ID))
/	
CREATE TABLE WL_SIM_RUN_STATUS 
   (SIM_RUN_STATUS_CODE VARCHAR2(3), 
	DESCRIPTION VARCHAR2(50), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_SIM_RUN_STATUS PRIMARY KEY (SIM_RUN_STATUS_CODE) )
/	
CREATE TABLE WL_SIM_UNIT_ASSIGNMENTS 
   (SIM_UNIT_ASSIGNMENTS_ID NUMBER(12,0) NOT NULL ENABLE, 
	SIM_ID NUMBER(4,0), 
	PERSON_ID VARCHAR2(40), 
	UNIT_NUMBER VARCHAR2(8), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,
	CONSTRAINT PK_SIM_UNIT_ASSIGNMENTS PRIMARY KEY (SIM_UNIT_ASSIGNMENTS_ID))
/	
CREATE TABLE WL_UNIT_ASSIGNMENTS 
   (UNIT_ASSIGN_ID NUMBER(12,0) NOT NULL ENABLE,
    PERSON_ID VARCHAR2(40) NOT NULL ENABLE, 
	UNIT_NUMBER VARCHAR2(8) NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE,
    VER_NBR NUMBER(8) NOT NULL ENABLE,
    OBJ_ID VARCHAR2(36) NOT NULL ENABLE,	
	CONSTRAINT PK_UNIT_ASSIGNMENTS PRIMARY KEY (UNIT_ASSIGN_ID)	)
/	
CREATE SEQUENCE SEQ_ABSENTEE_ID  
MINVALUE 1 
MAXVALUE 999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_CAPACITY_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_CURRENT_LOAD_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_FLEXIBILITY_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE 
/
CREATE SEQUENCE SEQ_WL_OPTIMIZATION_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_COMPLEXITY_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_AGGREG_COUNT_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_REV_COMM_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_REV_ASSIGNMENT_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_PROP_REV_COMM_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_PROP_REV_DET_ID 
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_WL_UNIT_ASSIGN_ID 
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/				
CREATE SEQUENCE SEQ_SIM_CAPACITY_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_SIM_CURRENT_LOAD_ID  
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE SEQ_SIM_FLEXIBILITY_ID 
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/
CREATE SEQUENCE  SEQ_SIM_ID  
MINVALUE 1 
MAXVALUE 9999999999  
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE 
/ 
CREATE SEQUENCE  SEQ_SIM_UNIT_ASSIGNMENTS_ID
MINVALUE 1 
MAXVALUE 9999999999 
INCREMENT BY 1 
START WITH 9000 
NOCACHE  
NOORDER  
NOCYCLE
/




	
	
	

   
	
