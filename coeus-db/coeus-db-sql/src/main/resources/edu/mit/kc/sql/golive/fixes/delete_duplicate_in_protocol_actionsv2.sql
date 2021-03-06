-- test this query whether we have row in child tables of PROTOCOL_ACTIONS
-- select count(*) from kcso.protocol_correspondence where action_id_fk in ( '692210','693613' );
-- select count(*) from kcso.comm_batch_corresp_detail where PROTOCOL_ACTION_ID in ( '692210','693613' );
DELETE FROM PROTOCOL_ACTIONS
WHERE PROTOCOL_ACTION_ID in ( '692210','693613' )
/
/*
--test script
select MIN(PROTOCOL_ACTION_ID) PROTOCOL_ACTION_ID,PROTOCOL_NUMBER,SEQUENCE_NUMBER,SUBMISSION_NUMBER,ACTION_ID,PROTOCOL_ID,PROTOCOL_ACTION_TYPE_CODE
from PROTOCOL_ACTIONS
GROUP BY PROTOCOL_NUMBER,SEQUENCE_NUMBER,SUBMISSION_NUMBER,ACTION_ID,PROTOCOL_ID,PROTOCOL_ACTION_TYPE_CODE
HAVING COUNT(PROTOCOL_ACTION_ID)> 1
-- restore script
insert into PROTOCOL_ACTIONS(PROTOCOL_ACTION_ID,PROTOCOL_NUMBER,SEQUENCE_NUMBER,SUBMISSION_NUMBER,ACTION_ID,PROTOCOL_ACTION_TYPE_CODE,
PROTOCOL_ID,SUBMISSION_ID_FK,COMMENTS,ACTION_DATE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,ACTUAL_ACTION_DATE,OBJ_ID,PREV_SUBMISSION_STATUS_CODE,
SUBMISSION_TYPE_CODE,PREV_PROTOCOL_STATUS_CODE,FOLLOWUP_ACTION_CODE,CREATE_USER,CREATE_TIMESTAMP)
SELECT PROTOCOL_ACTION_ID,PROTOCOL_NUMBER,SEQUENCE_NUMBER,SUBMISSION_NUMBER,ACTION_ID,PROTOCOL_ACTION_TYPE_CODE,
PROTOCOL_ID,SUBMISSION_ID_FK,COMMENTS,ACTION_DATE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,ACTUAL_ACTION_DATE,OBJ_ID,PREV_SUBMISSION_STATUS_CODE,
SUBMISSION_TYPE_CODE,PREV_PROTOCOL_STATUS_CODE,FOLLOWUP_ACTION_CODE,CREATE_USER,CREATE_TIMESTAMP
FROM PROTOCOL_ACTIONS_BAK_0526
WHERE PROTOCOL_ACTION_ID IN ('692210','693613')
*/
