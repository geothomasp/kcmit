CREATE TABLE PI_APPOINTMENT_TYPE (
PI_APPOINT_TYPE_CODE NUMBER(3,0) NOT NULL ENABLE, 
DESCRIPTION VARCHAR2(200) NOT NULL ENABLE, 
UPDATE_TIMESTAMP	DATE  NOT NULL ENABLE,
UPDATE_USER	VARCHAR2(60)  NOT NULL ENABLE,
VER_NBR	NUMBER(8,0)  NOT NULL ENABLE,
OBJ_ID	VARCHAR2(36)   NOT NULL ENABLE,
CONSTRAINT PI_APPOINTMENT_TYPEP1 PRIMARY KEY (PI_APPOINT_TYPE_CODE)
)
/
Insert into PI_APPOINTMENT_TYPE (PI_APPOINT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
SELECT PI_APPOINT_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,1,SYS_GUID() FROM OSP$PI_APPOINTMENT_TYPE@coeus.kuali
/
commit
/