set serveroutput on;
begin
dbms_output.enable(6500000000);
end;
/
delete from krim_role_mbr_attr_data_t  where role_mbr_id in (
      select role_mbr_id from krim_role_mbr_t where role_id in (
		select role_id from krim_role_t where nmspc_cd not in ('KR-BUS','KR-SYS','KR-IDM','KR-NS','KR-NTFCN','KR-WKFLW','KUALI','KR-RULE','KR-KRAD','KR-RULE-TEST','KC-SYS','KC-GEN','KC-KRMS','KC-M','KC-WKFLW')
		and role_id not in (select role_id from krim_role_t where kim_typ_id in (select kim_typ_id from krim_typ_t where nm like 'Derived Role:%'))
      ))
/
delete from krim_role_mbr_t where role_id in (
		select role_id from krim_role_t where nmspc_cd not in ('KR-BUS','KR-SYS','KR-IDM','KR-NS','KR-NTFCN','KR-WKFLW','KUALI','KR-RULE','KR-KRAD','KR-RULE-TEST','KC-SYS','KC-GEN','KC-KRMS','KC-M','KC-WKFLW')
		and role_id not in (select role_id from krim_role_t where kim_typ_id in (select kim_typ_id from krim_typ_t where nm like 'Derived Role:%')))
/
delete from krim_role_perm_t where role_id in (
		select role_id from krim_role_t where nmspc_cd not in ('KR-BUS','KR-SYS','KR-IDM','KR-NS','KR-NTFCN','KR-WKFLW','KUALI','KR-RULE','KR-KRAD','KR-RULE-TEST','KC-SYS','KC-GEN','KC-KRMS','KC-M','KC-WKFLW')
		and role_id not in (select role_id from krim_role_t where kim_typ_id in (select kim_typ_id from krim_typ_t where nm like 'Derived Role:%')))
/
delete from krim_role_t where nmspc_cd not in ('KR-BUS','KR-SYS','KR-IDM','KR-NS','KR-NTFCN','KR-WKFLW','KUALI','KR-RULE','KR-KRAD','KR-RULE-TEST','KC-SYS','KC-GEN','KC-KRMS','KC-M','KC-WKFLW')
and kim_typ_id not in (select kim_typ_id from krim_typ_t where nm like 'Derived Role:%')
/
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
-- protocol fix
declare
	li_count NUMBER;
	li_role_id KRIM_ROLE_T.ROLE_ID%type;
begin

	UPDATE krim_role_t set nmspc_cd ='KC-UNT' where role_nm = 'IRB Administrator';
	
	select count(role_id) into li_count from KRIM_ROLE_T where ROLE_NM = 'Protocol Aggregator';
	if li_count = 0 then
		UPDATE krim_role_t set role_nm = 'Protocol Aggregator' where role_nm = 'IRB Protocol Aggregator';
	end if;
		
	select count(role_id) into li_count from KRIM_ROLE_T where ROLE_NM = 'ProtocolApprover';
	if li_count = 0 then
		INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND, LAST_UPDT_DT)  
		VALUES(KRIM_ROLE_ID_S.NEXTVAL,SYS_GUID(),1,'ProtocolApprover','KC-PROTOCOL','This role exists primarily to grant implicit Cancel permission to Protocol Aggregators and Admins','83','Y',sysdate);	
	end if;
	
	select count(role_id) into li_count from KRIM_ROLE_T where ROLE_NM = 'Funding Source Monitor';
	if li_count = 0 then
		li_role_id := KRIM_ROLE_ID_S.NEXTVAL;		
		INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND, LAST_UPDT_DT)  
		VALUES(li_role_id,SYS_GUID(),1,'Funding Source Monitor','KC-UNT','Funding Source Monitor','69','Y',sysdate);	
	end if;
	
	
	select count(role_id) into li_count from KRIM_ROLE_T where ROLE_NM = 'Access_Proposal_Person_Institutional_Salaries';
	if li_count = 0 then
		li_role_id := KRIM_ROLE_ID_S.NEXTVAL;		
		INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND, LAST_UPDT_DT)  
		VALUES(li_role_id,SYS_GUID(),1,'Access_Proposal_Person_Institutional_Salaries','KC-PD','Access Proposal Person Institutional Salaries','68','Y',sysdate);	
	end if;
	
	select count(role_id) into li_count from KRIM_ROLE_T where ROLE_NM = 'Negotiation Administrator';
	if li_count = 0 then
		li_role_id := KRIM_ROLE_ID_S.NEXTVAL;		
		INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND, LAST_UPDT_DT)  
		VALUES(li_role_id,SYS_GUID(),1,'Negotiation Administrator','KC-NEGOTIATION','The Negotiation Administrator role','69','Y',sysdate);	
	end if;
	
	select count(role_id) into li_count from KRIM_ROLE_T where role_nm = 'Protocol Aggregator' and nmspc_cd = 'KC-PROTOCOL-DOC';
	if li_count = 0 then
		li_role_id := KRIM_ROLE_ID_S.NEXTVAL;		
		INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND, LAST_UPDT_DT)  
		VALUES(li_role_id,SYS_GUID(),1,'Protocol Aggregator','KC-PROTOCOL-DOC','Added to Document Qualified Role memberships for corresponding Role in KC-PROTOCOL namespace','68','Y',sysdate);	
	end if;
	
	select count(role_id) into li_count from KRIM_ROLE_T where role_nm = 'Protocol Viewer' and nmspc_cd = 'KC-PROTOCOL-DOC';
	if li_count = 0 then
		li_role_id := KRIM_ROLE_ID_S.NEXTVAL;		
		INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND, LAST_UPDT_DT)  
		VALUES(li_role_id,SYS_GUID(),1,'Protocol Viewer','KC-PROTOCOL-DOC','Added to Document Qualified Role memberships for corresponding Role in KC-PROTOCOL namespace','68','Y',sysdate);	
	end if;
	
	select count(role_id) into li_count from KRIM_ROLE_T where role_nm = 'View Institutionally Maintained Salaries' and nmspc_cd = 'KC-PD';
	if li_count = 0 then
		li_role_id := KRIM_ROLE_ID_S.NEXTVAL;		
		INSERT INTO KRIM_ROLE_T(ROLE_ID,OBJ_ID,VER_NBR,ROLE_NM,NMSPC_CD,DESC_TXT,KIM_TYP_ID,ACTV_IND, LAST_UPDT_DT)  
		VALUES(li_role_id,SYS_GUID(),1,'View Institutionally Maintained Salaries','KC-PD','View Institutionally Maintained Salaries','68','Y',sysdate);	
	end if;	
	
	
	commit;

end;
/
commit
/
--MITKC-623
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
(select  ROLE_ID from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper('Application Administrator'))and nmspc_cd ='KC-SYS'),
(select PERM_ID from KRIM_PERM_T where nm = 'Modify Unit' and nmspc_cd='KC-UNT'),
'Y'
)
/
commit
/
--MITKC-665
UPDATE KRIM_ROLE_T
SET nmspc_cd = 'KC-UNT'
WHERE role_nm = 'IRB Reviewer'
/
declare
li_count NUMBER;
li_perm_id_seq KRIM_PERM_T.PERM_ID%type;
begin
select count(PERM_ID) into li_count FROM KRIM_PERM_T WHERE nm = 'Export Any Record' and nmspc_cd = 'KR-NS';
  if li_count = 0 then
    li_perm_id_seq := KRIM_PERM_ID_S.NEXTVAL;
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
    VALUES(
    li_perm_id_seq,
    SYS_GUID(),
    1,
    NULL,
    'KR-NS',
    'Export Any Record',
    'Export Any Record',
    'Y'
    );
    
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
  (select  ROLE_ID from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper('KC Superuser'))and nmspc_cd ='KC-SYS'),
  li_perm_id_seq,
  'Y'
  );    
  
  end if;

end;
/
commit
/
--MITKC-438
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
declare
cursor c_data is
select 'Modify Negotiations' role_nm from dual
UNION ALL
select 'Negotiation Administrator' role_nm from dual
UNION ALL
select 'Negotiation SuperUser' role_nm from dual
UNION ALL
select 'Negotiator' role_nm from dual;
r_data c_data%rowtype;

li_count number;
begin

open c_data;
loop
fetch c_data into r_data;
exit when c_data%notfound;

  select distinct count(r4.nm) into li_count
  from krim_role_t r1
  inner join krim_role_perm_t r3 on r1.role_id = r3.role_id
  inner join krim_perm_t r4 on r4.perm_id = r3.perm_id
  where  r1.role_nm = r_data.role_nm
  and  r4.nm = 'Initiate Document';
  
  if li_count = 0 then
    INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID,OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
    VALUES(KRIM_ROLE_PERM_ID_S.nextval,sys_guid(),1,
    (select role_id from krim_role_t where  role_nm = r_data.role_nm),
    (select perm_id from krim_perm_t where nm = 'Initiate Document'),
    'Y');    
   
  end if;
  
end loop;
close c_data;

end;
/
commit
/
declare
  ls_role_id KRIM_ROLE_PERM_T.ROLE_ID%type;
  ls_perm_id KRIM_ROLE_PERM_T.PERM_ID%type;
  li_count number;
begin
  select role_id into ls_role_id from krim_role_t where role_nm = 'Application Administrator';
  
  FOR  r_perm IN 
    (
    SELECT PERM_ID from KRIM_PERM_T where nm in ('Add Sponsor Hierarchy','Delete Sponsor Hierarchy' ,'Modify Sponsor Hierarchy')
    )
  LOOP
    select count(role_perm_id) into li_count from KRIM_ROLE_PERM_T
    where role_id = ls_role_id
    and   role_id = r_perm.PERM_ID;
    
    if li_count = 0 then
      INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID,OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
      VALUES(KRIM_ROLE_PERM_ID_S.nextval,sys_guid(),1,ls_role_id,r_perm.PERM_ID,'Y');
    
    end if;
    
  END LOOP;
end;
/
commit
/
--MITKC-620
declare
  ls_role_id KRIM_ROLE_PERM_T.ROLE_ID%type;
  ls_perm_id KRIM_ROLE_PERM_T.PERM_ID%type;
  li_count number;
begin
  select role_id into ls_role_id from krim_role_t where role_nm = 'Modify Subcontract';
  
  FOR  r_perm IN 
    (
    SELECT PERM_ID from KRIM_PERM_T where nm in ('Open Document','Open RICE Document')
    )
  LOOP
    select count(role_perm_id) into li_count from KRIM_ROLE_PERM_T
    where role_id = ls_role_id
    and   role_id = r_perm.PERM_ID;
    
    if li_count = 0 then
      INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID,OBJ_ID,VER_NBR,ROLE_ID,PERM_ID,ACTV_IND)
      VALUES(KRIM_ROLE_PERM_ID_S.nextval,sys_guid(),1,ls_role_id,r_perm.PERM_ID,'Y');
    
    end if;
    
  END LOOP;
end;
/
commit
/
--MITKC-623
declare
  li_count number;
begin

    select count(role_perm_id)
    into li_count
    from KRIM_ROLE_PERM_T
    where role_id = (select  ROLE_ID from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper('Application Administrator'))and nmspc_cd ='KC-SYS')
    and   PERM_ID = (select PERM_ID from KRIM_PERM_T where nm = 'Add Unit' and nmspc_cd='KC-UNT');
    
    if li_count = 0 then
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
      (select  ROLE_ID from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper('Application Administrator'))and nmspc_cd ='KC-SYS'),
      (select PERM_ID from KRIM_PERM_T where nm = 'Add Unit' and nmspc_cd='KC-UNT'),
      'Y'
      );    
    end if;

end;
/
commit
/
--MITKC-782
update krim_role_t
set nmspc_cd = 'KC-UNT' , kim_typ_id = 68
where role_nm = 'Proposal Creator'
/
delete  from krim_role_mbr_attr_data_t
where role_mbr_id in ( select role_mbr_id from krim_role_mbr_t 
                              where role_id in (select role_id  from krim_role_t 
                                                  where role_nm = 'Proposal Creator')
) and kim_attr_defn_id = 48
/
commit
/
