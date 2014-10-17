Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-GEN','All','KC_DB_MAIL_HOST',sys_guid(),1,'CONFG','outgoing.mit.edu','A','Set mail host for notificaion sent from DB','KC')
/
Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID) 
values ('KC-GEN','All','KC_DB_MAIL_PORT',sys_guid(),1,'CONFG','port','A','Set mail port for notificaion sent from DB','KC')
/
Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-GEN','All','KC_DB_SENDER_ID',sys_guid(),1,'CONFG','kc@your.place','A','Set sender id for DB notification','KC')
/
Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-GEN','All','KC_DB_REPLY_ID',sys_guid(),1,'CONFG','kc@your.place','A','Set reply to id for DB notification','KC')
/
-- new added start
UPDATE KRCR_PARM_T SET VAL = 'kc-mit-dev@mit.edu' WHERE PARM_NM = 'EMAIL_NOTIFICATION_FROM_ADDRESS'
/
UPDATE KRCR_PARM_T SET VAL = 'kc-mit-dev@mit.edu' WHERE PARM_NM = 'EMAIL_NOTIFICATION_TEST_ADDRESS'
/
UPDATE KRCR_PARM_T SET VAL = 'Y' WHERE PARM_NM = 'EMAIL_NOTIFICATIONS_ENABLED'
/
UPDATE KRCR_PARM_T SET VAL = 'Y' WHERE PARM_NM = 'EMAIL_NOTIFICATIONS_TEST_ENABLED'
/
UPDATE KRCR_PARM_T SET VAL = '1000' WHERE PARM_NM = 'KC_NOTIFICATION_CHANNEL_ID'
/
UPDATE KRCR_PARM_T SET VAL = '1' WHERE PARM_NM = 'NORMAL_NOTIFICATION_PRIORITY_ID'
/
UPDATE KRCR_PARM_T SET VAL = '0 */10 * * * ?' WHERE PARM_NM = 'REPORT_TRACKING_NOTIFICATIONS_BATCH_CRON_TRIGGER'
/
UPDATE KRCR_PARM_T SET VAL = 'N' WHERE PARM_NM = 'REPORT_TRACKING_NOTIFICATIONS_BATCH_ENABLED'
/
UPDATE KRCR_PARM_T SET VAL = 'quickstart' WHERE PARM_NM = 'REPORT_TRACKING_NOTIFICATIONS_BATCH_RECIPIENT'
/
UPDATE KRCR_PARM_T SET VAL = 'Y' WHERE PARM_NM = 'SEND_EMAIL_NOTIFICATION_IND'
/
UPDATE KRCR_PARM_T SET VAL = 'K' WHERE PARM_NM = 'SEND_NOTE_WORKFLOW_NOTIFICATION_ACTIONS'
/
UPDATE KRCR_PARM_T SET VAL = '1' WHERE PARM_NM = 'SIMPLE_NOTIFICATION_CONTENT_TYPE_ID'
/
UPDATE KRCR_PARM_T SET VAL = '1000' WHERE PARM_NM = 'SYSTEM_NOTIFICATION_PRODUCER_ID'
/
