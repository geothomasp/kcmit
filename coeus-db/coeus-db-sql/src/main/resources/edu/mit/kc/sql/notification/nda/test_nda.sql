CREATE TABLE NOVI_NDA_SURVEY_RESP 
   (	QUESTION_DESC VARCHAR2(2000 BYTE), 
	ANSWER VARCHAR2(2000 BYTE), 
	QUESTIONINDEX NUMBER(5,0), 
	SURVEYRESPONSEID VARCHAR2(50), 
	PAGEINDEX NUMBER(5,0)
   );
delete from   NOVI_NDA_SURVEY_RESP where  QUESTIONINDEX = 1; 
Insert into NOVI_NDA_SURVEY_RESP (QUESTIONINDEX,SURVEYRESPONSEID,PAGEINDEX,QUESTION_DESC,ANSWER)
values (1,1,1,'Who has won the fifa world cup 2014','Germany');
-- test script
update nda set person_id = '925705642' where nda_number='00000101' and person_id = '925705642' ;

/*
drop table nda;
drop sequence SEQ_NDA_NUMBER;
delete from NOTIFICATION_TYPE where MODULE_CODE = 6 and ACTION_CODE = '501';

*/