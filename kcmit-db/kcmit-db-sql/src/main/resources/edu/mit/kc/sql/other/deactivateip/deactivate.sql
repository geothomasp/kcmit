ORACLE_SID=OSPA
export ORACLE_SID

ORACLE_HOME=/oracle/product/11.2.0/db
export ORACLE_HOME

ORACLE_CONNECT_STRING=`cat /home/coeus/ospauser/id`
$ORACLE_HOME/bin/sqlplus  $ORACLE_CONNECT_STRING @/home/coeus/deactivateip/deactivate.sql


echo `date` 'End deactivate.sh'

mail -s 'Deactivate IP  - Production ' coeus-mit@mit.edu < /home/coeus/deactivateip/deactivate.log
coeus@osp-award.MIT.EDU> cat /home/coeus/deactivateip/deactivate.sql
set heading off;
set echo off;
var ls_ret varchar2(10);
spool /home/coeus/deactivateip/deactivate.log
set lin 200;


exec :ls_ret := fn_deactivate_inst_prop;

select 'Deactivate script run on ' || :ls_ret  from dual;


select 'List of Proposals Deactivated ' from dual;
select  PROPOSAL_NUMBER || ' - ' ||  TITLE
from temp_deactivated_ip;

spool off;
commit;
exit;