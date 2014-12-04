UPDATE SUBAWARD_CUSTOM_DATA s
SET s.VALUE=(SELECT sc.NEGOTIATION_NUMBER FROM OSP$SUBCONTRACT@coeus.kuali sc
WHERE s.SUBAWARD_CODE=to_number(sc.SUBCONTRACT_CODE) 
AND s.SEQUENCE_NUMBER=sc.SEQUENCE_NUMBER)
WHERE s.CUSTOM_ATTRIBUTE_ID=(SELECT ID FROM CUSTOM_ATTRIBUTE WHERE NAME='NEG_NUMBER_SUB')
/
commit
/
