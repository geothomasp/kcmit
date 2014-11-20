set heading off;
set echo off;
var li_ret number;
spool /home/coeus/rcr/notify_rcr.log

exec :li_ret := pkg_rcr_notifcations.fn_send_notification(1);
exec :li_ret := pkg_rcr_notifcations.fn_send_notification(2);
exec :li_ret := pkg_rcr_notifcations.fn_send_notification(3);
exec :li_ret := pkg_rcr_notifcations.fn_send_notification(4);
exec :li_ret := pkg_rcr_notifcations.fn_send_notification(5);

spool off;
commit;
exit;