select ' Started UPDATE_AWARD_PAYMENT_SCHEDULE  ' from dual
/
DECLARE

li_cust_id NUMBER(12,0);
ls_award_number VARCHAR2(40);

CURSOR c_award_comment IS
SELECT a.AWARD_NUMBER,a.AWARD_ID,ac.MIT_AWARD_NUMBER,ac.SEQUENCE_NUMBER,ac.DUE_DATE,ac.AMOUNT,ac.UPDATE_TIMESTAMP,ac.UPDATE_USER,ac.SUBMIT_DATE,ac.SUBMITTED_BY,ac.INVOICE_NUMBER,ac.STATUS_DESCRIPTION FROM AWARD a 
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t ON a.AWARD_NUMBER=replace(t.MIT_AWARD_NUMBER,'-','-00') AND a.SEQUENCE_NUMBER=t.SEQUENCE_NUMBER
INNER JOIN OSP$AWARD_PAYMENT_SCHEDULE@coeus.kuali ac ON t.MIT_AWARD_NUMBER=ac.MIT_AWARD_NUMBER and t.SEQUENCE_NUMBER=ac.SEQUENCE_NUMBER
WHERE t.FEED_TYPE='C'
ORDER BY a.AWARD_NUMBER,a.SEQUENCE_NUMBER;
r_award_comment c_award_comment%ROWTYPE;

BEGIN
IF c_award_comment%ISOPEN THEN
CLOSE c_award_comment;
END IF;
OPEN c_award_comment;
LOOP
FETCH c_award_comment INTO r_award_comment;
EXIT WHEN c_award_comment%NOTFOUND;

begin	
	   IF ls_award_number is null THEN
	
           DELETE FROM AWARD_PAYMENT_SCHEDULE WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		ELSIF ls_award_number<>r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER THEN  
		
	       DELETE FROM AWARD_PAYMENT_SCHEDULE WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		END IF;  
    

       INSERT INTO AWARD_PAYMENT_SCHEDULE(AWARD_PAYMENT_SCHEDULE_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,DUE_DATE,AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,SUBMIT_DATE,SUBMITTED_BY,INVOICE_NUMBER,STATUS_DESCRIPTION,STATUS,LAST_UPDATE_USER,LAST_UPDATE_TIMESTAMP,OVERDUE,REPORT_STATUS_CODE,SUBMITTED_BY_PERSON_ID,VER_NBR,OBJ_ID)
	   VALUES(SEQUENCE_AWARD_ID.NEXTVAL,r_award_comment.AWARD_ID,r_award_comment.AWARD_NUMBER,r_award_comment.SEQUENCE_NUMBER,r_award_comment.DUE_DATE,r_award_comment.AMOUNT,r_award_comment.UPDATE_TIMESTAMP,r_award_comment.UPDATE_USER,r_award_comment.SUBMIT_DATE,r_award_comment.SUBMITTED_BY,r_award_comment.INVOICE_NUMBER,r_award_comment.STATUS_DESCRIPTION,null,r_award_comment.UPDATE_USER,r_award_comment.UPDATE_TIMESTAMP,null,null,null,1,SYS_GUID());

exception
when others then
	dbms_output.put_line('Error in update of AWARD_PAYMENT_SCHEDULE. AWARD_NUMBER,SEQUENCE_NUMBER'||r_award_comment.AWARD_NUMBER||','||r_award_comment.SEQUENCE_NUMBER||'-'||sqlerrm);
end;	
	
END LOOP;
CLOSE c_award_comment;
END;
/
select ' Ended UPDATE_AWARD_PAYMENT_SCHEDULE  ' from dual
/