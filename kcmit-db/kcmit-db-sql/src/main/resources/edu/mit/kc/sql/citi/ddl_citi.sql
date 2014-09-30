CREATE TABLE CITI_TRAINING 
(	
	CITI_TRAINING_ID DECIMAL(12,0) NOT NULL,
	FIRST_NAME VARCHAR2(30), 
	LAST_NAME VARCHAR2(30),
	EMAIL VARCHAR2(60), 
	CURRICULUM VARCHAR2(100), 
	TRAINING_GROUP VARCHAR2(100), 
	SCORE VARCHAR2(9), 
	PASSING_SCORE VARCHAR2(9), 
	STAGE_NUMBER VARCHAR2(5), 
	STAGE VARCHAR2(50), 
	DATE_COMPLETED DATE, 
	USER_NAME VARCHAR2(60), 
	CUSTOM_FIELD1 VARCHAR2(100), 
	CUSTOM_FIELD2 VARCHAR2(9), 
	UPDATE_TIMESTAMP DATE,
	CONSTRAINT PK_CITI_TRAINING PRIMARY KEY (CITI_TRAINING_ID)
)
/
CREATE TABLE CITI_ERROR_LOG 
(	PERSON_ID VARCHAR2(9), 
	ERROR_MESSAGE VARCHAR2(350), 
	UPDATE_TIMESTAMP DATE
)
/
CREATE SEQUENCE  SEQ_CITI_TRAINING_ID  MINVALUE 1 MAXVALUE 9999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  CYCLE
/
