
declare
cursor c_protocol is
  select protocol_id, document_number, protocol_number, sequence_number, instr(protocol_number,'A') amendc, instr(protocol_number,'R') renwc 
  from protocol
  where protocol_number in ('1005003884A005', '1005003884R005', '1005003879R005', '1504007096')
  and active = 'Y';

li_count NUMBER(10);
li_protocol_status_code VARCHAR2(3);
 
begin

FOR protocol_rec in c_protocol
LOOP

	DELETE from PROTOCOL_ONLN_RVWS p where p.PROTOCOL_ID = protocol_rec.protocol_id;
	
	DELETE from PROTOCOL_REVIEWERS p where p.PROTOCOL_ID = protocol_rec.protocol_id;
	
	DELETE from PROTOCOL_EXPIDITED_CHKLST p where p.PROTOCOL_ID = protocol_rec.protocol_id;
	
	SELECT COUNT(*) 
	into li_count
	FROM PROTOCOL_ACTIONS p where p.protocol_id = protocol_rec.protocol_id
	AND protocol_action_type_code = '100';
	
	if li_count = 0 then
		update PROTOCOL_ACTIONS set protocol_action_type_code = '100',
		comments = 'ProtocolBase created', submission_number = null, submission_id_fk = null
		where PROTOCOL_ID = protocol_rec.protocol_id and protocol_action_type_code = '101';
	else	
		DELETE from PROTOCOL_ACTIONS p where p.PROTOCOL_ID = protocol_rec.protocol_id and
		protocol_action_type_code <> '100';
	end if;
	
	DELETE from PROTOCOL_SUBMISSION p where p.PROTOCOL_ID = protocol_rec.protocol_id;

	if protocol_rec.amendc > 0 then
		li_protocol_status_code := '105';
	elsif protocol_rec.renwc > 0 then
		li_protocol_status_code := '106';
	else	
		li_protocol_status_code := '100';
	end if;

	update PROTOCOL set protocol_status_code = li_protocol_status_code
	where PROTOCOL_ID = protocol_rec.protocol_id;

	UPDATE KREW_DOC_HDR_T
	SET DOC_HDR_STAT_CD = 'S', rte_lvl=0, rte_prncpl_id = null
	WHERE DOC_HDR_ID = protocol_rec.document_number;
	
	DELETE from DOCUMENT_NEXTVALUE
	WHERE DOCUMENT_NUMBER = protocol_rec.document_number and property_name = 'submissionNumber';

END LOOP;

end;

/
