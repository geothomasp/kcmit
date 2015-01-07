Spool logs/error.log;
set feedback off;
set heading off;
set term on;
set serveroutput on;
select 'Started role right migration.'|| localtimestamp from dual;
@scripts/ddl_role_rights.sql
@scripts/kc_coeus_role_mapping.sql
@scripts/kc_coeus_right_mapping.sql
@scripts/role_bootstrap.sql
@scripts/perm_bootstrap.sql
@scripts/role_perm_bootstrap.sql
@scripts/truncate_and_apply_bootstrap.sql
@scripts/kc_coeus_role_perm_mapping.sql
commit;
@scripts/syncing_role_rights.sql
@scripts/load_coeus_user_roles.sql
@scripts/add_role_perm_manually.sql
@scripts/document_access_irb.sql
@scripts/document_access_eps.sql
@scripts/document_access_iacuc.sql
commit;
select 'completed role right migration.'|| localtimestamp from dual;
Spool Off;
Set define On;
Set feedback On;
/
EXIT
/