-- Adding fina; mapping to delete and update role
delete from KC_ROLE_UPDATE_ACTION
/
commit
/
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Active Committee Member On Iacuc Protocol','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Institute Proposal Document','KC-ADM','Maintain Institute Proposal Attachments','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Active IACUC Committee Member','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Active IACUC Committee Member on Protocol','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Active IACUC Committee Member on Scheduled Date','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Affiliate','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Audit Division Authorizations','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Award Budget Aggregator','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Business Rules Maintainer','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('CA','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('COI','KC-NEGOTIATION',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('COI','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('COI Administrator','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Coi Disclosure Reviewer','KC-COIDISCLOSURE',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('CRC','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Delete Proposal Document Level','KC-PD',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Faculty','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Faculty Supervisor','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Administrator','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Online Reviewer','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Protocol Aggregator','KC-PROTOCOL',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Protocol Approver','KC-PROTOCOL',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Protocol Creator','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Protocol Viewer','KC-PROTOCOL',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Reviewer','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Organization Correspondent','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUC Unit Correspondent','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('IACUCWorkflowApprover','KC-WKFLW',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Investigators','KC-NEGOTIATION',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('KP','KC-NEGOTIATION',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Arra Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Award Budget','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Award Budget for RAFT','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Award Documents','KC-ADM','Maintain Award Attachments','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Conflict of Interest','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Custom Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Notifications','KC-SYS',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Proposal Questionnaire Document Level','KC-PD',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Questionnaire','KC-SYS',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain RTF Forms','KC-SYS',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Reporting Requirements','KC-ADM','Maintain Award Reporting Tracking','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Maintain Subcontracting Goals','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify all IACUC Protocols','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Arra Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Award Budget','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Institute Proposal','KC-ADM','Maintain Institute Proposal','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Negotiations','KC-ADM','Maintain Negotiations','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('MAINTAIN USER ROLES','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Manager','KC-SYS',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('MIT Maintain Reporting Roles','KC-SYS',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Organizations','KC-SYS','Maintain Organizations','KC-SYS','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Proposal Log','KC-ADM','Maintain Proposal Log','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Subcontract','KC-ADM','Maintain Subcontract','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Template','KC-SYS','Maintain Template','KC-SYS','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Modify Training','KC-SYS',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Negotiation Administrator','KC-NEGOTIATION',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Negotiation SuperUser','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Negotiator','KC-NEGOTIATION',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Non-Faculty','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Person Maintainer','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('PI','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Receive Disclosure Notice','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Rolodex Maintainer','KC-ADM','Maintain Rolodex','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Award Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Budget Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Committee Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Dev Proposal Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Global Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Person Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Protocol Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Rolodex Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Sponsor Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run Unit Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Run User Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Sponsor Maintainer','KC-ADM','Maintain Sponsor','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Sponsor Rules Maintainer','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('SP','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('Student Investigator','KC-IACUC',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View all IACUC Protocols','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Arra Reports','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Award Documents','KC-ADM','View Award Attachments','KC-AWARD','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Conflict of Interest','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Departments Awards','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Departments Proposals','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Institute Proposal Document','KC-ADM','View Institute Proposal Attachments','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Institutionally Maintained Salaries','KC-PD',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Institutionally Maintained Salaries Document Level','KC-PD',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Key Person Maintenance','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Keyperson Maintenance','KC-AWARD',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Pending Disclosures','KC-ADM',null,null,'D');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Shared Award Documents','KC-ADM','View Shared Award Attachments','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Shared Institute Proposal Documents','KC-ADM','View Shared Institute Proposal Attachments','KC-ADM','U');
Insert into KC_ROLE_UPDATE_ACTION (ROLE_NM,NMSPC_CD,NEW_ROLE_NM,NEW_NMSPC_CD,ACTION_TYP) values ('View Subcontract Documents','KC-ADM','View Subcontract Attachments','KC-ADM','U');
commit
/
commit
/
--- Adding final mapping to a temp table START
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create CountryMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create DocumentTypeDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create NamespaceMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create ParameterMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create PeopleFlowMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create RoutingRuleDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create StateMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create TermSpecificationMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Grant Permission','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Grant Responsibility','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Initiate Simple Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain Person Training','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain System Parameter','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Modify Sponsor Hierarchy','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Populate Group','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Populate KC Groups','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Save Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','View Active Special Review Types','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-B');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KR-RULE-TEST');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain Training','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Administer Pessimistic Locking','KR-NS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Modify Question','KC-Questionnaire');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Alter Proposal Data','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Blanket Approve AwardDocument','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Edit Kuali ENROUTE Document Route Status Code I','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Grant Permission','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Grant Responsibility KUALI Namespace','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Route Document','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Take Requested Approve Action','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Take Requested FYI Action','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create Context Maintenance Document','KR-NS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create TermSpecification Maintenance Document','KR-NS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Allow Backdoor Login','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Add Proposal Viewer','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Maintain ProposalHierarchy','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Modify Budget','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Modify Narrative','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Modify Proposal Rates','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Modify ProposalDevelopmentDocument','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Modify ProposalPermissions','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','NOTIFY_PROPOSAL_PERSONS','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Print Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Recall Document','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Recall Document','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Recall Document','KR-WKFLW');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','Submit ProposalDevelopmentDocument','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','View Budget','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','View Narratives','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','View Personnel Salaries','KC-B');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','View Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','VIEW_INSTITUTIONAL_SALARIES','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Aggregator','KC-PD','UnitHierarchy','VIEW_PROP_PERSON_INST_SALARIES','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('All Unit Administrators','KC-AWARD','Derived Role: All Award Unit Administrators',null,null);
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('All Unit Administrators','KC-IP','Derived Role: All Institutional Proposal Unit Administrators',null,null);
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('All Unit Administrators','KC-PD','Derived Role: All Proposal Unit Administrators',null,null);
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('All Unit Administrators Document Level','KC-PD','Derived Role: Document Access',null,null);
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','Create AwardBudget','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','Maintain AwardBudgetRouting','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','Modify AwardBudget','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','Post AwardBudget','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','Submit AwardBudget','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','View Award','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','View AwardBudget','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Award Budget Administrator','KC-AB','UnitHierarchy','View Personnel Salaries','KC-B');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Create Temporary Proposal Log','KC-ADM','UnitHierarchy','Create Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Create Temporary Proposal Log','KC-ADM','UnitHierarchy','Edit Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Create Temporary Proposal Log','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Create Temporary Proposal Log','KC-ADM','UnitHierarchy','Open Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Create Temporary Proposal Log','KC-ADM','UnitHierarchy','Save Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Create Temporary Proposal Log','KC-ADM','UnitHierarchy','Submit Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Feed Maintainer','KC-SYS','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Initiator or Reviewer','KR-WKFLW','Derived Role: Route Log','Add Note  Attachment Kuali Document','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Initiator or Reviewer','KR-WKFLW','Derived Role: Route Log','Cancel Document','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IP Review Maintainer','KC-ADM','UnitHierarchy','Create Intellectual Property Review','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IP Review Maintainer','KC-ADM','UnitHierarchy','Edit Intellectual Property Review','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IP Review Maintainer','KC-ADM','UnitHierarchy','Open Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IP Review Maintainer','KC-ADM','UnitHierarchy','Open Intellectual Property Review','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IP Review Maintainer','KC-ADM','UnitHierarchy','Save Intellectual Property Review','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IP Review Maintainer','KC-ADM','UnitHierarchy','Submit Intellectual Property Review','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Administrative Correction','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Assign IRB Committee','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Create CommitteeDocument','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Create IRB Correspondence','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Create or Modify Research Areas','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Create ProtocolDocument','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Delete Protocol','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Edit Protocol Billable','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Generate Agenda','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Administer Routing for Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Assign Role','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Assign Role','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Blanket Approve AwardDocument','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Blanket Approve CommitteeDocument','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Blanket Approve Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Blanket Approve ProposalDevelopmentDocument','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Blanket Approve ProtocolDocument','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Blanket Approve TimeAndMoneyDocument','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Cancel Document','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create AgendaEditorMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create CampusMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create ContextMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create CountyMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create IdentityManagementDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create ParameterDetailTypeMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create ParameterTypeMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create PostalCodeMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create RoutingRuleDelegationMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create RuleMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create TermMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Grant Permission','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Grant Responsibility','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Initiate RICE Document','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Log In Kuali Portal','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain System Parameter','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Modify Entity','KR-IDM');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Modify Unit','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Route Document','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Unrestricted Document Search','KR-WKFLW');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','View Other Action List','KR-WKFLW');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-COIDISCLOSURE');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Maintain KRMS Agenda','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create Valid Rate','KC-M');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Inquire Into Pessimistic  ','KR-NS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Modify Questionnaire','KC-Questionnaire');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Add Proposal Viewer','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Blanket Approve AwardBudgetDocument','KC-AB');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Blanket Approve Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Blanket Approve RICE Document','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Export Any Record','KR-NS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','View Active Special Review Types','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','View Budget','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','View Narratives','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','VIEW NEGOTIATION - UNRESTRICTED','KC-NEGOTIATION');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','View Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','VIEW_SUBAWARD_DOCUMENTS  ','KC-SUBAWARD  ');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','Maintain Award Attachments  ','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('OSP Administrator','KC-ADM','UnitHierarchy','MAINTAIN_INST_PROPOSAL_DOC  ','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Ad Hoc Review Document - Acknowledge','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Ad Hoc Review Document - Approve','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Ad Hoc Review Document - FYI','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Add Message to Route Log','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Add Sponsor','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Administer Routing for Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Administer Routing RICE Document','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Assign Role','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Cancel Document','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create PeopleFlowMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create RoutingRuleDelegationMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create RoutingRuleDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create RuleMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Edit Kuali ENROUTE Document Route Status Code R','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Edit Kuali ENROUTE Document Route Status Code S','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Grant Responsibility','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Modify Sponsor','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Take Requested Acknowledge Action','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Take Requested Complete Action','KUALI');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create PersonMassChangeDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('System Administrator','KC-ADM','UnitHierarchy','Create Term Maintenance Document','KR-NS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Maintain Protocol Online Reviews','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Modify Batch Correspondence Detail','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Modify IRB Correspondence','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Institute Proposal Attachments','KC-ADM','UnitHierarchy','MAINTAIN_INST_PROPOSAL_DOC ','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Award Reporting Tracking','KC-ADM','UnitHierarchy','Modify Award Report Tracking  ','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor Hierarchy','KC-SYS','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor Hierarchy','KC-ADM','UnitHierarchy','Edit_WL ','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Modify Budget','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Modify Narrative','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Modify ProposalDevelopmentDocument','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Print Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','View Narratives','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Add Proposal Viewer','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Institute Proposal','KC-ADM','UnitHierarchy','Edit Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Institute Proposal','KC-ADM','UnitHierarchy','Save Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Institute Proposal','KC-ADM','UnitHierarchy','Submit Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Negotiations','KC-ADM','Default','VIEW NEGOTIATION - UNRESTRICTED','KC-NEGOTIATION');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Organizations','KC-SYS','UnitHierarchy','Modify Organization','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Proposal Log','KC-ADM','UnitHierarchy','Edit Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Proposal Log','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','Create Subaward Invoice','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','MODIFY SUBAWARD','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','Open Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','Submit Subaward Document','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','View Subaward Invoice','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Template','KC-SYS','UnitHierarchy','View Award Sponsor Template','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Submission','KC-ADM','UnitHierarchy','Print Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Submission','KC-ADM','UnitHierarchy','Submit to Sponsor','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Submission','KC-ADM','UnitHierarchy','View Narratives','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Submission','KC-ADM','UnitHierarchy','View Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Role Maintenance','KC-ADM','UnitHierarchy','Assign Role','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Role Maintenance','KC-ADM','UnitHierarchy','Grant Permission','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Rolodex','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Rolodex','KC-ADM','UnitHierarchy','View Address Book','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor','KC-ADM','UnitHierarchy','Modify Sponsor','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor','KC-ADM','UnitHierarchy','View Sponsor','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Copy RICE Document','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create AgendaMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Create CampusTypeMaintenanceDocument','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Generate Minutes','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Generate Schedule','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Maintain Memberships','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Maintain Minutes','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Maintain Protocol Notes','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Maintain Protocol Online Review Comments','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Maintain Protocol Submissions','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Modify Committee','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Schedule','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Award Attachments','KC-ADM','UnitHierarchy','Maintain Award Attachments','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Modify Correspondence Template','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Modify Protocol','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Modify Protocol Submission','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Modify Schedule','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Perform Committee Actions','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Perform IRB Actions on a Protocol','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Protocol Review Not Required','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','Submit Protocol','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Active Protocol Review Types','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Active Protocol Types','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Active Special Review Types','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Agenda','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Committee','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View IRB Correspondence','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Member Details','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Minutes','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Protocol','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Protocol Online Review Comments','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('IRB Administrator','KC-PROTOCOL','UnitHierarchy','View Restricted Notes','KC-PROTOCOL');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Award Attachments','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Institute Proposal Attachments','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Key Person','KC-AWARD','UnitHierarchy','Maintain Keyperson','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Award Reporting Tracking','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor Hierarchy','KC-SYS','UnitHierarchy','Add Sponsor Hierarchy','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor Hierarchy','KC-SYS','UnitHierarchy','Modify Sponsor Hierarchy','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor Hierarchy','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Modify Proposal Rates','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','Modify ProposalPermissions','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','View Budget','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Modify All Dev Proposals','KC-PD','UnitHierarchy','View Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Institute Proposal','KC-ADM','UnitHierarchy','Create Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Institute Proposal','KC-ADM','UnitHierarchy','View Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Negotiations','KC-ADM','Default','CREATE ACTIVITIES','KC-NEGOTIATION');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Negotiations','KC-ADM','Default','CREATE NEGOTIATION','KC-NEGOTIATION');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Negotiations','KC-ADM','Default','MODIFY NEGOTIATION','KC-NEGOTIATION');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Negotiations','KC-ADM','Default','MODIFY ACTIVITIES','KC-NEGOTIATION');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Organizations','KC-SYS','UnitHierarchy','Add Organization','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Organizations','KC-SYS','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Proposal Log','KC-ADM','UnitHierarchy','Create Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Proposal Log','KC-ADM','UnitHierarchy','Open Proposal Log','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','CREATE SUBAWARD','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','Modify Subaward Invoice','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','Open RICE Document','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Subcontract','KC-ADM','Default','VIEW SUBAWARD','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Template','KC-SYS','UnitHierarchy','Create Award Sponsor Template','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Template','KC-SYS','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Template','KC-SYS','UnitHierarchy','Modify Award Sponsor Template','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('PI','KC-PROTOCOL','Derived Role: Protocol Personnel',null,null);
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Proxy Certify','KC-ADM','Unit','Certify','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Submission','KC-ADM','UnitHierarchy','Create Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Submission','KC-ADM','UnitHierarchy','Submit Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Proposal Submission','KC-ADM','UnitHierarchy','View Budget','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Role Maintenance','KC-ADM','UnitHierarchy','Assign Role','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Role Maintenance','KC-ADM','UnitHierarchy','Grant Permission','KR-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Rolodex','KC-ADM','UnitHierarchy','Add Address Book','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Rolodex','KC-ADM','UnitHierarchy','Modify Address Book','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor','KC-ADM','UnitHierarchy','Add Sponsor','KC-UNT');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Maintain Sponsor','KC-ADM','UnitHierarchy','Initiate Document','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Unit Administrator','KC-WKFLW','Derived Role - Unit Administrator','Open Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Unit Administrator','KC-WKFLW','Derived Role - Unit Administrator','View Active Special Review Types','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Unit Correspondent','KC-PROTOCOL','Derived Role: IRB Correspondent',null,null);
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View All Dev Proposals','KC-ADM','UnitHierarchy','View Proposal','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View All Dev Proposals','KC-ADM','UnitHierarchy','View Budget  ','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View All Dev Proposals','KC-ADM','UnitHierarchy','View Narratives  ','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Award Attachments','KC-ADM','UnitHierarchy','View Award Attachments','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Dev Proposal Attachments','KC-ADM','UnitHierarchy','VIEW_DEV_PROPOSAL_DOC ','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Institute Proposal','KC-ADM','UnitHierarchy','Open Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Institute Proposal Attachments','KC-ADM','UnitHierarchy','Open Institutional Proposal','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Institute Proposal Attachments','KC-ADM','UnitHierarchy','VIEW_INST_PROPOSAL_DOC  ','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Negotiations','KC-ADM','UnitHierarchy','VIEW NEGOTIATION - UNRESTRICTED','KC-NEGOTIATION');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Shared Award Attachments','KC-ADM','UnitHierarchy','VIEW_SHARED_AWARD_DOC','KC-AWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Shared Institute Proposal Attachments','KC-ADM','UnitHierarchy','VIEW_SHARED_INST_PROPOSAL_DOC','KC-IP');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Shared Subaward Attachments','KC-SUBAWARD','UnitHierarchy','VIEW_SHARED_SUBAWARD_DOC','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Subaward','KC-ADM','UnitHierarchy','VIEW SUBAWARD','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Subaward','KC-ADM','UnitHierarchy','View Subaward Invoice','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View Subcontract Attachments','KC-ADM','UnitHierarchy','VIEW_SUBAWARD_DOCUMENTS ','KC-SUBAWARD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('View WL ','KC-ADM','UnitHierarchy','Vie_WL','KC-PD');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Add Sponsor Hierarchy','KC-SYS');
Insert into TMP_ROLE_PERM_MAPPING (ROLE_NM,ROLE_NMSPC_CD,ROLE_KIM_TYP_NM,PERM_NM,PERM_NMSPC_CD) values ('Application Administrator','KC-SYS','UnitHierarchy','Add Unit','KC-UNT');
commit;
--- Adding final mapping to a temp table START
INSERT INTO KC_COEUS_ROLE_PERM_MAPPING(ROLE_NM,ROLE_NMSPC_CD,PERM_NM,PERM_NMSPC_CD)
select distinct t1.COEUS_ROLES,t2.NMSPC_CD as ROLE_NMSPC_CD, t4.nm,t4.NMSPC_CD as PERM_NMSPC_CD  from kc_coeus_role_mapping t1
inner join krim_role_t t2 on t1.kc_roles = t2.role_nm
inner join krim_role_perm_t t3 on t2.role_id = t3.role_id
inner join krim_perm_t t4 on t4.perm_id = t3.perm_id
where t1.kc_roles is not null
/
commit
/
INSERT INTO KC_COEUS_ROLE_PERM_MAPPING(ROLE_NM,ROLE_NMSPC_CD,PERM_NM,PERM_NMSPC_CD)
select distinct t1.role_name, decode(t1.role_type,'P','KC-PD','R','KC-PROTOCOL','S','KC-ADM','KC-SYS') as ROLE_NMSPC_CD , t4.kc_perm_nm, t4.nmspc_cd
from osp$role t1
inner join osp$role_rights t3 on t3.role_id = t1.role_id
inner join kc_coeus_right_mapping t4 on t4.coeus_right_id = t3.right_id
left outer join kc_coeus_role_mapping t2 on t1.role_name = t2.COEUS_ROLES
where t2.COEUS_ROLES is null
/
commit
/
--INSERT INTO KC_COEUS_ROLE_PERM_MAPPING(ROLE_NM,KC_PERM_NM)
--VALUES('OSP Administrator','Allow Backdoor Login')
--/
DELETE FROM KC_COEUS_ROLE_PERM_MAPPING WHERE ROLE_NM IN ( SELECT ROLE_NM FROM TMP_ROLE_PERM_MAPPING )
/
commit
/
INSERT INTO KC_COEUS_ROLE_PERM_MAPPING(ROLE_NM,ROLE_NMSPC_CD,PERM_NM,PERM_NMSPC_CD)
SELECT ROLE_NM,ROLE_NMSPC_CD,PERM_NM,PERM_NMSPC_CD FROM TMP_ROLE_PERM_MAPPING
/
commit
/

