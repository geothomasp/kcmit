delete from krim_role_mbr_attr_data_t  where role_mbr_id in (
      select role_mbr_id from krim_role_mbr_t where mbr_id in (
      select prncpl_id from krim_prncpl_t where trim(upper(prncpl_nm)) in 
      (select distinct trim(upper(user_id)) from osp$user_roles)
      )
);

delete from krim_role_mbr_t where mbr_id in (
select prncpl_id from krim_prncpl_t where trim(upper(prncpl_nm)) in 
(select distinct trim(upper(user_id)) from osp$user_roles)
);
commit;
ALTER TABLE KRIM_DLGN_T DISABLE CONSTRAINT KRIM_DLGN_TR1 ;
ALTER TABLE KRIM_ROLE_MBR_T DISABLE CONSTRAINT KRIM_ROLE_MBR_TR1 ;
ALTER TABLE KRIM_PERM_ATTR_DATA_T DISABLE CONSTRAINT KRIM_PERM_ATTR_DATA_TR3 ;
ALTER TABLE KRIM_ROLE_PERM_T DISABLE CONSTRAINT KRIM_ROLE_PERM_TR1 ;
ALTER TABLE KRIM_ROLE_PERM_T DISABLE CONSTRAINT KRIM_ROLE_PERM_TP1 ;
ALTER TABLE KRIM_ROLE_PERM_T DISABLE CONSTRAINT KRIM_ROLE_PERM_TC0 ;
ALTER TABLE KRIM_PERM_T DISABLE CONSTRAINT KRIM_PERM_TP1 ;
ALTER TABLE KRIM_PERM_T DISABLE CONSTRAINT KRIM_PERM_TC0 ;
ALTER TABLE KRIM_PERM_T DISABLE CONSTRAINT KRIM_PERM_T_TC1 ;
ALTER TABLE ROLE_CNTRL_MAP_T DISABLE CONSTRAINT FK_ROLE_CNTRL_MAP_T ;
ALTER TABLE KC_ROLE_CNTRAL_MAP DISABLE CONSTRAINT FK_KC_ROLE_CNTRAL_MAP ;

ALTER TABLE KRIM_ROLE_T DISABLE CONSTRAINT KRIM_ROLE_TP1 ;
ALTER TABLE KRIM_ROLE_T DISABLE CONSTRAINT KRIM_ROLE_TC1 ;
ALTER TABLE KRIM_ROLE_T DISABLE CONSTRAINT KRIM_ROLE_TC0 ;
truncate table krim_role_perm_t;
insert into krim_role_perm_t(
  ROLE_PERM_ID,
  OBJ_ID,
  VER_NBR,
  ROLE_ID,
  PERM_ID,
  ACTV_IND
)
select ROLE_PERM_ID,
OBJ_ID,
VER_NBR,
ROLE_ID,
PERM_ID,
ACTV_IND from KC_ROLE_PERM_BOOTSTRAP;
truncate table KRIM_PERM_T;
insert into KRIM_PERM_T(
  PERM_ID,
  OBJ_ID,
  VER_NBR,
  PERM_TMPL_ID,
  NMSPC_CD,
  NM,
  DESC_TXT,
  ACTV_IND
)
select 
  PERM_ID,
  OBJ_ID,
  VER_NBR,
  PERM_TMPL_ID,
  NMSPC_CD,
  NM,
  DESC_TXT,
  ACTV_IND
from   KC_PERM_BOOTSTRAP;
delete from KRIM_ROLE_T;
insert into KRIM_ROLE_T(
ROLE_ID,
OBJ_ID,
VER_NBR,
ROLE_NM,
NMSPC_CD,
DESC_TXT,
KIM_TYP_ID,
ACTV_IND,
LAST_UPDT_DT
)
select ROLE_ID,
OBJ_ID,
VER_NBR,
ROLE_NM,
NMSPC_CD,
DESC_TXT,
KIM_TYP_ID,
ACTV_IND,
LAST_UPDT_DT
from KC_ROLE_BOOTSTRAP;
commit;
-- delete the member's who as the roles which are not in krim_role_t start
delete from krim_role_mbr_attr_data_t  where role_mbr_id in (
  select distinct t1.role_mbr_id from krim_role_mbr_t t1 where t1.role_id not in (select role_id from krim_role_t)
);
delete from krim_role_mbr_t where role_id not in (select role_id from krim_role_t);
-- delete the member's who as the roles which are not in krim_role_t start
delete from krim_dlgn_t where role_id not in (select role_id from krim_role_t)
/
commit
/
ALTER TABLE KRIM_PERM_T ENABLE CONSTRAINT KRIM_PERM_TP1 ;
ALTER TABLE KRIM_PERM_T ENABLE CONSTRAINT KRIM_PERM_TC0 ;
ALTER TABLE KRIM_PERM_T ENABLE CONSTRAINT KRIM_PERM_T_TC1 ;
ALTER TABLE KRIM_ROLE_T ENABLE CONSTRAINT KRIM_ROLE_TP1 ;
ALTER TABLE KRIM_ROLE_T ENABLE CONSTRAINT KRIM_ROLE_TC1 ;
ALTER TABLE KRIM_ROLE_T ENABLE CONSTRAINT KRIM_ROLE_TC0 ;
ALTER TABLE KRIM_DLGN_T ENABLE CONSTRAINT KRIM_DLGN_TR1 ;
ALTER TABLE KRIM_ROLE_MBR_T ENABLE CONSTRAINT KRIM_ROLE_MBR_TR1 ;
ALTER TABLE KRIM_PERM_ATTR_DATA_T ENABLE CONSTRAINT KRIM_PERM_ATTR_DATA_TR3 ;
ALTER TABLE KRIM_ROLE_PERM_T ENABLE CONSTRAINT KRIM_ROLE_PERM_TR1 ;
ALTER TABLE KRIM_ROLE_PERM_T ENABLE CONSTRAINT KRIM_ROLE_PERM_TP1 ;
ALTER TABLE KC_ROLE_CNTRAL_MAP ENABLE CONSTRAINT FK_KC_ROLE_CNTRAL_MAP ;
ALTER TABLE ROLE_CNTRL_MAP_T ENABLE CONSTRAINT FK_ROLE_CNTRL_MAP_T ;
ALTER TABLE KRIM_ROLE_PERM_T ENABLE CONSTRAINT KRIM_ROLE_PERM_TC0
/
