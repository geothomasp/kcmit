UPDATE ROLODEX T SET T.SPONSOR_ADDRESS_FLAG = 'Y' WHERE T.ROLODEX_ID IN (SELECT T1.ROLODEX_ID FROM SPONSOR T1)
/
UPDATE ROLODEX T SET T.SPONSOR_ADDRESS_FLAG = 'N' WHERE T.ROLODEX_ID NOT IN (SELECT T1.ROLODEX_ID FROM SPONSOR T1)
/
