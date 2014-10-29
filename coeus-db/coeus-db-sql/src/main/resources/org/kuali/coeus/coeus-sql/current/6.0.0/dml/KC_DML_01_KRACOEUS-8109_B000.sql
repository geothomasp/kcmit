UPDATE KRMS_FUNC_T
SET NM = 'completeNarrativeRule' AND DESC_TXT= 'Complete Narrative Rule'
where FUNC_ID IN (select FUNC_ID from KRMS_FUNC_T where NM= 'incompleteNarrativeRule')
/
