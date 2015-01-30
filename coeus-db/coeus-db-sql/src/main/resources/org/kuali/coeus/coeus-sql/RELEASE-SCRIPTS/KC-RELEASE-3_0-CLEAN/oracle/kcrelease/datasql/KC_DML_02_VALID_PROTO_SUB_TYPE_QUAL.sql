--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 Kuali, Inc.
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

TRUNCATE TABLE VALID_PROTO_SUB_TYPE_QUAL DROP STORAGE
/
INSERT INTO VALID_PROTO_SUB_TYPE_QUAL (VALID_PROTO_SUB_TYPE_QUAL_ID,SUBMISSION_TYPE_CODE,SUBMISSION_TYPE_QUAL_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_VALID_SUBM_REVW_TYPE_QUAL.NEXTVAL,(SELECT SUBMISSION_TYPE_CODE FROM SUBMISSION_TYPE WHERE DESCRIPTION = 'FYI'),(SELECT SUBMISSION_TYPE_QUAL_CODE FROM SUBMISSION_TYPE_QUALIFIER WHERE DESCRIPTION = 'Modification/Amendment/Revisions/Significant New Finding'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_PROTO_SUB_TYPE_QUAL (VALID_PROTO_SUB_TYPE_QUAL_ID,SUBMISSION_TYPE_CODE,SUBMISSION_TYPE_QUAL_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_VALID_SUBM_REVW_TYPE_QUAL.NEXTVAL,(SELECT SUBMISSION_TYPE_CODE FROM SUBMISSION_TYPE WHERE DESCRIPTION = 'FYI'),(SELECT SUBMISSION_TYPE_QUAL_CODE FROM SUBMISSION_TYPE_QUALIFIER WHERE DESCRIPTION = 'Annual Scheduled by IRB'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_PROTO_SUB_TYPE_QUAL (VALID_PROTO_SUB_TYPE_QUAL_ID,SUBMISSION_TYPE_CODE,SUBMISSION_TYPE_QUAL_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_VALID_SUBM_REVW_TYPE_QUAL.NEXTVAL,(SELECT SUBMISSION_TYPE_CODE FROM SUBMISSION_TYPE WHERE DESCRIPTION = 'FYI'),(SELECT SUBMISSION_TYPE_QUAL_CODE FROM SUBMISSION_TYPE_QUALIFIER WHERE DESCRIPTION = 'Contingent/Conditional Approval/Deferred Approval/ Non-Approval'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_PROTO_SUB_TYPE_QUAL (VALID_PROTO_SUB_TYPE_QUAL_ID,SUBMISSION_TYPE_CODE,SUBMISSION_TYPE_QUAL_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_VALID_SUBM_REVW_TYPE_QUAL.NEXTVAL,(SELECT SUBMISSION_TYPE_CODE FROM SUBMISSION_TYPE WHERE DESCRIPTION = 'FYI'),(SELECT SUBMISSION_TYPE_QUAL_CODE FROM SUBMISSION_TYPE_QUALIFIER WHERE DESCRIPTION = 'Protocol-related COI Report'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_PROTO_SUB_TYPE_QUAL (VALID_PROTO_SUB_TYPE_QUAL_ID,SUBMISSION_TYPE_CODE,SUBMISSION_TYPE_QUAL_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_VALID_SUBM_REVW_TYPE_QUAL.NEXTVAL,(SELECT SUBMISSION_TYPE_CODE FROM SUBMISSION_TYPE WHERE DESCRIPTION = 'FYI'),(SELECT SUBMISSION_TYPE_QUAL_CODE FROM SUBMISSION_TYPE_QUALIFIER WHERE DESCRIPTION = 'Self report for Noncompliance'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_PROTO_SUB_TYPE_QUAL (VALID_PROTO_SUB_TYPE_QUAL_ID,SUBMISSION_TYPE_CODE,SUBMISSION_TYPE_QUAL_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_VALID_SUBM_REVW_TYPE_QUAL.NEXTVAL,(SELECT SUBMISSION_TYPE_CODE FROM SUBMISSION_TYPE WHERE DESCRIPTION = 'FYI'),(SELECT SUBMISSION_TYPE_QUAL_CODE FROM SUBMISSION_TYPE_QUALIFIER WHERE DESCRIPTION = 'Unanticipated Problems'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_PROTO_SUB_TYPE_QUAL (VALID_PROTO_SUB_TYPE_QUAL_ID,SUBMISSION_TYPE_CODE,SUBMISSION_TYPE_QUAL_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES (SEQ_VALID_SUBM_REVW_TYPE_QUAL.NEXTVAL,(SELECT SUBMISSION_TYPE_CODE FROM SUBMISSION_TYPE WHERE DESCRIPTION = 'FYI'),(SELECT SUBMISSION_TYPE_QUAL_CODE FROM SUBMISSION_TYPE_QUALIFIER WHERE DESCRIPTION = 'DSMB Report'),'admin',SYSDATE,SYS_GUID(),1)
/
