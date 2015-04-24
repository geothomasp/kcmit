alter table QUESTIONNAIRE_ANSWER disable constraint FK_QUESTIONNAIRE_ANS_QID
/
alter table QUESTION_EXPLANATION disable constraint FK_QUESTION_EXPLANATION
/
alter table QUESTIONNAIRE_QUESTIONS disable constraint FK_QUESTIONNAIRE_QUESTIONS
/
alter table QUESTIONNAIRE_QUESTIONS disable constraint FK_QUESTIONNAIRE_QUESTIONNAIRE
/
alter table QUESTIONNAIRE_USAGE disable constraint FK_QUESTIONNAIRE_USAGE
/
alter table QUESTIONNAIRE_ANSWER_HEADER disable constraint FK_QUESTIONNAIRE_QID
/
alter table QUESTIONNAIRE_QUESTIONS disable constraint FK_QUEST_QUESTIONS_COND_TYPE
/
truncate table QUESTION
/
insert into QUESTION(QUESTION_REF_ID,
					 QUESTION_ID,
					 SEQUENCE_NUMBER,
					 SEQUENCE_STATUS,
					 QUESTION,
					 STATUS,
					 GROUP_TYPE_CODE,
					 QUESTION_TYPE_ID,
					 LOOKUP_CLASS,
					 LOOKUP_RETURN,
					 DISPLAYED_ANSWERS,
					 MAX_ANSWERS,
					 ANSWER_MAX_LENGTH,
					 UPDATE_TIMESTAMP,
					 UPDATE_USER,
					 VER_NBR,
					 OBJ_ID,
					 DOCUMENT_NUMBER)
			  select QUESTION_REF_ID,
					 QUESTION_ID,
					 SEQUENCE_NUMBER,
					 SEQUENCE_STATUS,
					 QUESTION,
					 STATUS,
					 GROUP_TYPE_CODE,
					 QUESTION_TYPE_ID,
					 LOOKUP_CLASS,
					 LOOKUP_RETURN,
					 DISPLAYED_ANSWERS,
					 MAX_ANSWERS,
					 ANSWER_MAX_LENGTH,
					 UPDATE_TIMESTAMP,
					 UPDATE_USER,
					 VER_NBR,
					 OBJ_ID,
					 DOCUMENT_NUMBER
				from QUESTION@KC_STAG_DB_LINK
/
truncate table QUESTION_EXPLANATION
/
insert into QUESTION_EXPLANATION(QUESTION_EXPLANATION_ID,
                                 QUESTION_REF_ID_FK,
                                 EXPLANATION_TYPE,
                                 EXPLANATION,
                                 UPDATE_TIMESTAMP,
                                 UPDATE_USER,
                                 VER_NBR,
                                 OBJ_ID)
						  select QUESTION_EXPLANATION_ID,
                                 QUESTION_REF_ID_FK,
                                 EXPLANATION_TYPE,
                                 EXPLANATION,
                                 UPDATE_TIMESTAMP,
                                 UPDATE_USER,
                                 1,
                                 sys_guid()
							from QUESTION_EXPLANATION@KC_STAG_DB_LINK
/
truncate table QUESTION_TYPES
/							
insert into QUESTION_TYPES(QUESTION_TYPE_ID,
						   QUESTION_TYPE_NAME,
						   UPDATE_TIMESTAMP,
						   UPDATE_USER,
						   VER_NBR,
						   OBJ_ID)
					select QUESTION_TYPE_ID,
						   QUESTION_TYPE_NAME,
						   UPDATE_TIMESTAMP,
						   UPDATE_USER,
						   1,
						   sys_guid()
					  from QUESTION_TYPES@KC_STAG_DB_LINK
/
truncate table QUESTIONNAIRE
/
insert into QUESTIONNAIRE(QUESTIONNAIRE_REF_ID,
						  QUESTIONNAIRE_ID,
						  SEQUENCE_NUMBER,
						  NAME,
						  DESCRIPTION,
						  UPDATE_TIMESTAMP,
						  UPDATE_USER,
						  IS_FINAL,
						  VER_NBR,
						  OBJ_ID,
						  FILE_NAME,
						  TEMPLATE,
						  DOCUMENT_NUMBER)
				   select QUESTIONNAIRE_REF_ID,
						  QUESTIONNAIRE_ID,
						  SEQUENCE_NUMBER,
						  NAME,
						  DESCRIPTION,
						  UPDATE_TIMESTAMP,
						  UPDATE_USER,
						  IS_FINAL,
						  1,
						  sys_guid(),
						  FILE_NAME,
						  TEMPLATE,
						  DOCUMENT_NUMBER
					 from QUESTIONNAIRE@KC_STAG_DB_LINK
/
truncate table QUESTIONNAIRE_QUESTIONS
/
insert into QUESTIONNAIRE_QUESTIONS(QUESTIONNAIRE_QUESTIONS_ID,
                                    QUESTIONNAIRE_REF_ID_FK,
                                    QUESTION_REF_ID_FK,
                                    QUESTION_NUMBER,
									PARENT_QUESTION_NUMBER,
									CONDITION_FLAG,
									CONDITION_TYPE,
									CONDITION_VALUE,
									UPDATE_TIMESTAMP,
									UPDATE_USER,
									QUESTION_SEQ_NUMBER,
									VER_NBR,
									OBJ_ID,
									RULE_ID)
							 select QUESTIONNAIRE_QUESTIONS_ID,
                                    QUESTIONNAIRE_REF_ID_FK,
                                    QUESTION_REF_ID_FK,
                                    QUESTION_NUMBER,
									PARENT_QUESTION_NUMBER,
									CONDITION_FLAG,
									CONDITION_TYPE,
									CONDITION_VALUE,
									UPDATE_TIMESTAMP,
									UPDATE_USER,
									QUESTION_SEQ_NUMBER,
									1,
									sys_guid(),
									RULE_ID
							   from QUESTIONNAIRE_QUESTIONS@KC_STAG_DB_LINK
/
truncate table QUESTIONNAIRE_USAGE
/
insert into QUESTIONNAIRE_USAGE(QUESTIONNAIRE_USAGE_ID,
                                MODULE_ITEM_CODE,
								MODULE_SUB_ITEM_CODE,
								QUESTIONNAIRE_REF_ID_FK,
								QUESTIONNAIRE_SEQUENCE_NUMBER,
								QUESTIONNAIRE_LABEL,
								UPDATE_TIMESTAMP,
								UPDATE_USER,
								VER_NBR,
								OBJ_ID,
								IS_MANDATORY,
								RULE_ID)
						 select QUESTIONNAIRE_USAGE_ID,
                                MODULE_ITEM_CODE,
								MODULE_SUB_ITEM_CODE,
								QUESTIONNAIRE_REF_ID_FK,
								QUESTIONNAIRE_SEQUENCE_NUMBER,
								QUESTIONNAIRE_LABEL,
								UPDATE_TIMESTAMP,
								UPDATE_USER,
								1,
								sys_guid(),
								IS_MANDATORY,
								RULE_ID
						   from QUESTIONNAIRE_USAGE@KC_STAG_DB_LINK
/
truncate table QUESTIONNAIRE_CONDITION_TYPE
/
insert into QUESTIONNAIRE_CONDITION_TYPE(QUEST_CONDITION_TYPE_CODE,
                                         DESCRIPTION,
										 UPDATE_TIMESTAMP,
										 UPDATE_USER,
										 VER_NBR,
										 OBJ_ID)
								  select QUEST_CONDITION_TYPE_CODE,
                                         DESCRIPTION,
										 UPDATE_TIMESTAMP,
										 UPDATE_USER,
										 1,
										 sys_guid()
									from QUESTIONNAIRE_CONDITION_TYPE@KC_STAG_DB_LINK
/
alter table QUESTIONNAIRE_ANSWER enable constraint FK_QUESTIONNAIRE_ANS_QID
/
alter table QUESTION_EXPLANATION enable constraint FK_QUESTION_EXPLANATION
/
alter table QUESTIONNAIRE_QUESTIONS enable constraint FK_QUESTIONNAIRE_QUESTIONS
/
alter table QUESTIONNAIRE_QUESTIONS enable constraint FK_QUESTIONNAIRE_QUESTIONNAIRE
/
alter table QUESTIONNAIRE_USAGE enable constraint FK_QUESTIONNAIRE_USAGE
/
alter table QUESTIONNAIRE_ANSWER_HEADER enable constraint FK_QUESTIONNAIRE_QID
/
alter table QUESTIONNAIRE_QUESTIONS enable constraint FK_QUEST_QUESTIONS_COND_TYPE
/
commit
/
declare
li_count number;
ls_proposal_max varchar2(12);
ls_question_max NUMBER(6,0);
ls_questionnaire_max NUMBER(6,0);
li_proposal_max number(10);
ls_query VARCHAR2(400);
li_num NUMBER;
begin
 
select max(QUESTION_ID) into ls_question_max from QUESTION;
select SEQ_QUESTION_ID.NEXTVAL into li_num from dual;
if ls_question_max > li_num then
   ls_question_max:=ls_question_max -  li_num;  
   execute immediate('alter sequence SEQ_QUESTION_ID increment by '||ls_question_max);
end if;

select max(a.QUESTIONNAIRE_ID) into ls_questionnaire_max from(                                
select QUESTIONNAIRE_REF_ID as QUESTIONNAIRE_ID from QUESTIONNAIRE
union
select QUESTIONNAIRE_QUESTIONS_ID as QUESTIONNAIRE_ID from QUESTIONNAIRE_QUESTIONS
union
select QUESTIONNAIRE_USAGE_ID as QUESTIONNAIRE_ID from QUESTIONNAIRE_USAGE
union
select QUESTION_REF_ID as QUESTIONNAIRE_ID from QUESTION
union
select QUESTION_EXPLANATION_ID as QUESTIONNAIRE_ID from QUESTION_EXPLANATION
) a;
select SEQ_QUESTIONNAIRE_REF_ID.NEXTVAL into li_num from dual;
if ls_question_max > li_num then
   ls_questionnaire_max:=ls_questionnaire_max - li_num;
   execute immediate('alter sequence SEQ_QUESTIONNAIRE_REF_ID increment by '||ls_questionnaire_max);
end if;

select max(QUESTIONNAIRE_ID) into ls_questionnaire_max from QUESTIONNAIRE;
select SEQ_QUESTIONNAIRE_ID.NEXTVAL into li_num from dual;
if ls_question_max > li_num then
   ls_questionnaire_max:=ls_questionnaire_max - li_num;
   execute immediate('alter sequence SEQ_QUESTIONNAIRE_ID increment by '||ls_questionnaire_max);       
end if;
end;
/
select SEQ_QUESTION_ID.NEXTVAL from dual
/
alter sequence SEQ_QUESTION_ID increment by 1
/
select SEQ_QUESTIONNAIRE_ID.NEXTVAL from dual
/
alter sequence SEQ_QUESTIONNAIRE_ID increment by 1
/
select SEQ_QUESTIONNAIRE_REF_ID.NEXTVAL from dual
/
alter sequence SEQ_QUESTIONNAIRE_REF_ID increment by 1
/