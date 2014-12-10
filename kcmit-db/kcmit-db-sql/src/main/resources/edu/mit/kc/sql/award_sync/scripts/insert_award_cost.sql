select ' Start time of AWARD_COST_SHARE  script is ' from dual
/
DECLARE

ls_award_number VARCHAR2(40) := null;

CURSOR c_award_comment IS
SELECT a.AWARD_NUMBER,a.SEQUENCE_NUMBER  Kuali_sequence_number,a.AWARD_ID,ac.MIT_AWARD_NUMBER,ac.SEQUENCE_NUMBER,ac.FISCAL_YEAR,ac.COST_SHARING_PERCENTAGE,ac.COST_SHARING_TYPE_CODE,ac.SOURCE_ACCOUNT,ac.DESTINATION_ACCOUNT,ac.AMOUNT,ac.UPDATE_TIMESTAMP,ac.UPDATE_USER FROM AWARD a 
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t ON a.AWARD_NUMBER=replace(t.MIT_AWARD_NUMBER,'-','-00') AND a.SEQUENCE_NUMBER=t.SEQUENCE_NUMBER
LEFT OUTER JOIN OSP$AWARD_COST_SHARING@coeus.kuali ac ON t.MIT_AWARD_NUMBER=ac.MIT_AWARD_NUMBER and t.SEQUENCE_NUMBER=ac.SEQUENCE_NUMBER
WHERE t.FEED_TYPE = 'N'
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


    IF r_award_comment.MIT_AWARD_NUMBER IS NULL THEN
	   
	   IF ls_award_number is null THEN
	   
	       INSERT INTO AWARD_COST_SHARE(AWARD_COST_SHARE_ID,VERIFICATION_DATE,COST_SHARE_MET,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,PROJECT_PERIOD,COST_SHARE_PERCENTAGE,COST_SHARE_TYPE_CODE,SOURCE,DESTINATION,COMMITMENT_AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
	       SELECT SEQ_AWARD_COST_SHARE_ID.NEXTVAL,VERIFICATION_DATE,COST_SHARE_MET,r_award_comment.AWARD_ID,r_award_comment.AWARD_NUMBER,r_award_comment.Kuali_sequence_number,PROJECT_PERIOD,COST_SHARE_PERCENTAGE,COST_SHARE_TYPE_CODE,SOURCE,DESTINATION,COMMITMENT_AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,1,SYS_GUID() FROM AWARD_COST_SHARE
           WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER and 	SEQUENCE_NUMBER=(SELECT MAX(aw.SEQUENCE_NUMBER) FROM AWARD_COST_SHARE aw where aw.AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND aw.SEQUENCE_NUMBER<r_award_comment.Kuali_sequence_number);
         
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		ELSIF ls_award_number<>r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER THEN 
		
	       INSERT INTO AWARD_COST_SHARE(AWARD_COST_SHARE_ID,VERIFICATION_DATE,COST_SHARE_MET,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,PROJECT_PERIOD,COST_SHARE_PERCENTAGE,COST_SHARE_TYPE_CODE,SOURCE,DESTINATION,COMMITMENT_AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
	       SELECT SEQ_AWARD_COST_SHARE_ID.NEXTVAL,VERIFICATION_DATE,COST_SHARE_MET,r_award_comment.AWARD_ID,r_award_comment.AWARD_NUMBER,r_award_comment.Kuali_sequence_number,PROJECT_PERIOD,COST_SHARE_PERCENTAGE,COST_SHARE_TYPE_CODE,SOURCE,DESTINATION,COMMITMENT_AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,1,SYS_GUID() FROM AWARD_COST_SHARE
           WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER and 	SEQUENCE_NUMBER=(SELECT MAX(aw.SEQUENCE_NUMBER) FROM AWARD_COST_SHARE aw where aw.AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND aw.SEQUENCE_NUMBER<r_award_comment.Kuali_sequence_number);
         
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		END IF;   
    ELSE

       INSERT INTO AWARD_COST_SHARE(AWARD_COST_SHARE_ID,VERIFICATION_DATE,COST_SHARE_MET,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,PROJECT_PERIOD,COST_SHARE_PERCENTAGE,COST_SHARE_TYPE_CODE,SOURCE,DESTINATION,COMMITMENT_AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
	   VALUES(SEQ_AWARD_COST_SHARE_ID.NEXTVAL,NULL,NULL,r_award_comment.AWARD_ID,r_award_comment.AWARD_NUMBER,r_award_comment.Kuali_sequence_number,r_award_comment.FISCAL_YEAR,r_award_comment.COST_SHARING_PERCENTAGE,r_award_comment.COST_SHARING_TYPE_CODE,r_award_comment.SOURCE_ACCOUNT,r_award_comment.DESTINATION_ACCOUNT,r_award_comment.AMOUNT,r_award_comment.UPDATE_TIMESTAMP,r_award_comment.UPDATE_USER,1,SYS_GUID());
  
    END IF;	
	
END LOOP;
CLOSE c_award_comment;
END;
/	
select ' End time of AWARD_COST_SHARE script is ' from dual
/