echo `date` 'Starting E-Verify Notifications ** E-Verify  Prod'

cd /home/coeus/everify

ORACLE_BASE=/oracle
export ORACLE_BASE

ORACLE_HOME=$ORACLE_BASE/product/11.2.0/db
export ORACLE_HOME

LIBHOME=$ORACLE_HOME/lib
export LIBHOME

ORACLE_CONNECT_STRING=`cat /home/coeus/ospauser/id`

$ORACLE_HOME/bin/sqlplus $ORACLE_CONNECT_STRING @/home/coeus/everify/notify.sql
mail -s "E-Verify Notification log" coeus-dev-team@mit.edu < /home/coeus/everify/notify_everify.log
echo `date` 'End E-Verify Notification.sh'
