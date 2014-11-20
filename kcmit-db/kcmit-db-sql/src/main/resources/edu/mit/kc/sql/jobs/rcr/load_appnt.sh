echo `date` 'Starting Load RCR Appointments.sh ** RCR load KCQA'

cd /opt/kc/jobs/rcr

ORACLE_BASE=/oracle
export ORACLE_BASE

ORACLE_HOME=$ORACLE_BASE/product/11.2.0.4/db/
export ORACLE_HOME

LIBHOME=$ORACLE_HOME/lib
export LIBHOME

ORACLE_CONNECT_STRING=`cat /opt/kc/dbcred/dbcred`

$ORACLE_HOME/bin/sqlplus $ORACLE_CONNECT_STRING @/opt/kc/jobs/rcr/loadrcr.sql
mail -s "KCQA - RCR data load log" kc-mit-dev@mit.edu < /opt/kc/jobs/rcr/rcr_load.log
echo `date` 'End RCR Data load.sh'
