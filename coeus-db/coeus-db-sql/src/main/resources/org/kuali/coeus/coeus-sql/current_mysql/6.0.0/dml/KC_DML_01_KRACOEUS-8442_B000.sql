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
DELETE FROM VALID_NARR_FORMS WHERE NARRATIVE_TYPE_CODE = 11
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPerson-V1.0',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalkeypersons'),null,'admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPersonExpanded-V1-1',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalkeypersons'),null,'admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPersonExpanded_1_2-V1.2',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalkeypersons'),'N','admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPerson-V1.1',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalkeypersons'),null,'admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPersonExpanded-V1.0',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalkeypersons'),null,'admin',NOW(),UUID())
/

DELETE FROM VALID_NARR_FORMS WHERE NARRATIVE_TYPE_CODE = 12
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPerson-V1.0',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalequipment'),null,'admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPersonExpanded-V1-1',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalequipment'),null,'admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPersonExpanded_1_2-V1.2',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalequipment'),'N','admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPerson-V1.1',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalequipment'),null,'admin',NOW(),UUID())
/
INSERT INTO SEQ_VALID_NARR_FORMS_ID VALUES(NULL)
/
INSERT INTO VALID_NARR_FORMS (VALID_NARR_FORMS_ID,FORM_NAME,NARRATIVE_TYPE_CODE,MANDATORY,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID)
VALUES ((SELECT (MAX(ID)) FROM SEQ_VALID_NARR_FORMS_ID),'RR_KeyPersonExpanded-V1.0',(SELECT NARRATIVE_TYPE_CODE FROM NARRATIVE_TYPE WHERE DESCRIPTION = 'Additionalequipment'),null,'admin',NOW(),UUID())
/

DELIMITER ;
