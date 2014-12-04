INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID,OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
VALUES(KRIM_ROLE_PERM_ID_S.nextval,sys_guid(),1,
(select role_id from krim_role_t where  role_nm = 'OSP Administrator'),
(select perm_id from krim_perm_t where nm = 'Blanket Approve RICE Document'),
'Y')
/
INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID,OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
VALUES(KRIM_ROLE_PERM_ID_S.nextval,sys_guid(),1,
(select role_id from krim_role_t where  role_nm = 'OSP Administrator'),
(select perm_id from krim_perm_t where nm = 'Blanket Approve Document'),
'Y')
/
INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID,OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
VALUES(KRIM_ROLE_PERM_ID_S.nextval,sys_guid(),1,
(select role_id from krim_role_t where  role_nm = 'OSP Administrator'),
(select perm_id from krim_perm_t where nm = 'Blanket Approve AwardDocument'),
'Y')
/
INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID,OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
VALUES(KRIM_ROLE_PERM_ID_S.nextval,sys_guid(),1,
(select role_id from krim_role_t where  role_nm = 'OSP Administrator'),
(select perm_id from krim_perm_t where nm = 'Blanket Approve AwardBudgetDocument'),
'Y')
/
