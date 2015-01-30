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

INSERT INTO VALID_PROTO_ACTION_ACTION
    (VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
VALUES
    (1, 205, 1, 109, 'Y', 'Do you want to include this submission in an Agenda', NOW(), 'admin', UUID());
    
INSERT INTO VALID_PROTO_ACTION_ACTION
    (VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID) 
VALUES
    (2, 206, 1, 109, 'Y', 'Do you want to include this submission in an Agenda', NOW(), 'admin', UUID());

INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(3, '308', 1, '204', 'N', NULL, NOW(), 'admin', UUID(), '1');
  
INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(4, '308', 1, '304', 'N', NULL, NOW(), 'admin', UUID(), '2');

INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(5, '308', 1, '203', 'N', NULL, NOW(), 'admin', UUID(), '3');

INSERT INTO VALID_PROTO_ACTION_ACTION(VALID_PROTO_ACTION_ACTION_ID, PROTOCOL_ACTION_TYPE_CODE, ACTION_NUMBER, FOLLOWUP_ACTION_CODE, USER_PROMPT_FLAG, USER_PROMPT, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, COMM_DECISION_MOTION_TYPE_CODE)
  VALUES(6, '308', 1, '202', 'N', NULL, NOW(), 'admin', UUID(), '4');

COMMIT;
