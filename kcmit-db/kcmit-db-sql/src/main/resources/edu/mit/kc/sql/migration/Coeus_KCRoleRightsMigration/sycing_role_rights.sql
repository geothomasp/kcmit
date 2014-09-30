set serveroutput on;
begin
dbms_output.enable(6500000000);
end;
/
declare
li_coeus_role_id NUMBER(5,0);
li_kc_role_id    krim_role_t.role_id%type;
li_count         NUMBER;

cursor c_role is  
   select  distinct t1.role_type ,t1.DESCRIPTION,t1.role_id as coeus_role_id,t3.role_id as kc_role_id, t3.role_nm, t1.role_name as coeus_roles 
   from  osp$role t1 left outer join kc_coeus_role_mapping t2 on t1.role_name = t2.coeus_roles
   left outer join krim_role_t t3 on t3.role_nm = t2.kc_roles;
  
r_role c_role%rowtype;

cursor c_role_right is
  select distinct t1.right_id , t2.kc_perm_id, t3.perm_id,t4.description,t4.right_type
  from osp$role_rights t1
  inner join OSP$RIGHTS t4 on t1.right_id = t4.right_id
  left outer join kc_coeus_right_mapping t2 on t1.right_id = t2.coeus_right_id
  left outer join krim_perm_t t3 on t2.kc_perm_id = t3.nm
  where t1.role_id = li_coeus_role_id ;
  
r_role_right c_role_right%rowtype;

ls_namespace VARCHAR2(40);
ls_kim_typ_id NUMBER(8);
li_role_count number;
li_perm_id KRIM_PERM_T.perm_id%type;
ls_perm_nm KRIM_PERM_T.nm%type;

begin

  open c_role;
  loop
  fetch c_role into r_role;
  exit when c_role%notfound;
  
  li_coeus_role_id := r_role.coeus_role_id;   
  li_kc_role_id    := r_role.kc_role_id;
  
  -- role is missing in KC we need to add that role to KC
  -- Adding role START
	if li_kc_role_id is null then
	
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
			
			select  count(ROLE_ID) into li_role_count from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper(r_role.coeus_roles));
			if    li_role_count = 0 then 
			   --dbms_output.put_line('Inserting role '||r_role.coeus_roles);			
			   BEGIN
					SELECT KRIM_ROLE_ID_S.NEXTVAL INTO li_kc_role_id FROM DUAL;
					INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND)  
					VALUES(li_kc_role_id,SYS_GUID(),1,r_role.coeus_roles,ls_namespace,r_role.DESCRIPTION,ls_kim_typ_id,'Y');					
								
			   EXCEPTION
			   WHEN OTHERS THEN
				dbms_output.put_line('Error while inserting into KRIM_ROLE_T , role name is'||r_role.coeus_roles||'.  The error is: '||sqlerrm);
			   continue;
			   END;
			
			else
				
					select  ROLE_ID into li_kc_role_id from KRIM_ROLE_T 
					where trim(upper(ROLE_NM)) = trim(upper(r_role.coeus_roles)) and rownum = 1;
			
		    end if;
			
			
	end if;
	
  -- Adding role ENDS
   
  
  
      open c_role_right;
      loop
      fetch c_role_right into r_role_right;
      exit when c_role_right%notfound;
      
	    li_perm_id := r_role_right.perm_id;
		ls_perm_nm  := r_role_right.kc_perm_id;
		
        if li_perm_id is null then
         
		-- INSERTING to RIGHT 
			select count(PERM_ID) into li_count from KRIM_PERM_T where trim(upper(NM)) = trim(upper(r_role_right.right_id));
		
			if li_count = 0 then
			 ls_perm_nm := 	trim(upper(r_role_right.right_id));
			 
			 --dbms_output.put_line('Inserting permission '||r_role_right.right_id);
			 BEGIN
				  SELECT KRIM_PERM_ID_S.NEXTVAL INTO li_perm_id FROM DUAL;
				  INSERT INTO KRIM_PERM_T(
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
					li_perm_id,
					sys_guid(),
					1,
					1,
					decode(r_role_right.right_type,'P','KC-PD','R','KC-PROTOCOL','I','KC-PROTOCOL','S','KC-ADM','KC-SYS'),
					ls_perm_nm,
					r_role_right.description,
					'Y' 
				  from dual; 
			
			EXCEPTION
			WHEN OTHERS THEN
			   dbms_output.put_line('Error while inserting into KRIM_PERM_T , RIGHT name is '||ls_perm_nm||'.  The error is: '||sqlerrm);
			   continue;
			END;
		 else
		 
		select PERM_ID into li_perm_id from KRIM_PERM_T where trim(upper(NM)) = trim(upper(r_role_right.right_id)) and rownum = 1;
		
		end if;
         
        end if;
		--end if;
      -- INSERTing to RIGHT 
	  
       select count(role_perm_id) into li_count 
       from KRIM_ROLE_PERM_T
       where role_id = li_kc_role_id
       and   perm_id = li_perm_id;
       
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
					li_kc_role_id,
					li_perm_id,
					'Y'
				  );
			EXCEPTION
			WHEN OTHERS THEN
			   dbms_output.put_line('Error while inserting into KRIM_ROLE_PERM_T , RIGHT name is '||ls_perm_nm||' and role name '||r_role.role_nm||',coeus role id '||li_coeus_role_id||'.  The error is: '||sqlerrm);
			   continue;
			END;
       end if; 
	 
      end loop;
      close c_role_right;
  
  end loop;
  close c_role;
  
exception
when others then
dbms_output.put_line('Exception occoured by syncing role rights. The error is '||sqlerrm);
end;
/
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
/
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