CREATE TABLE "OSP$AWARD_IDC_RATE"
(	"MIT_AWARD_NUMBER" CHAR(10 BYTE) NOT NULL ENABLE, 
"SEQUENCE_NUMBER" NUMBER(4,0) NOT NULL ENABLE, 
"APPLICABLE_IDC_RATE" NUMBER(5,2) NOT NULL ENABLE, 
"IDC_RATE_TYPE_CODE" NUMBER(3,0) NOT NULL ENABLE, 
"FISCAL_YEAR" CHAR(4 BYTE) NOT NULL ENABLE, 
"ON_CAMPUS_FLAG" CHAR(1 BYTE) NOT NULL ENABLE, 
"UNDERRECOVERY_OF_IDC" NUMBER(12,2), 
"SOURCE_ACCOUNT" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
"DESTINATION_ACCOUNT" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
"START_DATE" DATE NOT NULL ENABLE, 
"END_DATE" DATE, 
"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
"UPDATE_USER" VARCHAR2(8 BYTE) NOT NULL ENABLE)
/
commit
/
declare
li_count NUMBER;
begin
select count(MIT_AWARD_NUMBER) into li_count from OSP$AWARD_IDC_RATE;
if li_count = 0 then
  insert into	OSP$AWARD_IDC_RATE(MIT_AWARD_NUMBER,SEQUENCE_NUMBER,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,START_DATE,ON_CAMPUS_FLAG,SOURCE_ACCOUNT,
  DESTINATION_ACCOUNT,UNDERRECOVERY_OF_IDC,END_DATE,UPDATE_TIMESTAMP,UPDATE_USER)
  select MIT_AWARD_NUMBER,SEQUENCE_NUMBER,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,START_DATE,ON_CAMPUS_FLAG,SOURCE_ACCOUNT,
  DESTINATION_ACCOUNT,UNDERRECOVERY_OF_IDC,END_DATE,UPDATE_TIMESTAMP,UPDATE_USER from OSP$AWARD_IDC_RATE@coeus.kuali;
end if;
end;
/
commit
/
drop table V_AWARD_IDC
/
CREATE TABLE V_AWARD_IDC 
(KUALI_AWD VARCHAR2(20 BYTE), 
KUALI_SEQUENCE_NUMBER NUMBER(4,0), 
MIT_SEQUENCE_NUMBER NUMBER(4,0), 
CHANGED CHAR(1 BYTE), 
MIT_AWARD_NUMBER CHAR(10 BYTE), 
SEQUENCE_NUMBER NUMBER(4,0), 
AWARD_ID NUMBER(22,0), 
APPLICABLE_IDC_RATE NUMBER(5,2), 
IDC_RATE_TYPE_CODE NUMBER(3,0), 
FISCAL_YEAR CHAR(4 BYTE), 
ON_CAMPUS_FLAG CHAR(1 BYTE), 
UNDERRECOVERY_OF_IDC NUMBER(12,2), 
SOURCE_ACCOUNT VARCHAR2(100 BYTE), 
DESTINATION_ACCOUNT VARCHAR2(100 BYTE), 
START_DATE DATE, 
END_DATE DATE, 
UPDATE_TIMESTAMP DATE, 
UPDATE_USER VARCHAR2(8 BYTE) )
/
INSERT INTO V_AWARD_IDC(KUALI_AWD,KUALI_SEQUENCE_NUMBER,MIT_SEQUENCE_NUMBER,CHANGED,MIT_AWARD_NUMBER,SEQUENCE_NUMBER,AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,UPDATE_TIMESTAMP,UPDATE_USER)  
SELECT l.kuali_awd,l.kuali_sequence_number,a.sequence_number  Mit_sequence_number,l.changed,  a.MIT_AWARD_NUMBER,a.SEQUENCE_NUMBER,aw.AWARD_ID,a.APPLICABLE_IDC_RATE,a.IDC_RATE_TYPE_CODE,a.FISCAL_YEAR,a.ON_CAMPUS_FLAG,a.UNDERRECOVERY_OF_IDC,a.SOURCE_ACCOUNT,a.DESTINATION_ACCOUNT,a.START_DATE,a.END_DATE,a.UPDATE_TIMESTAMP,a.UPDATE_USER 
FROM  TEMP_SEQ_LOG l 
Left outer join OSP$AWARD_IDC_RATE a  on l.module_item_key=a.mit_award_number and l.mit_sequence_number=a.sequence_number  inner join AWARD aw on aw.AWARD_NUMBER=l.KUALI_AWD and aw.SEQUENCE_NUMBER=l.KUALI_SEQUENCE_NUMBER  where l.MODULE='AWD' 
and aw.IDC_INDICATOR not in('N1','N0')
/
commit
/
CREATE INDEX V_AWARD_IDC_I1 ON V_AWARD_IDC(KUALI_AWD, KUALI_SEQUENCE_NUMBER, MIT_AWARD_NUMBER)
/
CREATE INDEX V_AWARD_IDC_I2 ON V_AWARD_IDC(MIT_AWARD_NUMBER)
/
---------------------------------------------------------------------------------------------------------------------------------
drop table TEMP_AWD_IDC
/
truncate table AWARD_IDC_RATE
/
CREATE TABLE TEMP_AWD_IDC 
(KUALI_AWD VARCHAR2(20 BYTE), 
KUALI_SEQUENCE_NUMBER NUMBER, 
SEQUENC NUMBER(4,0))
/	
INSERT INTO  TEMP_AWD_IDC(KUALI_AWD,KUALI_SEQUENCE_NUMBER,SEQUENC) 
select kuali_awd,(select max(aw.sequence_number) from V_AWARD_IDC aw where aw.kuali_awd= v.kuali_awd
and aw.KUALI_SEQUENCE_NUMBER<=v.KUALI_SEQUENCE_NUMBER and aw.mit_award_number is not null)  as kuali_sequence_number,v.KUALI_SEQUENCE_NUMBER SEQUENC  
from V_AWARD_IDC v  where v.mit_award_number is null
/
commit
/
CREATE INDEX temp_awd_idc_I1 ON temp_awd_idc(kuali_awd,kuali_sequence_number)
/
INSERT INTO AWARD_IDC_RATE(AWARD_IDC_RATE_ID,AWARD_NUMBER,SEQUENCE_NUMBER,AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
SELECT  SEQUENCE_AWARD_ID.NEXTVAL,a.kuali_awd,a.kuali_sequence_number,a.AWARD_ID,a.APPLICABLE_IDC_RATE,a.IDC_RATE_TYPE_CODE,a.FISCAL_YEAR,a.ON_CAMPUS_FLAG,a.UNDERRECOVERY_OF_IDC,a.SOURCE_ACCOUNT,a.DESTINATION_ACCOUNT,a.START_DATE,a.END_DATE,1,a.UPDATE_TIMESTAMP,a.UPDATE_USER,SYS_GUID()
FROM V_AWARD_IDC a  where a.mit_award_number IS NOT NULL
/
commit
/
INSERT INTO AWARD_IDC_RATE(AWARD_IDC_RATE_ID,AWARD_NUMBER,SEQUENCE_NUMBER,AWARD_ID,APPLICABLE_IDC_RATE,IDC_RATE_TYPE_CODE,FISCAL_YEAR,ON_CAMPUS_FLAG,UNDERRECOVERY_OF_IDC,SOURCE_ACCOUNT,DESTINATION_ACCOUNT,START_DATE,END_DATE,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
SELECT  SEQUENCE_AWARD_ID.NEXTVAL,a.kuali_awd,v2.SEQUENC,a.AWARD_ID,a.APPLICABLE_IDC_RATE,a.IDC_RATE_TYPE_CODE,a.FISCAL_YEAR,a.ON_CAMPUS_FLAG,a.UNDERRECOVERY_OF_IDC,a.SOURCE_ACCOUNT,a.DESTINATION_ACCOUNT,a.START_DATE,a.END_DATE,1,a.UPDATE_TIMESTAMP,a.UPDATE_USER,SYS_GUID()
FROM V_AWARD_IDC a  inner join temp_awd_idc v2 on a.kuali_awd=v2.kuali_awd and a.sequence_number=v2.kuali_sequence_number
where a.changed='N'
/
commit
/
update AWARD_IDC_RATE pp set pp.AWARD_ID = (select p.AWARD_ID from award p where
p.award_number = pp.award_number
and p.sequence_number = pp.sequence_number
)
/
commit
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
update AWARD_IDC_RATE  set AWARD_NUMBER = r_update.CHANGE_AWARD_NUMBER where AWARD_NUMBER = r_update.AWARD_NUMBER;
end loop;
close c_update;
end;
/
update AWARD_IDC_RATE set ON_CAMPUS_FLAG = 'F' Where ON_CAMPUS_FLAG = 'N'
/
update AWARD_IDC_RATE set ON_CAMPUS_FLAG = 'N' Where ON_CAMPUS_FLAG = 'Y'
/
commit
/