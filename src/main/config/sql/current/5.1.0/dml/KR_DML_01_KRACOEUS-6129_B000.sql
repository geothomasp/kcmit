INSERT INTO KRCR_PARM_T (NMSPC_CD, CMPNT_CD, PARM_NM, OBJ_ID, VER_NBR, PARM_TYP_CD, VAL, PARM_DESC_TXT, EVAL_OPRTR_CD, APPL_ID)
VALUES ('KC-PD', 'Document', 'HIDE_PROP_DEV_DOC_DESCRIPTION_PANEL', SYS_GUID(), 1, 'CONFG', 'Y', 
	'Set to Y to hide the document description panel in Proposal Development and default the document description. N to turn off this behavior.', 'A', 'KC')
/