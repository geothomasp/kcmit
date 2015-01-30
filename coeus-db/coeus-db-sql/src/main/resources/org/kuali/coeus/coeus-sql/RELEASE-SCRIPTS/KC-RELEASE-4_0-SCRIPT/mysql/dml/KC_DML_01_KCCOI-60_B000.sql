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

DELIMITER /
INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (8, 8, 1, 'Award', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (9, 8, 2, 'Proposal', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (10, 8, 3, 'IRB Protocol', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (11, 8, 4, 'IACUC Protocol', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (12, 8, 5, 'New', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (13, 8, 6, 'Update', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (14, 8, 7, 'Other', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (15, 8, 10, 'Institute Proposal', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (16, 8, 11, 'Manual Award', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (17, 8, 12, 'Manual Proposal', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (18, 8, 13, 'Manual IRB Protocol', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (19, 8, 14, 'Annual', NOW(), 'admin', 1, UUID())
/

INSERT INTO COEUS_SUB_MODULE (COEUS_SUB_MODULE_ID, MODULE_CODE , SUB_MODULE_CODE , DESCRIPTION, UPDATE_TIMESTAMP ,UPDATE_USER, VER_NBR, OBJ_ID)
	VALUES (20, 8, 15, 'Travel Disclosure', NOW(), 'admin', 1, UUID())
/
DELIMITER ;
