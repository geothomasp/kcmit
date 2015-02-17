INSERT INTO SHARED_DOCUMENT_TYPE(
SHARED_DOCUMENT_TYPE_ID,
COEUS_MODULE_CODE,
DOCUMENT_TYPE_CODE,
UPDATE_TIMESTAMP,
UPDATE_USER,
VER_NBR,
OBJ_ID
)
SELECT
SEQ_SHARED_DOCUMENT_TYPE.NEXTVAL,
COEUS_MODULE_CODE,
DOCUMENT_TYPE_CODE,
UPDATE_TIMESTAMP,
UPDATE_USER,
1,
sys_guid()
FROM OSP$SHARED_DOCUMENT_TYPE@coeus.kuali
/
commit
/
declare
li_count PLS_INTEGER;
begin
select count(perm_id) into li_count from KRIM_PERM_T where nm = 'MAINTAIN_INST_PROPOSAL_DOC';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-IP','MAINTAIN_INST_PROPOSAL_DOC','Maintain Institute Proposal Document','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_INST_PROPOSAL_DOC';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-IP','VIEW_INST_PROPOSAL_DOC','View Institute Proposal Document','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'MAINTAIN_AWARD_DOCUMENTS';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-AWARD','MAINTAIN_AWARD_DOCUMENTS','Maintain Award Documents','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_AWARD_DOCUMENTS';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-AWARD','VIEW_AWARD_DOCUMENTS','View Award Documents','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_SUBAWARD_DOCUMENTS';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-SUBAWARD','VIEW_SUBAWARD_DOCUMENTS','View Subaward Documents','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_DEV_PROPOSAL_DOC';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-PD','VIEW_DEV_PROPOSAL_DOC','View Dev Proposal Attachments','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_SHARED_SUBAWARD_DOC';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-SUBAWARD','VIEW_SHARED_SUBAWARD_DOC','View Shared Subaward Attachments','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_SHARED_AWARD_DOC';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-AWARD','VIEW_SHARED_AWARD_DOC','View Shared Award Documents','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_SHARED_INST_PROPOSAL_DOC';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-IP','VIEW_SHARED_INST_PROPOSAL_DOC','View Shared Institute Proposal Documents','Y');
	
end if;

select count(perm_id) into li_count from KRIM_PERM_T where nm = 'VIEW_ALL_SHARED_DOC';
if li_count = 0 then  
    insert into KRIM_PERM_T(PERM_ID,OBJ_ID,VER_NBR,PERM_TMPL_ID,NMSPC_CD,NM,DESC_TXT,ACTV_IND)
    VALUES(KRIM_PERM_ID_S.NEXTVAL,SYS_GUID(),1,NULL,'KC-SYS','VIEW_ALL_SHARED_DOC','View All Shared Documents','Y');
	
end if;

end;
/