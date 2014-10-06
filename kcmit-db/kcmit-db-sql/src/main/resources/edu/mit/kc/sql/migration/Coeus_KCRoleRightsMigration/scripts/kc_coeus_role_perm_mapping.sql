INSERT INTO KC_COEUS_ROLE_PERM_MAPPING(ROLE_NM,KC_PERM_NM)
select distinct t1.COEUS_ROLES, t4.nm from kc_coeus_role_mapping t1
inner join krim_role_t t2 on t1.kc_roles = t2.role_nm
inner join krim_role_perm_t t3 on t2.role_id = t3.role_id
inner join krim_perm_t t4 on t4.perm_id = t3.perm_id
where t1.kc_roles is not null
/
commit
/
INSERT INTO KC_COEUS_ROLE_PERM_MAPPING(ROLE_NM,KC_PERM_NM,NMSPC_CD)
select distinct t1.role_name , t4.kc_perm_nm, t4.nmspc_cd
from osp$role t1
inner join osp$role_rights t3 on t3.role_id = t1.role_id
inner join kc_coeus_right_mapping t4 on t4.coeus_right_id = t3.right_id
left outer join kc_coeus_role_mapping t2 on t1.role_name = t2.COEUS_ROLES
where t2.COEUS_ROLES is null
/
commit
/
INSERT INTO KC_COEUS_ROLE_PERM_MAPPING(ROLE_NM,KC_PERM_NM)
VALUES('OSP Administrator','Allow Backdoor Login')
/
commit
/