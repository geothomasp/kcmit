
CREATE OR REPLACE FUNCTION FN_DOCUMENT_NEXTVAL 
(AS_DOCUMENT_NBR IN DOCUMENT_NEXTVALUE.DOCUMENT_NUMBER%TYPE,
AS_PROPERTY_NAME IN DOCUMENT_NEXTVALUE.PROPERTY_NAME%TYPE) RETURN NUMBER IS 
li_nextValue number;
li_ver_nbr number:=1; 
li_count number;
li_return number;
BEGIN

SELECT COUNT(*) into li_count  FROM DOCUMENT_NEXTVALUE WHERE DOCUMENT_NUMBER=AS_DOCUMENT_NBR AND PROPERTY_NAME=AS_PROPERTY_NAME;

IF li_count=0 THEN     
li_return:=1;
li_nextValue:=2;
INSERT INTO DOCUMENT_NEXTVALUE(DOCUMENT_NUMBER,PROPERTY_NAME,NEXT_VALUE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
VALUES(AS_DOCUMENT_NBR,AS_PROPERTY_NAME,li_nextValue,SYSDATE,USER,li_ver_nbr,SYS_GUID());     
ELSE

SELECT NEXT_VALUE INTO li_nextValue FROM DOCUMENT_NEXTVALUE WHERE DOCUMENT_NUMBER=AS_DOCUMENT_NBR AND PROPERTY_NAME=AS_PROPERTY_NAME;
li_return:=li_nextValue;
li_nextValue:=li_nextValue+1;
UPDATE DOCUMENT_NEXTVALUE SET NEXT_VALUE=li_nextValue WHERE DOCUMENT_NUMBER=AS_DOCUMENT_NBR AND PROPERTY_NAME=AS_PROPERTY_NAME;

END IF;
RETURN li_return;

EXCEPTION 
WHEN OTHERS THEN
dbms_output.put_line('Error occured'||substr(sqlerrm,1,200));
RETURN -1;

END FN_DOCUMENT_NEXTVAL;
/