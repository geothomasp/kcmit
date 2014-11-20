echo `date` 'Starting RCR Notifications ** RCR  PROD'

cd /home/coeus/rcr

ORACLE_BASE=/oracle
export ORACLE_BASE

ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db
export ORACLE_HOME

LIBHOME=$ORACLE_HOME/lib
export LIBHOME

ORACLE_CONNECT_STRING=`cat /home/coeus/ospauser/id`

$ORACLE_HOME/bin/sqlplus $ORACLE_CONNECT_STRING @/home/coeus/rcr/notify.sql
mail -s "RCR Notifications - Production" coeus-dev-team@mit.edu < /home/coeus/rcr/notify_rcr.log
echo `date` 'End RCR Data load.sh'
