#!/bin/bash
env=$ENV
scriptDir="src/config/sql/5.2"
tod=$(date +%Y%m%d)
echo $tod
echo "spool sqlrun-${tod}.log"
cd $scriptDir
sqlplus kcso/dev50kc@KCDEV @all-sql-snapshot.sql
sqlplus kcso/qa50kc@KCQA @all-sql-snapshot.sql
cat all-ddl-snapshot.sql > "all-ddl-$tod.sql"
cat all-dml-snapshot.sql > "all-dml-$tod.sql"
> all-ddl-snapshot.sql;
> all-dml-snapshot.sql;
git add src/config/sql/5.2/.
git commit -am 'reset all snapshots'
git push
