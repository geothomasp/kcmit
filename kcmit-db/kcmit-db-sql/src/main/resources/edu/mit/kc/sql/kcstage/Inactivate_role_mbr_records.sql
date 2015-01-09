update krim_role_mbr_t set  actv_to_dt  = sysdate   
	--select count(*) from krim_role_mbr_t 
  where mbr_id not in (
	select prncpl_id from  krim_prncpl_t 
	where prncpl_nm in ('admin','geot','sdowdy','cwood','aeh','snair')
	);
  
update krim_role_mbr_t set  actv_to_dt  = sysdate   
  where mbr_id in (
	select prncpl_id from  krim_prncpl_t 
	where prncpl_nm ='aeh' and
	role_id not in (select role_id from krim_role_t where role_nm='Application Administrator')
	);  