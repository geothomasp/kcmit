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

DELIMITER /
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '1', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '2', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '3', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '4', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '5', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '6', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '7', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '8', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '9', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '10', '1', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '9', '2', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO SEQ_PROTO_ATTCHTYPEGRP_ID VALUES(NULL)
/
INSERT INTO IACUC_PROTO_ATTACH_TYPE_GROUP (TYPE_GROUP_ID, TYPE_CD, GROUP_CD, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ((SELECT (MAX(ID)) FROM SEQ_PROTO_ATTCHTYPEGRP_ID), '11', '2', NOW(), 'admin', UUID(), 1 )
/
DELIMITER ;
