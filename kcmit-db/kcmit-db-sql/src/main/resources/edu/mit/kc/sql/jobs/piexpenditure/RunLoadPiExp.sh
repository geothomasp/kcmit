echo `date` 'Starting award sync from COEUS QA ***KCPROD***'

ORACLE_SID=KCDEV
export ORACLE_SID

ORACLE_HOME=/oracle/product/11.2.0.4/db
export ORACLE_HOME
tod=$(date +%Y%m%d%H%M)

ORACLE_CONNECT_STRING=`cat /opt/kc/dbcred/dbcred`
cd /opt/kc/jobs/piexpenditure
$ORACLE_HOME/bin/sqlplus  $ORACLE_CONNECT_STRING @/opt/kc/jobs/piexpenditure/load_dashboard_exp.sql > logs/load_dashboard_exp-${tod}.log

echo `date` 'End award_sync.sh'
mail -s 'PI Expenditure Loaded - KCPROD' kc-notifications@mit.edu < /opt/kc/jobs/logs/load_dashboard_exp-${tod}.log
