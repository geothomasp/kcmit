select ' Start time of  update PROPOSAL is ' from dual
/
DECLARE
li_ver_nbr NUMBER(8):=1;
li_proposal_id NUMBER(12,0);
ls_document_number VARCHAR2(40);
ls_unit_number VARCHAR2(8);
--ls_fiscal_year CHAR(4);
li_ip_review   NUMBER(12,0);
li_ip_review_join_id NUMBER(12,0);
ls_current_account_number VARCHAR2(100);
ls_curr_acc_num VARCHAR2(7);
ls_app_doc_stat VARCHAR2(64):=null;
ls_cfda_num VARCHAR2(7);
ls_person_id VARCHAR2(40);
ls_initial_contract_admin	VARCHAR2(40);
li_new_seq NUMBER(4,0):=0;
ls_proposal_number VARCHAR2(8);
li_krew_rnt_brch NUMBER(19,0);
li_krew_rnt_node NUMBER(19,0);
li_krew_rne_node_instn NUMBER(19,0);

li_loop number;
li_commit_count number:=0;

CURSOR c_proposal IS
SELECT OSP$PROPOSAL.PROPOSAL_NUMBER,OSP$PROPOSAL.SEQUENCE_NUMBER,SPONSOR_PROPOSAL_NUMBER,PROPOSAL_TYPE_CODE,CURRENT_ACCOUNT_NUMBER,TITLE,SPONSOR_CODE,ROLODEX_ID,NOTICE_OF_OPPORTUNITY_CODE,GRAD_STUD_HEADCOUNT,
GRAD_STUD_PERSON_MONTHS,TYPE_OF_ACCOUNT,ACTIVITY_TYPE_CODE,REQUESTED_START_DATE_INITIAL,REQUESTED_START_DATE_TOTAL,REQUESTED_END_DATE_INITIAL,REQUESTED_END_DATE_TOTAL,TOTAL_DIRECT_COST_INITIAL,TOTAL_DIRECT_COST_TOTAL,TOTAL_INDIRECT_COST_INITIAL,TOTAL_INDIRECT_COST_TOTAL,NUMBER_OF_COPIES,DEADLINE_DATE,DEADLINE_TYPE,MAIL_BY,MAIL_TYPE,MAIL_ACCOUNT_NUMBER,SUBCONTRACT_FLAG,COST_SHARING_INDICATOR,IDC_RATE_INDICATOR,SPECIAL_REVIEW_INDICATOR,STATUS_CODE,UPDATE_TIMESTAMP,UPDATE_USER,SCIENCE_CODE_INDICATOR,NSF_CODE,PRIME_SPONSOR_CODE,CREATE_TIMESTAMP,INITIAL_CONTRACT_ADMIN,IP_REVIEW_REQ_TYPE_CODE,
REVIEW_SUBMISSION_DATE,REVIEW_RECEIVE_DATE,REVIEW_RESULT_CODE,IP_REVIEWER,IP_REVIEW_ACTIVITY_INDICATOR,REPLACE(trim(current_award_number),'-','-00') as CURRENT_AWARD_NUMBER,CFDA_NUMBER,OPPORTUNITY,AWARD_TYPE_CODE,KEY_PERSON_INDICATOR
FROM OSP$PROPOSAL@coeus.kuali INNER JOIN TEMP_TAB_TO_SYNC_IP t on OSP$PROPOSAL.PROPOSAL_NUMBER = t.PROPOSAL_NUMBER 
and OSP$PROPOSAL.SEQUENCE_NUMBER = t.SEQUENCE_NUMBER
WHERE t.FEED_TYPE='C' 
order by OSP$PROPOSAL.PROPOSAL_NUMBER,OSP$PROPOSAL.SEQUENCE_NUMBER;
r_proposal c_proposal%ROWTYPE;


BEGIN

IF c_proposal%ISOPEN THEN
CLOSE c_proposal;
END IF;

OPEN c_proposal;
li_loop:=0;
LOOP
FETCH c_proposal INTO r_proposal;
EXIT WHEN c_proposal%NOTFOUND;

	ls_proposal_number:=r_proposal.PROPOSAL_NUMBER;
	BEGIN
	SELECT t1.UNIT_NUMBER INTO ls_unit_number FROM OSP$PROPOSAL_UNITS@coeus.kuali t1 WHERE t1.LEAD_UNIT_FLAG='Y' AND t1.PROPOSAL_NUMBER=r_proposal.PROPOSAL_NUMBER 
	AND t1.SEQUENCE_NUMBER = (	select max(t2.SEQUENCE_NUMBER) from OSP$PROPOSAL_UNITS@coeus.kuali t2
								where t2.PROPOSAL_NUMBER = t1.PROPOSAL_NUMBER 
								and   t2.SEQUENCE_NUMBER <= r_proposal.SEQUENCE_NUMBER
							 );

	EXCEPTION
	WHEN NO_DATA_FOUND THEN
	ls_unit_number:=NULL;
	END;

	li_new_seq := r_proposal.SEQUENCE_NUMBER;
	ls_person_id:=r_proposal.IP_REVIEWER;   
	ls_initial_contract_admin:=r_proposal.INITIAL_CONTRACT_ADMIN;         

	BEGIN
	
		UPDATE IP_REVIEW SET
		IP_REVIEW_REQ_TYPE_CODE = r_proposal.IP_REVIEW_REQ_TYPE_CODE,
		REVIEW_SUBMISSION_DATE  = r_proposal.REVIEW_SUBMISSION_DATE,
		REVIEW_RECEIVE_DATE		= r_proposal.REVIEW_RECEIVE_DATE,
		REVIEW_RESULT_CODE		= r_proposal.REVIEW_RESULT_CODE,
		IP_REVIEWER				= ls_person_id,
		UPDATE_TIMESTAMP		= r_proposal.UPDATE_TIMESTAMP,
		UPDATE_USER				= r_proposal.UPDATE_USER
		WHERE PROPOSAL_NUMBER = r_proposal.PROPOSAL_NUMBER
		AND   SEQUENCE_NUMBER =  li_new_seq;
		
	EXCEPTION
	WHEN OTHERS THEN
	dbms_output.put_line('ERROR IN updating IP_REVIEW,PROPOSAL_NUMBER:'||r_proposal.PROPOSAL_NUMBER||'-'||sqlerrm);
	END;

	ls_cfda_num:=r_proposal.CFDA_NUMBER;  

	if  ls_cfda_num IS NOT NULL then         
	select substr(trim(ls_cfda_num),1,2)||'.'||substr(trim(ls_cfda_num),3) into ls_cfda_num from dual;
	end if;


	BEGIN
		ls_current_account_number:=r_proposal.CURRENT_ACCOUNT_NUMBER;
		SELECT SUBSTR(trim(ls_current_account_number),1,7)INTO ls_curr_acc_num FROM DUAL;

		UPDATE PROPOSAL SET
		LEAD_UNIT_NUMBER 		= ls_unit_number,
		SPONSOR_PROPOSAL_NUMBER = r_proposal.SPONSOR_PROPOSAL_NUMBER,
		PROPOSAL_TYPE_CODE		= r_proposal.PROPOSAL_TYPE_CODE,
		CURRENT_ACCOUNT_NUMBER	= ls_curr_acc_num,
		TITLE					= r_proposal.TITLE,
		SPONSOR_CODE			= r_proposal.SPONSOR_CODE,
		ROLODEX_ID				= r_proposal.ROLODEX_ID,
		NOTICE_OF_OPPORTUNITY_CODE	= r_proposal.NOTICE_OF_OPPORTUNITY_CODE,
		GRAD_STUD_HEADCOUNT		=	r_proposal.GRAD_STUD_HEADCOUNT,
		GRAD_STUD_PERSON_MONTHS	= r_proposal.GRAD_STUD_PERSON_MONTHS,
		TYPE_OF_ACCOUNT			= r_proposal.TYPE_OF_ACCOUNT,
		ACTIVITY_TYPE_CODE		= r_proposal.ACTIVITY_TYPE_CODE,
		REQUESTED_START_DATE_INITIAL = r_proposal.REQUESTED_START_DATE_INITIAL,
		REQUESTED_START_DATE_TOTAL	=	r_proposal.REQUESTED_START_DATE_TOTAL,
		REQUESTED_END_DATE_INITIAL	=	r_proposal.REQUESTED_END_DATE_INITIAL,
		REQUESTED_END_DATE_TOTAL = r_proposal.REQUESTED_END_DATE_TOTAL,
		TOTAL_DIRECT_COST_INITIAL = r_proposal.TOTAL_DIRECT_COST_INITIAL,
		TOTAL_DIRECT_COST_TOTAL	= r_proposal.TOTAL_DIRECT_COST_TOTAL,
		TOTAL_INDIRECT_COST_INITIAL = r_proposal.TOTAL_INDIRECT_COST_INITIAL,
		TOTAL_INDIRECT_COST_TOTAL = r_proposal.TOTAL_INDIRECT_COST_TOTAL,
		NUMBER_OF_COPIES	=	r_proposal.NUMBER_OF_COPIES,
		DEADLINE_DATE	=	r_proposal.DEADLINE_DATE,
		DEADLINE_TYPE	= r_proposal.DEADLINE_TYPE,
		MAIL_BY	= r_proposal.MAIL_BY,
		MAIL_TYPE = r_proposal.MAIL_TYPE,
		MAIL_ACCOUNT_NUMBER = r_proposal.MAIL_ACCOUNT_NUMBER,
		SUBCONTRACT_FLAG = r_proposal.SUBCONTRACT_FLAG,
		COST_SHARING_INDICATOR = r_proposal.COST_SHARING_INDICATOR,
		IDC_RATE_INDICATOR = r_proposal.IDC_RATE_INDICATOR,
		SPECIAL_REVIEW_INDICATOR = r_proposal.SPECIAL_REVIEW_INDICATOR,
		STATUS_CODE	= r_proposal.STATUS_CODE,
		SCIENCE_CODE_INDICATOR = r_proposal.SCIENCE_CODE_INDICATOR,
		NSF_CODE	=	r_proposal.NSF_CODE,
		PRIME_SPONSOR_CODE	=	r_proposal.PRIME_SPONSOR_CODE,
		INITIAL_CONTRACT_ADMIN	=	ls_initial_contract_admin,
		IP_REVIEW_ACTIVITY_INDICATOR	= r_proposal.IP_REVIEW_ACTIVITY_INDICATOR,
		CURRENT_AWARD_NUMBER	=  r_proposal.CURRENT_AWARD_NUMBER,
		CFDA_NUMBER		=	ls_cfda_num,
		OPPORTUNITY	=	r_proposal.OPPORTUNITY,
		UPDATE_TIMESTAMP	=	r_proposal.UPDATE_TIMESTAMP,
		UPDATE_USER	=	r_proposal.UPDATE_USER,
		AWARD_TYPE_CODE 	=	r_proposal.AWARD_TYPE_CODE
		WHERE PROPOSAL_NUMBER = r_proposal.PROPOSAL_NUMBER
		AND   SEQUENCE_NUMBER =  li_new_seq;
				
		--INSERT INTO SYNC_AWARD_LOG(feed_id,execution_date) VALUES(r_award.feed_id,sysdate);

	EXCEPTION
	WHEN OTHERS THEN
	dbms_output.put_line('ERROR IN updateting PROPOSAL,PROPOSAL_NUMBER:'||r_proposal.PROPOSAL_NUMBER||'SEQUENCE_NUMBER:'||r_proposal.SEQUENCE_NUMBER||'-'||sqlerrm);
	END;


END LOOP;
CLOSE c_proposal;

END;
/
select ' End time of  update PROPOSAL is ' from dual
/