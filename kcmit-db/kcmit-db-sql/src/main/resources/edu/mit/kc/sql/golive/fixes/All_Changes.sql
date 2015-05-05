select Coeus_Award_Template_Count,KC_Award_Template_Count from
(select count(*) Coeus_Award_Template_Count from OSP$TEMPLATE_COMMENTS@coeus.kuali)a, 
(select count(*) KC_Award_Template_Count from AWARD_TEMPLATE_COMMENTS)b;


select count(*) from osp$unit@coeus.kuali

select count(*) from osp$SPONSOR_HIERARCHY@coeus.kuali

select max(to_number(proposal_number)) from osp$eps_proposal@coeus.kuali

select max(to_number(proposal_number)) from eps_proposal

select 

select max(FEED_ID)  from SAP_FEED_DETAILS


create user anish_a identified by anishR0cks;
create role KC_VIEW;
grant select any table to KC_VIEW;
grant KC_VIEW to anish_a;
grant create session to anish_a;

select count(*) from award_attachment

select count(*) from attachment_file

select count(*) from osp$award_documents@coeus.kuali

ALTER TABLE AWARD_ATTACHMENT ENABLE CONSTRAINT FK_AWARD_ATTACHMENT_TYPE

ALTER TABLE AWARD_ATTACHMENT ENABLE CONSTRAINT FK_AW_ATT_AWARD

ALTER TABLE AWARD_ATTACHMENT ADD CONSTRAINT FK_ATTACHMENT_FILE FOREIGN KEY (FILE_ID) REFERENCES ATTACHMENT_FILE(FILE_ID)

ALTER TABLE PROTOCOL_ATTACHMENT_PROTOCOL DISABLE CONSTRAINT FK_PA_PROTOCOL_FILE
/
ALTER TABLE PROTOCOL_ATTACHMENT_PERSONNEL DISABLE CONSTRAINT FK_PA_PERSONNEL_FILE
/
delete from ATTACHMENT_FILE where FILE_ID in ( select FILE_ID from PROTOCOL_ATTACHMENT_PERSONNEL )
/
commit
/
delete from PROTOCOL_ATTACHMENT_PERSONNEL
/
commit
/
select count(*) from PROTOCOL_ATTACHMENT_PROTOCOL


delete from ATTACHMENT_FILE where FILE_ID in ( select FILE_ID from PROTOCOL_ATTACHMENT_PROTOCOL )


select count(*) from narrative_attachment where file_data_id not in (select id from file_data)

select count(*) from file_data

select count(*) from eps_prop_person_bio_attachment where file_data_id not in (select id from file_data)

select count(*)  from file_data a, narrative_attachment b 
where b.file_data_id = a.id

select file_data_id from  narrative_attachment


select id from file_data where id in ('15280F02B7A7C00CE0537C2C091220FE')
update krms_agenda_t set actv ='Y'



select distinct t1.rule_id, t1.module_item_code, t1.module_sub_item_code, t2.questionnaire_id, t2.sequence_number
 from questionnaire_usage@KC_STAG_DB_LINK t1
 inner join questionnaire@KC_STAG_DB_LINK t2 on t1.questionnaire_ref_id_fk = t2.questionnaire_ref_id
 where t1.rule_id is not null
 and t2.sequence_number in ( select max(s1.sequence_number) from questionnaire@KC_STAG_DB_LINK s1
                             where s1.questionnaire_id = t2.questionnaire_id );
                             
                             
                             
                             
update krms_agenda_t set actv ='Y'
                             
                             
update questionnaire_usage set rule_id=null                             
                             
                             
select * from document_access where doc_hdr_id in (select document_number from eps_proposal where proposal_number = '1027')

select distinct role_nm from document_access
                             

update document_access set role_nm = 'Approver Document Level' where role_nm='Approver'

alter table document_access drop constraint UQ_DOCUMENT_ACCESS1
commit;
update document_access set role_nm = 'Aggregator Document Level' where role_nm='Aggregator'

update eps_proposal_budget_ext set status_code='1' where status_code='C'
update eps_proposal_budget_ext set status_code='2' where status_code='I'

select count(*) from sap_feed_details

UPDATE sap_feed_details SET award_number = replace(award_number,'-','-00');

sap_budget_feed_batch_list SET no_of_records = li_no_of_records  WHERE sap_budget_feed_batch_id = li_sap_budget_feed_batch_id;

select count(*) from 

select count(*) from budget_details where cost_element='422121'

update krms_term_parm_t set nm='Sponsor Type Code' where nm='Sponsor Code'

update krms_term_parm_t set nm='Unit Number' where nm='Lead Unit Number'

select * from krms_term_parm_t where nm='CompetitionId'

update krms_term_parm_t set nm='Sponsor Type Code' where nm='CompetitionId'

select * from krms_term_parm_t where nm='Fellowship Codes' and val is null

update krms_term_parm_t set nm='Unit Number' where nm='Fellowship Codes' and val is null

update questionnaire_usage set rule_id='10094' where QUESTIONNAIRE_REF_ID_FK='444161'

select questionnaire_label, rule_id from questionnaire_usage@kc_stag_db_link where rule_id is not null

select KRMS_TERM_S.nextval from dual;

select * from krms_agenda_t
 where typ_id = 'KC1004';
 
 update krms_agenda_t set actv='Y'
 
 select * from question where question_id = '103'
 
 update question set question_id = '143' where question='Have lobbying activities been conducted on behalf of this proposal? Disclosure of Lobbying Activities (GPG, Chapter II.C.1.e)'

 update question set question_id = '144' where question like 'Select a Funding Mechanism'

 

