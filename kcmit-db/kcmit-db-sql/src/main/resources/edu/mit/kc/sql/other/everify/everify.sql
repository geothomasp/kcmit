set heading off;
set echo off;
var li_ret number;
spool /home/coeus/everify/notify.log

exec :li_ret := pkg_e_verify_notifications.fn_gen_e_verify_emails;

spool off;
commit;
exit;
