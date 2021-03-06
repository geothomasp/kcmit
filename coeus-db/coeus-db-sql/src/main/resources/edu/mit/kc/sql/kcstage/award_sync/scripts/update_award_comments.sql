select ' Started UPDATE_AWARD_COMMENT ' from dual
/
DECLARE
li_commit_count NUMBER;
ll_comment clob;
li_check_list CHAR(1);
CURSOR c_awd IS
SELECT t1.AWARD_NUMBER,t1.SEQUENCE_NUMBER,t1.COMMENT_TYPE_CODE 
FROM AWARD_COMMENT t1 
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t2 ON t1.AWARD_NUMBER = replace(t2.MIT_AWARD_NUMBER,'-','-00') AND t1.SEQUENCE_NUMBER = t2.SEQUENCE_NUMBER
WHERE t2.FEED_TYPE = 'C';
r_awd c_awd%ROWTYPE;

BEGIN

IF c_awd%ISOPEN THEN
CLOSE c_awd;
END IF;
OPEN c_awd;
LOOP
FETCH c_awd INTO r_awd;
EXIT WHEN c_awd% NOTFOUND;
	
        
         begin
            select a1.COMMENTS,CHECKLIST_PRINT_FLAG into ll_comment , li_check_list
            from OSP$AWARD_COMMENTS a1
            where a1.AWARD_NUMBER = r_awd.AWARD_NUMBER
            and  a1.SEQUENCE_NUMBER = (   SELECT MAX(a.SEQUENCE_NUMBER)
                          FROM OSP$AWARD_COMMENTS a WHERE a.COMMENT_CODE = r_awd.COMMENT_TYPE_CODE
                          AND a.AWARD_NUMBER = r_awd.AWARD_NUMBER 
                          AND a.SEQUENCE_NUMBER <= r_awd.SEQUENCE_NUMBER
                        )
            and  a1.COMMENT_CODE = r_awd.COMMENT_TYPE_CODE;
            
        exception      
        when no_data_found then      
        ll_comment := null;
        end;
		
				UPDATE /*+ index(award_comment AWARD_COMMENT_I1) */ AWARD_COMMENT 
				SET COMMENTS = ll_comment,
				CHECKLIST_PRINT_FLAG = li_check_list
				WHERE AWARD_NUMBER = r_awd.AWARD_NUMBER 
				AND SEQUENCE_NUMBER = r_awd.SEQUENCE_NUMBER
				AND COMMENT_TYPE_CODE = r_awd.COMMENT_TYPE_CODE; 
		
		
	li_commit_count:= li_commit_count + 1;
	
	if li_commit_count = 1000 then
		li_commit_count:=0;    
		commit;
	end if;
	
END LOOP;
CLOSE c_awd;
END;
/
INSERT INTO AWARD_COMMENT(AWARD_COMMENT_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,COMMENT_TYPE_CODE,CHECKLIST_PRINT_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,COMMENTS)
SELECT SEQ_AWARD_COMMENT_ID.NEXTVAL,a.AWARD_ID,a.AWARD_NUMBER,a.SEQUENCE_NUMBER,ac.COMMENT_CODE,ac.CHECKLIST_PRINT_FLAG,ac.UPDATE_TIMESTAMP,ac.UPDATE_USER,1,sys_guid(),ac.COMMENTS FROM OSP$AWARD_COMMENTS ac
INNER JOIN TEMP_TAB_TO_SYNC_AWARD t2 ON ac.MIT_AWARD_NUMBER = t2.MIT_AWARD_NUMBER AND ac.SEQUENCE_NUMBER = t2.SEQUENCE_NUMBER
INNER JOIN AWARD a ON a.AWARD_NUMBER=replace(t2.MIT_AWARD_NUMBER,'-','-00') AND a.SEQUENCE_NUMBER=t2.SEQUENCE_NUMBER
LEFT OUTER JOIN  AWARD_COMMENT c ON ac.MIT_AWARD_NUMBER=replace(c.AWARD_NUMBER,'-00','-') AND ac.SEQUENCE_NUMBER=c.SEQUENCE_NUMBER AND ac.COMMENT_CODE=c.COMMENT_TYPE_CODE
WHERE t2.FEED_TYPE = 'C' AND c. AWARD_NUMBER IS NULL
/
select ' Ended UPDATE_AWARD_COMMENT ' from dual
/	