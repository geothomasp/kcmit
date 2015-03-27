-- deprecated
-- Need to set the  utl_file_dir in oracle prameter
-- Alter system set UTL_FILE_DIR='/u01/app/oracle' scope=SPFILE;
-- SELECT * FROM V$PARAMETER where name ='utl_file_dir'
--user directory 
--create or replace directory DIR_KC_SAP_FEED as '/u01/app/oracle/oradata'
--grant read, write on directory DIR_KC_SAP_FEED to km60010215

DECLARE
li_ret number;
BEGIN

li_ret:=fn_generate_master_sap_feed('DIR_KC_SAP_FEED','admin');
dbms_output.put_line(li_ret);
end;
/
DECLARE
li_ret number;
BEGIN

li_ret:=fn_generate_rolodex_feed('DIR_KC_SAP_FEED','admin');
dbms_output.put_line(li_ret);
end;
/
DECLARE
li_ret number;
BEGIN

li_ret:=fn_generate_sponsor_feed('DIR_KC_SAP_FEED','admin');
dbms_output.put_line(li_ret);
end;
/
