declare
li_max number(10);
ls_query VARCHAR2(400);
begin
select max(TRANSACTION_ID) into li_max from AWARD_AMOUNT_INFO;
ls_query:='alter sequence SEQ_TRANSACTION_ID increment by '||li_max;      
execute immediate(ls_query);  

end;
/
select SEQ_TRANSACTION_ID.NEXTVAL from dual
/
alter sequence SEQ_TRANSACTION_ID increment by 1
/
