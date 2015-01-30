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

INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('BL-BL','IU-UNIV','BLOOMINGTON CAMPUS','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('BL-IIDC','BL-RCEN','IND INST ON DISABILITY/COMMNTY','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('BL-RCEN','BL-RUGS','RESEARCH CENTERS','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('BL-RUGS','BL-BL','OFFICE OF VP FOR RESEARCH','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IN-CARD','IN-MDEP','CARDIOLOGY','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IN-CARR','IN-CARD','CARDIOLOGY RECHARGE CTR','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IN-IN','IU-UNIV','IND UNIV-PURDUE UNIV INDPLS','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IN-MDEP','IN-MED','MEDICINE DEPT','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IN-MED','IN-IN','SCHOOL OF MEDICINE','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IN-PED','IN-MED','PEDIATRICS','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IN-PERS','IN-PED','PED-EMERGENCY ROOM SERVICES','admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO UNIT (UNIT_NUMBER,PARENT_UNIT_NUMBER,UNIT_NAME,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR) 
    VALUES ('IU-UNIV','000001','UNIVERSITY LEVEL','admin',SYSDATE,SYS_GUID(),1)
/
