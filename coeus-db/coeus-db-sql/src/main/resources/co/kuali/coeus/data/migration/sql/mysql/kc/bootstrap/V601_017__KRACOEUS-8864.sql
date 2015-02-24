DELIMITER /

drop procedure if exists findNextId
/

create procedure findNextId(in tableName varchar(64), in idCol varchar(64), out newId int)
begin
-- build statement like select t1.report_code + 1 from report t1 where not exists (select null from report t2 where t1.report_code + 1 = t2.report_code)
	set @dynamicSql = CONCAT('select t1.', idCol, ' + 1 into @dynamicSqlId from ', tableName, ' t1 where not exists (select null from ', tableName, ' t2 where t1.', idCol, ' + 1 = t2.', idCol, ') limit 1');
	prepare stmt1 from @dynamicSql;
	execute stmt1;
	set newId = @dynamicSqlId;
	deallocate prepare stmt1;
end
/

call findNextId('VALID_SP_REV_APPROVAL', 'VALID_SP_REV_APPROVAL_ID', @newId)
/
INSERT INTO VALID_SP_REV_APPROVAL (VALID_SP_REV_APPROVAL_ID,SPECIAL_REVIEW_CODE,APPROVAL_TYPE_CODE,PROTOCOL_NUMBER_FLAG,APPLICATION_DATE_FLAG,APPROVAL_DATE_FLAG,EXEMPT_NUMBER_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (@newId, 2, 2,'Y','Y','Y','N','admin',NOW(),UUID(),1)
/
call findNextId('VALID_SP_REV_APPROVAL', 'VALID_SP_REV_APPROVAL_ID', @newId)
/
INSERT INTO VALID_SP_REV_APPROVAL (VALID_SP_REV_APPROVAL_ID,SPECIAL_REVIEW_CODE,APPROVAL_TYPE_CODE,PROTOCOL_NUMBER_FLAG,APPLICATION_DATE_FLAG,APPROVAL_DATE_FLAG,EXEMPT_NUMBER_FLAG,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
    VALUES (@newId, 2, 4,'Y','N','N','Y','admin',NOW(),UUID(),1)
/
UPDATE VALID_SP_REV_APPROVAL SET PROTOCOL_NUMBER_FLAG = 'Y'  WHERE SPECIAL_REVIEW_CODE = (SELECT SPECIAL_REVIEW_CODE FROM SPECIAL_REVIEW WHERE DESCRIPTION = 'Human Subjects') AND APPROVAL_TYPE_CODE = (SELECT APPROVAL_TYPE_CODE FROM SP_REV_APPROVAL_TYPE WHERE DESCRIPTION = 'Exempt')
/
DELIMITER ;
