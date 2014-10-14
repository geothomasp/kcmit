INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Aggregator Only Document Level','KC-PD','Proposal Aggregator without Rate Modify Right','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Add Proposal Viewer' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Certify' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Maintain ProposalHierarchy' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Narrative' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify ProposalDevelopmentDocument' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify ProposalPermissions' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Print Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Submit ProposalDevelopmentDocument' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Narratives' AND NMSPC_CD = 'KC-PD'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Budget Creator Only Document Level','KC-PD','Budget Creator without Rate Modify Perm','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify ProposalDevelopmentDocument' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Print Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Narratives' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Only Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'approver Document Level','KC-PD','approver','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'unassigned Document Level','KC-PD','Unassigned role - no permissions','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Viewer Document Level','KC-PD','Proposal Viewer','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Viewer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Print Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Viewer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Viewer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Narratives' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Viewer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Budget Creator Document Level','KC-PD','Proposal Budget Creator','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Proposal Rates' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify ProposalDevelopmentDocument' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Print Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW_INSTITUTIONAL_SALARIES' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW_PROP_PERSON_INST_SALARIES' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Narratives' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Personnel Salaries' AND NMSPC_CD = 'KC-B'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Budget Creator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Narrative Writer Document Level','KC-PD','Proposal Narrative Writer','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Narrative Writer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Narrative' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Narrative Writer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify ProposalDevelopmentDocument' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Narrative Writer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Print Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Narrative Writer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Narrative Writer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Narratives' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Narrative Writer Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Aggregator Document Level','KC-PD','Proposal Aggregator','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Add Proposal Viewer' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Certify' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Maintain ProposalHierarchy' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Narrative' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Proposal Rates' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify ProposalDevelopmentDocument' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify ProposalPermissions' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Print Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Recall Document' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Submit ProposalDevelopmentDocument' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW_INSTITUTIONAL_SALARIES' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW_PROP_PERSON_INST_SALARIES' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Narratives' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Personnel Salaries' AND NMSPC_CD = 'KC-B'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Aggregator Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Access_Proposal_Person_Institutional_Salaries Document Level','KC-PD','Access Proposal Person Institutional Salaries','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Access_Proposal_Person_Institutional_Salaries Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'VIEW_PROP_PERSON_INST_SALARIES' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Access_Proposal_Person_Institutional_Salaries Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Personnel Salaries' AND NMSPC_CD = 'KC-B'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Delete Proposal Document Level','KC-PD','Delete Proposal Permission','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Delete Proposal Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Delete Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Delete Proposal Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Budget' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Delete Proposal Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Narratives' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Delete Proposal Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'View Proposal' AND NMSPC_CD = 'KC-PD'), 'Y')
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Investigators Document Level','KC-PD','Proposal Development Investigators Role','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'All Unit Administrators Document Level','KC-PD','All Proposal Unit Administrators','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/

INSERT INTO KRIM_ROLE_T (ROLE_ID, ROLE_NM, NMSPC_CD, DESC_TXT, ACTV_IND, KIM_TYP_ID, OBJ_ID, VER_NBR, LAST_UPDT_DT)
VALUES ('KC' || KRIM_ROLE_ID_S.NEXTVAL, 'Maintain Proposal Questionnaire Document Level','KC-PD','Grants the ability to maintain proposal questionnaires.','Y', (SELECT KIM_TYP_ID FROM KRIM_TYP_T WHERE NM = 'Derived Role: Document Access' AND NMSPC_CD = 'KC-SYS'), SYS_GUID(), 1, SYSDATE)
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Maintain Proposal Questionnaire Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Maintain Questionnaire Usage' AND NMSPC_CD = 'KC-PD'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Maintain Proposal Questionnaire Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Question' AND NMSPC_CD = 'KC-QUESTIONNAIRE'), 'Y')
/
INSERT INTO KRIM_ROLE_PERM_T (ROLE_PERM_ID, OBJ_ID, VER_NBR, ROLE_ID, PERM_ID, ACTV_IND)
VALUES ('KC' || KRIM_ROLE_PERM_ID_S.NEXTVAL, SYS_GUID(), 1, (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE ROLE_NM = 'Maintain Proposal Questionnaire Document Level' AND NMSPC_CD = 'KC-PD'), (SELECT PERM_ID FROM KRIM_PERM_T WHERE NM = 'Modify Questionnaire' AND NMSPC_CD = 'KC-QUESTIONNAIRE'), 'Y')
/
