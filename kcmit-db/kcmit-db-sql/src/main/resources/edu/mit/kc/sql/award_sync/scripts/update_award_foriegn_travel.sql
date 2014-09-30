select ' Start time of UPDATE_AWARD_APPROVED_FOREIGN_TRAVEL is '|| localtimestamp from dual
/
DECLARE
li_cust_id NUMBER(12,0);
ls_award_number VARCHAR2(40);

CURSOR c_award_comment IS
SELECT a.AWARD_NUMBER,a.SEQUENCE_NUMBER  Kuali_sequence_number,a.AWARD_ID,ac.MIT_AWARD_NUMBER,ac.SEQUENCE_NUMBER,ac.PERSON_ID,r.ROLODEX_ID,ac.PERSON_NAME,ac.DESTINATION,ac.DATE_FROM,ac.DATE_TO,ac.AMOUNT,ac.UPDATE_TIMESTAMP,ac.UPDATE_USER FROM AWARD a 
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t ON a.AWARD_NUMBER=replace(t.MIT_AWARD_NUMBER,'-','-00') AND a.SEQUENCE_NUMBER=t.SEQUENCE_NUMBER
INNER JOIN OSP$AWARD_APPRVD_FOREIGN_TRIP@coeus.kuali ac ON t.MIT_AWARD_NUMBER=ac.MIT_AWARD_NUMBER and t.SEQUENCE_NUMBER=ac.SEQUENCE_NUMBER
left outer join ROLODEX r on ac.PERSON_ID=r.ROLODEX_ID
WHERE t.FEED_TYPE='C'
ORDER BY AWARD_NUMBER,SEQUENCE_NUMBER;
r_award_comment c_award_comment%ROWTYPE;

BEGIN
IF c_award_comment%ISOPEN THEN
CLOSE c_award_comment;
END IF;
OPEN c_award_comment;
LOOP
FETCH c_award_comment INTO r_award_comment;
EXIT WHEN c_award_comment%NOTFOUND;



	
	   IF ls_award_number is null THEN
	
	      DELETE FROM AWARD_APPROVED_FOREIGN_TRAVEL WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;
		  ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		ELSIF ls_award_number<>r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER THEN
		
          DELETE FROM AWARD_APPROVED_FOREIGN_TRAVEL WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;
		  
		  ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		  
		END IF;


      INSERT INTO AWARD_APPROVED_FOREIGN_TRAVEL(AWARD_APPR_FORN_TRAVEL_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,PERSON_ID,ROLODEX_ID,TRAVELER_NAME,DESTINATION,START_DATE,END_DATE,AMOUNT,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
	  VALUES(SEQUENCE_AWARD_ID.NEXTVAL,r_award_comment.AWARD_ID,r_award_comment.AWARD_NUMBER,r_award_comment.SEQUENCE_NUMBER,r_award_comment.PERSON_ID,r_award_comment.ROLODEX_ID,r_award_comment.PERSON_NAME,r_award_comment.DESTINATION,r_award_comment.DATE_FROM,r_award_comment.DATE_TO,r_award_comment.AMOUNT,r_award_comment.UPDATE_TIMESTAMP,r_award_comment.UPDATE_USER,1,SYS_GUID());


	
END LOOP;
CLOSE c_award_comment;
END;
/
select ' End time of UPDATE_AWARD_APPROVED_FOREIGN_TRAVEL is '|| localtimestamp from dual
/