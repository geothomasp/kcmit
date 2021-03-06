alter table negotiation_agreement_type modify description varchar2(200)
/
DECLARE

CURSOR c_agr_type IS
SELECT NEGOTIATION_AGREE_TYPE_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER FROM OSP$NEGOTIATION_AGREEMENT_TYPE@Coeus.Kuali;
r_agr_type c_agr_type%ROWTYPE;


BEGIN

IF c_agr_type%ISOPEN THEN
CLOSE c_agr_type;
END IF;
OPEN c_agr_type;
LOOP
FETCH c_agr_type INTO r_agr_type;
EXIT WHEN c_agr_type%NOTFOUND;

UPDATE NEGOTIATION_AGREEMENT_TYPE
SET DESCRIPTION=r_agr_type.DESCRIPTION
WHERE NEGOTIATION_AGRMNT_TYPE_ID=r_agr_type.NEGOTIATION_AGREE_TYPE_CODE;

END LOOP;
CLOSE c_agr_type;
END;
/

