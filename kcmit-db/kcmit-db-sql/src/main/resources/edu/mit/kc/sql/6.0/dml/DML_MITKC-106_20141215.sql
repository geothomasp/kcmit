UPDATE AWARD_COMMENT
SET COMMENT_TYPE_CODE=(SELECT COMMENT_TYPE_CODE FROM COMMENT_TYPE WHERE DESCRIPTION IN('ARRA Award Description'))
WHERE COMMENT_TYPE_CODE='22';

UPDATE AWARD_COMMENT
SET COMMENT_TYPE_CODE=(SELECT COMMENT_TYPE_CODE FROM COMMENT_TYPE WHERE DESCRIPTION IN('ARRA Quarterly Activities'))
WHERE COMMENT_TYPE_CODE='23';

commit;
/
