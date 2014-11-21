select ' Start time of AWARD_CLOSEOUT  is '|| localtimestamp from dual
/
DECLARE
ll_due_date	DATE;
ls_multiple	CHAR(1):='N';
li_award_id	NUMBER(22,0);
li_ver_nbr NUMBER:=1;
ls_awd_number VARCHAR2(12);
li_seq NUMBER(4,0);
li_commit_count number:=0;
CURSOR c_awd_closout IS
SELECT aat.MIT_AWARD_NUMBER,aat.SEQUENCE_NUMBER,aat.FINAL_INV_SUBMISSION_DATE,aat.FINAL_TECH_SUBMISSION_DATE,aat.FINAL_PATENT_SUBMISSION_DATE,
aat.FINAL_PROP_SUBMISSION_DATE,aat.ARCHIVE_LOCATION,aat.CLOSEOUT_DATE,aat.UPDATE_TIMESTAMP,aat.UPDATE_USER 
FROM OSP$AWARD_CLOSEOUT aat inner join TEMP_TAB_TO_SYNC_AWARD ts on aat.MIT_AWARD_NUMBER=ts.MIT_AWARD_NUMBER and aat.SEQUENCE_NUMBER=ts.SEQUENCE_NUMBER
WHERE ts.FEED_TYPE = 'N';
r_awd_closout c_awd_closout%ROWTYPE;
BEGIN
IF c_awd_closout%ISOPEN THEN
CLOSE c_awd_closout;
END IF;
OPEN c_awd_closout;
LOOP
FETCH c_awd_closout INTO r_awd_closout;
EXIT WHEN c_awd_closout%NOTFOUND;

select replace(r_awd_closout.MIT_AWARD_NUMBER,'-','-00') into ls_awd_number from dual;
li_seq := r_awd_closout.SEQUENCE_NUMBER;
begin
SELECT AWARD_ID INTO li_award_id FROM AWARD WHERE AWARD_NUMBER=ls_awd_number AND SEQUENCE_NUMBER=li_seq;
exception 
when others then
dbms_output.put_line('Error in AWARD_NUMBER:'||ls_awd_number||'with SEQUENCE_NUMBER:'||li_seq||'and error is:'||substr(sqlerrm,1,100));
continue;
end;
begin
SELECT FINAL_EXPIRATION_DATE INTO  ll_due_date FROM OSP$AWARD_AMOUNT_INFO where MIT_AWARD_NUMBER =r_awd_closout.MIT_AWARD_NUMBER AND 
SEQUENCE_NUMBER=r_awd_closout.SEQUENCE_NUMBER AND AMOUNT_SEQUENCE_NUMBER=(SELECT MAX(am.AMOUNT_SEQUENCE_NUMBER) from OSP$AWARD_AMOUNT_INFO am where
am.MIT_AWARD_NUMBER=r_awd_closout.MIT_AWARD_NUMBER AND am.SEQUENCE_NUMBER=r_awd_closout.SEQUENCE_NUMBER);
exception when others then
ll_due_date:=null;
end;

INSERT INTO AWARD_CLOSEOUT(AWARD_CLOSEOUT_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,CLOSEOUT_REPORT_CODE,CLOSEOUT_REPORT_NAME,DUE_DATE,FINAL_SUBMISSION_DATE,MULTIPLE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(SEQ_AWARD_AWARD_CLOSEOUT.nextval,li_award_id,ls_awd_number,li_seq,'1','Financial',NULL,r_awd_closout.FINAL_PROP_SUBMISSION_DATE,ls_multiple,r_awd_closout.UPDATE_TIMESTAMP,r_awd_closout.UPDATE_USER,li_ver_nbr,SYS_GUID());


INSERT INTO AWARD_CLOSEOUT(AWARD_CLOSEOUT_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,CLOSEOUT_REPORT_CODE,CLOSEOUT_REPORT_NAME,DUE_DATE,FINAL_SUBMISSION_DATE,MULTIPLE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(SEQ_AWARD_AWARD_CLOSEOUT.nextval,li_award_id,ls_awd_number,li_seq,'2','Property',NULL,r_awd_closout.FINAL_PROP_SUBMISSION_DATE,ls_multiple,r_awd_closout.UPDATE_TIMESTAMP,r_awd_closout.UPDATE_USER,li_ver_nbr,SYS_GUID());

INSERT INTO AWARD_CLOSEOUT(AWARD_CLOSEOUT_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,CLOSEOUT_REPORT_CODE,CLOSEOUT_REPORT_NAME,DUE_DATE,FINAL_SUBMISSION_DATE,MULTIPLE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(SEQ_AWARD_AWARD_CLOSEOUT.nextval,li_award_id,ls_awd_number,li_seq,'4','Technical',NULL,r_awd_closout.FINAL_TECH_SUBMISSION_DATE,ls_multiple,r_awd_closout.UPDATE_TIMESTAMP,r_awd_closout.UPDATE_USER,li_ver_nbr,SYS_GUID());

INSERT INTO AWARD_CLOSEOUT(AWARD_CLOSEOUT_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,CLOSEOUT_REPORT_CODE,CLOSEOUT_REPORT_NAME,DUE_DATE,FINAL_SUBMISSION_DATE,MULTIPLE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(SEQ_AWARD_AWARD_CLOSEOUT.nextval,li_award_id,ls_awd_number,li_seq,'3','Patent',NULL,r_awd_closout.FINAL_PATENT_SUBMISSION_DATE,ls_multiple,r_awd_closout.UPDATE_TIMESTAMP,r_awd_closout.UPDATE_USER,li_ver_nbr,SYS_GUID());

INSERT INTO AWARD_CLOSEOUT(AWARD_CLOSEOUT_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,CLOSEOUT_REPORT_CODE,CLOSEOUT_REPORT_NAME,DUE_DATE,FINAL_SUBMISSION_DATE,MULTIPLE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(SEQ_AWARD_AWARD_CLOSEOUT.nextval,li_award_id,ls_awd_number,li_seq,'6','Invoice',ll_due_date,r_awd_closout.FINAL_INV_SUBMISSION_DATE,ls_multiple,r_awd_closout.UPDATE_TIMESTAMP,r_awd_closout.UPDATE_USER,li_ver_nbr,SYS_GUID());

END LOOP;
CLOSE c_awd_closout;
EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('Error occured Mit Award  number and Sequence Number is '||r_awd_closout.MIT_AWARD_NUMBER||' , '||r_awd_closout.SEQUENCE_NUMBER||' . '||sqlerrm);
dbms_output.put_line('Completed AWARD_CLOSEOUT!!!');
END;
/
commit
/
select ' End time of AWARD_CLOSEOUT  is '|| localtimestamp from dual
/