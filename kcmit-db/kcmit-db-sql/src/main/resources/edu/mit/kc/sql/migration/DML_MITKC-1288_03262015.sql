DROP TABLE TMP_MAPPING_UNIT_ADMIN_TYP_CD
/
CREATE TABLE TMP_MAPPING_UNIT_ADMIN_TYP_CD(
COEUS_UNIT_ADMIN_TYP_CD NUMBER(3,0),
KC_UNIT_ADMIN_TYP_CD NUMBER(3,0),
DESCRIPTION VARCHAR2(200 BYTE)
)
/
INSERT INTO TMP_MAPPING_UNIT_ADMIN_TYP_CD(COEUS_UNIT_ADMIN_TYP_CD,KC_UNIT_ADMIN_TYP_CD,DESCRIPTION)
SELECT t2.unit_administrator_type_code, t1.unit_administrator_type_code,t1.description
FROM unit_administrator_type t1
INNER JOIN osp$unit_administrator_type@coeus.kuali t2 on t1.DESCRIPTION = t2.DESCRIPTION
/
commit
/
ALTER TABLE PROTOCOL_UNITS DISABLE CONSTRAINT FK_PROTOCOL_UNITS_2 ;
ALTER TABLE USER_ROLES DISABLE CONSTRAINT FK_USER_ROLES_UNIT ;
ALTER TABLE KRA_USER DISABLE CONSTRAINT FK_USER_UNIT_NUMBER_KRA ;
ALTER TABLE INSTITUTE_RATES DISABLE CONSTRAINT FK_INST_RATES_UNIT_NUMBER_KRA ;
ALTER TABLE INSTITUTE_LA_RATES DISABLE CONSTRAINT FK_INSTITUTE_LA_RATES_UNIT_KRA ;
ALTER TABLE PROPOSAL_UNITS DISABLE CONSTRAINT FK_PROPOSAL_UNITS_UNIT_NUMBER ;
ALTER TABLE PROPOSAL_LOG DISABLE CONSTRAINT FK_LEAD_UNIT ;
ALTER TABLE AWARD_PERSON_UNITS DISABLE CONSTRAINT FK_APU_UNIT ;
ALTER TABLE FIN_OBJECT_CODE_MAPPING DISABLE CONSTRAINT FK_UNIT_NUMBER ;
ALTER TABLE NEGOTIATION_UNASSOC_DETAIL DISABLE CONSTRAINT NEGOTIATION_UNASSOC_DETAIL_FK2 ;
ALTER TABLE AWARD_REPORT_TRACKING DISABLE CONSTRAINT AWARD_REPORT_TRACKING_FK1 ;
ALTER TABLE COMMITTEE DISABLE CONSTRAINT FK_COMMITTEE_2 ;
ALTER TABLE UNIT_FORMULATED_COST DISABLE CONSTRAINT FK_UNIT_FORMULATED_COST_1 ;
ALTER TABLE AWARD DISABLE CONSTRAINT FK_AWARD_UNIT ;
ALTER TABLE	UNIT_ADMINISTRATOR	DISABLE CONSTRAINT	FK1_UNIT_ADMINISTRATOR_KRA ;
ALTER TABLE	IACUC_PROTOCOL_UNITS	DISABLE CONSTRAINT	FK_IACUC_PROTOCOL_UNITS_UNIT ;
TRUNCATE TABLE UNIT_ADMINISTRATOR
/
DECLARE
li_ver_nbr number :=1;
li_check_count NUMBER;
li_count_unit number;
li_count_unit_admin number;
li_count_unit_admin_typ number;
li_person_id VARCHAR2(40);
  CURSOR c_unit IS
  select u.UNIT_NUMBER,u.UNIT_NAME,nvl(u.ORGANIZATION_ID,'000001') ORGANIZATION_ID,u.UPDATE_TIMESTAMP,u.UPDATE_USER,
  u.ADMINISTRATIVE_OFFICER,u.OSP_ADMINISTRATOR,u.UNIT_HEAD,u.DEAN_VP,u.OTHER_INDIVIDUAL_TO_NOTIFY,1,uh.PARENT_UNIT_NUMBER,sys_guid() 
  from osp$unit@coeus.kuali u join OSP$UNIT_HIERARCHY@coeus.kuali uh on u.unit_number= uh.unit_number(+);
  r_unit c_unit%rowtype;

BEGIN  

IF c_unit%ISOPEN THEN
CLOSE c_unit;
END IF;
begin
OPEN c_unit;
LOOP
  FETCH c_unit INTO r_unit;
  EXIT WHEN c_unit%NOTFOUND;

			IF UPPER(TRIM(r_unit.ADMINISTRATIVE_OFFICER)) IS NOT NULL THEN  
			
			    select count(t1.UNIT_ADMINISTRATOR_TYPE_CODE) into li_check_count  from OSP$UNIT_ADMINISTRATORS@coeus.kuali t1
				WHERE t1.UNIT_NUMBER= r_unit.UNIT_NUMBER 
				AND   t1.UNIT_ADMINISTRATOR_TYPE_CODE in ( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from OSP$UNIT_ADMINISTRATOR_TYPE@coeus.kuali t2 where upper(trim(t2.DESCRIPTION)) = upper('ADMINISTRATIVE_OFFICER'))
				AND   t1.ADMINISTRATOR= r_unit.ADMINISTRATIVE_OFFICER;
				
			  IF li_check_count=0 THEN                   
				li_person_id:=r_unit.ADMINISTRATIVE_OFFICER;                    
				INSERT INTO UNIT_ADMINISTRATOR(UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
				VALUES( r_unit.UNIT_NUMBER,li_person_id,( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from UNIT_ADMINISTRATOR_TYPE t2 where upper(trim(t2.DESCRIPTION)) = upper('ADMINISTRATIVE_OFFICER')),r_unit.UPDATE_TIMESTAMP,r_unit.UPDATE_USER,li_ver_nbr,SYS_GUID());
				COMMIT;
			  END IF; 
			  
			END IF; 
						   
			 IF UPPER(TRIM(r_unit.OSP_ADMINISTRATOR)) IS NOT NULL THEN    
			  
			  select count(t1.UNIT_ADMINISTRATOR_TYPE_CODE) into li_check_count  from OSP$UNIT_ADMINISTRATORS@coeus.kuali t1
				WHERE t1.UNIT_NUMBER= r_unit.UNIT_NUMBER 
				AND   t1.UNIT_ADMINISTRATOR_TYPE_CODE in ( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from OSP$UNIT_ADMINISTRATOR_TYPE@coeus.kuali t2 where upper(trim(t2.DESCRIPTION)) = upper('OSP_ADMINISTRATOR'))
				AND   t1.ADMINISTRATOR= r_unit.OSP_ADMINISTRATOR;
				
			  IF li_check_count=0 THEN                  
				  li_person_id:=r_unit.OSP_ADMINISTRATOR;                 
				INSERT INTO UNIT_ADMINISTRATOR(UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
				VALUES( r_unit.UNIT_NUMBER,li_person_id,( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from UNIT_ADMINISTRATOR_TYPE t2 where upper(trim(t2.DESCRIPTION)) = upper('OSP_ADMINISTRATOR')),r_unit.UPDATE_TIMESTAMP,r_unit.UPDATE_USER,li_ver_nbr,SYS_GUID());
				 COMMIT;
			  END IF;
			   
			END IF; 
			
			  IF UPPER(TRIM(r_unit.UNIT_HEAD)) IS NOT NULL THEN   
			  
			   select count(t1.UNIT_ADMINISTRATOR_TYPE_CODE) into li_check_count  from OSP$UNIT_ADMINISTRATORS@coeus.kuali t1
				WHERE t1.UNIT_NUMBER= r_unit.UNIT_NUMBER 
				AND   t1.UNIT_ADMINISTRATOR_TYPE_CODE in ( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from OSP$UNIT_ADMINISTRATOR_TYPE@coeus.kuali t2 where upper(trim(t2.DESCRIPTION)) = upper('UNIT_HEAD'))
				AND   t1.ADMINISTRATOR= r_unit.UNIT_HEAD;
			  
			  IF li_check_count=0 THEN                  
				  li_person_id:=r_unit.UNIT_HEAD;                   
				INSERT INTO UNIT_ADMINISTRATOR(UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
				VALUES( r_unit.UNIT_NUMBER,li_person_id,( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from UNIT_ADMINISTRATOR_TYPE t2 where upper(trim(t2.DESCRIPTION)) = upper('UNIT_HEAD')),r_unit.UPDATE_TIMESTAMP,r_unit.UPDATE_USER,li_ver_nbr,SYS_GUID());
				 COMMIT;
			  END IF;
			   
			END IF; 
			
			IF UPPER(TRIM(r_unit.DEAN_VP)) IS NOT NULL THEN    
			  
			    select count(t1.UNIT_ADMINISTRATOR_TYPE_CODE) into li_check_count  from OSP$UNIT_ADMINISTRATORS@coeus.kuali t1
				WHERE t1.UNIT_NUMBER= r_unit.UNIT_NUMBER 
				AND   t1.UNIT_ADMINISTRATOR_TYPE_CODE in ( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from OSP$UNIT_ADMINISTRATOR_TYPE@coeus.kuali t2 where upper(trim(t2.DESCRIPTION)) = upper('DEAN_VP'))
				AND   t1.ADMINISTRATOR= r_unit.DEAN_VP;
			  
				IF li_check_count=0 THEN                  
				  li_person_id:=r_unit.DEAN_VP;                   
			   
				INSERT INTO UNIT_ADMINISTRATOR(UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
				VALUES( r_unit.UNIT_NUMBER,li_person_id,( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from UNIT_ADMINISTRATOR_TYPE t2 where upper(trim(t2.DESCRIPTION)) = upper('DEAN_VP')),r_unit.UPDATE_TIMESTAMP,r_unit.UPDATE_USER,li_ver_nbr,SYS_GUID());
				 COMMIT;
			  END IF;
			   
			END IF; 
			
			IF UPPER(TRIM(r_unit.OTHER_INDIVIDUAL_TO_NOTIFY)) IS NOT NULL THEN  
			
			   select count(t1.UNIT_ADMINISTRATOR_TYPE_CODE) into li_check_count  from OSP$UNIT_ADMINISTRATORS@coeus.kuali t1
				WHERE t1.UNIT_NUMBER= r_unit.UNIT_NUMBER 
				AND   t1.UNIT_ADMINISTRATOR_TYPE_CODE in ( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from OSP$UNIT_ADMINISTRATOR_TYPE@coeus.kuali t2 where upper(trim(t2.DESCRIPTION)) = upper('OTHER_INDIVIDUAL_TO_NOTIFY'))
				AND   t1.ADMINISTRATOR= r_unit.OTHER_INDIVIDUAL_TO_NOTIFY;
			  IF li_check_count=0 THEN                  
				  li_person_id:=r_unit.OTHER_INDIVIDUAL_TO_NOTIFY;                          
			  
				INSERT INTO UNIT_ADMINISTRATOR(UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
				VALUES( r_unit.UNIT_NUMBER,li_person_id,( select t2.UNIT_ADMINISTRATOR_TYPE_CODE from UNIT_ADMINISTRATOR_TYPE t2 where upper(trim(t2.DESCRIPTION)) = upper('OTHER_INDIVIDUAL_TO_NOTIFY')),r_unit.UPDATE_TIMESTAMP,r_unit.UPDATE_USER,li_ver_nbr,SYS_GUID());
				 COMMIT;
			  END IF;
			   
			END IF; 
	
  EXIT WHEN c_unit%NOTFOUND;
END LOOP;
CLOSE c_unit;
EXCEPTION WHEN OTHERS THEN
dbms_output.put_line('Error occured from main '||sqlerrm);
end;

begin
	   
  insert into UNIT_ADMINISTRATOR(UNIT_NUMBER,PERSON_ID,UNIT_ADMINISTRATOR_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
  select ua.UNIT_NUMBER,ua.ADMINISTRATOR,kua.KC_UNIT_ADMIN_TYP_CD,ua.UPDATE_TIMESTAMP,ua.UPDATE_USER,1,SYS_GUID() 
  from OSP$UNIT_ADMINISTRATORS@coeus.kuali ua 
  inner join TMP_MAPPING_UNIT_ADMIN_TYP_CD kua on ua.UNIT_ADMINISTRATOR_TYPE_CODE  = kua.COEUS_UNIT_ADMIN_TYP_CD;
  commit;  
exception
when others then
dbms_output.put_line('exception in truncating UNIT_ADMINISTRATOR');
end;

END;
/
ALTER TABLE PROTOCOL_UNITS ENABLE CONSTRAINT FK_PROTOCOL_UNITS_2 ;
ALTER TABLE USER_ROLES ENABLE CONSTRAINT FK_USER_ROLES_UNIT ;
ALTER TABLE KRA_USER ENABLE CONSTRAINT FK_USER_UNIT_NUMBER_KRA ;
ALTER TABLE INSTITUTE_RATES ENABLE CONSTRAINT FK_INST_RATES_UNIT_NUMBER_KRA ;
ALTER TABLE INSTITUTE_LA_RATES ENABLE CONSTRAINT FK_INSTITUTE_LA_RATES_UNIT_KRA ;
ALTER TABLE PROPOSAL_UNITS ENABLE CONSTRAINT FK_PROPOSAL_UNITS_UNIT_NUMBER ;
ALTER TABLE PROPOSAL_LOG ENABLE CONSTRAINT FK_LEAD_UNIT ;
ALTER TABLE AWARD_PERSON_UNITS ENABLE CONSTRAINT FK_APU_UNIT ;
ALTER TABLE FIN_OBJECT_CODE_MAPPING ENABLE CONSTRAINT FK_UNIT_NUMBER ;
ALTER TABLE NEGOTIATION_UNASSOC_DETAIL ENABLE CONSTRAINT NEGOTIATION_UNASSOC_DETAIL_FK2 ;
ALTER TABLE AWARD_REPORT_TRACKING ENABLE CONSTRAINT AWARD_REPORT_TRACKING_FK1 ;
ALTER TABLE COMMITTEE ENABLE CONSTRAINT FK_COMMITTEE_2 ;
ALTER TABLE UNIT_FORMULATED_COST ENABLE CONSTRAINT FK_UNIT_FORMULATED_COST_1 ;
ALTER TABLE AWARD ENABLE CONSTRAINT FK_AWARD_UNIT ;
ALTER TABLE	UNIT_ADMINISTRATOR	ENABLE CONSTRAINT	FK1_UNIT_ADMINISTRATOR_KRA ;
ALTER TABLE	IACUC_PROTOCOL_UNITS	ENABLE CONSTRAINT	FK_IACUC_PROTOCOL_UNITS_UNIT
/
UPDATE UNIT_ADMINISTRATOR_TYPE
SET DEFAULT_GROUP_FLAG = 'C'
WHERE UPDATE_USER like 'admin'
AND DEFAULT_GROUP_FLAG <> 'N'
/
UPDATE UNIT_ADMINISTRATOR_TYPE
SET DEFAULT_GROUP_FLAG = 'C'
WHERE UPDATE_USER <>'admin'
/
commit
/
UPDATE AWARD_UNIT_CONTACTS t1 SET t1.unit_administrator_type_code = ( select t2.KC_UNIT_ADMIN_TYP_CD from TMP_MAPPING_UNIT_ADMIN_TYP_CD t2
																		where t2.COEUS_UNIT_ADMIN_TYP_CD = t1.unit_administrator_type_code
																	)
WHERE t1.unit_administrator_type_code in ( select COEUS_UNIT_ADMIN_TYP_CD from TMP_MAPPING_UNIT_ADMIN_TYP_CD )                                  
/
UPDATE PROPOSAL_UNIT_CONTACTS t1 SET t1.unit_administrator_type_code = ( select t2.KC_UNIT_ADMIN_TYP_CD from TMP_MAPPING_UNIT_ADMIN_TYP_CD t2
																		where t2.COEUS_UNIT_ADMIN_TYP_CD = t1.unit_administrator_type_code
																	)
WHERE t1.unit_administrator_type_code in ( select COEUS_UNIT_ADMIN_TYP_CD from TMP_MAPPING_UNIT_ADMIN_TYP_CD )
/
commit
/

