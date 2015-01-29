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
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

-- insert negotiation activity types
INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'CC', 'Conference Call', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'CD', 'Copied Documents', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'E', 'Email', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'FR', 'Fax Received', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'FS', 'Fax Sent', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'M', 'Meeting', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'TC', 'Telephone Call', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'O', 'Other', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'DD', 'Draft Document', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'RD', 'Revised Document', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'CS', 'Correspondence Sent', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'CR', 'Correspondence Received', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'CPS', 'Courier Package Sent', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'CPR', 'Courier Package Received', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'EDS', 'Executable Document Sent', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'EDR', 'Executable Document Received', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_ACTIVITY_TYPE_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_ACTIVITY_TYPE (NEGOTIATION_ACTIVITY_TYPE_ID, NEGOTIATION_ACTIVITY_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_ACTIVITY_TYPE_S), 'F', 'Filed - Returned to CA', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_LOCATION_S VALUES(NULL)
/

-- insert negotiation locations
INSERT INTO NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID, NEGOTIATION_LOCATION_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_LOCATION_S), 'OSP', 'OSP', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_LOCATION_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID, NEGOTIATION_LOCATION_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_LOCATION_S), 'TLO', 'TLO', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_LOCATION_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID, NEGOTIATION_LOCATION_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_LOCATION_S), 'OGC', 'OGC', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_LOCATION_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID, NEGOTIATION_LOCATION_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_LOCATION_S), 'S', 'Sponsor', NOW(), 'admin', UUID(), 'Y', 1)
/
INSERT INTO NEGOTIATION_LOCATION_S VALUES(NULL)
/

INSERT INTO NEGOTIATION_LOCATION (NEGOTIATION_LOCATION_ID, NEGOTIATION_LOCATION_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, ACTV_IND, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM NEGOTIATION_LOCATION_S), 'DLC', 'DLC', NOW(), 'admin', UUID(), 'Y', 1)
/

COMMIT
/




DELIMITER ;
