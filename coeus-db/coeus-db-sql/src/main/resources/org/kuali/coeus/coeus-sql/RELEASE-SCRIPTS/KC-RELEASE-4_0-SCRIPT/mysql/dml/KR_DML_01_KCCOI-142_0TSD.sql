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
INSERT INTO KRIM_ENTITY_ID_S VALUES(NULL)
/
-- insert the data in the various entity tables and the principal table to create the coi admin user
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT,OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'Y', NOW(),UUID(), 1)
/
INSERT INTO KRIM_ENTITY_NM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_NM_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'COI', 'Admin', 'PRFR', 'Y', 'Y', NOW(), UUID(), 1)
/

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ('10000000121', (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'coiadmin', 'fK69ATFsAydwQuteang+xMva+Tc=', 'Y', NOW(), UUID(), 1)
/

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID, ENT_TYP_CD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_ADDR_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_TYP_CD, ADDR_LINE_1, CITY, STATE_PVC_CD, POSTAL_CD, POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ADDR_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', '2222 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'Y', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_EMAIL_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_TYP_CD, EMAIL_ADDR, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMAIL_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', 'coiadmin@kuali.org', 'Y', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_EMP_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, ENTITY_AFLTN_ID, EMP_REC_ID, EMP_ID, EMP_STAT_CD, EMP_TYP_CD, BASE_SLRY_AMT, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMP_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), (SELECT ENTITY_AFLTN_ID FROM KRIM_ENTITY_AFLTN_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'COI' AND LAST_NM = 'Admin')), '1', (SELECT PRNCPL_NM FROM KRIM_PRNCPL_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'COI' AND LAST_NM = 'Admin')),'A','P',100000,'000001','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_TYP_CD, PHONE_NBR, POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', '321-321-2282', null, 'Y', 'Y', NOW(),UUID(), 1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID,ENT_TYP_CD, PHONE_TYP_CD, PHONE_NBR,POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'FAX', '321-321-2283', null, 'N', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/

-- insert the role-member data to create the association between the pre-existing coi admin role and coiadmin user created above
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-COIDISCLOSURE' AND ROLE_NM = 'COI Administrator'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'coiadmin'), 'P', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S), (SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'), '000001', UUID(), 1)
/
INSERT INTO KRIM_ATTR_DATA_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_S), (SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'), 'Y', UUID(), 1)
/
INSERT INTO KRIM_ENTITY_ID_S VALUES(NULL)
/




-- insert the data in the various entity tables and the principal table to create the coireviewer user
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT,OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'Y', NOW(),UUID(), 1)
/
INSERT INTO KRIM_ENTITY_NM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_NM_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'COI', 'Reviewer', 'PRFR', 'Y', 'Y', NOW(), UUID(), 1)
/

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ('10000000122', (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'coireviewer', 'fK69ATFsAydwQuteang+xMva+Tc=', 'Y', NOW(), UUID(), 1)
/

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID, ENT_TYP_CD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_ADDR_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_TYP_CD, ADDR_LINE_1, CITY, STATE_PVC_CD, POSTAL_CD, POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ADDR_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', '2223 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'Y', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_EMAIL_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_TYP_CD, EMAIL_ADDR, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMAIL_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', 'coireviewer@kuali.org', 'Y', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_EMP_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, ENTITY_AFLTN_ID, EMP_REC_ID, EMP_ID, EMP_STAT_CD, EMP_TYP_CD, BASE_SLRY_AMT, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMP_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), (SELECT ENTITY_AFLTN_ID FROM KRIM_ENTITY_AFLTN_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'COI' AND LAST_NM = 'Reviewer')), '1', (SELECT PRNCPL_NM FROM KRIM_PRNCPL_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'COI' AND LAST_NM = 'Reviewer')),'A','P',100000,'000001','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_TYP_CD, PHONE_NBR, POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', '321-321-2284', null, 'Y', 'Y', NOW(),UUID(), 1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID,ENT_TYP_CD, PHONE_TYP_CD, PHONE_NBR,POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'FAX', '321-321-2285', null, 'N', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_ID_S VALUES(NULL)
/




-- insert the data in the various entity tables and the principal table to create the coiuser user
INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT,OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'Y', NOW(),UUID(), 1)
/
INSERT INTO KRIM_ENTITY_NM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_NM_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'COI', 'User', 'PRFR', 'Y', 'Y', NOW(), UUID(), 1)
/

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ('10000000123', (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'coiuser', 'fK69ATFsAydwQuteang+xMva+Tc=', 'Y', NOW(), UUID(), 1)
/

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID, ENT_TYP_CD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_ADDR_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID, ENTITY_ID, ENT_TYP_CD, ADDR_TYP_CD, ADDR_LINE_1, CITY, STATE_PVC_CD, POSTAL_CD, POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ADDR_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', '2224 Kuali Drive', 'Coeus', 'MA', '53421', 'US', 'Y', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_EMAIL_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_TYP_CD, EMAIL_ADDR, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMAIL_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', 'coiuser@kuali.org', 'Y', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ENTITY_EMP_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, ENTITY_AFLTN_ID, EMP_REC_ID, EMP_ID, EMP_STAT_CD, EMP_TYP_CD, BASE_SLRY_AMT, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMP_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), (SELECT ENTITY_AFLTN_ID FROM KRIM_ENTITY_AFLTN_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'COI' AND LAST_NM = 'User')), '1', (SELECT PRNCPL_NM FROM KRIM_PRNCPL_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'COI' AND LAST_NM = 'User')),'A','P',100000,'000001','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID, ENT_TYP_CD, PHONE_TYP_CD, PHONE_NBR, POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'WRK', '321-321-2286', null, 'Y', 'Y', NOW(),UUID(), 1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID, ENTITY_ID,ENT_TYP_CD, PHONE_TYP_CD, PHONE_NBR,POSTAL_CNTRY_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S), (SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S), 'PERSON', 'FAX', '321-321-2287', null, 'N', 'Y', NOW(), UUID(), 1)
/
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/

-- insert the role-member data to create the association between the pre-existing coi reporter role and coiuser user created above
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-COIDISCLOSURE' AND ROLE_NM = 'COI Reporter'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'coiuser'), 'P', NOW(), UUID(), 1)
/
DELIMITER ;
