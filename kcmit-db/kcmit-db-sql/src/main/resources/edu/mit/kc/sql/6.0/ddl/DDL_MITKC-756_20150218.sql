CREATE TABLE KC_ROLE_CNTRAL_MAP(
ROLE_CNTRL_MAP_ID VARCHAR2(40 BYTE),
ROLE_ID VARCHAR2(40 BYTE) NOT NULL ENABLE,
ROLE_NM VARCHAR2(80 BYTE) NOT NULL ENABLE,
CNTRL_ROLE_NM VARCHAR2(80 BYTE) NOT NULL ENABLE,
NMSPC_CD VARCHAR2(40 BYTE) NOT NULL ENABLE,
UPDATE_TIMESTAMP DATE DEFAULT SYSDATE,
VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE,
OBJ_ID VARCHAR2(36 BYTE) NOT NULL ENABLE)
/
ALTER TABLE KC_ROLE_CNTRAL_MAP
ADD CONSTRAINT PK_KC_ROLE_CNTRAL_MAP
PRIMARY KEY (ROLE_CNTRL_MAP_ID)
/
ALTER TABLE KC_ROLE_CNTRAL_MAP
ADD CONSTRAINT FK_KC_ROLE_CNTRAL_MAP
FOREIGN KEY (ROLE_ID)
REFERENCES KRIM_ROLE_T (ROLE_ID)
/
CREATE TABLE USER_ROLE_CNTRL_MAP_LOG(
SYNC_LOG_ID VARCHAR2(40 BYTE),
ROLE_NM VARCHAR2(80 BYTE) NOT NULL ENABLE,
PRNCPL_NM VARCHAR2(80 BYTE) NOT NULL ENABLE,
UNIT_NUMBER VARCHAR2(400 BYTE) NOT NULL ENABLE,
UPDATE_TIMESTAMP DATE DEFAULT SYSDATE,
UPDATE_USER VARCHAR2(60 BYTE) NOT NULL ENABLE,
VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE,
OBJ_ID VARCHAR2(36 BYTE) NOT NULL ENABLE)
/
ALTER TABLE USER_ROLE_CNTRL_MAP_LOG
ADD CONSTRAINT PK_USER_ROLE_CNTRL_MAP_LOG
PRIMARY KEY (SYNC_LOG_ID)
/
