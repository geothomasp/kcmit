CREATE SEQUENCE SEQ_NDA_NUMBER INCREMENT BY 1 START WITH 1 MAXVALUE 999999999 CYCLE NOCACHE
/
CREATE TABLE NDA(
NDA_NUMBER        VARCHAR2(10),
PERSON_ID         VARCHAR2(40) NOT NULL,
TITLE             VARCHAR2(2000),
CREATE_DATE       TIMESTAMP(6)  NOT NULL,
ORGANIZATION_NAME VARCHAR2(2000),
SURVEY_ID    VARCHAR2(50),
COMPLETION_DATE   TIMESTAMP(6),
VER_NBR	NUMBER(8,0),
OBJ_ID	VARCHAR2(36),
CONSTRAINT PK_NDA PRIMARY KEY (NDA_NUMBER)
)
/