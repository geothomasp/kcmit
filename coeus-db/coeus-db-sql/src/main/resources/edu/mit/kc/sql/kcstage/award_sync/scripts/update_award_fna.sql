select ' Started UPDATE_AWARD_AMT_FNA_DISTRIBUTION ' from dual
/
DELETE FROM AWARD_PERSON_CREDIT_SPLITS WHERE AWARD_PERSON_ID IN (SELECT AWARD_PERSON_ID FROM AWARD_PERSON_CREDIT_SPLITS WHERE AWARD_PERSON_ID NOT IN(SELECT AWARD_PERSON_ID FROM AWARD_PERSONS))
/
DELETE FROM AWARD_PERS_UNIT_CRED_SPLITS WHERE AWARD_PERSON_UNIT_ID IN (SELECT AWARD_PERSON_UNIT_ID FROM AWARD_PERSON_UNITS WHERE AWARD_PERSON_ID NOT IN(SELECT AWARD_PERSON_ID FROM AWARD_PERSONS))
/
DELETE FROM AWARD_PERSON_UNITS WHERE AWARD_PERSON_ID IN (SELECT AWARD_PERSON_ID FROM AWARD_PERSON_UNITS WHERE AWARD_PERSON_ID NOT IN(SELECT AWARD_PERSON_ID FROM AWARD_PERSONS))
/
ALTER TABLE AWARD_PERSON_UNITS ENABLE  CONSTRAINT FK_APU_AW_PERSON
/
ALTER TABLE AWARD_PERSON_CREDIT_SPLITS ENABLE CONSTRAINT FK_AP_CREDIT_SPLIT_AP
/
select ' Ended UPDATE_AWARD_AMT_FNA_DISTRIBUTION ' from dual
/