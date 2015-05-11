SET DEFINE OFF;
create table TMP_KREW_USR_OPTN_T(
PRSN_OPTN_ID	VARCHAR2(200),
VAL	VARCHAR2(2000));

INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DELEGATOR_FILTER','Secondary Delegators on Action List Page');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DocSearch.LastSearch.Holding1','{"documentStatuses":[],"documentStatusCategories":[],"additionalDocumentTypeNames":[],"dateCreatedFrom":1430862406767,"documentAttributeValues":{},"isAdvancedSearch":"NO","searchOptions":{},"applicationDocumentStatuses":[]}');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('EMAIL_NOTIFICATION','immediate');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('NOTIFY_APPROVE','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_C','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOC_TYPE_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('INITIATOR_COL_SHOW_NEW',null);  
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('CURRENT_NODE_COL_SHOW_NEW','no');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('LAST_APPROVED_DATE_COL_SHOW_NEW','no');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('TITLE_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('ACTION_REQUESTED_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('ACTION_LIST_SIZE_NEW','10');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('NOTIFY_ACKNOWLEDGE',null);
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('NOTIFY_COMPLETE',null);
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DELEGATOR_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_D','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_I','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_R','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DATE_CREATED_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_P','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('NOTIFY_FYI',null);
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('EMAIL_NOTIFY_PRIMARY','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_E','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('CLEAR_FYI_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('WORKGROUP_REQUEST_COL_SHOW_NEW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('OPEN_ITEMS_NEW_WINDOW','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_F','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_X','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('APP_DOC_STATUS_COL_SHOW_NEW',null);     
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('REFRESH_RATE','15');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_A','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DOCUMENT_STATUS_COLOR_S','white');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('USE_OUT_BOX','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('EMAIL_NOTIFY_SECONDARY','yes');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DocSearch.LastSearch.Order','DocSearch.LastSearch.Holding1,DocSearch.LastSearch.Holding0');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('DocSearch.LastSearch.Holding0','{"documentStatuses":[],"documentStatusCategories":[],"additionalDocumentTypeNames":[],"dateCreatedFrom":1430679105372,"documentAttributeValues":{},"isAdvancedSearch":"NO","searchOptions":{},"applicationDocumentStatuses":[]}');
INSERT INTO TMP_KREW_USR_OPTN_T(PRSN_OPTN_ID,VAL)
VALUES('PRIMARY_DELEGATE_FILTER','Primary Delegates on Action List Page');
commit
/
declare
cursor c_krew_usr is
select p.PRNCPL_ID from KRIM_PRNCPL_T p 
left outer join KREW_USR_OPTN_T k on p.PRNCPL_ID = k.PRNCPL_ID
where k.PRNCPL_ID is null;
r_krew_usr c_krew_usr%rowtype;

begin
     if c_krew_usr%isopen then
	    close c_krew_usr;
	 end if;
	 open c_krew_usr;
	 loop
	 fetch c_krew_usr into r_krew_usr;
	 exit when c_krew_usr%notfound;
	 
	     insert into KREW_USR_OPTN_T(PRNCPL_ID,
                                     PRSN_OPTN_ID,
                                     VAL,
                                     VER_NBR)
							  select r_krew_usr.PRNCPL_ID,
							         PRSN_OPTN_ID,
									 VAL,
									 1
								from TMP_KREW_USR_OPTN_T;
								
	 end loop;
	 close c_krew_usr;

end;
/