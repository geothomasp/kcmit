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

-- Add the coiApprover principal and assign the Coi Approver role to that principal.

INSERT INTO KRIM_ENTITY_T (ENTITY_ID, ACTV_IND, LAST_UPDT_DT,OBJ_ID, VER_NBR) 
    VALUES (KRIM_ENTITY_ID_S.NEXTVAL, 'Y', SYSDATE, SYS_GUID(), 1)
/

INSERT INTO KRIM_ENTITY_NM_T (ENTITY_NM_ID, ENTITY_ID, FIRST_NM, LAST_NM, NM_TYP_CD, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ENTITY_NM_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'COI', 'Approver', 'PRFR', 'Y', 'Y', SYSDATE, SYS_GUID(), 1)
/

INSERT INTO KRIM_PRNCPL_T (PRNCPL_ID, ENTITY_ID, PRNCPL_NM, PRNCPL_PSWD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
    VALUES (KRIM_PRNCPL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'coiapprover', 'fK69ATFsAydwQuteang+xMva+Tc=', 'Y', SYSDATE, SYS_GUID(), 1)
/

INSERT INTO KRIM_ENTITY_ENT_TYP_T (ENTITY_ID, ENT_TYP_CD, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'Y', SYSDATE, SYS_GUID(), 1)
/

INSERT INTO KRIM_ENTITY_EMAIL_T (ENTITY_EMAIL_ID, ENTITY_ID, ENT_TYP_CD, EMAIL_TYP_CD, EMAIL_ADDR, DFLT_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ENTITY_EMAIL_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, 'PERSON', 'WRK', 'coiapprover@kuali.org', 'Y', 'Y', SYSDATE, SYS_GUID(), 1)
/

INSERT INTO KRIM_ENTITY_EMP_INFO_T (ENTITY_EMP_ID, ENTITY_ID, EMP_REC_ID, EMP_ID, EMP_STAT_CD, EMP_TYP_CD, BASE_SLRY_AMT, PRMRY_DEPT_CD, PRMRY_IND, ACTV_IND, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ENTITY_EMP_ID_S.NEXTVAL, KRIM_ENTITY_ID_S.CURRVAL, '1', 'coiapprover', 'A', 'P', 100000, '000001', 'Y','Y', SYSDATE, SYS_GUID(), 1)
/


INSERT INTO KRIM_ROLE_MBR_T (ROLE_MBR_ID, ROLE_ID, MBR_ID, MBR_TYP_CD, LAST_UPDT_DT, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ROLE_MBR_ID_S.NEXTVAL, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-COIDISCLOSURE' AND ROLE_NM = 'COI Approver'), KRIM_PRNCPL_ID_S.CURRVAL, 'P', SYSDATE, SYS_GUID(), 1)
/

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID,VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'unitNumber'), '000001', SYS_GUID(), 1)
/

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T (ATTR_DATA_ID, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR) 
    VALUES (KRIM_ATTR_DATA_ID_S.NEXTVAL, KRIM_ROLE_MBR_ID_S.CURRVAL, (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'UnitHierarchy'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'subunits'), 'Y', SYS_GUID(), 1)
/
