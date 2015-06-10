create index kc_mig_awrd_conv_ind on KC_MIG_AWARD_CONV(AWARD_NUMBER)
/
create index trans_detail_ind on TRANSACTION_DETAILS(AWARD_NUMBER,SEQUENCE_NUMBER,TNM_DOCUMENT_NUMBER)
/
create index amount_info_id on AWARD_AMOUNT_INFO(AWARD_NUMBER,SEQUENCE_NUMBER,TNM_DOCUMENT_NUMBER)
/
CREATE TABLE TEMP_AMOUNT(MIT_AWARD_NUMBER CHAR(10 BYTE),
SEQUENCE_NUMBER NUMBER(4,0),
TRANSACTION_ID VARCHAR2(10 BYTE),
AMOUNT_SEQUENCE_NUMBER NUMBER(4,0))
/
INSERT INTO TEMP_AMOUNT(MIT_AWARD_NUMBER,SEQUENCE_NUMBER,TRANSACTION_ID,AMOUNT_SEQUENCE_NUMBER)
select MIT_AWARD_NUMBER,SEQUENCE_NUMBER,TRANSACTION_ID,AMOUNT_SEQUENCE_NUMBER  from osp$award_amount_info@coeus.kuali
/
create index temp_amount_id on TEMP_AMOUNT(MIT_AWARD_NUMBER,SEQUENCE_NUMBER,AMOUNT_SEQUENCE_NUMBER)
/
DECLARE
ls_mit_awd  CHAR(10);
ls_number VARCHAR2(20):=NULL;
ls_transaction VARCHAR2(10);
li_amount_seq_num NUMBER(4,0);
li_cnt NUMBER(4,0);

CURSOR c_trans IS 
select AWARD_NUMBER,SEQUENCE_NUMBER,TNM_DOCUMENT_NUMBER,ANTICIPATED_CHANGE,OBLIGATED_CHANGE,ANTICIPATED_TOTAL_DIRECT,ANTICIPATED_TOTAL_INDIRECT,OBLIGATED_TOTAL_DIRECT,OBLIGATED_TOTAL_INDIRECT,UPDATE_TIMESTAMP,UPDATE_USER FROM award_amount_info
where TNM_DOCUMENT_NUMBER is not null
order by AWARD_AMOUNT_INFO_ID;
r_trans c_trans%ROWTYPE;

BEGIN 

     IF c_trans%ISOPEN THEN
        CLOSE c_trans;
	 END IF;
	 
	 OPEN c_trans;
	 LOOP
	 FETCH c_trans INTO r_trans;
	 EXIT WHEN c_trans%NOTFOUND;
--dbms_output.put_line(r_trans.AWARD_NUMBER|| ' '||r_trans.SEQUENCE_NUMBER||' '||r_trans.TNM_DOCUMENT_NUMBER||' '||li_amount_seq_num);
select count(CHANGE_AWARD_NUMBER) into li_cnt from KC_MIG_AWARD_CONV where CHANGE_AWARD_NUMBER=r_trans.AWARD_NUMBER;

IF li_cnt=0 THEN
   
	ls_mit_awd :=  replace(r_trans.AWARD_NUMBER,'-00','-');
	
ELSE
    select (AWARD_NUMBER) into ls_mit_awd  FROM KC_MIG_AWARD_CONV where CHANGE_AWARD_NUMBER=r_trans.AWARD_NUMBER;
	ls_mit_awd :=  replace(ls_mit_awd,'-00','-');
	
END IF;

    IF ls_number IS NULL THEN
                ls_number:=r_trans.AWARD_NUMBER||r_trans.TNM_DOCUMENT_NUMBER;
                li_amount_seq_num:=1;
					
				  
		
            ELSIF ls_number!=r_trans.AWARD_NUMBER||r_trans.TNM_DOCUMENT_NUMBER THEN
                  ls_number:=r_trans.AWARD_NUMBER||r_trans.TNM_DOCUMENT_NUMBER;
                  li_amount_seq_num:=1;
				  
				  
				    
              ELSIF ls_number=r_trans.AWARD_NUMBER||r_trans.TNM_DOCUMENT_NUMBER THEN 
                  li_amount_seq_num:=li_amount_seq_num+1;
              
	   END IF; 
     --dbms_output.put_line('1:'||r_trans.AWARD_NUMBER|| ' '||r_trans.SEQUENCE_NUMBER||' '||r_trans.TNM_DOCUMENT_NUMBER||' '||li_amount_seq_num);   
     BEGIN
		select TRANSACTION_ID into ls_transaction  from TEMP_AMOUNT
		where MIT_AWARD_NUMBER = ls_mit_awd and SEQUENCE_NUMBER = r_trans.SEQUENCE_NUMBER and AMOUNT_SEQUENCE_NUMBER = li_amount_seq_num;
     EXCEPTION 
     WHEN OTHERS THEN
     --dbms_output.put_line('2:'||r_trans.AWARD_NUMBER|| ' '||r_trans.SEQUENCE_NUMBER||' '||r_trans.TNM_DOCUMENT_NUMBER||' '||li_amount_seq_num);   
		li_amount_seq_num := li_amount_seq_num - 1;
    select count(TRANSACTION_ID) into li_cnt from TEMP_AMOUNT
		where MIT_AWARD_NUMBER=ls_mit_awd and SEQUENCE_NUMBER=r_trans.SEQUENCE_NUMBER and AMOUNT_SEQUENCE_NUMBER = li_amount_seq_num;
    if li_cnt=1 then
		select TRANSACTION_ID into ls_transaction  from TEMP_AMOUNT
		where MIT_AWARD_NUMBER=ls_mit_awd and SEQUENCE_NUMBER=r_trans.SEQUENCE_NUMBER and AMOUNT_SEQUENCE_NUMBER = li_amount_seq_num;
    end if;
     END;
     
     UPDATE award_amount_info
     SET TRANSACTION_ID = ls_transaction
     WHERE AWARD_NUMBER = r_trans.AWARD_NUMBER 
     AND SEQUENCE_NUMBER = r_trans.SEQUENCE_NUMBER
     AND TNM_DOCUMENT_NUMBER = r_trans.TNM_DOCUMENT_NUMBER;
     
     UPDATE TRANSACTION_DETAILS
     SET TRANSACTION_ID = ls_transaction
     WHERE AWARD_NUMBER = r_trans.AWARD_NUMBER 
     AND SEQUENCE_NUMBER = r_trans.SEQUENCE_NUMBER
     AND TNM_DOCUMENT_NUMBER = r_trans.TNM_DOCUMENT_NUMBER;
     
     
END LOOP;
	 CLOSE c_trans;
	  
END;
/
commit
/
INSERT INTO PENDING_TRANSACTIONS(TRANSACTION_ID,DOCUMENT_NUMBER,SOURCE_AWARD_NUMBER,DESTINATION_AWARD_NUMBER,OBLIGATED_AMOUNT,ANTICIPATED_AMOUNT,COMMENTS,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,OBLIGATED_DIRECT_AMOUNT,OBLIGATED_INDIRECT_AMOUNT,ANTICIPATED_DIRECT_AMOUNT,ANTICIPATED_INDIRECT_AMOUNT,PROCESSED_FLAG,SINGLE_NODE_TRANS)
SELECT TRANSACTION_ID,TNM_DOCUMENT_NUMBER,AWARD_NUMBER,'000000-00000',OBLIGATED_CHANGE,ANTICIPATED_CHANGE,NULL,UPDATE_TIMESTAMP,UPDATE_USER,1,SYS_GUID(),OBLIGATED_TOTAL_DIRECT,OBLIGATED_TOTAL_INDIRECT,ANTICIPATED_TOTAL_DIRECT,ANTICIPATED_TOTAL_INDIRECT,'Y','N' 
FROM AWARD_AMOUNT_INFO WHERE AWARD_AMOUNT_INFO_ID in(SELECT MAX(AWARD_AMOUNT_INFO_ID) FROM AWARD_AMOUNT_INFO GROUP BY AWARD_NUMBER,SEQUENCE_NUMBER,TNM_DOCUMENT_NUMBER) AND TNM_DOCUMENT_NUMBER IS NOT NULL
/
commit
/ 
drop index kc_mig_awrd_conv_ind
/
drop index trans_detail_ind
/
drop index amount_info_id
/
DROP TABLE TEMP_AMOUNT
/