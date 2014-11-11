declare
li_count NUMBER;
begin
select count(rolodex_id) into li_count from rolodex where rolodex_id = 100046;
if li_count = 0 then
  Insert into ROLODEX (ROLODEX_ID,LAST_NAME,FIRST_NAME,MIDDLE_NAME,SUFFIX,PREFIX,TITLE,ORGANIZATION,ADDRESS_LINE_1,ADDRESS_LINE_2,ADDRESS_LINE_3,FAX_NUMBER,EMAIL_ADDRESS,CITY,COUNTY,STATE,POSTAL_CODE,COMMENTS,PHONE_NUMBER,COUNTRY_CODE,SPONSOR_CODE,OWNED_BY_UNIT,SPONSOR_ADDRESS_FLAG,DELETE_FLAG,CREATE_USER,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,ACTV_IND) 
  values (100046,'Place Holder','Payment Invoice Cnct',null,null,null,null,'University',null,null,null,null,null,null,null,null,null,null,null,null,null,'000001','N',null,user,sysdate,user,1,sys_guid(),'Y');

end if;
end;
/
commit
/
DELETE FROM CONTACT_TYPE WHERE DESCRIPTION='Payment Invoice Contact'
/
commit
/
INSERT INTO CONTACT_TYPE(CONTACT_TYPE_CODE,VER_NBR,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
VALUES((SELECT MAX(to_number(CONTACT_TYPE_CODE))+1 FROM CONTACT_TYPE),1,'Payment Invoice Contact',sysdate,'admin',SYS_GUID())
/
commit
/
declare
li_count number;
begin
  select  count(table_name) into li_count  from user_tables   where table_name = 'OSP$AWARD_HEADER';
  if li_count = 0 then
    execute immediate('CREATE TABLE OSP$AWARD_HEADER 
   ("MIT_AWARD_NUMBER" CHAR(10) NOT NULL ENABLE, 
	"SEQUENCE_NUMBER" NUMBER(4,0) NOT NULL ENABLE, 
	"PROPOSAL_NUMBER" VARCHAR2(8), 
	"TITLE" VARCHAR2(200) NOT NULL ENABLE, 
	"AWARD_TYPE_CODE" NUMBER(3,0) NOT NULL ENABLE, 
	"SPECIAL_EB_RATE_OFF_CAMPUS" NUMBER(5,2), 
	"SPECIAL_EB_RATE_ON_CAMPUS" NUMBER(5,2), 
	"PRE_AWARD_AUTHORIZED_AMOUNT" NUMBER(12,2), 
	"PRE_AWARD_EFFECTIVE_DATE" DATE, 
	"CFDA_NUMBER" CHAR(6), 
	"DFAFS_NUMBER" VARCHAR2(20), 
	"SUB_PLAN_FLAG" CHAR(1), 
	"PROCUREMENT_PRIORITY_CODE" VARCHAR2(6), 
	"PRIME_SPONSOR_CODE" CHAR(6), 
	"NON_COMPETING_CONT_PRPSL_DUE" NUMBER(3,0), 
	"COMPETING_RENEWAL_PRPSL_DUE" NUMBER(3,0), 
	"BASIS_OF_PAYMENT_CODE" NUMBER(3,0) NOT NULL ENABLE, 
	"METHOD_OF_PAYMENT_CODE" NUMBER(3,0) NOT NULL ENABLE, 
	"PAYMENT_INVOICE_FREQ_CODE" NUMBER(3,0), 
	"INVOICE_NUMBER_OF_COPIES" NUMBER(1,0), 
	"FINAL_INVOICE_DUE" NUMBER(3,0), 
	"ACTIVITY_TYPE_CODE" NUMBER(3,0) NOT NULL ENABLE, 
	"ACCOUNT_TYPE_CODE" NUMBER(3,0), 
	"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(8) NOT NULL ENABLE
   )');
   end if;
  end;
 /
 declare
li_count number;
begin
  select  count(table_name) into li_count  from user_tables   where table_name = 'OSP$AWARD_AMOUNT_INFO';
  if li_count = 0 then
    execute immediate('CREATE TABLE OSP$AWARD_AMOUNT_INFO 
   (	"MIT_AWARD_NUMBER" CHAR(10) NOT NULL ENABLE, 
	"SEQUENCE_NUMBER" NUMBER(4,0) NOT NULL ENABLE, 
	"AMOUNT_SEQUENCE_NUMBER" NUMBER(4,0) NOT NULL ENABLE, 
	"ANTICIPATED_TOTAL_AMOUNT" NUMBER(12,2), 
	"ANT_DISTRIBUTABLE_AMOUNT" NUMBER(12,2), 
	"FINAL_EXPIRATION_DATE" DATE, 
	"CURRENT_FUND_EFFECTIVE_DATE" DATE, 
	"AMOUNT_OBLIGATED_TO_DATE" NUMBER(12,2), 
	"OBLI_DISTRIBUTABLE_AMOUNT" NUMBER(12,2), 
	"OBLIGATION_EXPIRATION_DATE" DATE, 
	"TRANSACTION_ID" VARCHAR2(10), 
	"ENTRY_TYPE" CHAR(1), 
	"EOM_PROCESS_FLAG" CHAR(1), 
	"UPDATE_TIMESTAMP" DATE NOT NULL ENABLE, 
	"UPDATE_USER" VARCHAR2(8) NOT NULL ENABLE, 
	"ANTICIPATED_CHANGE" NUMBER(12,2), 
	"OBLIGATED_CHANGE" NUMBER(12,2), 
	"OBLIGATED_CHANGE_DIRECT" NUMBER(12,2), 
	"OBLIGATED_CHANGE_INDIRECT" NUMBER(12,2), 
	"ANTICIPATED_CHANGE_DIRECT" NUMBER(12,2), 
	"ANTICIPATED_CHANGE_INDIRECT" NUMBER(12,2), 
	"ANTICIPATED_TOTAL_DIRECT" NUMBER(12,2), 
	"ANTICIPATED_TOTAL_INDIRECT" NUMBER(12,2), 
	"OBLIGATED_TOTAL_DIRECT" NUMBER(12,2), 
	"OBLIGATED_TOTAL_INDIRECT" NUMBER(12,2)
   )');
  end if;

 end;
   /
   declare
   li_count number;
   begin
   select  count(*) into li_count  from OSP$AWARD_HEADER;
   if li_count = 0 then
   INSERT INTO OSP$AWARD_HEADER(MIT_AWARD_NUMBER,SEQUENCE_NUMBER,PROPOSAL_NUMBER,TITLE,AWARD_TYPE_CODE,SPECIAL_EB_RATE_OFF_CAMPUS,SPECIAL_EB_RATE_ON_CAMPUS,PRE_AWARD_AUTHORIZED_AMOUNT,PRE_AWARD_EFFECTIVE_DATE,CFDA_NUMBER,DFAFS_NUMBER,SUB_PLAN_FLAG,PROCUREMENT_PRIORITY_CODE,PRIME_SPONSOR_CODE,NON_COMPETING_CONT_PRPSL_DUE,COMPETING_RENEWAL_PRPSL_DUE,BASIS_OF_PAYMENT_CODE,METHOD_OF_PAYMENT_CODE,PAYMENT_INVOICE_FREQ_CODE,INVOICE_NUMBER_OF_COPIES,FINAL_INVOICE_DUE,ACTIVITY_TYPE_CODE,ACCOUNT_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER)
   SELECT MIT_AWARD_NUMBER,SEQUENCE_NUMBER,PROPOSAL_NUMBER,TITLE,AWARD_TYPE_CODE,SPECIAL_EB_RATE_OFF_CAMPUS,SPECIAL_EB_RATE_ON_CAMPUS,PRE_AWARD_AUTHORIZED_AMOUNT,PRE_AWARD_EFFECTIVE_DATE,CFDA_NUMBER,DFAFS_NUMBER,SUB_PLAN_FLAG,PROCUREMENT_PRIORITY_CODE,PRIME_SPONSOR_CODE,NON_COMPETING_CONT_PRPSL_DUE,COMPETING_RENEWAL_PRPSL_DUE,BASIS_OF_PAYMENT_CODE,METHOD_OF_PAYMENT_CODE,PAYMENT_INVOICE_FREQ_CODE,INVOICE_NUMBER_OF_COPIES,FINAL_INVOICE_DUE,ACTIVITY_TYPE_CODE,ACCOUNT_TYPE_CODE,UPDATE_TIMESTAMP,UPDATE_USER FROM OSP$AWARD_HEADER@coeus.kuali;  
   end if;
   end;
   /
   declare
   li_count number;
   begin
   select  count(*) into li_count from OSP$AWARD_AMOUNT_INFO;
  if li_count = 0 then
  INSERT INTO OSP$AWARD_AMOUNT_INFO(MIT_AWARD_NUMBER,SEQUENCE_NUMBER,AMOUNT_SEQUENCE_NUMBER,ANTICIPATED_TOTAL_AMOUNT,ANT_DISTRIBUTABLE_AMOUNT,FINAL_EXPIRATION_DATE,CURRENT_FUND_EFFECTIVE_DATE,AMOUNT_OBLIGATED_TO_DATE,OBLI_DISTRIBUTABLE_AMOUNT,OBLIGATION_EXPIRATION_DATE,TRANSACTION_ID,ENTRY_TYPE,EOM_PROCESS_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,ANTICIPATED_CHANGE,OBLIGATED_CHANGE,OBLIGATED_CHANGE_DIRECT,OBLIGATED_CHANGE_INDIRECT,ANTICIPATED_CHANGE_DIRECT,ANTICIPATED_CHANGE_INDIRECT,ANTICIPATED_TOTAL_DIRECT,ANTICIPATED_TOTAL_INDIRECT,OBLIGATED_TOTAL_DIRECT,OBLIGATED_TOTAL_INDIRECT)
  SELECT MIT_AWARD_NUMBER,SEQUENCE_NUMBER,AMOUNT_SEQUENCE_NUMBER,ANTICIPATED_TOTAL_AMOUNT,ANT_DISTRIBUTABLE_AMOUNT,FINAL_EXPIRATION_DATE,CURRENT_FUND_EFFECTIVE_DATE,AMOUNT_OBLIGATED_TO_DATE,OBLI_DISTRIBUTABLE_AMOUNT,OBLIGATION_EXPIRATION_DATE,TRANSACTION_ID,ENTRY_TYPE,EOM_PROCESS_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,ANTICIPATED_CHANGE,OBLIGATED_CHANGE,OBLIGATED_CHANGE_DIRECT,OBLIGATED_CHANGE_INDIRECT,ANTICIPATED_CHANGE_DIRECT,ANTICIPATED_CHANGE_INDIRECT,ANTICIPATED_TOTAL_DIRECT,ANTICIPATED_TOTAL_INDIRECT,OBLIGATED_TOTAL_DIRECT,OBLIGATED_TOTAL_INDIRECT  FROM OSP$AWARD_AMOUNT_INFO@coeus.kuali;
   end if;
   end;
   /
DELETE FROM REPORT WHERE DESCRIPTION='Payment/Invoice Frequency'
/
DELETE FROM REPORT WHERE DESCRIPTION='Final Invoice Due'
/
DELETE FROM VALID_CLASS_REPORT_FREQ WHERE REPORT_CLASS_CODE = 6
/
commit
/
CREATE INDEX OSP$AWARD_AMOUNT_INFO_I2 ON OSP$AWARD_AMOUNT_INFO(MIT_AWARD_NUMBER,SEQUENCE_NUMBER);
CREATE INDEX OSP$AWARD_AMOUNT_INFO_I3 ON OSP$AWARD_AMOUNT_INFO(MIT_AWARD_NUMBER,SEQUENCE_NUMBER,AMOUNT_SEQUENCE_NUMBER);
commit
/
DECLARE
ls_report_code VARCHAR2(3);
ls_report_code_1 VARCHAR2(3);

BEGIN

INSERT INTO REPORT(REPORT_CODE,VER_NBR,DESCRIPTION,FINAL_REPORT_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID,ACTIVE_FLAG)
VALUES((select max(rownum)+1 from REPORT),1,'Payment/Invoice Frequency','N',SYSDATE,'admin', SYS_GUID(),'Y');
commit;
INSERT INTO REPORT(REPORT_CODE,VER_NBR,DESCRIPTION,FINAL_REPORT_FLAG,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID,ACTIVE_FLAG)
VALUES((select max(rownum)+1 from REPORT),1,'Final Invoice Due','N',SYSDATE,'admin', SYS_GUID(),'Y');
commit;

SELECT REPORT_CODE INTO ls_report_code FROM REPORT WHERE DESCRIPTION='Payment/Invoice Frequency';
SELECT REPORT_CODE INTO ls_report_code_1  FROM REPORT WHERE DESCRIPTION='Final Invoice Due';

Insert into VALID_CLASS_REPORT_FREQ (VALID_CLASS_REPORT_FREQ_ID,REPORT_CLASS_CODE,REPORT_CODE,FREQUENCY_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
select (select max(VALID_CLASS_REPORT_FREQ_ID) + 1 from VALID_CLASS_REPORT_FREQ) + rownum,
        '6',
        ls_report_code,
        t1.FREQUENCY_CODE,
        sysdate,
        'admin',
        0,
        SYS_GUID()
from 
(select distinct PAYMENT_INVOICE_FREQ_CODE as FREQUENCY_CODE    
      from osp$award_header@coeus.kuali t1
      where t1.PAYMENT_INVOICE_FREQ_CODE is not null)t1;
      
  Insert into VALID_CLASS_REPORT_FREQ (VALID_CLASS_REPORT_FREQ_ID,REPORT_CLASS_CODE,REPORT_CODE,FREQUENCY_CODE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
  values((select max(VALID_CLASS_REPORT_FREQ_ID) + 1 from VALID_CLASS_REPORT_FREQ),'6',ls_report_code_1,'14',sysdate,'admin',0,SYS_GUID());
  
END;
/
DECLARE
ls_report_code VARCHAR2(3);
li_award_id NUMBER(12,0);
ls_award_number VARCHAR2(16);
li_award_report_terms_id NUMBER(12,0);
li_rolodex_id NUMBER(12,0):=100046;
ls_contact VARCHAR2(3);
ls_FREQUENCY_BASE_CODE FREQUENCY_BASE.FREQUENCY_BASE_CODE%type;

CURSOR c_invoice IS
SELECT MIT_AWARD_NUMBER,SEQUENCE_NUMBER,PAYMENT_INVOICE_FREQ_CODE,INVOICE_NUMBER_OF_COPIES,FINAL_INVOICE_DUE FROM OSP$AWARD_HEADER
WHERE PAYMENT_INVOICE_FREQ_CODE IS NOT NULL;
r_invoice c_invoice%ROWTYPE;

BEGIN
SELECT REPORT_CODE INTO ls_report_code FROM REPORT WHERE DESCRIPTION='Payment/Invoice Frequency';

--select FREQUENCY_BASE_CODE into ls_FREQUENCY_BASE_CODE from FREQUENCY_BASE where DESCRIPTION='As Required'

IF c_invoice%ISOPEN THEN
CLOSE c_invoice;
END IF;
OPEN c_invoice;
LOOP
FETCH c_invoice INTO r_invoice;
EXIT WHEN c_invoice%NOTFOUND;


  
  SELECT SEQUENCE_AWARD_ID.NEXTVAL INTO li_award_report_terms_id FROM DUAL;
  ls_award_number:=replace(r_invoice.MIT_AWARD_NUMBER,'-','-00');
  BEGIN
  SELECT AWARD_ID INTO li_award_id FROM AWARD WHERE AWARD_NUMBER=ls_award_number AND SEQUENCE_NUMBER=r_invoice.SEQUENCE_NUMBER;
  EXCEPTION
  WHEN OTHERS THEN
    BEGIN
	  SELECT CHANGE_AWARD_NUMBER into ls_award_number FROM KC_MIG_AWARD_CONV WHERE AWARD_NUMBER=ls_award_number;
	  SELECT AWARD_ID INTO li_award_id FROM AWARD WHERE AWARD_NUMBER=ls_award_number AND SEQUENCE_NUMBER=r_invoice.SEQUENCE_NUMBER;
	EXCEPTION
	WHEN OTHERS THEN
	  dbms_output.put_line(ls_award_number||' '||r_invoice.SEQUENCE_NUMBER);
	  CONTINUE;
	END;  
  
  END;


 INSERT INTO AWARD_REPORT_TERMS(AWARD_REPORT_TERMS_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,REPORT_CLASS_CODE,REPORT_CODE,FREQUENCY_CODE,FREQUENCY_BASE_CODE,OSP_DISTRIBUTION_CODE,DUE_DATE,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
 VALUES(li_award_report_terms_id,li_award_id,ls_award_number,r_invoice.SEQUENCE_NUMBER,'6',ls_report_code,r_invoice.PAYMENT_INVOICE_FREQ_CODE,6,NULL,NULL,1,SYSDATE,'admin',SYS_GUID());
 
 SELECT CONTACT_TYPE_CODE INTO  ls_contact FROM CONTACT_TYPE WHERE DESCRIPTION='Payment Invoice Contact';
 
 
  IF  r_invoice.INVOICE_NUMBER_OF_COPIES IS NOT NULL THEN
  
    INSERT INTO AWARD_REP_TERMS_RECNT(AWARD_REP_TERMS_RECNT_ID,CONTACT_ID,AWARD_REPORT_TERMS_ID,CONTACT_TYPE_CODE,ROLODEX_ID,NUMBER_OF_COPIES,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
	VALUES(SEQ_AWARD_REP_TERMS_RECNT_ID.NEXTVAL,NULL,li_award_report_terms_id,ls_contact,li_rolodex_id,r_invoice.INVOICE_NUMBER_OF_COPIES,1,SYSDATE,'admin',SYS_GUID());
   
  END IF;
  
END LOOP;
CLOSE c_invoice;
END;
/
DECLARE

ls_report_code_1 VARCHAR2(3);
li_award_id NUMBER(12,0);
ls_award_number VARCHAR2(16);
li_award_report_terms_id NUMBER(12,0);
li_rolodex_id NUMBER(12,0):=100046;
ll_date DATE;
ls_contact VARCHAR2(3);

CURSOR c_invoice IS
SELECT MIT_AWARD_NUMBER,SEQUENCE_NUMBER,PAYMENT_INVOICE_FREQ_CODE,INVOICE_NUMBER_OF_COPIES,FINAL_INVOICE_DUE FROM OSP$AWARD_HEADER
WHERE INVOICE_NUMBER_OF_COPIES IS NOT NULL OR FINAL_INVOICE_DUE IS NOT NULL;
r_invoice c_invoice%ROWTYPE;

BEGIN

SELECT REPORT_CODE INTO ls_report_code_1  FROM REPORT WHERE DESCRIPTION='Final Invoice Due';

IF c_invoice%ISOPEN THEN
CLOSE c_invoice;
END IF;
OPEN c_invoice;
LOOP
FETCH c_invoice INTO r_invoice;
EXIT WHEN c_invoice%NOTFOUND;
   
  IF r_invoice.INVOICE_NUMBER_OF_COPIES IS NOT NULL OR r_invoice.FINAL_INVOICE_DUE IS NOT NULL THEN
   
     
  
  SELECT SEQUENCE_AWARD_ID.NEXTVAL INTO li_award_report_terms_id FROM DUAL;
  BEGIN
  SELECT FINAL_EXPIRATION_DATE + 60 INTO ll_date FROM OSP$AWARD_AMOUNT_INFO WHERE MIT_AWARD_NUMBER=r_invoice.MIT_AWARD_NUMBER AND SEQUENCE_NUMBER=r_invoice.SEQUENCE_NUMBER
  AND AMOUNT_SEQUENCE_NUMBER=(SELECT MAX(AMOUNT_SEQUENCE_NUMBER) FROM OSP$AWARD_AMOUNT_INFO WHERE MIT_AWARD_NUMBER=r_invoice.MIT_AWARD_NUMBER AND SEQUENCE_NUMBER=r_invoice.SEQUENCE_NUMBER);
  EXCEPTION
  WHEN OTHERS THEN
  ll_date:=NULL;
  END;
  
  ls_award_number:=replace(r_invoice.MIT_AWARD_NUMBER,'-','-00');
  BEGIN
  SELECT AWARD_ID INTO li_award_id FROM AWARD WHERE AWARD_NUMBER=ls_award_number AND SEQUENCE_NUMBER=r_invoice.SEQUENCE_NUMBER;
  EXCEPTION
  WHEN OTHERS THEN  
	  BEGIN
	  SELECT CHANGE_AWARD_NUMBER into ls_award_number FROM KC_MIG_AWARD_CONV WHERE AWARD_NUMBER=ls_award_number;
	  SELECT AWARD_ID INTO li_award_id FROM AWARD WHERE AWARD_NUMBER=ls_award_number AND SEQUENCE_NUMBER=r_invoice.SEQUENCE_NUMBER;
	  EXCEPTION
	  WHEN OTHERS THEN
	  dbms_output.put_line(ls_award_number||' '||r_invoice.SEQUENCE_NUMBER);
	  CONTINUE;
	  END;
  END;
SELECT CONTACT_TYPE_CODE INTO  ls_contact FROM CONTACT_TYPE WHERE DESCRIPTION='Payment Invoice Contact';
BEGIN
 INSERT INTO AWARD_REPORT_TERMS(AWARD_REPORT_TERMS_ID,AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,REPORT_CLASS_CODE,REPORT_CODE,FREQUENCY_CODE,FREQUENCY_BASE_CODE,OSP_DISTRIBUTION_CODE,DUE_DATE,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
 VALUES(li_award_report_terms_id,li_award_id,ls_award_number,r_invoice.SEQUENCE_NUMBER,'6',ls_report_code_1,NULL,NULL,NULL,ll_date,1,SYSDATE,'admin',SYS_GUID());
 
 INSERT INTO AWARD_REP_TERMS_RECNT(AWARD_REP_TERMS_RECNT_ID,CONTACT_ID,AWARD_REPORT_TERMS_ID,CONTACT_TYPE_CODE,ROLODEX_ID,NUMBER_OF_COPIES,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
 VALUES(SEQ_AWARD_REP_TERMS_RECNT_ID.NEXTVAL,NULL,li_award_report_terms_id,ls_contact,li_rolodex_id,r_invoice.INVOICE_NUMBER_OF_COPIES,1,SYSDATE,'admin',SYS_GUID());
EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('DUE_DATE:'||ll_date||'MIT_AWARD_NUMBER:'||r_invoice.MIT_AWARD_NUMBER||'SEQUENCE_NUMBER:'||r_invoice.SEQUENCE_NUMBER);
END;
END IF;  
END LOOP;
CLOSE c_invoice;
END;
/