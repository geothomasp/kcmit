--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 The Kuali Foundation
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

delimiter /
TRUNCATE TABLE BATCH_CORRESPONDENCE_DETAIL
/
INSERT INTO SEQ_BATCH_CORRESPONDENCE VALUES (null)
/
INSERT INTO BATCH_CORRESPONDENCE_DETAIL (BATCH_CORRESPONDENCE_DETAIL_ID,BATCH_CORRESPONDENCE_TYPE_CODE,PROTO_CORRESP_TYPE_CODE,DAYS_TO_EVENT,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ((SELECT MAX(ID) FROM SEQ_BATCH_CORRESPONDENCE),(SELECT BATCH_CORRESPONDENCE_TYPE_CODE FROM BATCH_CORRESPONDENCE WHERE DESCRIPTION = 'Protocol Renewal Reminders'),(SELECT PROTO_CORRESP_TYPE_CODE FROM PROTO_CORRESP_TYPE WHERE DESCRIPTION = 'Renewal Reminder Letter #1'),60,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_BATCH_CORRESPONDENCE VALUES (null)
/
INSERT INTO BATCH_CORRESPONDENCE_DETAIL (BATCH_CORRESPONDENCE_DETAIL_ID,BATCH_CORRESPONDENCE_TYPE_CODE,PROTO_CORRESP_TYPE_CODE,DAYS_TO_EVENT,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ((SELECT MAX(ID) FROM SEQ_BATCH_CORRESPONDENCE),(SELECT BATCH_CORRESPONDENCE_TYPE_CODE FROM BATCH_CORRESPONDENCE WHERE DESCRIPTION = 'Protocol Renewal Reminders'),(SELECT PROTO_CORRESP_TYPE_CODE FROM PROTO_CORRESP_TYPE WHERE DESCRIPTION = 'Renewal Reminder Letter #2'),15,'admin',NOW(),UUID(),1)
/
INSERT INTO SEQ_BATCH_CORRESPONDENCE VALUES (null)
/
INSERT INTO BATCH_CORRESPONDENCE_DETAIL (BATCH_CORRESPONDENCE_DETAIL_ID,BATCH_CORRESPONDENCE_TYPE_CODE,PROTO_CORRESP_TYPE_CODE,DAYS_TO_EVENT,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ((SELECT MAX(ID) FROM SEQ_BATCH_CORRESPONDENCE),(SELECT BATCH_CORRESPONDENCE_TYPE_CODE FROM BATCH_CORRESPONDENCE WHERE DESCRIPTION = 'Reminder to IRB Notifications'),(SELECT PROTO_CORRESP_TYPE_CODE FROM PROTO_CORRESP_TYPE WHERE DESCRIPTION = 'Reminder to IRB Notification #1'),15,'admin',NOW(),UUID(),1)
/
delimiter ;
