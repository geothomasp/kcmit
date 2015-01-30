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

TRUNCATE TABLE VALID_CALC_TYPES DROP STORAGE
/
INSERT INTO VALID_CALC_TYPES (CALC_TYPE_ID,RATE_CLASS_TYPE,DEPENDENT_SEQ_NUMBER,DEPENDENT_RATE_CLASS_TYPE,RATE_CLASS_CODE,RATE_TYPE_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
  VALUES ('1','L',0,null,null,null,'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_CALC_TYPES (CALC_TYPE_ID,RATE_CLASS_TYPE,DEPENDENT_SEQ_NUMBER,DEPENDENT_RATE_CLASS_TYPE,RATE_CLASS_CODE,RATE_TYPE_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
  VALUES ('1','X',0,null,null,null,'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_CALC_TYPES (CALC_TYPE_ID,RATE_CLASS_TYPE,DEPENDENT_SEQ_NUMBER,DEPENDENT_RATE_CLASS_TYPE,RATE_CLASS_CODE,RATE_TYPE_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
  VALUES ('1','Y',0,null,null,null,'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_CALC_TYPES (CALC_TYPE_ID,RATE_CLASS_TYPE,DEPENDENT_SEQ_NUMBER,DEPENDENT_RATE_CLASS_TYPE,RATE_CLASS_CODE,RATE_TYPE_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
  VALUES ('1','E',1,'Y',(SELECT RATE_CLASS_CODE FROM RATE_CLASS WHERE DESCRIPTION = 'Employee Benefits'),(SELECT RATE_TYPE_CODE FROM RATE_TYPE WHERE DESCRIPTION = 'EB on LA'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_CALC_TYPES (CALC_TYPE_ID,RATE_CLASS_TYPE,DEPENDENT_SEQ_NUMBER,DEPENDENT_RATE_CLASS_TYPE,RATE_CLASS_CODE,RATE_TYPE_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
  VALUES ('1','O',1,'E',null,null,'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_CALC_TYPES (CALC_TYPE_ID,RATE_CLASS_TYPE,DEPENDENT_SEQ_NUMBER,DEPENDENT_RATE_CLASS_TYPE,RATE_CLASS_CODE,RATE_TYPE_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
  VALUES ('1','V',1,'Y',(SELECT RATE_CLASS_CODE FROM RATE_CLASS WHERE DESCRIPTION = 'Vacation'),(SELECT RATE_TYPE_CODE FROM RATE_TYPE WHERE DESCRIPTION = 'Vacation on LA'),'admin',SYSDATE,SYS_GUID(),1)
/
INSERT INTO VALID_CALC_TYPES (CALC_TYPE_ID,RATE_CLASS_TYPE,DEPENDENT_SEQ_NUMBER,DEPENDENT_RATE_CLASS_TYPE,RATE_CLASS_CODE,RATE_TYPE_CODE,UPDATE_USER,UPDATE_TIMESTAMP,OBJ_ID,VER_NBR)
  VALUES ('1','O',2,'V',null,null,'admin',SYSDATE,SYS_GUID(),1)
/
