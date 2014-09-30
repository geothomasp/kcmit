Spool logs/error.log;
set feedback off;
set heading off;
set term on;
set serveroutput on;
select 'Started role right migration.' from dual;
@ddl_role_rights.sql
@kc_coeus_role_mapping.sql
@kc_coeus_right_mapping.sql
@role_bootstrap.sql
@perm_bootstrap.sql
@role_perm_bootstrap.sql
@truncate_and_apply_bootstrap.sql
commit;
@sycing_role_rights.sql
@load_coeus_user_roles.sql
commit;
select 'completed role right migration.' from dual;
Spool Off;
Set define On;
Set feedback On;

