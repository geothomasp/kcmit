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
sqlplus kcso/qa50kc@KCQA @start_sync.sql
