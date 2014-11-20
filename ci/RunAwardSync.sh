#!/bin/bash
export ORACLE_HOME=/oracle/product/11.2.0/client
export LD_LIBRARY_PATH=$ORACLE_HOME/lib
export PATH=$PATH:$LD_LIBRARY_PATH:$ORACLE_HOME/bin:/usr/local/bin
env=$ENV
scriptDir="kcmit-db/kcmit-db-sql/src/main/resources/edu/mit/kc/sql/award_sync"
tod=$(date +%Y%m%d%H%M)
echo $tod
echo "spool sqlrun-${tod}.log"
cd $scriptDir
sqlplus kcso/qawkly50kc@KCQAWKLY @start_sync.sql > award_sync_qawkly-${tod}.log
sqlplus kcso/dev50kc@KCQDEV @start_sync.sql > award_sync_dev-${tod}.log
