TRUNCATE TABLE AWARD_FUNDING_PROPOSALS
/
INSERT INTO AWARD_FUNDING_PROPOSALS(AWARD_FUNDING_PROPOSAL_ID,AWARD_ID,PROPOSAL_ID,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,ACTIVE,OBJ_ID)
select SEQUENCE_AWARD_ID.NEXTVAL,t.award_id, p.proposal_id,af.UPDATE_TIMESTAMP,af.UPDATE_USER,1,'Y',SYS_GUID()
from  award t,proposal p,OSP$AWARD_FUNDING_PROPOSALS af
where t.award_number = replace(af.MIT_AWARD_NUMBER,'-','-00')
and   t.SEQUENCE_NUMBER = af.SEQUENCE_NUMBER
and p.proposal_number = af.proposal_number
and p.sequence_number = af.PROP_SEQUENCE_NUMBER
/
declare
li_seq number(4,0);
li_proposal_id number(12,0);
li_count number;
ll_timestamp TIMESTAMP(6);
ls_user VARCHAR2(60);

cursor c_fund is
select  distinct ap.PROPOSAL_ID,p.PROPOSAL_NUMBER,p.SEQUENCE_NUMBER from AWARD_FUNDING_PROPOSALS ap
inner join PROPOSAL p on ap.PROPOSAL_ID=p.PROPOSAL_ID
ORDER BY p.PROPOSAL_NUMBER,p.SEQUENCE_NUMBER;
r_fund c_fund%rowtype;

begin

if c_fund%isopen then
close c_fund;
end if;
open c_fund;
loop
fetch c_fund into r_fund;
exit when c_fund%notfound;

select count(Proposal_number) into  li_count from OSP$AWARD_FUNDING_PROPOSALS@coeus.kuali where PROPOSAL_NUMBER = r_fund.PROPOSAL_NUMBER and PROP_SEQUENCE_NUMBER = r_fund.SEQUENCE_NUMBER;

if li_count >0 then
    
	

   if r_fund.SEQUENCE_NUMBER<> 1 then
   
       select UPDATE_TIMESTAMP,UPDATE_USER into ll_timestamp,ls_user  from PROPOSAL where PROPOSAL_ID = r_fund.PROPOSAL_ID;

       li_seq:=r_fund.SEQUENCE_NUMBER-1;


        SELECT PROPOSAL_ID INTO li_proposal_id FROM  PROPOSAL WHERE PROPOSAL_NUMBER=r_fund.PROPOSAL_NUMBER AND SEQUENCE_NUMBER=li_seq;

        INSERT INTO AWARD_FUNDING_PROPOSALS(AWARD_FUNDING_PROPOSAL_ID,AWARD_ID,PROPOSAL_ID,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,ACTIVE,OBJ_ID)
        SELECT SEQUENCE_AWARD_ID.NEXTVAL,af.AWARD_ID,r_fund.PROPOSAL_ID,ll_timestamp,ls_user,1,'Y',sys_guid() FROM AWARD_FUNDING_PROPOSALS af 
        WHERE  PROPOSAL_ID=li_proposal_id;

    end if;
end if;
end loop;
close c_fund;
end;
/