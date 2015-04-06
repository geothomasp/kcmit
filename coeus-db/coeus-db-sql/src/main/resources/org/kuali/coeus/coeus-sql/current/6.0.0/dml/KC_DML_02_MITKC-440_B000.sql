Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-S2S','All','PROPOSAL_TYPE_CODE_PRE_PROPOSAL',sys_guid(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_PRE_PROPOSAL")}','A','s2sCode corresponding to Proposal Type:PreProposal','KUALI')
/

Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-S2S','All','PROPOSAL_TYPE_CODE_SUPPLEMENT_CHANGE_CORRECTED',sys_guid(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_SUPPLEMENT_CHANGE_CORRECTED")}','A','s2sCode corresponding to Proposal Type:Supplement Changed/Corrected','KUALI')
/

Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-S2S','All','PROPOSAL_TYPE_CODE_RENEWAL_CHANGE_CORRECTED',sys_guid(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_RENEWAL_CHANGE_CORRECTED")}','A','s2sCode corresponding to Proposal Type:Renewal Changed/Corrected','KUALI')
/

Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-S2S','All','PROPOSAL_TYPE_CODE_RESUBMISSION_CHANGE_CORRECTED',sys_guid(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_RESUBMISSION_CHANGE_CORRECTED")}','A','s2sCode corresponding to Proposal Type:Resubmission Changed/Corrected','KUALI')
/

Insert into KRCR_PARM_T (NMSPC_CD,CMPNT_CD,PARM_NM,OBJ_ID,VER_NBR,PARM_TYP_CD,VAL,EVAL_OPRTR_CD,PARM_DESC_TXT,APPL_ID)
values ('KC-S2S','All','PROPOSAL_TYPE_CODE_NEW_CHANGE_CORRECTED',sys_guid(),1,'CONFG','@{#param("KC-PD", "Document", "PROPOSAL_TYPE_CODE_NEW_CHANGE_CORRECTED")}','A','s2sCode corresponding to Proposal Type:New Changed/Corrected','KUALI')
/
