set serveroutput on;
begin
dbms_output.enable(6500000000);
end;
/

delete from krim_role_mbr_attr_data_t  where role_mbr_id in (
      select role_mbr_id from krim_role_mbr_t where role_id in (
		select role_id from krim_role_t where nmspc_cd not in (
															'KR-BUS',
															'KR-SYS',
															'KR-IDM',
															'KR-NS',
															'KR-NTFCN',															
															'KR-WKFLW',
															'KUALI',
															'KR-RULE',
															'KR-KRAD',
															'KR-RULE-TEST',
															'KC-SYS',
															'KC-GEN',
															'KC-KRMS',
															'KC-M',															
															'KC-WKFLW'
														)
      )
);
delete from krim_role_mbr_t where role_id in (
		select role_id from krim_role_t where nmspc_cd not in (
															'KR-BUS',
															'KR-SYS',
															'KR-IDM',
															'KR-NS',
															'KR-NTFCN',														
															'KR-WKFLW',
															'KUALI',
															'KR-RULE',
															'KR-KRAD',
															'KR-RULE-TEST',
															'KC-SYS',
															'KC-GEN',
															'KC-KRMS',
															'KC-M',															
															'KC-WKFLW'
														)
);
delete from krim_role_perm_t where role_id in (
		select role_id from krim_role_t where nmspc_cd not in (
															'KR-BUS',
															'KR-SYS',
															'KR-IDM',
															'KR-NS',
															'KR-NTFCN',															
															'KR-WKFLW',
															'KUALI',
															'KR-RULE',
															'KR-KRAD',
															'KR-RULE-TEST',
															'KC-SYS',
															'KC-GEN',
															'KC-KRMS',
															'KC-M',															
															'KC-WKFLW'
														)
);
delete from krim_role_t where nmspc_cd not in (
											'KR-BUS',
											'KR-SYS',
											'KR-IDM',
											'KR-NS',
											'KR-NTFCN',											
											'KR-WKFLW',
											'KUALI',
											'KR-RULE',
											'KR-KRAD',
											'KR-RULE-TEST',
											'KC-SYS',
											'KC-GEN',
											'KC-KRMS',
											'KC-M',											
											'KC-WKFLW'
);
commit
/
declare
li_coeus_role_id NUMBER(5,0);
li_kc_role_id    krim_role_t.role_id%type;
li_count         NUMBER;

cursor c_role is  
   select  distinct t1.role_type ,t1.DESCRIPTION, t1.role_name 
   from  osp$role t1;  
   r_role c_role%rowtype;
  
ls_namespace VARCHAR2(40);
ls_kim_typ_id NUMBER(8);
li_role_count number;

begin

  open c_role;
  loop
  fetch c_role into r_role;
  exit when c_role%notfound;
  
 
  select count(role_id) into li_role_count from krim_role_t where trim(upper(role_nm)) = trim(upper(r_role.role_name));
  
  -- role is missing in KC we need to add that role to KC
  -- Adding role START
	if li_role_count = 0 then
	
		if UPPER(TRIM(r_role.role_type)) = 'P' then
			ls_namespace:='KC-PD';
			
		elsif  upper(trim(r_role.role_type))='R' or upper(trim(r_role.role_type))='I' then 
			ls_namespace:='KC-PROTOCOL';     

		elsif  upper(trim(r_role.role_type))='S'  then 	
			ls_namespace:='KC-ADM';
			
		else   	
			ls_namespace:='KC-SYS';
		end if;	
	

			  begin
				select k.KIM_TYP_ID into ls_kim_typ_id from KRIM_TYP_T k where k.nm='UnitHierarchy'; 
			  EXCEPTION
			  WHEN OTHERS THEN
			  dbms_output.put_line('There is not KIM_TYP_ID for UnitHierarchy'); 
			  continue;
			  end;	
						
			   --dbms_output.put_line('Inserting role '||r_role.role_name);			
			   BEGIN
					SELECT KRIM_ROLE_ID_S.NEXTVAL INTO li_kc_role_id FROM DUAL;
					INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND)  
					VALUES(li_kc_role_id,SYS_GUID(),1,r_role.role_name,ls_namespace,r_role.DESCRIPTION,ls_kim_typ_id,'Y');					
								
			   EXCEPTION
			   WHEN OTHERS THEN
				dbms_output.put_line('Error while inserting into KRIM_ROLE_T , role name is'||r_role.role_name||'.  The error is: '||sqlerrm);
			   continue;
			   END;
				
			
			
	end if;
	
  end loop;
  close c_role;
end;
/
-- Adding role ENDS
declare
li_max number(10);
ls_query VARCHAR2(400);
li_nextval number(10);
begin
select max(to_number(ROLE_PERM_ID)) into li_max from krim_role_perm_t where role_perm_id not like '%K%';
select KRIM_ROLE_PERM_ID_S.NEXTVAL into li_nextval from dual;
if li_max > li_nextval then
	li_max := (li_max - li_nextval) + 1;
	ls_query:='alter sequence KRIM_ROLE_PERM_ID_S increment by '||li_max;      
	execute immediate(ls_query); 
end if; 

end;
/
select KRIM_ROLE_PERM_ID_S.NEXTVAL from dual
/
alter sequence KRIM_ROLE_PERM_ID_S increment by 1
/
declare
	li_count         NUMBER;  
	
	cursor c_role_right is 
	select t3.role_id, t2.perm_id
	from kc_coeus_role_perm_mapping t1 
	inner join krim_perm_t t2 on t1.kc_perm_nm = t2.nm and (t1.nmspc_cd is null or t1.nmspc_cd = t2.nmspc_cd)
	inner join krim_role_t t3 on t1.role_nm = t3.role_nm;
	r_role_right c_role_right%rowtype;
	
begin 
 
      open c_role_right;
      loop
      fetch c_role_right into r_role_right;
      exit when c_role_right%notfound;
      
       select count(role_perm_id) into li_count 
       from KRIM_ROLE_PERM_T
       where role_id = r_role_right.role_id
       and   perm_id = r_role_right.perm_id;
       
       if li_count = 0 then
        --dbms_output.put_line('Mapping permission '||ls_perm_nm ||' to role '||r_role.kc_role);
			BEGIN
				INSERT INTO KRIM_ROLE_PERM_T(
					ROLE_PERM_ID,
					OBJ_ID,
					VER_NBR,
					ROLE_ID,
					PERM_ID,
					ACTV_IND
				  )
				  VALUES(
					KRIM_ROLE_PERM_ID_S.nextval,
					sys_guid(),
					1,
					r_role_right.role_id,
					r_role_right.perm_id,
					'Y'
				  );
			EXCEPTION
			WHEN OTHERS THEN
			   dbms_output.put_line('Error while inserting into KRIM_ROLE_PERM_T , role id is '||r_role_right.role_id||' and perm id is '||r_role_right.perm_id||'.  The error is: '||sqlerrm);
			   continue;
			END;
       end if; 
	 
      end loop;
      close c_role_right;
end;
/
/*
INSERT INTO KRIM_ROLE_PERM_T(
					ROLE_PERM_ID,
					OBJ_ID,
					VER_NBR,
					ROLE_ID,
					PERM_ID,
					ACTV_IND
				  )
VALUES(
KRIM_ROLE_PERM_ID_S.nextval,
sys_guid(),
1,
(select  ROLE_ID from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper('OSP Administrator')) and rownum = 1),
(select PERM_ID from KC_PERM_BOOTSTRAP where nm = 'Allow Backdoor Login'),
'Y'
)
/*/
INSERT INTO KRIM_ROLE_PERM_T(
					ROLE_PERM_ID,
					OBJ_ID,
					VER_NBR,
					ROLE_ID,
					PERM_ID,
					ACTV_IND
				  )
VALUES(
KRIM_ROLE_PERM_ID_S.nextval,
sys_guid(),
1,
(select  ROLE_ID from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper('Technical Administrator')) and rownum = 1),
(select PERM_ID from KC_PERM_BOOTSTRAP where nm = 'Allow Backdoor Login'),
'Y'
)
/
commit
/