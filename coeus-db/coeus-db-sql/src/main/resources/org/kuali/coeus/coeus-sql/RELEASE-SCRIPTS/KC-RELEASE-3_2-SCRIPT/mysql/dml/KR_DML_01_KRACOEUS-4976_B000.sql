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
INSERT INTO KRIM_PERM_ID_BS_S VALUES(NULL)
/
-- Create new Permissions
INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT)
VALUES((SELECT (MAX(ID)) FROM KRIM_PERM_ID_BS_S), UUID(), 1, (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NM = 'Default' AND NMSPC_CD='KUALI'), 'KC-NEGOTIATION', 'CREATE NEGOTIATION', 'Create a new negotiation permission')
/
INSERT INTO KRIM_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT)
VALUES((SELECT (MAX(ID)) FROM KRIM_PERM_ID_BS_S), UUID(), 1, (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NM = 'Default' AND NMSPC_CD='KUALI'), 'KC-NEGOTIATION', 'MODIFY NEGOTIATION', 'Edit an existing negotiation permission')
/
INSERT INTO KRIM_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT)
VALUES((SELECT (MAX(ID)) FROM KRIM_PERM_ID_BS_S), UUID(), 1, (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NM = 'Default' AND NMSPC_CD='KUALI'), 'KC-NEGOTIATION', 'CREATE ACTIVITIES', 'Create new activities on an existing negotiation permission')
/
INSERT INTO KRIM_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT)
VALUES((SELECT (MAX(ID)) FROM KRIM_PERM_ID_BS_S), UUID(), 1, (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NM = 'Default' AND NMSPC_CD='KUALI'), 'KC-NEGOTIATION', 'MODIFY ACTIVITIES', 'Edit the activities on an existing negotiation permission')
/
INSERT INTO KRIM_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT)
VALUES((SELECT (MAX(ID)) FROM KRIM_PERM_ID_BS_S), UUID(), 1, (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NM = 'Default' AND NMSPC_CD='KUALI'), 'KC-NEGOTIATION', 'VIEW NEGOTIATION - UNRESTRICTED', 'View all information on a negotiation permission')
/
INSERT INTO KRIM_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_PERM_T (PERM_ID, OBJ_ID, VER_NBR, PERM_TMPL_ID, NMSPC_CD, NM, DESC_TXT)
VALUES((SELECT (MAX(ID)) FROM KRIM_PERM_ID_BS_S), UUID(), 1, (SELECT PERM_TMPL_ID FROM KRIM_PERM_TMPL_T WHERE NM = 'Default' AND NMSPC_CD='KUALI'), 'KC-NEGOTIATION', 'VIEW NEGOTIATION', 'View all non-restricted information on a negotiation permission')
/
INSERT INTO KRIM_TYP_ID_BS_S VALUES(NULL)
/
-- create role types
INSERT INTO KRIM_TYP_T (KIM_TYP_ID, OBJ_ID, VER_NBR, NM, SRVC_NM, ACTV_IND, NMSPC_CD)
VALUES( (SELECT (MAX(ID)) FROM KRIM_TYP_ID_BS_S), UUID(), 1, 'Derived Role: Negotiation Negotiator', 'negotiationNegotiatorDerivedRoleType', 'Y', 'KC-NEGOTIATION')
/
INSERT INTO KRIM_TYP_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_TYP_T (KIM_TYP_ID, OBJ_ID, VER_NBR, NM, SRVC_NM, ACTV_IND, NMSPC_CD)
VALUES( (SELECT (MAX(ID)) FROM KRIM_TYP_ID_BS_S), UUID(), 1, 'Derived Role: Negotiation Investigators', 'negotiationPersonDerivedRoleType', 'Y', 'KC-NEGOTIATION')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- create new roles
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'Negotiation Administrator', 'KC-NEGOTIATION', 'The Negotiation Administrator role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Default'), 'Y', NOW())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'Negotiator', 'KC-NEGOTIATION', 'The Negotiator role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Negotiation Negotiator'), 'Y', NOW())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'Negotiation Creator', 'KC-NEGOTIATION', 'The Negotiation Creator role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Default'), 'Y', NOW())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'Investigators', 'KC-NEGOTIATION', 'The Negotiation Investigators role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Negotiation Investigators'), 'Y', NOW())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'PI', 'KC-NEGOTIATION', 'The Negotiation Principle Investigator role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Negotiation Investigators'), 'Y', NOW())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'COI', 'KC-NEGOTIATION', 'The Negotiation Co-Investigator role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Negotiation Investigators'), 'Y', NOW())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, 'KP', 'KC-NEGOTIATION', 'The Negotiation Key Person role', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Negotiation Investigators'), 'Y', NOW())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- associate roles with permissions
-- NEGOTIATION ADMINISTRATOR
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Administrator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'CREATE NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Administrator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'MODIFY NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Administrator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'CREATE ACTIVITIES' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Administrator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'MODIFY ACTIVITIES' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Administrator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION - UNRESTRICTED' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- NEGOTIATOR
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'CREATE NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'MODIFY NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'CREATE ACTIVITIES' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'MODIFY ACTIVITIES' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION - UNRESTRICTED' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- NEGOTIATOR CREATOR
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Creator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'CREATE NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Creator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'MODIFY NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Creator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'CREATE ACTIVITIES' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Creator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION - UNRESTRICTED' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- OSP ADMINISTRATOR
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'OSP Administrator' AND NMSPC_CD='KC-ADM'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION - UNRESTRICTED' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- UNIT ADMINISTRATOR
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Unit Administrator' AND NMSPC_CD='KC-WKFLW'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- NEGOTIATION INVESTIGATORS
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Investigators' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- NEGOTIATION PI
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'PI' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- NEGOTIATION CO-PI
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'COI' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- NEGOTIATION KEY PERSON
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S), UUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'KP' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW NEGOTIATION' AND NMSPC_CD='KC-NEGOTIATION'), 'Y')
/
COMMIT
/
DELIMITER ;
