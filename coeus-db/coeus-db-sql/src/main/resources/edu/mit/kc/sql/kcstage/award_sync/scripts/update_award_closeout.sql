select ' Started UPDATE_AWARD_CLOSEOUT ' from dual
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
WHERE ts.FEED_TYPE='C';
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
end;


UPDATE AWARD_CLOSEOUT
SET FINAL_SUBMISSION_DATE=r_awd_closout.FINAL_PROP_SUBMISSION_DATE
WHERE AWARD_ID=li_award_id
AND CLOSEOUT_REPORT_NAME='Financial';

UPDATE AWARD_CLOSEOUT
SET FINAL_SUBMISSION_DATE=r_awd_closout.FINAL_PROP_SUBMISSION_DATE
WHERE AWARD_ID=li_award_id
AND CLOSEOUT_REPORT_NAME='Property';

UPDATE AWARD_CLOSEOUT
SET FINAL_SUBMISSION_DATE=r_awd_closout.FINAL_TECH_SUBMISSION_DATE
WHERE AWARD_ID=li_award_id
AND CLOSEOUT_REPORT_NAME='Technical';

UPDATE AWARD_CLOSEOUT
SET FINAL_SUBMISSION_DATE=r_awd_closout.FINAL_PATENT_SUBMISSION_DATE
WHERE AWARD_ID=li_award_id
AND CLOSEOUT_REPORT_NAME='Patent';

UPDATE AWARD_CLOSEOUT
SET FINAL_SUBMISSION_DATE=r_awd_closout.FINAL_INV_SUBMISSION_DATE
WHERE AWARD_ID=li_award_id
AND CLOSEOUT_REPORT_NAME='Invoice';

END LOOP;
CLOSE c_awd_closout;
END;
/
select ' Ended UPDATE_AWARD_CLOSEOUT ' from dual
/	