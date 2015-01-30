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
INSERT INTO KRIM_RSP_ID_BS_S VALUES(NULL)
/
-- IACUCAdminInitialReview
-- Create responsibility
INSERT INTO KRIM_RSP_T (RSP_ID,RSP_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) VALUES
((SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),(SELECT RSP_TMPL_ID FROM KRIM_RSP_TMPL_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'Review'), 'KC-WKFLW','IACUC Admin Approve Review Request','Protocol Online Review Document - IACUC Admin approves online review request made by PI during protocol submission.','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- document for responsibility
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),
(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Type, Routing Node & Action Information'),
(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'documentTypeName' AND NMSPC_CD = 'KR-WKFLW'), 'IacucProtocolOnlineReviewDocument',
UUID())
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- node name
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,RSP_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S),(SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'routeNodeName'),'IACUCAdminInitialReview',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'required'),
'false', UUID())
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- action
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'),
(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'actionDetailsAtRoleMemberLevel' AND NMSPC_CD = 'KR-WKFLW'), 'false', UUID())
/
INSERT INTO KRIM_ROLE_RSP_ID_BS_S VALUES(NULL)
/

-- role responsibility mapping
INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID, OBJ_ID, VER_NBR, ROLE_ID, RSP_ID, ACTV_IND) VALUES
((SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ID_BS_S), UUID(), '1', (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IACUC Administrator') ,
(SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), 'Y')
/
INSERT INTO KRIM_ROLE_RSP_ACTN_ID_BS_S VALUES(NULL)
/
-- inserting action for responsibility
INSERT INTO krim_role_rsp_actn_t (ROLE_RSP_ACTN_ID, OBJ_ID, VER_NBR, ACTN_TYP_CD, PRIORITY_NBR, ACTN_PLCY_CD, ROLE_MBR_ID, ROLE_RSP_ID, FRC_ACTN) values
((SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ACTN_ID_BS_S), UUID(), '1', 'A', '1', 'F', '*', (SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ID_BS_S),
'N')
/
INSERT INTO KRIM_RSP_ID_BS_S VALUES(NULL)
/

-- IACUCOnlineReviewer
-- need a derived role for this
-- Create responsibility
INSERT INTO KRIM_RSP_T (RSP_ID,RSP_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) VALUES
((SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),(SELECT RSP_TMPL_ID FROM KRIM_RSP_TMPL_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'Review'), 'KC-WKFLW','IACUC Reviewer Approve Online Review','Protocol Onlinereview Document - IACUC Reviewer approves online review','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- document for responsibility
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),
(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Type, Routing Node & Action Information'),
(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'documentTypeName' AND NMSPC_CD = 'KR-WKFLW'), 'IacucProtocolOnlineReviewDocument',
UUID())
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- node name
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,RSP_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S),(SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'routeNodeName'),'IACUCOnlineReviewer',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'required'),
'false', UUID())
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- action
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'),
(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'actionDetailsAtRoleMemberLevel' AND NMSPC_CD = 'KR-WKFLW'), 'false', UUID())
/
INSERT INTO KRIM_TYP_ID_BS_S VALUES(NULL)
/

INSERT INTO KRIM_TYP_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,SRVC_NM,VER_NBR)
VALUES ('Y',(SELECT (MAX(ID)) FROM KRIM_TYP_ID_BS_S),'Derived Role: IACUC Online Reviewer','KC-WKFLW',UUID(),'iacucProtocolOnlineReviewRoleTypeService',1)
/
INSERT INTO KRIM_ROLE_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_T ( ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT )
VALUES( (SELECT (MAX(ID)) FROM KRIM_ROLE_ID_BS_S), UUID(), 1, 'IACUC Online Reviewer', 'KC-IACUC', 'IACUC Online Reviewer', (SELECT (MAX(ID)) FROM KRIM_TYP_ID_BS_S), 'Y', NOW() )
/
INSERT INTO KRIM_ROLE_RSP_ID_BS_S VALUES(NULL)
/
-- role responsibility mapping
INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID, OBJ_ID, VER_NBR, ROLE_ID, RSP_ID, ACTV_IND) VALUES
((SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ID_BS_S), UUID(), '1', (SELECT (MAX(ID)) FROM KRIM_ROLE_ID_BS_S) ,
(SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), 'Y')
/
INSERT INTO KRIM_ROLE_RSP_ACTN_ID_BS_S VALUES(NULL)
/
-- inserting action for responsibility
INSERT INTO krim_role_rsp_actn_t (ROLE_RSP_ACTN_ID, OBJ_ID, VER_NBR, ACTN_TYP_CD, PRIORITY_NBR, ACTN_PLCY_CD, ROLE_MBR_ID, ROLE_RSP_ID, FRC_ACTN) values
((SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ACTN_ID_BS_S), UUID(), '1', 'A', '1', 'F', '*', (SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ID_BS_S),
'Y')
/
INSERT INTO KRIM_RSP_ID_BS_S VALUES(NULL)
/

-- IACUCAdminReview

-- Create responsibility
INSERT INTO KRIM_RSP_T (RSP_ID,RSP_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND,OBJ_ID,VER_NBR) VALUES
((SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),(SELECT RSP_TMPL_ID FROM KRIM_RSP_TMPL_T WHERE NMSPC_CD = 'KR-WKFLW' AND NM = 'Review'), 'KC-WKFLW','IACUC Admin Approve Online Review','Protocol Online Review Document - IACUC Admin approves online review','Y',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- document for responsibility
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),
(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Document Type, Routing Node & Action Information'),
(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'documentTypeName' AND NMSPC_CD = 'KR-WKFLW'), 'IacucProtocolOnlineReviewDocument',
UUID())
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- node name
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID,RSP_ID,KIM_TYP_ID,KIM_ATTR_DEFN_ID,ATTR_VAL,OBJ_ID,VER_NBR)
VALUES ((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S),(SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S),(SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'),(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'routeNodeName'),'IACUCAdminReview',UUID(),1)
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'), (SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'required'),
'false', UUID())
/
INSERT INTO KRIM_ATTR_DATA_ID_BS_S VALUES(NULL)
/
-- action
INSERT INTO KRIM_RSP_ATTR_DATA_T (ATTR_DATA_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ATTR_DATA_ID_BS_S), (SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NMSPC_CD = 'KR-WKFLW' AND
NM = 'Document Type, Routing Node & Action Information'),
(SELECT KIM_ATTR_DEFN_ID FROM KRIM_ATTR_DEFN_T WHERE NM = 'actionDetailsAtRoleMemberLevel' AND NMSPC_CD = 'KR-WKFLW'), 'false', UUID())
/
INSERT INTO KRIM_ROLE_RSP_ID_BS_S VALUES(NULL)
/
-- role responsibility mapping
INSERT INTO KRIM_ROLE_RSP_T (ROLE_RSP_ID, OBJ_ID, VER_NBR, ROLE_ID, RSP_ID, ACTV_IND) VALUES
((SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ID_BS_S), UUID(), '1', (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IACUC Administrator') ,
(SELECT (MAX(ID)) FROM KRIM_RSP_ID_BS_S), 'Y')
/
INSERT INTO KRIM_ROLE_RSP_ACTN_ID_BS_S VALUES(NULL)
/
-- inserting action for responsibility
INSERT INTO krim_role_rsp_actn_t (ROLE_RSP_ACTN_ID, OBJ_ID, VER_NBR, ACTN_TYP_CD, PRIORITY_NBR, ACTN_PLCY_CD, ROLE_MBR_ID, ROLE_RSP_ID, FRC_ACTN) values
((SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ACTN_ID_BS_S), UUID(), '1', 'A', '1', 'F', '*', (SELECT (MAX(ID)) FROM KRIM_ROLE_RSP_ID_BS_S),
'Y')
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
-- online reviewer role permission
INSERT INTO KRIM_ROLE_PERM_T
(ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IACUC Online Reviewer' AND NMSPC_CD='KC-IACUC'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View IACUC Protocol' AND NMSPC_CD='KC-IACUC'),'Y',1,UUID())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T
(ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IACUC Online Reviewer' AND NMSPC_CD='KC-IACUC'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Maintain IACUC Protocol Online Review Comments' AND NMSPC_CD='KC-IACUC'),'Y',1,UUID())
/
INSERT INTO KRIM_ROLE_PERM_ID_BS_S VALUES(NULL)
/
INSERT INTO KRIM_ROLE_PERM_T
(ROLE_PERM_ID,ROLE_ID,PERM_ID,ACTV_IND,VER_NBR,OBJ_ID) VALUES
((SELECT (MAX(ID)) FROM KRIM_ROLE_PERM_ID_BS_S),(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'IACUC Online Reviewer' AND NMSPC_CD='KC-IACUC'),
(SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View IACUC Protocol Online Review Comments' AND NMSPC_CD='KC-IACUC' ),'Y',1,UUID())
/
DELIMITER ;
