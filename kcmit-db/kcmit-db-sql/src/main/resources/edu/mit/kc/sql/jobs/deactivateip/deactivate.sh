ORACLE_SID=OSPA
export ORACLE_SID

ORACLE_HOME=/oracle/product/11.2.0/db
export ORACLE_HOME

ORACLE_CONNECT_STRING=`cat /home/coeus/ospauser/id`
$ORACLE_HOME/bin/sqlplus  $ORACLE_CONNECT_STRING @/home/coeus/deactivateip/deactivate.sql


echo `date` 'End deactivate.sh'

mail -s 'Deactivate IP  - Production ' coeus-mit@mit.edu < /home/coeus/deactivateip/deactivate.log