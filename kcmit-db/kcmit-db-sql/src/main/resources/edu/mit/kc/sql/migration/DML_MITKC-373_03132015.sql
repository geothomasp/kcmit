DELETE FROM AWARD_UNIT_CONTACTS WHERE AWARD_NUMBER IN(SELECT replace(MIT_AWARD_NUMBER,'-','-00') FROM OSP$AWARD_UNIT_ADMINISTRATORS@coeus.kuali)
/
DELETE FROM AWARD_UNIT_CONTACTS WHERE AWARD_NUMBER IN(SELECT CHANGE_AWARD_NUMBER FROM KC_MIG_AWARD_CONV)
/
DROP TABLE TEMP_AWARD_UNIT_CONTACTS 
/
CREATE TABLE TEMP_AWARD_UNIT_CONTACTS 
   (AWARD_NUMBER VARCHAR2(12), 
	SEQUENCE_NUMBER NUMBER(4,0), 
	PERSON_ID VARCHAR2(40), 
	FULL_NAME VARCHAR2(90), 
	UNIT_ADMINISTRATOR_TYPE_CODE VARCHAR2(3), 
	UNIT_CONTACT_TYPE VARCHAR2(13), 
	UPDATE_TIMESTAMP DATE, 
	UPDATE_USER VARCHAR2(60), 
	UNIT_ADMINISTRATOR_UNIT_NUMBER VARCHAR2(12), 
	DEFAULT_UNIT_CONTACT CHAR(1))
/
INSERT INTO TEMP_AWARD_UNIT_CONTACTS(AWARD_NUMBER,SEQUENCE_NUMBER,PERSON_ID,FULL_NAME,UNIT_ADMINISTRATOR_TYPE_CODE,UNIT_CONTACT_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,UNIT_ADMINISTRATOR_UNIT_NUMBER)
SELECT replace(MIT_AWARD_NUMBER,'-','-00'),u.SEQUENCE_NUMBER,u.ADMINISTRATOR,p.FULL_NAME,u.UNIT_ADMINISTRATOR_TYPE_CODE,'CONTACT',u.UPDATE_TIMESTAMP,u.UPDATE_USER,ua.UNIT_NUMBER FROM OSP$AWARD_UNIT_ADMINISTRATORS@coeus.kuali u 
left outer join OSP$UNIT_ADMINISTRATORS@coeus.kuali ua on ua.ADMINISTRATOR=u.ADMINISTRATOR and ua.UNIT_ADMINISTRATOR_TYPE_CODE=u.UNIT_ADMINISTRATOR_TYPE_CODE
left outer join OSP$PERSON@coeus.kuali p on p.PERSON_ID=u.ADMINISTRATOR
/
declare
cursor c_update is
select AWARD_NUMBER,CHANGE_AWARD_NUMBER from KC_MIG_AWARD_CONV;
r_update c_update%rowtype;
begin
open c_update;
loop
fetch c_update into r_update;
exit when c_update%notfound;
update TEMP_AWARD_UNIT_CONTACTS  set AWARD_NUMBER = r_update.CHANGE_AWARD_NUMBER where AWARD_NUMBER = r_update.AWARD_NUMBER;
commit;
end loop;
close c_update;
end;
/ 
DECLARE
ls_awd_number varchar2(12);
li_seq number(4,0);
li_award_contact number(12,0);
CURSOR c_award IS
SELECT AWARD_NUMBER,SEQUENCE_NUMBER,AWARD_ID FROM AWARD ORDER BY AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER;
r_award c_award%ROWTYPE;

CURSOR c_amt_info(as_mit varchar2,as_seq number) IS
select AWARD_NUMBER,SEQUENCE_NUMBER,PERSON_ID,FULL_NAME,UNIT_ADMINISTRATOR_TYPE_CODE,UNIT_CONTACT_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,UNIT_ADMINISTRATOR_UNIT_NUMBER FROM TEMP_AWARD_UNIT_CONTACTS
where AWARD_NUMBER=as_mit and SEQUENCE_NUMBER=(select max(au.SEQUENCE_NUMBER) from TEMP_AWARD_UNIT_CONTACTS au where au.AWARD_NUMBER=TEMP_AWARD_UNIT_CONTACTS.AWARD_NUMBER and au.SEQUENCE_NUMBER<=as_seq)
ORDER BY AWARD_NUMBER,SEQUENCE_NUMBER;
r_amt_info c_amt_info%ROWTYPE;

BEGIN

IF c_award%ISOPEN THEN 
CLOSE c_award;
END IF;
OPEN c_award;
LOOP
FETCH c_award INTO r_award;
EXIT WHEN c_award%NOTFOUND;

ls_awd_number:=r_award.AWARD_NUMBER;
li_seq:=r_award.SEQUENCE_NUMBER;

IF c_amt_info%ISOPEN THEN
CLOSE c_amt_info;
END IF;
OPEN c_amt_info(ls_awd_number,li_seq);
LOOP
FETCH c_amt_info INTO r_amt_info;
EXIT WHEN c_amt_info%NOTFOUND;

select SEQUENCE_AWARD_ID.NEXTVAL into li_award_contact from dual;

INSERT INTO AWARD_UNIT_CONTACTS(AWARD_UNIT_CONTACT_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,PERSON_ID,FULL_NAME,UNIT_ADMINISTRATOR_TYPE_CODE,UNIT_CONTACT_TYPE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,UNIT_ADMINISTRATOR_UNIT_NUMBER)
VALUES(li_award_contact,r_award.AWARD_ID,r_award.AWARD_NUMBER,r_award.SEQUENCE_NUMBER,r_amt_info.PERSON_ID,r_amt_info.FULL_NAME,r_amt_info.UNIT_ADMINISTRATOR_TYPE_CODE,r_amt_info.UNIT_CONTACT_TYPE,r_amt_info.UPDATE_TIMESTAMP,r_amt_info.UPDATE_USER,1,sys_guid(),r_amt_info.UNIT_ADMINISTRATOR_UNIT_NUMBER);

end loop;
close c_amt_info;
end loop;
close c_award;
end;
/
