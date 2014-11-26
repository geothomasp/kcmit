-- Need to set the  utl_file_dir in oracle prameter
-- Alter system set UTL_FILE_DIR='/u01/app/oracle' scope=SPFILE;
-- SELECT * FROM V$PARAMETER where name ='utl_file_dir'
DECLARE
li_ret number;
BEGIN

li_ret:=fn_generate_sap_feed('/u01/app/oracle','admin');
dbms_output.put_line(li_ret);
end;
/
DECLARE
li_ret number;
BEGIN

li_ret:=fn_generate_rolodex_feed('/u01/app/oracle');
dbms_output.put_line(li_ret);
end;
/
DECLARE
li_ret number;
BEGIN

li_ret:=fn_generate_sponsor_feed('/u01/app/oracle');
dbms_output.put_line(li_ret);
end;
/
