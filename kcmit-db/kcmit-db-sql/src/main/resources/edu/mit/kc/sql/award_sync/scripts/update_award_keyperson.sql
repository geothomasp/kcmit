select ' Start time of UPDATE_AWARD_PERSONS is '|| localtimestamp from dual
/
DECLARE
li_cust_id NUMBER(12,0);
ls_award_number VARCHAR2(40);

CURSOR c_award_comment IS
SELECT a.AWARD_NUMBER,a.SEQUENCE_NUMBER  Kuali_sequence_number,a.AWARD_ID,ac.MIT_AWARD_NUMBER,ac.SEQUENCE_NUMBER,DECODE(r.ROLODEX_ID,null,ac.PERSON_ID,null) PERSON_ID,r.ROLODEX_ID,ac.PERSON_NAME,ac.PROJECT_ROLE,ac.FACULTY_FLAG,ac.NON_MIT_PERSON_FLAG,ac.PERCENTAGE_EFFORT,ac.ACADEMIC_YEAR_EFFORT,ac.SUMMER_YEAR_EFFORT,ac.CALENDAR_YEAR_EFFORT,ac.UPDATE_TIMESTAMP,ac.UPDATE_USER FROM AWARD a 
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t ON a.AWARD_NUMBER=replace(t.MIT_AWARD_NUMBER,'-','-00') AND a.SEQUENCE_NUMBER=t.SEQUENCE_NUMBER
INNER JOIN OSP$AWARD_KEY_PERSONS@coeus.kuali ac ON t.MIT_AWARD_NUMBER=ac.MIT_AWARD_NUMBER and t.SEQUENCE_NUMBER=ac.SEQUENCE_NUMBER
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
	
	       DELETE AWARD_PERSONS WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		ELSIF ls_award_number<>r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER THEN  
		
		   DELETE AWARD_PERSONS WHERE AWARD_NUMBER=r_award_comment.AWARD_NUMBER AND SEQUENCE_NUMBER=r_award_comment.SEQUENCE_NUMBER;  
		   ls_award_number:=r_award_comment.AWARD_NUMBER||r_award_comment.SEQUENCE_NUMBER;
		   
		END IF;   
   
       INSERT INTO AWARD_PERSONS(AWARD_PERSON_ID,KEY_PERSON_PROJECT_ROLE,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,PERSON_ID,ROLODEX_ID,FULL_NAME,CONTACT_ROLE_CODE,ACADEMIC_YEAR_EFFORT,CALENDAR_YEAR_EFFORT,SUMMER_EFFORT,TOTAL_EFFORT,FACULTY_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
	   VALUES(SEQUENCE_AWARD_ID.NEXTVAL,r_award_comment.PROJECT_ROLE,r_award_comment.AWARD_ID,r_award_comment.AWARD_NUMBER,r_award_comment.SEQUENCE_NUMBER,r_award_comment.PERSON_ID,r_award_comment.ROLODEX_ID,r_award_comment.PERSON_NAME,'KP',r_award_comment.ACADEMIC_YEAR_EFFORT,r_award_comment.CALENDAR_YEAR_EFFORT,r_award_comment.SUMMER_YEAR_EFFORT,r_award_comment.PERCENTAGE_EFFORT,r_award_comment.FACULTY_FLAG,r_award_comment.UPDATE_TIMESTAMP,r_award_comment.UPDATE_USER,1,SYS_GUID());
    

	
END LOOP;
CLOSE c_award_comment;
END;
/
select ' End time of UPDATE_AWARD_PERSONS is '|| localtimestamp from dual
/