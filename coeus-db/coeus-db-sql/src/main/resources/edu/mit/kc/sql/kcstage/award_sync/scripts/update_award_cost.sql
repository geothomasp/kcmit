select ' Started UPDATE_AWARD_COST_SHARE ' from dual
/	
DECLARE

ls_award_number VARCHAR2(40);

CURSOR c_award_comment IS
SELECT a.AWARD_NUMBER,a.SEQUENCE_NUMBER  Kuali_sequence_number,a.AWARD_ID,ac.MIT_AWARD_NUMBER,ac.SEQUENCE_NUMBER,ac.FISCAL_YEAR,ac.COST_SHARING_PERCENTAGE,ac.COST_SHARING_TYPE_CODE,ac.SOURCE_ACCOUNT,ac.DESTINATION_ACCOUNT,ac.AMOUNT,ac.UPDATE_TIMESTAMP,ac.UPDATE_USER FROM AWARD a 
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t ON a.AWARD_NUMBER=replace(t.MIT_AWARD_NUMBER,'-','-00') AND a.SEQUENCE_NUMBER=t.SEQUENCE_NUMBER
INNER JOIN OSP$AWARD_COST_SHARING@coeus.kuali ac ON t.MIT_AWARD_NUMBER=ac.MIT_AWARD_NUMBER and t.SEQUENCE_NUMBER=ac.SEQUENCE_NUMBER
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
	   
	       DELETE FROM AWARD_COST_SHARE WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		ELSIF ls_award_number<>r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER THEN 
		
	       DELETE FROM AWARD_COST_SHARE WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		END IF;   


       INSERT INTO AWARD_COST_SHARE(AWARD_COST_SHARE_ID,VERIFICATION_DATE,COST_SHARE_MET,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,PROJECT_PERIOD,COST_SHARE_PERCENTAGE,COST_SHARE_TYPE_CODE,SOURCE,DESTINATION,COMMITMENT_AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
	   VALUES(SEQ_AWARD_COST_SHARE_ID.NEXTVAL,NULL,NULL,r_award_comment.AWARD_ID,r_award_comment.AWARD_NUMBER,r_award_comment.SEQUENCE_NUMBER,r_award_comment.FISCAL_YEAR,r_award_comment.COST_SHARING_PERCENTAGE,r_award_comment.COST_SHARING_TYPE_CODE,r_award_comment.SOURCE_ACCOUNT,r_award_comment.DESTINATION_ACCOUNT,r_award_comment.AMOUNT,r_award_comment.UPDATE_TIMESTAMP,r_award_comment.UPDATE_USER,1,SYS_GUID());
  
exception
when others then
	dbms_output.put_line('Error in update of AWARD_COST_SHARE. AWARD_NUMBER,SEQUENCE_NUMBER'||r_award_comment.AWARD_NUMBER||','||r_award_comment.SEQUENCE_NUMBER||'-'||sqlerrm);
end;	
	
END LOOP;
CLOSE c_award_comment;
END;
/
select ' Ended UPDATE_AWARD_COST_SHARE ' from dual
/