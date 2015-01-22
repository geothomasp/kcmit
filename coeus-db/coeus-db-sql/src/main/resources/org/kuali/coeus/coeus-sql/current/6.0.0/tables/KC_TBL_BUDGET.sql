alter table BUDGET add PARENT_DOCUMENT_TYPE_CODE varchar2(10)
/

update BUDGET set PARENT_DOCUMENT_TYPE_CODE = (select PARENT_DOCUMENT_TYPE_CODE from BUDGET_DOCUMENT where BUDGET.DOCUMENT_NUMBER = BUDGET_DOCUMENT.DOCUMENT_NUMBER)
/

alter table BUDGET modify PARENT_DOCUMENT_TYPE_CODE varchar2(10) not null
/

alter table BUDGET modify DOCUMENT_NUMBER varchar2(40) null
/

alter table BUDGET add BUDGET_NAME varchar2(255)
/

update BUDGET set BUDGET_NAME = (select FDOC_DESC from KRNS_DOC_HDR_T where BUDGET.DOCUMENT_NUMBER = KRNS_DOC_HDR_T.DOC_HDR_ID)
/

ALTER TABLE BUDGET
ADD (CREATE_TIMESTAMP TIMESTAMP )
/

ALTER TABLE BUDGET
ADD (CREATE_USER VARCHAR(60) )
/
