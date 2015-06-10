drop table TRAINING_MODULES
/
CREATE TABLE TRAINING_MODULES 
(	
TRAINING_MODULES_ID NUMBER(8,0),
TRAINING_CODE NUMBER(4,0) , 
MODULE_CODE NUMBER(3,0) NOT NULL ENABLE, 
SUB_MODULE_CODE NUMBER(3,0), 
DESCRIPTION VARCHAR2(200) NOT NULL ENABLE, 
UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
UPDATE_USER VARCHAR2(60) NOT NULL ENABLE,
VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE, 
OBJ_ID VARCHAR2(36) NOT NULL ENABLE
)
/
CREATE SEQUENCE SEQ_TRAINING_MODULES_ID
START WITH 1
MAXVALUE 9999999999
MINVALUE 1
NOCYCLE
NOCACHE
NOORDER
/
