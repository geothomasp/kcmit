update krim_role_mbr_t set  actv_to_dt  = sysdate   
	--select count(*) from krim_role_mbr_t 
  where mbr_id not in (
	select prncpl_id from  krim_prncpl_t 
	where prncpl_nm in ('admin','geot','sdowdy','cwood','aeh','snair','kr')
	)
	and role_id not in (select role_id from krim_roleT where nm like '%Award Budget%');
  
update krim_role_mbr_t set  actv_to_dt  = sysdate   
  where mbr_id in (
	select prncpl_id from  krim_prncpl_t 
	where prncpl_nm ='aeh' and
	role_id not in (select role_id from krim_role_t where role_nm='Application Administrator')
	);  
  
  
select * from krim_role_perm_t where role_id in (select role_id from krim_role_t where role_nm like '%Award Budget%')

select * from krim_perm_t where nm like '%Export%'

select * from krim_role_t where role_nm='User'

select count(*) from krim_role_mbr_t where mbr_id in (select prncpl_id from krim_prncpl_t where prncpl_id='admin')

update krim_prncpl_t set ACTV_IND='Y' where prncpl_nm in ('admin','kr')