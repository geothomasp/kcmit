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
li_sap_budget_feed_batch_id     sap_budget_feed_batch_list.sap_budget_feed_batch_id%type;
ls_amount 						sap_budget_feed.amount%type;
ret 							number;
li_inserted                     PLS_INTEGER := 0;
li_count 						NUMBER;
ls_cost_element     			SAP_BUDGET_FEED.COST_ELEMENT%type;
ls_auth_total					sap_feed.auth_total%type;
ls_mit_account_number				sap_feed.mit_sap_account%type;

	CURSOR c_sap_bud_det IS
		SELECT	t1.budget_id,
		t2.account_number,
		t2.award_number,
		t2.sequence_number
		FROM AWARD_BUDGET_EXT t1
		INNER JOIN AWARD t2 on t1.award_id = t2.award_id    
		WHERE t2.SEQUENCE_NUMBER in ( select  max(s1.sequence_number)  from  AWARD s1
									  INNER JOIN KREW_DOC_HDR_T s2 on s2.DOC_HDR_ID = s1.DOCUMENT_NUMBER    
									  WHERE s1.award_number  =  t2.award_number
									  AND s2.DOC_HDR_STAT_CD = 'F' 
									)
		AND t2.status_code <> 6  -- do not include award on hold status                             
		AND t1.AWARD_BUDGET_STATUS_CODE IN ( select regexp_substr(ls_award_budget_status,'[^,]+', 1, level) from dual
												connect by regexp_substr(ls_award_budget_status, '[^,]+', 1, level) is not null );		
		r_sap_bud_det c_sap_bud_det%rowtype;

	CURSOR c_award_budget is
		select t1.cost_element as gl_account_key,
		sum(t1.line_item_cost) amount
		from budget_details t1 		
		where t1.budget_id = li_budget_id   
		group by t1.cost_element
		
		UNION	
		
		SELECT decode(t3.activity_type_code,1,'422121', '422123') gl_account_key,
			nvl(t1.amount,0) AS AMOUNT
		FROM (
			  select t1.budget_id,
			  sum(t1.total_indirect_cost) amount
			  from budget_periods t1 	   
			  where t1.budget_id = li_budget_id
			  group by t1.budget_id    
			) t1 	
		INNER JOIN  AWARD_BUDGET_EXT t2 on t1.budget_id = t2.budget_id
		INNER JOIN award t3 on t2.award_id = t3.award_id
		
		UNION
		
		select '422127' As gl_account_key,
		nvl(sum(TOTAL_FRINGE_AMOUNT),0) AS amount
		from award_budget_period_ext t1
		inner join budget_periods t2 on t1.budget_period_number = t2.budget_period_number
		where t2.budget_id = li_budget_id;		
	
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
	
	
		SELECT	count(t1.budget_id) INTO li_count
		FROM AWARD_BUDGET_EXT t1
		INNER JOIN AWARD t2 on t1.award_id = t2.award_id
		WHERE t2.status_code != 6 and -- do not include award on hold status 
		t1.AWARD_BUDGET_STATUS_CODE IN ( select regexp_substr(ls_award_budget_status,'[^,]+', 1, level) from dual
												connect by regexp_substr(ls_award_budget_status, '[^,]+', 1, level) is not null );
		
		IF li_count = 0 THEN -- There is nothing to feed
			return -100;
		END IF;	
	
	
	
		ls_batch_file_name := concat(concat(concat('dospfpl1.', ltrim(to_char(as_batch_id, '000'))), '.'),
															to_char(as_dt_now, 'YYYYMMDDHH24MISS'));
															
		li_sap_budget_feed_batch_id := 	seq_sap_budget_feed_batch_id.nextval;												
		
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
				li_sap_budget_feed_batch_id,
				as_batch_id,
				ls_batch_file_name,
				as_dt_now,
				as_update_user,
				li_no_of_records,
				sysdate,
				1,
				sys_guid()
				);
				
	
	
	
	open c_sap_bud_det;
	loop
	fetch c_sap_bud_det into r_sap_bud_det;
	exit when c_sap_bud_det%notfound;
	
		li_sap_budget_feed_details_id := seq_sap_budget_feed_details_id.nextval;
		ls_account_number := r_sap_bud_det.account_number;
		
		INSERT INTO SAP_BUDGET_FEED_DETAILS(
		SAP_BUDGET_FEED_DETAILS_ID,
		SAP_BUDGET_FEED_BATCH_ID,
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
		li_sap_budget_feed_batch_id,
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
						ls_amount := '+'||LPAD( ( to_number(r_award_budget.amount) * 100 ), 9, '0');
				else
						ls_amount := '-'||LPAD(ABS( ( to_number(r_award_budget.amount) * 100 )), 9, '0');
				end if;
				
				
				select count(sap_obj_cd) into li_count FROM SAP_KC_OBJ_CD_MAPPING WHERE KC_OBJ_CD = r_award_budget.gl_account_key;
				
				if li_count = 1 then
					SELECT SAP_OBJ_CD into ls_cost_element FROM SAP_KC_OBJ_CD_MAPPING WHERE KC_OBJ_CD = r_award_budget.gl_account_key;
					
				else
					ls_cost_element := r_award_budget.gl_account_key;
					
				end if;
								
			
				INSERT INTO SAP_BUDGET_FEED(
							SAP_BUDGET_FEED_ID,
							SAP_BUDGET_FEED_DETAILS_ID,
							SAP_BUDGET_FEED_BATCH_ID,
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
						 li_sap_budget_feed_batch_id,
						 as_batch_id,
						 ls_sap_feed_fiscal_year,
						 ls_account_number,
						 ls_cost_element,						 
						 ls_amount,
						 1,
						 sys_guid()
					  );
					  
					 li_no_of_records := li_no_of_records + 1; 
					 
			end loop;
			close c_award_budget;
			
		--- cost sharing in the budget feed START
	
					--- checking if there is any cost sharing account in master feed batch id
					SELECT count(t1.feed_id) into li_count
					from sap_feed t1
					inner join sap_feed_details t2 on t1.feed_id = t2.feed_id
					where t1.batch_id = as_batch_id
					and t2.award_number = r_sap_bud_det.award_number
					and t1.spon_code = '009906';
					
					if li_count > 0 then 
						-- if present then checks if it is already added for the award
--						SELECT count(t1.cost_element) into li_count
--						from sap_budget_feed t1
--						inner join sap_budget_feed_details t2 on t1.sap_budget_feed_details_id = t2.sap_budget_feed_details_id
--						where t2.batch_id = as_batch_id
--						and t2.award_number = r_sap_bud_det.award_number
--						and t1.account_number = '009906';
--					
--						if li_count = 0 then
						
							-- fetching the  authorized total 
							begin
								SELECT t1.auth_total,t1.mit_sap_account into ls_auth_total,ls_mit_account_number
								from sap_feed t1
								inner join sap_feed_details t2 on t1.feed_id = t2.feed_id
								where t1.batch_id = as_batch_id
								and t2.award_number = r_sap_bud_det.award_number
								and t1.spon_code = '009906';
							exception
							when others then	
								ls_auth_total := '0';
							end;	
																	
							if to_number(ls_auth_total) >= 0 then
									ls_amount := '+'||LPAD( ( to_number(ls_auth_total) ), 9, '0');
							else
									ls_amount := '-'||LPAD(ABS( ( to_number(ls_auth_total) )), 9, '0');
							end if;
							
							INSERT INTO SAP_BUDGET_FEED(
										SAP_BUDGET_FEED_ID,
										SAP_BUDGET_FEED_DETAILS_ID,
										SAP_BUDGET_FEED_BATCH_ID,
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
									 li_sap_budget_feed_batch_id,
									 as_batch_id,
									 ls_sap_feed_fiscal_year,
									 ls_mit_account_number,
									 '400000',						 
									 ls_amount,
									 1,
									 sys_guid()
								  );
								  
							li_no_of_records := li_no_of_records + 1; 
--						
--						end if;		
--					
--					
--					
					end if;	
	
		--- cost sharing in the budget feed START
	
	end loop;
	close c_sap_bud_det;

		
		
		UPDATE 	AWARD_BUDGET_EXT SET AWARD_BUDGET_STATUS_CODE = 9 --Posted
		WHERE budget_id IN ( SELECT budget_id FROM SAP_BUDGET_FEED_DETAILS WHERE BATCH_ID = as_batch_id);
		
		UPDATE SAP_BUDGET_FEED_DETAILS SET FEED_STATUS = 'F'  WHERE BATCH_ID = as_batch_id;
		
		UPDATE sap_budget_feed_batch_list SET no_of_records = li_no_of_records  WHERE sap_budget_feed_batch_id = li_sap_budget_feed_batch_id;
		
		COMMIT;		
		
		
	ret := fn_spool_awd_budget_batch(li_sap_budget_feed_batch_id, as_path);

	return li_sap_budget_feed_batch_id;

end;
/
