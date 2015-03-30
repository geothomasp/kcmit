create or replace
function fn_generate_sap_budget_feed(as_path IN VARCHAR2,
					as_update_user IN VARCHAR2,
					as_batch_id IN NUMBER,
					as_dt_now IN DATE)
return number is

ls_award_budget_status			krcr_parm_t.val%TYPE;
li_sap_budget_feed_details_id	sap_budget_feed_details.sap_budget_feed_details_id%type;	
ls_sap_feed_fiscal_year			krcr_parm_t.val%TYPE;
li_budget_id 					award_budget_ext.budget_id%type;
ls_account_number				award.account_number%type;
li_no_of_records				NUMBER;
ls_batch_file_name              sap_budget_feed_batch_list.batch_file_name%type;
ls_amount 						sap_budget_feed.amount%type;
ret 							number;
li_inserted                     PLS_INTEGER := 0;
	CURSOR c_sap_bud_det IS
		SELECT	t1.budget_id,
		t2.account_number,
		t2.award_number,
		t2.sequence_number
		FROM AWARD_BUDGET_EXT t1
		INNER JOIN AWARD t2 on t1.award_id = t2.award_id
		WHERE t1.AWARD_BUDGET_STATUS_CODE IN ( select regexp_substr(ls_award_budget_status,'[^,]+', 1, level) from dual
												connect by regexp_substr(ls_award_budget_status, '[^,]+', 1, level) is not null );		
		r_sap_bud_det c_sap_bud_det%rowtype;

	CURSOR c_award_budget is
		select t1.cost_element as gl_account_key,
		sum(t1.line_item_cost) amount
		from budget_details t1 		
		where t1.budget_id = li_budget_id   
		group by t1.cost_element
		UNION	
		select t3.gl_account_key,
		sum(t2.calculated_cost) amount
		from budget_details t1 
		inner join budget_details_cal_amts t2 on t1.budget_details_id = t2.budget_details_id
		inner join sap_bud_rate_class_gl_mapping t3 on t1.on_off_campus_flag = t3.on_off_campus_flag 
													and t2.rate_class_code = t3.rate_class_code 
		where t1.budget_id = li_budget_id
		group by t3.gl_account_key;
		r_award_budget c_award_budget%rowtype;
		
begin	
	
	begin				
		select val into ls_award_budget_status from krcr_parm_t where parm_nm = 'SAP_AWD_BUD_FEED_STATUS';
	
	exception
	when others then
		raise_application_error(-20101, 'Error occured while fetching SAP_AWD_BUD_FEED_STATUS. '||sqlerrm);
		return -1;
	end;
	
	select val into ls_sap_feed_fiscal_year from krcr_parm_t where parm_nm = 'SAP_FEED_CURRENT_FISCAL_YEAR';
	
	li_no_of_records := 0;
	open c_sap_bud_det;
	loop
	fetch c_sap_bud_det into r_sap_bud_det;
	exit when c_sap_bud_det%notfound;
	
		li_sap_budget_feed_details_id := seq_sap_budget_feed_details_id.nextval;
		ls_account_number := r_sap_bud_det.account_number;
		
		INSERT INTO SAP_BUDGET_FEED_DETAILS(
		SAP_BUDGET_FEED_DETAILS_ID,
		BATCH_ID,
		BUDGET_ID,
		AWARD_NUMBER,
		SEQUENCE_NUMBER,
		FEED_STATUS,
		UPDATE_USER,
		UPDATE_TIMESTAMP,
		VER_NBR,
		OBJ_ID
		)
		VALUES(
		li_sap_budget_feed_details_id,
		as_batch_id,
		r_sap_bud_det.budget_id,
		r_sap_bud_det.award_number,
		r_sap_bud_det.sequence_number,
		'P',
		lower(as_update_user),
		sysdate,
		1,
		sys_guid()
		);
			li_inserted := 1;
			li_budget_id := r_sap_bud_det.budget_id;
			
			open c_award_budget;
			loop
			fetch c_award_budget into r_award_budget;
			exit when c_award_budget%notfound;
			
				if r_award_budget.amount >= 0 then
						ls_amount := '+'||LPAD(r_award_budget.amount, 9, '0');
				else
						ls_amount := '-'||LPAD(ABS(r_award_budget.amount), 9, '0');
				end if;
			
				INSERT INTO SAP_BUDGET_FEED(
							SAP_BUDGET_FEED_ID,
							SAP_BUDGET_FEED_DETAILS_ID,
							BATCH_ID,
							FISCAL_YEAR,
							ACCOUNT_NUMBER,
							COST_ELEMENT,
							AMOUNT,
							VER_NBR,
							OBJ_ID
							)
				VALUES(  SEQ_SAP_BUDGET_FEED_ID.NEXTVAL,
						 li_sap_budget_feed_details_id,
						 as_batch_id,
						 ls_sap_feed_fiscal_year,
						 ls_account_number,
						 r_award_budget.gl_account_key,
						 ls_amount,
						 1,
						 sys_guid()
					  );
					  
					 li_no_of_records := li_no_of_records + 1; 
					 
			end loop;
			close c_award_budget;
			
	
	
	end loop;
	close c_sap_bud_det;

		ls_batch_file_name := concat(concat(concat('dospfpl1.', ltrim(to_char(as_batch_id, '000'))), '.'),
															to_char(as_dt_now, 'YYYYMMDDHH24MISS'));
		IF li_inserted = 1 THEN
			INSERT INTO sap_budget_feed_batch_list(
							sap_budget_feed_batch_id,
							batch_id,
							batch_file_name,
							batch_timestamp,
							update_user,
							no_of_records,
							update_timestamp,
							ver_nbr,
							obj_id
							)
					VALUES(
					seq_sap_budget_feed_batch_id.nextval,
					as_batch_id,
					ls_batch_file_name,
					as_dt_now,
					as_update_user,
					li_no_of_records,
					sysdate,
					1,
					sys_guid()
					);
		END IF;		
		
		UPDATE 	AWARD_BUDGET_EXT SET AWARD_BUDGET_STATUS_CODE = 9 --Posted
		WHERE budget_id IN ( SELECT budget_id FROM SAP_BUDGET_FEED_DETAILS WHERE BATCH_ID = as_batch_id);
		
		UPDATE SAP_BUDGET_FEED_DETAILS SET FEED_STATUS = 'F'  WHERE BATCH_ID = as_batch_id;
		
		COMMIT;		
		
		
	ret := fn_spool_awd_budget_batch(as_batch_id, as_path);

	return as_batch_id;

end;
/
