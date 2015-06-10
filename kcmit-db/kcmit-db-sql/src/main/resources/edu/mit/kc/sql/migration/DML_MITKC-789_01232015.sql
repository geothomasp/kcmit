ALTER TABLE NEGOTIATION_ATTACHMENT DISABLE CONSTRAINT NEGOTIATION_ATTACHMENT_FK1 ;
/
ALTER TABLE NEGOTIATION_ATTACHMENT DISABLE CONSTRAINT NEGOTIATION_ATTACHMENT_FK2 ;
/
DELETE FROM NEGOTIATION_ACTIVITY WHERE NEGOTIATION_ACTIVITY_ID IN(SELECT NEGOTIATION_ACTIVITY_ID FROM TEMP_NEGOTIATION_ACT_ID)
/
DELETE FROM NEGOTIATION_ATTACHMENT WHERE ACTIVITY_ID IN(SELECT NEGOTIATION_ACTIVITY_ID FROM TEMP_NEGOTIATION_ACT_ID)
/
DELETE FROM ATTACHMENT_FILE WHERE FILE_ID IN(SELECT FILE_ID FROM NEGOTIATION_ATTACHMENT)
/
TRUNCATE TABLE TEMP_NEGOTIATION_ACT_ID
/
CREATE TABLE OSP$NEGOTIATION_LOCATION
   (NEGOTIATION_NUMBER VARCHAR2(8), 
	LOCATION_NUMBER NUMBER(3,0), 
	NEGOTIATION_LOCATION_TYPE_CODE NUMBER(3,0), 
	EFFECTIVE_START_DATE DATE,
  EFFECTIVE_END_DATE DATE,
	UPDATE_TIMESTAMP DATE, 
	UPDATE_USER VARCHAR2(8)
   )
/   
DECLARE
li_location_num  NUMBER(3,0);
ll_effective_end DATE;
CURSOR c_loc IS
SELECT NEGOTIATION_NUMBER,LOCATION_NUMBER,NEGOTIATION_LOCATION_TYPE_CODE,EFFECTIVE_DATE,UPDATE_TIMESTAMP,UPDATE_USER FROM OSP$NEGOTIATION_LOCATION@coeus.kuali
ORDER BY NEGOTIATION_NUMBER,LOCATION_NUMBER;
r_loc c_loc%ROWTYPE;

BEGIN
IF c_loc%ISOPEN THEN
CLOSE c_loc;
END IF;
OPEN c_loc;
LOOP
FETCH c_loc INTO r_loc;
EXIT WHEN c_loc%NOTFOUND;

li_location_num:=r_loc.LOCATION_NUMBER + 1;

BEGIN
SELECT EFFECTIVE_DATE into ll_effective_end FROM OSP$NEGOTIATION_LOCATION@coeus.kuali WHERE NEGOTIATION_NUMBER=r_loc.NEGOTIATION_NUMBER AND LOCATION_NUMBER=li_location_num;
EXCEPTION
WHEN OTHERS THEN
ll_effective_end:=r_loc.EFFECTIVE_DATE;
END;

IF ll_effective_end IS NULL THEN
ll_effective_end:=r_loc.EFFECTIVE_DATE;
END IF;

IF r_loc.EFFECTIVE_DATE<>ll_effective_end THEN

ll_effective_end:=ll_effective_end - 1;

END IF;

INSERT INTO OSP$NEGOTIATION_LOCATION(NEGOTIATION_NUMBER,LOCATION_NUMBER,NEGOTIATION_LOCATION_TYPE_CODE,EFFECTIVE_START_DATE,EFFECTIVE_END_DATE,UPDATE_TIMESTAMP,UPDATE_USER)
VALUES(r_loc.NEGOTIATION_NUMBER,r_loc.LOCATION_NUMBER,r_loc.NEGOTIATION_LOCATION_TYPE_CODE,r_loc.EFFECTIVE_DATE,ll_effective_end,r_loc.UPDATE_TIMESTAMP,r_loc.UPDATE_USER);

END LOOP;
CLOSE c_loc;
END;
/
DECLARE
li_ver_nbr NUMBER(8):=1;
li_act_id NUMBER(22,0);
li_neg_id NUMBER(22,0);
li_act_typ_id  NUMBER(22,0);
ls_loc_type VARCHAR2(9);
li_loc_id NUMBER(22,0);
ls_act_typ_code VARCHAR2(3);
ls_nego VARCHAR2(8);
ll_start_date DATE;
ll_end_date DATE;

CURSOR c_neg_activity IS
SELECT NEGOTIATION_NUMBER,ACTIVITY_NUMBER,substrb(DESCRIPTION,1,2000)DESCRIPTION,NEGOTIATION_ACT_TYPE_CODE,DOC_FILE_ADDRESS,FOLLOWUP_DATE,CREATE_DATE,ACTIVITY_DATE,UPDATE_TIMESTAMP,UPDATE_USER,RESTRICTED_VIEW FROM OSP$NEGOTIATION_ACTIVITIES@Coeus.Kuali
ORDER BY NEGOTIATION_NUMBER,ACTIVITY_NUMBER;
r_neg_activity c_neg_activity%ROWTYPE;


BEGIN

IF c_neg_activity%ISOPEN THEN
CLOSE c_neg_activity;
END IF;
OPEN c_neg_activity;
LOOP
FETCH c_neg_activity INTO r_neg_activity;
EXIT WHEN c_neg_activity%NOTFOUND;

SELECT NEGOTIATION_ACTIVITY_S.NEXTVAL INTO li_act_id FROM DUAL;
begin
SELECT NEGOTIATION_ID INTO li_neg_id FROM TEMP_NEGOTIATION_ID WHERE  NEGOTIATION_NUMBER=r_neg_activity.NEGOTIATION_NUMBER;
exception
when others then
dbms_output.put_line('Error while fetching NEGOTIATION_ID from TEMP_NEGOTIATION_ID using NEGOTIATION_NUMBER:'||r_neg_activity.NEGOTIATION_NUMBER||'and error is:'||sqlerrm);
end;

BEGIN

SELECT a.NEGOTIATION_LOCATION_TYPE_CODE,a.EFFECTIVE_END_DATE INTO li_loc_id,ll_end_date FROM OSP$NEGOTIATION_LOCATION a 
WHERE a.NEGOTIATION_NUMBER=r_neg_activity.NEGOTIATION_NUMBER AND a.EFFECTIVE_START_DATE<=r_neg_activity.ACTIVITY_DATE AND a.EFFECTIVE_END_DATE>=r_neg_activity.ACTIVITY_DATE 
AND a.LOCATION_NUMBER=(SELECT MIN(b.LOCATION_NUMBER) FROM OSP$NEGOTIATION_LOCATION b WHERE b.NEGOTIATION_NUMBER=a.NEGOTIATION_NUMBER 
AND b.EFFECTIVE_START_DATE<=r_neg_activity.ACTIVITY_DATE AND b.EFFECTIVE_END_DATE>=r_neg_activity.ACTIVITY_DATE); 

EXCEPTION 
WHEN OTHERS THEN
li_loc_id:=1;
END;


BEGIN

INSERT INTO TEMP_NEGOTIATION_ACT_ID(NEGOTIATION_NUMBER,ACTIVITY_NUMBER,NEGOTIATION_ACTIVITY_ID)
VALUES(r_neg_activity.NEGOTIATION_NUMBER,r_neg_activity.ACTIVITY_NUMBER,li_act_id);

INSERT INTO NEGOTIATION_ACTIVITY(NEGOTIATION_ACTIVITY_ID,NEGOTIATION_ID,LOCATION_ID,ACTIVITY_TYPE_ID,START_DATE,END_DATE,CREATE_DATE,FOLLOWUP_DATE,LAST_MODIFIED_USER,LAST_MODIFIED_DATE,DESCRIPTION,RESTRICTED,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(li_act_id,li_neg_id,li_loc_id,r_neg_activity.NEGOTIATION_ACT_TYPE_CODE,r_neg_activity.ACTIVITY_DATE,ll_end_date,r_neg_activity.CREATE_DATE,r_neg_activity.FOLLOWUP_DATE,lower(r_neg_activity.UPDATE_USER),r_neg_activity.UPDATE_TIMESTAMP,r_neg_activity.DESCRIPTION,r_neg_activity.RESTRICTED_VIEW,r_neg_activity.UPDATE_TIMESTAMP,r_neg_activity.UPDATE_USER,li_ver_nbr,SYS_GUID);
 commit;
 


EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('ERROR IN NEGOTIATION_ACTIVITY,NEGOTIATION_NUMBER:'||r_neg_activity.NEGOTIATION_NUMBER||'ACTIVITY_NUMBER:'||r_neg_activity.ACTIVITY_NUMBER||'ACTIVITY_DATE:'||r_neg_activity.ACTIVITY_DATE||'-'||sqlerrm);
END;

END LOOP;
CLOSE c_neg_activity;
END;
/
DECLARE
li_ver_nbr NUMBER(8):=1;
li_attachment_id NUMBER(22,0);
li_seq_attachment NUMBER(22,0);
ls_restricted CHAR(1 BYTE):='Y';
ls_content_type VARCHAR2(255 BYTE);
li_neg_id  NUMBER(22,0);
li_act_id NUMBER(22,0);
CURSOR c_attachment IS

SELECT NEGOTIATION_NUMBER,ACTIVITY_NUMBER,FILE_NAME,DOCUMENT,UPDATE_TIMESTAMP,UPDATE_USER,MIME_TYPE FROM TEMP_NEGOTIATION_DOC;
r_attachment c_attachment%ROWTYPE;

BEGIN

IF c_attachment%ISOPEN THEN
CLOSE c_attachment;
END IF;
OPEN c_attachment;
LOOP
FETCH c_attachment INTO r_attachment;
EXIT WHEN c_attachment%NOTFOUND;

SELECT NEGOTIATION_ATTACHMENT_S.NEXTVAL INTO li_attachment_id FROM DUAL;
SELECT SEQ_ATTACHMENT_ID.NEXTVAL INTO li_seq_attachment FROM DUAL;


BEGIN

ls_content_type:=r_attachment.MIME_TYPE;
IF ls_content_type IS NULL THEN  
ls_content_type:='application/octet-stream';
END IF;
begin
SELECT NEGOTIATION_ID  INTO li_neg_id FROM TEMP_NEGOTIATION_ID WHERE NEGOTIATION_NUMBER=r_attachment.NEGOTIATION_NUMBER;
exception
when others then
dbms_output.put_line('Error while fetching NEGOTIATION_ID from TEMP_NEGOTIATION_ID using NEGOTIATION_NUMBER:'||r_attachment.NEGOTIATION_NUMBER||'and error is:'||sqlerrm);
end;
begin
SELECT NEGOTIATION_ACTIVITY_ID INTO li_act_id FROM  TEMP_NEGOTIATION_ACT_ID WHERE NEGOTIATION_NUMBER=r_attachment.NEGOTIATION_NUMBER AND ACTIVITY_NUMBER=r_attachment.ACTIVITY_NUMBER;
exception
when others then
dbms_output.put_line('Error while fetching NEGOTIATION_ACTIVITY_ID from TEMP_NEGOTIATION_ACT_ID using NEGOTIATION_NUMBER:'||r_attachment.NEGOTIATION_NUMBER||'and ACTIVITY_NUMBER:'||r_attachment.ACTIVITY_NUMBER||'and error is:'||sqlerrm);
end;
INSERT INTO ATTACHMENT_FILE(FILE_ID,SEQUENCE_NUMBER,FILE_NAME,CONTENT_TYPE,FILE_DATA,VER_NBR,UPDATE_TIMESTAMP,UPDATE_USER,OBJ_ID)
VALUES(li_seq_attachment,0,r_attachment.FILE_NAME,ls_content_type,r_attachment.DOCUMENT,li_ver_nbr,r_attachment.UPDATE_TIMESTAMP,r_attachment.UPDATE_USER,SYS_GUID());

INSERT INTO NEGOTIATION_ATTACHMENT(ATTACHMENT_ID,ACTIVITY_ID,DESCRIPTION,RESTRICTED,FILE_ID,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(li_attachment_id,li_act_id,null,ls_restricted,li_seq_attachment,r_attachment.UPDATE_TIMESTAMP,r_attachment.UPDATE_USER,li_ver_nbr,SYS_GUID());

EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('ERROR IN NEGOTIATION_ATTACHMENT,NEGOTIATION_NUMBER:'||r_attachment.NEGOTIATION_NUMBER || 'ACTIVITY_ID:'||r_attachment.ACTIVITY_NUMBER||'-'||sqlerrm);

END;
END LOOP;
CLOSE c_attachment;
END;
/
DROP TABLE OSP$NEGOTIATION_LOCATION
/
ALTER TABLE NEGOTIATION_ATTACHMENT ENABLE CONSTRAINT NEGOTIATION_ATTACHMENT_FK1 ;
/
ALTER TABLE NEGOTIATION_ATTACHMENT ENABLE CONSTRAINT NEGOTIATION_ATTACHMENT_FK2 ;
/
commit
/