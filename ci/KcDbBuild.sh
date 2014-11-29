#!/bin/bash
scriptDir="../kcmit-db/kcmit-db-sql/src/main/resources/edu/mit/kc/sql"
script60Dir="../../kc/coeus-db/coeus-db-sql/src/main/resources/org/kuali/coeus/coeus-sql/current/6.0.0" 

if [ $# -lt 1 ]
then
	echo "Usage: $0 dbuser=<userid> dbpwd=<password> dbsid=<SID>"
	exit
fi

cd $scriptDir
tod=$(date +%Y%m%d%H%M)
usrid=$dbuser
pswd=$dbpwd 
sid=$dbsid

cd 5.2
mkdir -p logs
echo "spool sql52run-${tod}.log"
sqlplus ${usrid}/${pswd}@${sid} @all-sql-52.sql > logs/sql52run-${tod}.log

cd ../6.0
mkdir -p logs
echo "spool sql60run-${tod}.log"
sqlplus ${usrid}/${pswd}@${sid}  @all-sql-60.sql > logs/sql60run-${tod}.log


cd ../notification
mkdir -p logs
echo "spool notifrun-${tod}.log"
sqlplus ${usrid}/${pswd}@${sid} @all-notification-snapshot.sql > logs/notifrun-${tod}.log

cd ../feed
mkdir -p logs
echo "spool feedrun-${tod}.log"
sqlplus ${usrid}/${pswd}@${sid}  @all-feed-snapshot.sql > logs/feedrun-${tod}.log

cd $script60Dir
mkdir -p logs
echo "spool kc60run-${tod}.log"
sqlplus ${usrid}/${pswd}@${sid}  @all-kc60.sql > logs/kc60run-${tod}.log
