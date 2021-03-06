UPDATE AWARD_REPORT_TERMS SET  OSP_DISTRIBUTION_CODE=-1
WHERE OSP_DISTRIBUTION_CODE IS NULL;

create index AWARD_REP_I1 ON AWARD_REPORT_TERMS(AWARD_ID,REPORT_CLASS_CODE,REPORT_CODE,FREQUENCY_CODE,FREQUENCY_BASE_CODE,OSP_DISTRIBUTION_CODE);

create index AWARD_REP_TERMS_I1 ON AWARD_REP_TERMS_RECNT(AWARD_REPORT_TERMS_ID,CONTACT_TYPE_CODE,ROLODEX_ID);
commit;
/


DECLARE
li_min NUMBER(12);

CURSOR c_rep IS
SELECT a.AWARD_REPORT_TERMS_ID,a.AWARD_ID,a.AWARD_NUMBER,a.SEQUENCE_NUMBER,a.REPORT_CLASS_CODE,a.REPORT_CODE,
a.FREQUENCY_CODE,a.FREQUENCY_BASE_CODE,a.OSP_DISTRIBUTION_CODE,a.DUE_DATE,ar.CONTACT_ID,ar.CONTACT_TYPE_CODE,ar.ROLODEX_ID,ar.NUMBER_OF_COPIES
FROM AWARD_REPORT_TERMS a INNER JOIN AWARD_REP_TERMS_RECNT ar
ON a.AWARD_REPORT_TERMS_ID=ar.AWARD_REPORT_TERMS_ID
ORDER BY a.AWARD_ID;
r_rep c_rep%ROWTYPE;

BEGIN
IF c_rep%ISOPEN THEN
CLOSE c_rep;
END IF;
OPEN c_rep;
LOOP
FETCH c_rep INTO r_rep;
EXIT WHEN c_rep%NOTFOUND;
BEGIN
select min(AWARD_REPORT_TERMS_ID) INTO li_min FROM AWARD_REPORT_TERMS
WHERE AWARD_ID=r_rep.AWARD_ID AND REPORT_CLASS_CODE=r_rep.REPORT_CLASS_CODE AND REPORT_CODE=r_rep.REPORT_CODE
AND FREQUENCY_CODE=r_rep.FREQUENCY_CODE AND FREQUENCY_BASE_CODE=r_rep.FREQUENCY_BASE_CODE AND OSP_DISTRIBUTION_CODE=r_rep.OSP_DISTRIBUTION_CODE
GROUP BY AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,REPORT_CLASS_CODE,REPORT_CODE,
FREQUENCY_CODE,FREQUENCY_BASE_CODE,OSP_DISTRIBUTION_CODE,DUE_DATE;
EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line(r_rep.AWARD_ID||' '||r_rep.REPORT_CLASS_CODE||' '||r_rep.REPORT_CODE||' '||r_rep.FREQUENCY_CODE||' '||r_rep.FREQUENCY_BASE_CODE||' '||r_rep.OSP_DISTRIBUTION_CODE);
END;

UPDATE AWARD_REP_TERMS_RECNT
SET AWARD_REPORT_TERMS_ID=li_min
WHERE AWARD_REPORT_TERMS_ID=r_rep.AWARD_REPORT_TERMS_ID
AND CONTACT_TYPE_CODE=r_rep.CONTACT_TYPE_CODE
AND ROLODEX_ID=r_rep.ROLODEX_ID;

END LOOP;
CLOSE c_rep;
END;
/
DECLARE
CURSOR c_del IS
SELECT  distinct AWARD_ID FROM AWARD_REPORT_TERMS;
r_del c_del%ROWTYPE;

BEGIN
IF c_del%ISOPEN THEN
CLOSE c_del;
END IF;
OPEN c_del;
LOOP
FETCH c_del INTO r_del;
EXIT WHEN c_del%NOTFOUND;

DELETE FROM AWARD_REPORT_TERMS WHERE AWARD_REPORT_TERMS_ID NOT IN
(select min(AWARD_REPORT_TERMS_ID) FROM AWARD_REPORT_TERMS
WHERE AWARD_ID=r_del.AWARD_ID
GROUP BY AWARD_ID,AWARD_NUMBER,SEQUENCE_NUMBER,REPORT_CLASS_CODE,REPORT_CODE,
FREQUENCY_CODE,FREQUENCY_BASE_CODE,OSP_DISTRIBUTION_CODE,DUE_DATE)
AND AWARD_ID=r_del.AWARD_ID;

END LOOP;
CLOSE c_del;
END;
/
--set serveroutput  on;



