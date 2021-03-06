select ' Started AWARD_IDC_RATE script ' from dual
/
DECLARE
li_cust_id NUMBER(12,0);
ls_award_number VARCHAR2(40) := null;

CURSOR c_award_comment IS
SELECT a.AWARD_NUMBER,a.SEQUENCE_NUMBER  Kuali_sequence_number,a.AWARD_ID,ac.MIT_AWARD_NUMBER,ac.SEQUENCE_NUMBER,ac.APPLICABLE_IDC_RATE,ac.IDC_RATE_TYPE_CODE,ac.FISCAL_YEAR,ac.ON_CAMPUS_FLAG,ac.UNDERRECOVERY_OF_IDC,ac.SOURCE_ACCOUNT,ac.DESTINATION_ACCOUNT,ac.START_DATE,ac.END_DATE,ac.UPDATE_TIMESTAMP,ac.UPDATE_USER FROM AWARD a 
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t ON a.AWARD_NUMBER=replace(t.MIT_AWARD_NUMBER,'-','-00') AND a.SEQUENCE_NUMBER=t.SEQUENCE_NUMBER
LEFT OUTER JOIN OSP$AWARD_IDC_RATE@coeus.kuali ac ON t.MIT_AWARD_NUMBER=ac.MIT_AWARD_NUMBER and t.SEQUENCE_NUMBER=ac.SEQUENCE_NUMBER
WHERE t.FEED_TYPE='N'
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
    IF r_award_comment.MIT_AWARD_NUMBER IS NULL THEN
	
	   IF ls_award_number is null THEN
	
	       INSERT INTO AWARD_IDC_RATE(AWARD_IDC_RATE_ID,AWARD_NUMBER,SEQUENCE_NUMBER,AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
	       SELECT SEQUENCE_AWARD_ID.NEXTVAL,r_award_comment.AWARD_NUMBER,r_award_comment.Kuali_sequence_number,r_award_comment.AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,1,UPDATE_TIMESTAMP,UPDATE_USER,SYS_GUID() FROM AWARD_IDC_RATE
           WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER and 	SEQUENCE_NUMBER=(SELECT MAX(aw.SEQUENCE_NUMBER) FROM AWARD_APPROVED_EQUIPMENT aw where aw.AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND aw.SEQUENCE_NUMBER<r_award_comment.Kuali_sequence_number);
		   
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.Kuali_sequence_number;
		   
		ELSIF ls_award_number<>r_award_comment.AWARD_NUMBER||r_award_comment.Kuali_sequence_number THEN   
        
		   INSERT INTO AWARD_IDC_RATE(AWARD_IDC_RATE_ID,AWARD_NUMBER,SEQUENCE_NUMBER,AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
	       SELECT SEQUENCE_AWARD_ID.NEXTVAL,r_award_comment.AWARD_NUMBER,r_award_comment.Kuali_sequence_number,r_award_comment.AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,1,UPDATE_TIMESTAMP,UPDATE_USER,SYS_GUID() FROM AWARD_IDC_RATE
           WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER and 	SEQUENCE_NUMBER=(SELECT MAX(aw.SEQUENCE_NUMBER) FROM AWARD_APPROVED_EQUIPMENT aw where aw.AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND aw.SEQUENCE_NUMBER<r_award_comment.Kuali_sequence_number);
		   
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.Kuali_sequence_number;
		   
		END IF;
		
    ELSE
	
	

       INSERT INTO AWARD_IDC_RATE(AWARD_IDC_RATE_ID,AWARD_NUMBER,SEQUENCE_NUMBER,AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
	   VALUES(SEQUENCE_AWARD_ID.NEXTVAL,r_award_comment.AWARD_NUMBER,r_award_comment.Kuali_sequence_number,r_award_comment.AWARD_ID,r_award_comment.APPLICABLE_IDC_RATE,r_award_comment.IDC_RATE_TYPE_CODE,r_award_comment.FISCAL_YEAR,r_award_comment.ON_CAMPUS_FLAG,r_award_comment.UNDERRECOVERY_OF_IDC,r_award_comment.SOURCE_ACCOUNT,r_award_comment.DESTINATION_ACCOUNT,r_award_comment.START_DATE,r_award_comment.END_DATE,1,r_award_comment.UPDATE_TIMESTAMP,r_award_comment.UPDATE_USER,SYS_GUID());

	END IF;	
exception
when others then
	dbms_output.put_line('ERROR IN AWARD_IDC_RATE. AWARD_NUMBER,SEQUENCE_NUMBER'||r_award_comment.AWARD_NUMBER||','||r_award_comment.Kuali_sequence_number||'-'||sqlerrm);
end;		
	
END LOOP;
CLOSE c_award_comment;
END;
/	
select ' Ended AWARD_IDC_RATE script ' from dual
/