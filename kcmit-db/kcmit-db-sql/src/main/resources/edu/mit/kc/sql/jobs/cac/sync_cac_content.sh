#!/bin/bash

CREDS="/etc/creds/samba/creds.txt"
SRC_DIR="departmental/osp/CAC"
DST_DIR="/home/coeus/cac"
FILE="CAC.tab"
SRC_FILE="//win.mit.edu/dfs/departmental/osp/CAC"

/usr/bin/smbclient -A $CREDS '//win.mit.edu/dfs/' -D $SRC_DIR -c "get $FILE $DST_DIR/$FILE"
/usr/bin/smbclient -A $CREDS '//win.mit.edu/dfs/' -D $SRC_DIR -c "del $FILE"