set define off
set sqlblanklines on
spool KC-RELEASE-3_1_SP3-Upgrade-ORACLE-Install.log
@ORACLE/TABLES/KC_TBL_AWARD_TEMPLATE_REPORT_TERMS.sql
@ORACLE/TABLES/KC_TBL_COST_ELEMENT.sql
@ORACLE/TABLES/KC_TBL_PROPOSAL_LOG.sql
@ORACLE/DML/KC_DML_BS1_COST_ELEMENT.sql
@ORACLE/DML/KC_DML_BS1_SPONSOR_FORM_TEMPLATES.sql
commit;
exit;
