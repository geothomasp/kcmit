CREATE OR REPLACE TRIGGER T_KP_CONFIRM_AFT_INSERT_ROW 
after insert on AWARD_PERSON_CONFIRM for each row

declare

ls_recipient        KRIM_ROLE_MBR_T.MBR_ID%TYPE;
ls_message            VARCHAR2(2000);
li_rc                 number;
ls_PersonName        VARCHAR2(120);
li_Count                number;
li_KP_Needs_COI         number;
li_COI_Complete         number;
li_Training_Complete    number;
ll_coi_disp_code        COI_DISCLOSURE.DISCLOSURE_DISPOSITION_CODE%type;
ll_coi_rev_code         COI_DISCLOSURE.REVIEW_STATUS_CODE%type;
ll_COIBasedOnCustomData number;
li_NeedsCOI             number;
li_IsPCK                number;

/** Case 185 Begin **/


ls_ModuleItemKey        AWARD.AWARD_NUMBER%TYPE;
ls_PersonId             AWARD_PERSONS.PERSON_ID%TYPE;
ls_disc_num         	COI_DISCLOSURE.COI_DISCLOSURE_NUMBER%TYPE;


error_inserting         EXCEPTION;


begin
    
    ls_ModuleItemKey :=  :new.AWARD_NUMBER;
    ls_PersonId    := :new.PERSON_ID;
    
    --Send notification only if person id is not ('000000000' or '999999999'
    if ls_PersonId in ('999999999', '000000000') then
        return; 
    end if;
    
    ll_COIBasedOnCustomData := kc_kp_notifications_pkg.fn_get_awd_custom_data(ls_ModuleItemKey, 'COI_REQUIREMENT');
    
    -- fn_check_coi_hierarchy return -1 if COI is not needed for this award
     --  Returns 1 if KP does nto have to do COI
     -- return 2 if Key persons needs to do COI
     
    li_KP_Needs_COI := kc_kp_notifications_pkg.fn_check_coi_hierarchy(ls_ModuleItemKey);
    
    if (li_KP_Needs_COI <> 2) and (ll_COIBasedOnCustomData <> 3) then
        return;
    end if;
    
    li_COI_Complete := 0;
    
    if li_KP_Needs_COI = 2 then
        li_NeedsCOI := 1;
    else
        li_NeedsCOI := 0;
    end if;
    
    if ll_COIBasedOnCustomData = 3 then
        li_IsPCK := 1;
    else
        li_IsPCK := 0;
    end if;  
    
    --Check if the person has submitted a disclosure for any award in this hierarchy.
    --review status code should be somthing other than 1.
    
     begin

     select D.DISCLOSURE_DISPOSITION_CODE, D.REVIEW_STATUS_CODE
     into   ll_coi_disp_code, ll_coi_rev_code
     from COI_DISCLOSURE d,
        (select distinct DD.COI_DISCLOSURE_NUMBER, DD.SEQUENCE_NUMBER
         from   COI_DISC_DETAILS dd
         where  dd.MODULE_CODE = 1
         and    dd.MODULE_ITEM_KEY like  substr(ls_ModuleItemKey, 1, 6) || '%'
         and    DD.SEQUENCE_NUMBER = (select max(DD2.SEQUENCE_NUMBER)
                                     from   COI_DISC_DETAILS dd2
                                     where  DD.COI_DISCLOSURE_NUMBER = DD2.COI_DISCLOSURE_NUMBER
                                     and    DD.MODULE_ITEM_KEY = DD2.MODULE_ITEM_KEY)) discl
         where D.PERSON_ID =  ls_PersonId
         and   D.COI_DISCLOSURE_NUMBER = discl.COI_DISCLOSURE_NUMBER
         and   D.SEQUENCE_NUMBER = discl.SEQUENCE_NUMBER;



           if (ll_coi_rev_code <> 1) then
             -- person has submited the disclosure
               li_COI_Complete := 1;
           end if;


    exception
         when others then
           li_COI_Complete := 0;
    end;
    
    
    --Check if the person has completed COI training
    li_Training_Complete := 0;
    
    begin

         select count(*)
         into  li_count
         from PERSON_TRAINING t
         where T.PERSON_ID = ls_PersonId
         and   T.TRAINING_CODE = 54
         and   T.FOLLOWUP_DATE > sysdate;

     if (li_count > 0) then
      --Training Complete
        li_Training_Complete := 1;  
     end if;
    
    exception
        when others then
            li_Training_Complete := 0;

    end;
    
    if (li_COI_Complete = 1) and (li_Training_Complete = 1) then
        -- Person has comleted training and COI
        -- No need to send notification
         
        Return;
        
    end if;
       /*
    ls_disc_num     := fn_get_next_coi_disclosure_num();
     
    BEGIN
        insert into OSP$INV_COI_DISCLOSURE_v2
        values (ls_disc_num,
                :new.MIT_AWARD_NUMBER,
                1,
                :new.PERSON_ID,
                'K',  --To denote this is a KP disclosure
                sysdate,
                user);

    EXCEPTION
        when others then
            raise error_inserting;
    END ;
   */    
    
    li_rc := kc_kp_notifications_pkg.fn_gen_kp_coi_notification (ls_PersonId, ls_ModuleItemKey, li_COI_Complete, li_Training_Complete, li_NeedsCOI, li_IsPCK );
        
    

exception
    when error_inserting then
        raise_application_error(-20100, 'Error generating notifications' || SQLERRM);
    when others then
        raise_application_error(-20100, 'Error generating notifications' || SQLERRM);

end;
/