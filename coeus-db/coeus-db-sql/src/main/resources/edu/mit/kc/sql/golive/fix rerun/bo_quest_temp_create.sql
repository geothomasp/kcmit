  CREATE TABLE "TEMP_QUESTIONNAIRE" 
   (	"QUESTIONNAIRE_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(2000 BYTE), 
	"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(8 BYTE) NOT NULL ENABLE, 
	"IS_FINAL" VARCHAR2(1 BYTE) NOT NULL ENABLE, 
	"FILE_NAME" VARCHAR2(1000 BYTE), 
	"TEMPLATE" CLOB, 
	"VERSION_NUMBER" NUMBER(3,0) NOT NULL ENABLE, 
	"GROUP_TYPE_CODE" NUMBER(3,0));	
	delete from TEMP_QUESTIONNAIRE;
	commit;	
	insert into TEMP_QUESTIONNAIRE(QUESTIONNAIRE_ID,VERSION_NUMBER,NAME,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,IS_FINAL,FILE_NAME,TEMPLATE,GROUP_TYPE_CODE)
	select  QUESTIONNAIRE_ID,VERSION_NUMBER,NAME,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,IS_FINAL,FILE_NAME,TEMPLATE,GROUP_TYPE_CODE from  OSP$QUESTIONNAIRE@coeus.kuali;
	commit;

  CREATE TABLE "TEMP_QUESTION_EXPLANATION" 
   (	"QUESTION_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"EXPLANATION_TYPE" CHAR(1 BYTE) NOT NULL ENABLE, 
	"EXPLANATION" CLOB, 
	"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(8 BYTE) NOT NULL ENABLE);
	commit;
	insert into TEMP_QUESTION_EXPLANATION(QUESTION_ID,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER)
	select  QUESTION_ID,EXPLANATION_TYPE,EXPLANATION,UPDATE_TIMESTAMP,UPDATE_USER from OSP$QUESTION_EXPLANATION@coeus.kuali;
	commit;
/*
declare
li_count number;
begin
select count(*) into li_count from user_tables where table_name='TEMP_QUESTIONNAIRE';
if li_count=0 then
execute immediate('create table TEMP_QUESTIONNAIRE as select  * from  OSP$QUESTIONNAIRE@coeus.kuali');
else
execute immediate('drop table TEMP_QUESTIONNAIRE');
execute immediate('create table TEMP_QUESTIONNAIRE as select  * from  OSP$QUESTIONNAIRE@coeus.kuali');
end if;

select count(*) into li_count from user_tables where table_name='TEMP_QUESTION_EXPLANATION';
if li_count=0 then
execute immediate('create table TEMP_QUESTION_EXPLANATION as select  * from  OSP$QUESTION_EXPLANATION@coeus.kuali');
else
execute immediate('drop table TEMP_QUESTION_EXPLANATION');
execute immediate('create table TEMP_QUESTION_EXPLANATION as select  * from  OSP$QUESTION_EXPLANATION@coeus.kuali');
end if;
end;
*/
/
declare
li_count number;
begin
  select  count(table_name) into li_count  from user_tables   where table_name = 'BOOT_QUESTIONNAIRE';
  if li_count = 0 then  
	execute immediate('CREATE TABLE BOOT_QUESTIONNAIRE
	(	"QUESTIONNAIRE_REF_ID" NUMBER(12,0), 
	"QUESTIONNAIRE_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"SEQUENCE_NUMBER" NUMBER(4,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(2000), 
	"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(60) NOT NULL ENABLE, 
	"IS_FINAL" VARCHAR2(1) NOT NULL ENABLE, 
	"VER_NBR" NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE, 
	"OBJ_ID" VARCHAR2(36) NOT NULL ENABLE, 
	"FILE_NAME" VARCHAR2(1000), 
	"TEMPLATE" CLOB, 
	"DOCUMENT_NUMBER" VARCHAR2(40))');
	
  end if;
  
  select  count(table_name) into li_count  from user_tables   where table_name = 'BOOT_QUESTIONNAIRE_QUESTIONS';
  if li_count = 0 then    
	execute immediate('CREATE TABLE BOOT_QUESTIONNAIRE_QUESTIONS 
	(	"QUESTIONNAIRE_QUESTIONS_ID" NUMBER(12,0), 
	"QUESTIONNAIRE_REF_ID_FK" NUMBER(12,0) NOT NULL ENABLE, 
	"QUESTION_REF_ID_FK" NUMBER(12,0) NOT NULL ENABLE, 
	"QUESTION_NUMBER" NUMBER(6,0) NOT NULL ENABLE, 
	"PARENT_QUESTION_NUMBER" NUMBER(6,0) NOT NULL ENABLE, 
	"CONDITION_FLAG" VARCHAR2(1) NOT NULL ENABLE, 
	"CONDITION_TYPE" VARCHAR2(3), 
	"CONDITION_VALUE" VARCHAR2(2000 BYTE), 
	"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(60) NOT NULL ENABLE, 
	"QUESTION_SEQ_NUMBER" NUMBER(3,0), 
	"VER_NBR" NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE, 
	"OBJ_ID" VARCHAR2(36) NOT NULL ENABLE, 
	"RULE_ID" VARCHAR2(40))');
	
  end if;
	
  select  count(table_name) into li_count  from user_tables   where table_name = 'BOOT_QUESTION';
  if li_count = 0 then    
	execute immediate('CREATE TABLE BOOT_QUESTION 
	(	"QUESTION_REF_ID" NUMBER(12,0), 
	"QUESTION_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"SEQUENCE_NUMBER" NUMBER(4,0) NOT NULL ENABLE, 
	"SEQUENCE_STATUS" CHAR(1 BYTE) NOT NULL ENABLE, 
	"QUESTION" VARCHAR2(2000 BYTE) NOT NULL ENABLE, 
	"STATUS" CHAR(1 BYTE) NOT NULL ENABLE, 
	"GROUP_TYPE_CODE" NUMBER(3,0) NOT NULL ENABLE, 
	"QUESTION_TYPE_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"LOOKUP_CLASS" VARCHAR2(100 BYTE), 
	"LOOKUP_RETURN" VARCHAR2(30 BYTE), 
	"DISPLAYED_ANSWERS" NUMBER(2,0), 
	"MAX_ANSWERS" NUMBER(2,0), 
	"ANSWER_MAX_LENGTH" NUMBER(4,0), 
	"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(60 BYTE) NOT NULL ENABLE, 
	"VER_NBR" NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE, 
	"OBJ_ID" VARCHAR2(36 BYTE) NOT NULL ENABLE, 
	"DOCUMENT_NUMBER" VARCHAR2(14 BYTE))');
	
  end if;
  
  select  count(table_name) into li_count  from user_tables   where table_name = 'BOOT_QUESTIONNAIRE_USAGE';
  if li_count = 0 then    
	execute immediate('CREATE TABLE BOOT_QUESTIONNAIRE_USAGE 
   (QUESTIONNAIRE_USAGE_ID NUMBER(12,0), 
	MODULE_ITEM_CODE NUMBER(3,0) NOT NULL ENABLE, 
	MODULE_SUB_ITEM_CODE NUMBER(3,0) NOT NULL ENABLE, 
	QUESTIONNAIRE_REF_ID_FK NUMBER(12,0) NOT NULL ENABLE, 
	QUESTIONNAIRE_SEQUENCE_NUMBER NUMBER(4,0) NOT NULL ENABLE, 
    QUESTIONNAIRE_LABEL VARCHAR2(50 BYTE), 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60 BYTE) NOT NULL ENABLE, 
	VER_NBR NUMBER(8,0) DEFAULT 1 NOT NULL ENABLE, 
	OBJ_ID VARCHAR2(36 BYTE) NOT NULL ENABLE, 
	IS_MANDATORY CHAR(1 BYTE), 
	RULE_ID VARCHAR2(40 BYTE))');
	
  end if;
  
    select  count(table_name) into li_count  from user_tables   where table_name = 'BOOT_CONDITION_TYPE';
  if li_count = 0 then    
	execute immediate(' CREATE TABLE BOOT_CONDITION_TYPE
   (	QUEST_CONDITION_TYPE_CODE VARCHAR2(3 BYTE), 
	DESCRIPTION VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	UPDATE_TIMESTAMP DATE NOT NULL ENABLE, 
	UPDATE_USER VARCHAR2(60 BYTE),
  VER_NBR NUMBER(8,0) DEFAULT 1, 
	OBJ_ID VARCHAR2(36 BYTE))');
	
  end if;
  
  
  end;
/
truncate table BOOT_QUESTIONNAIRE_QUESTIONS
/
truncate table BOOT_QUESTIONNAIRE
/
truncate table BOOT_QUESTION
/
truncate table BOOT_CONDITION_TYPE
/
truncate table BOOT_QUESTIONNAIRE_USAGE
/
INSERT INTO BOOT_CONDITION_TYPE(QUEST_CONDITION_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
SELECT QUEST_CONDITION_TYPE_CODE,DESCRIPTION,sysdate,user,1,sys_guid() FROM QUESTIONNAIRE_CONDITION_TYPE
/
INSERT INTO BOOT_QUESTIONNAIRE (QUESTIONNAIRE_REF_ID,QUESTIONNAIRE_ID,SEQUENCE_NUMBER,NAME,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,IS_FINAL,VER_NBR,OBJ_ID,FILE_NAME,DOCUMENT_NUMBER)
SELECT QUESTIONNAIRE_REF_ID,QUESTIONNAIRE_ID,SEQUENCE_NUMBER,NAME,DESCRIPTION,sysdate,user,IS_FINAL,1,sys_guid(),FILE_NAME,DOCUMENT_NUMBER 
FROM QUESTIONNAIRE WHERE QUESTIONNAIRE_ID=5
/
INSERT INTO BOOT_QUESTIONNAIRE_QUESTIONS (QUESTIONNAIRE_QUESTIONS_ID,QUESTIONNAIRE_REF_ID_FK,QUESTION_REF_ID_FK,QUESTION_NUMBER,PARENT_QUESTION_NUMBER,CONDITION_FLAG,CONDITION_TYPE,CONDITION_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,QUESTION_SEQ_NUMBER,VER_NBR,OBJ_ID,RULE_ID)
SELECT qq.QUESTIONNAIRE_QUESTIONS_ID,qq.QUESTIONNAIRE_REF_ID_FK,qq.QUESTION_REF_ID_FK,qq.QUESTION_NUMBER,qq.PARENT_QUESTION_NUMBER,qq.CONDITION_FLAG,qq.CONDITION_TYPE,qq.CONDITION_VALUE,sysdate,user,qq.QUESTION_SEQ_NUMBER,1,sys_guid(),qq.RULE_ID
FROM QUESTIONNAIRE_QUESTIONS qq INNER JOIN QUESTIONNAIRE q ON q.QUESTIONNAIRE_REF_ID=qq.QUESTIONNAIRE_REF_ID_FK
WHERE q.QUESTIONNAIRE_ID=5
/
INSERT INTO BOOT_QUESTION (QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,DOCUMENT_NUMBER)
SELECT QUESTION_REF_ID,QUESTION_ID,SEQUENCE_NUMBER,SEQUENCE_STATUS,QUESTION,STATUS,GROUP_TYPE_CODE,QUESTION_TYPE_ID,LOOKUP_CLASS,LOOKUP_RETURN,DISPLAYED_ANSWERS,MAX_ANSWERS,ANSWER_MAX_LENGTH,sysdate,user,1,sys_guid(),DOCUMENT_NUMBER
FROM QUESTION
/
INSERT INTO BOOT_QUESTIONNAIRE_USAGE (QUESTIONNAIRE_USAGE_ID,MODULE_ITEM_CODE,MODULE_SUB_ITEM_CODE,QUESTIONNAIRE_REF_ID_FK,QUESTIONNAIRE_SEQUENCE_NUMBER,QUESTIONNAIRE_LABEL,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,IS_MANDATORY,RULE_ID)
SELECT qu.QUESTIONNAIRE_USAGE_ID,qu.MODULE_ITEM_CODE,qu.MODULE_SUB_ITEM_CODE,qu.QUESTIONNAIRE_REF_ID_FK,qu.QUESTIONNAIRE_SEQUENCE_NUMBER,qu.QUESTIONNAIRE_LABEL,sysdate,user,1,sys_guid(),qu.IS_MANDATORY,qu.RULE_ID 
FROM QUESTIONNAIRE_USAGE qu INNER JOIN QUESTIONNAIRE q ON q.QUESTIONNAIRE_REF_ID=qu.QUESTIONNAIRE_REF_ID_FK
WHERE q.QUESTIONNAIRE_ID=5
/
commit
/
ALTER TABLE QUESTIONNAIRE_QUESTIONS DISABLE CONSTRAINT FK_QUESTIONNAIRE_QUESTIONS;
/
ALTER TABLE QUESTIONNAIRE_ANSWER DISABLE CONSTRAINT FK_QUESTIONNAIRE_ANS_QID;
/
ALTER TABLE QUESTION_EXPLANATION DISABLE CONSTRAINT FK_QUESTION_EXPLANATION;
/
ALTER TABLE QUESTIONNAIRE_QUESTIONS DISABLE CONSTRAINT FK_QUESTIONNAIRE_QUESTIONNAIRE;
/
ALTER TABLE QUESTIONNAIRE_ANSWER_HEADER DISABLE CONSTRAINT FK_QUESTIONNAIRE_QID;
/
ALTER TABLE QUESTIONNAIRE_USAGE DISABLE CONSTRAINT FK_QUESTIONNAIRE_USAGE;
/
ALTER TABLE QUESTIONNAIRE_ANSWER DISABLE CONSTRAINT FK_QUESTIONNAIRE_ANS_COMP_ID;
/
TRUNCATE TABLE QUESTION_EXPLANATION;
/
TRUNCATE TABLE QUESTIONNAIRE_QUESTIONS;
/
TRUNCATE TABLE QUESTIONNAIRE_ANSWER;
/
TRUNCATE TABLE QUESTIONNAIRE_ANSWER_HEADER;
/
TRUNCATE TABLE QUESTIONNAIRE_USAGE;
/
TRUNCATE TABLE QUESTIONNAIRE;
/
TRUNCATE TABLE QUESTION;
/