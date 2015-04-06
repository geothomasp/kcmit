create or replace
function fn_generate_master_sap_feed
					(as_path VARCHAR2,
					as_update_user VARCHAR2)
return number is
li_batch_id 				SAP_FEED_BATCH_LIST.BATCH_ID%TYPE;
ld_now						DATE;
ret 							number;
begin	
	
	SELECT seq_sap_batch_id.NEXTVAL, sysdate
	INTO li_batch_id, ld_now
	FROM DUAL;
	
	begin
		ret := fn_generate_sap_budget_feed(as_path,as_update_user,li_batch_id,ld_now);
	exception
	when others then
		raise_application_error(-20100, 'Exception in fn_generate_sap_budget_feed. Error is ' || SQLERRM);
		ret := -1;
	end;
	
	begin
		ret := fn_generate_sap_feed(as_path,as_update_user,li_batch_id,ld_now);
	exception
	when others then
		raise_application_error(-20101, 'Exception in fn_generate_sap_feed. Error is ' || SQLERRM);
		ret := -1;
	end;	
	
	return ret;

end;
/