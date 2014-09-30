Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-GEN','All','KC_DB_MAIL_HOST',sys_guid(),1,'CONFG','outgoing.server.at.your.place','A','Set mail host for notificaion sent from DB','KC')
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