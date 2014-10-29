echo `date` 'Starting pfeed.sh ***Coeus Production Database***'

ORACLE_SID=OSPA
export ORACLE_SID

ORACLE_HOME=/oracle/product/11.2.0/db
export ORACLE_HOME

ORACLE_CONNECT_STRING=`cat /home/coeus/ospauser/id`
$ORACLE_HOME/bin/sqlplus  $ORACLE_CONNECT_STRING @/home/coeus/pfeed/pfeed.sql


echo `date` 'End pfeed.sh'

mail -s 'Person Feed - Production Database - OSPA' mit-kc-dev@mit.edu < /home/coeus/pfeed/pfeed.log