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
INSERT INTO KRIM_ENTITY_T (ENTITY_ID,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S),'Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_NM_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID,ENTITY_ID,FIRST_NM,LAST_NM,NM_TYP_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_NM_ID_S),(SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S),'Negotiation','Administrator','PRFR','Y','Y',NOW(),UUID(),1)
/

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID,ENTITY_ID,PRNCPL_NM,PRNCPL_PSWD,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ('10000000119',(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Administrator'),'negadministrator','fK69ATFsAydwQuteang+xMva+Tc=','Y',NOW(),UUID(),1)
/

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID,ENT_TYP_CD,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Administrator'),'PERSON','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_ADDR_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID,ENTITY_ID,ENT_TYP_CD,ADDR_TYP_CD,ADDR_LINE_1,CITY_NM,POSTAL_STATE_CD,POSTAL_CD,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ADDR_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Administrator'),'PERSON','WRK','75 Kuali Drive','Coeus','MA','53421','US','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_EMAIL_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID,ENTITY_ID,ENT_TYP_CD,EMAIL_TYP_CD,EMAIL_ADDR,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMAIL_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Administrator'),'PERSON','WRK','negadministrator@kuali.org','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_EMP_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID,ENTITY_ID,ENTITY_AFLTN_ID,EMP_REC_ID,EMP_ID,EMP_STAT_CD,EMP_TYP_CD,BASE_SLRY_AMT,PRMRY_DEPT_CD,PRMRY_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMP_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Administrator'),(SELECT ENTITY_AFLTN_ID FROM KRIM_ENTITY_AFLTN_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Award Doc' AND LAST_NM = 'Viewer')),'1',(SELECT PRNCPL_NM FROM KRIM_PRNCPL_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Award Doc' AND LAST_NM = 'Viewer')),'A','P',100000,'000001','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID,ENTITY_ID,ENT_TYP_CD,PHONE_TYP_CD,PHONE_NBR,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Administrator'),'PERSON','WRK','321-321-1075',null,'Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID,ENTITY_ID,ENT_TYP_CD,PHONE_TYP_CD,PHONE_NBR,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Administrator'),'PERSON','FAX','321-321-2075',null,'N','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Administrator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negadministrator'), 'P', NULL, NULL, NOW())
/
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'View Proposal Log' AND NMSPC_CD='KC-IP'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negadministrator'), 'P', NULL, NULL, NOW())
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
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Institutional Proposal Viewer' AND NMSPC_CD='KC-IP'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negadministrator'), 'P', NULL, NULL, NOW())
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
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Viewer' AND NMSPC_CD='KC-AWARD'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negadministrator'), 'P', NULL, NULL, NOW())
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
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'View Subaward' AND NMSPC_CD='KC-SUBAWARD'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negadministrator'), 'P', NULL, NULL, NOW())
/
INSERT INTO KRIM_ENTITY_ID_S VALUES(NULL)
/


INSERT INTO KRIM_ENTITY_T (ENTITY_ID,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S),'Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_NM_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID,ENTITY_ID,FIRST_NM,LAST_NM,NM_TYP_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_NM_ID_S),(SELECT (MAX(ID)) FROM KRIM_ENTITY_ID_S),'Negotiation','Creator','PRFR','Y','Y',NOW(),UUID(),1)
/

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID,ENTITY_ID,PRNCPL_NM,PRNCPL_PSWD,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ('10000000120',(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Creator'),'negcreator','fK69ATFsAydwQuteang+xMva+Tc=','Y',NOW(),UUID(),1)
/

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID,ENT_TYP_CD,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Creator'),'PERSON','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_ADDR_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_ADDR_T (ENTITY_ADDR_ID,ENTITY_ID,ENT_TYP_CD,ADDR_TYP_CD,ADDR_LINE_1,CITY_NM,POSTAL_STATE_CD,POSTAL_CD,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_ADDR_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Creator'),'PERSON','WRK','75 Kuali Drive','Coeus','MA','53421','US','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_EMAIL_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID,ENTITY_ID,ENT_TYP_CD,EMAIL_TYP_CD,EMAIL_ADDR,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMAIL_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Creator'),'PERSON','WRK','negcreator@kuali.org','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_EMP_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID,ENTITY_ID,ENTITY_AFLTN_ID,EMP_REC_ID,EMP_ID,EMP_STAT_CD,EMP_TYP_CD,BASE_SLRY_AMT,PRMRY_DEPT_CD,PRMRY_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_EMP_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Creator'),(SELECT ENTITY_AFLTN_ID FROM KRIM_ENTITY_AFLTN_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Award Doc' AND LAST_NM = 'Viewer')),'1',(SELECT PRNCPL_NM FROM KRIM_PRNCPL_T WHERE ENTITY_ID = (SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Award Doc' AND LAST_NM = 'Viewer')),'A','P',100000,'000001','Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID,ENTITY_ID,ENT_TYP_CD,PHONE_TYP_CD,PHONE_NBR,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Creator'),'PERSON','WRK','321-321-1075',null,'Y','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ENTITY_PHONE_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ENTITY_PHONE_T (ENTITY_PHONE_ID,ENTITY_ID,ENT_TYP_CD,PHONE_TYP_CD,PHONE_NBR,POSTAL_CNTRY_CD,DFLT_IND,ACTV_IND,LAST_UPDT_DT,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ENTITY_PHONE_ID_S),(SELECT ENTITY_ID FROM KRIM_ENTITY_NM_T WHERE FIRST_NM = 'Negotiation' AND LAST_NM = 'Creator'),'PERSON','FAX','321-321-2075',null,'N','Y',NOW(),UUID(),1)
/
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/

INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Negotiation Creator' AND NMSPC_CD='KC-NEGOTIATION'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negcreator'), 'P', NULL, NULL, NOW())
/
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'View Proposal Log' AND NMSPC_CD='KC-IP'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negcreator'), 'P', NULL, NULL, NOW())
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
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Institutional Proposal Viewer' AND NMSPC_CD='KC-IP'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negcreator'), 'P', NULL, NULL, NOW())
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
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Award Viewer' AND NMSPC_CD='KC-AWARD'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negcreator'), 'P', NULL, NULL, NOW())
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
INSERT INTO KRIM_ROLE_MBR_ID_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, ACTV_FRM_DT, ACTV_TO_DT, LAST_UPDT_DT)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ROLE_MBR_ID_S), 1, UUID(), (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'View Subaward' AND NMSPC_CD='KC-SUBAWARD'), (SELECT PRNCPL_ID FROM KRIM_PRNCPL_T WHERE PRNCPL_NM = 'negcreator'), 'P', NULL, NULL, NOW())
/
DELIMITER ;
