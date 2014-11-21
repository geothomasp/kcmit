echo `date` 'Starting pfeed.sh ***Kuali Coeus QA Database***'

ORACLE_SID=KCDEV
export ORACLE_SID

ORACLE_HOME=/oracle/product/11.2.0.4/db
export ORACLE_HOME

ORACLE_CONNECT_STRING=`cat /opt/kc/dbcred/dbcred`
$ORACLE_HOME/bin/sqlplus  $ORACLE_CONNECT_STRING @/opt/kc/jobs/pfeed/person_feed.sql


echo `date` 'End pfeed.sh'

mail -s 'Person Feed - Dev Database - KCSO' kc-mit-dev@mit.edu < /opt/kc/jobs/pfeed/pfeed.log