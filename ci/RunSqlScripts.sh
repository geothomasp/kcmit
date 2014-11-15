#!/bin/bash
export ORACLE_HOME=/oracle/product/11.2.0/client
export LD_LIBRARY_PATH=$ORACLE_HOME/lib
export PATH=$PATH:$LD_LIBRARY_PATH:$ORACLE_HOME/bin:/usr/local/bin
env=$ENV
scriptDir="kcmit-db/kcmit-db-sql/src/main/resources/edu/mit/kc/sql/6.0"
cd $scriptDir
git pull --rebase origin master
tod=$(date +%Y%m%d%H%M)
echo $tod
echo "spool sqlrun-${tod}.log"
sqlplus kcso/dev50kc@KCDEV @all-sql-snapshot.sql
#sqlplus kcso/qawkly50kc@KCQAWKLY @all-sql-snapshot.sql
cat all-ddl-snapshot.sql > "all-ddl-$tod.sql"
cat all-dml-snapshot.sql > "all-dml-$tod.sql"
> all-ddl-snapshot.sql;
> all-dml-snapshot.sql;
#git checkout master
git add .
git commit -am 'reset all snapshots'
#git push origin master
