select ' Start time of UPDATE_AWARD_AMOUNT_TRANSACTION is '|| localtimestamp from dual
/
DECLARE

CURSOR c_trans_upd IS
select aat.TRANSACTION_ID,replace(aat.MIT_AWARD_NUMBER,'-','-00') AWARD_NUMBER,decode(aat.TRANSACTION_TYPE_CODE,0,6,aat.TRANSACTION_TYPE_CODE) TRANSACTION_TYPE_CODE,aat.NOTICE_DATE,
aat.COMMENTS,aat.UPDATE_TIMESTAMP,aat.UPDATE_USER,1,SYS_GUID() from OSP$AWARD_AMOUNT_TRANSACTION aat inner join TEMP_TAB_TO_SYNC_AWARD ts on aat.MIT_AWARD_NUMBER=ts.MIT_AWARD_NUMBER 
where ts.FEED_TYPE='C';
r_trans_upd c_trans_upd%ROWTYPE;

BEGIN
IF c_trans_upd%ISOPEN THEN
CLOSE c_trans_upd;
END IF;
OPEN c_trans_upd;
LOOP
FETCH c_trans_upd INTO r_trans_upd;
EXIT WHEN c_trans_upd%NOTFOUND;

UPDATE AWARD_AMOUNT_TRANSACTION
SET TRANSACTION_TYPE_CODE=r_trans_upd.TRANSACTION_TYPE_CODE,
NOTICE_DATE=r_trans_upd.NOTICE_DATE,
COMMENTS=r_trans_upd.COMMENTS,
UPDATE_TIMESTAMP=r_trans_upd.UPDATE_TIMESTAMP,
UPDATE_USER=r_trans_upd.UPDATE_USER
WHERE AWARD_NUMBER=r_trans_upd.AWARD_NUMBER;

END LOOP;
CLOSE c_trans_upd;
END;
/
select ' End time of UPDATE_AWARD_AMOUNT_TRANSACTION is '|| localtimestamp from dual
/