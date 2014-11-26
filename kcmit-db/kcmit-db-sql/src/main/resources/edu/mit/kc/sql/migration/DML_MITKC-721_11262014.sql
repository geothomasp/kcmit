declare
li_seq number(4,0);
li_proposal_id number(12,0);
cursor c_fund is
select ap.AWARD_ID,ap.PROPOSAL_ID,p.PROPOSAL_NUMBER,p.SEQUENCE_NUMBER,ap.UPDATE_TIMESTAMP,ap.UPDATE_USER from AWARD_FUNDING_PROPOSALS ap
inner join PROPOSAL p on ap.PROPOSAL_ID=p.PROPOSAL_ID
inner join OSP$AWARD_FUNDING_PROPOSALS@coeus.kuali af on p.PROPOSAL_NUMBER=af.PROPOSAL_NUMBER and p.SEQUENCE_NUMBER=af.PROP_SEQUENCE_NUMBER
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

if r_fund.SEQUENCE_NUMBER<> 1 then

li_seq:=r_fund.SEQUENCE_NUMBER-1;

SELECT PROPOSAL_ID INTO li_proposal_id FROM  PROPOSAL WHERE PROPOSAL_NUMBER=r_fund.PROPOSAL_NUMBER AND SEQUENCE_NUMBER=li_seq;

INSERT INTO AWARD_FUNDING_PROPOSALS(AWARD_FUNDING_PROPOSAL_ID,AWARD_ID,PROPOSAL_ID,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,ACTIVE,OBJ_ID)
SELECT SEQUENCE_AWARD_ID.NEXTVAL,af.AWARD_ID,r_fund.PROPOSAL_ID,r_fund.UPDATE_TIMESTAMP,r_fund.UPDATE_USER,1,'Y',sys_guid() FROM AWARD_FUNDING_PROPOSALS af 
WHERE  PROPOSAL_ID=li_proposal_id;

end if;

end loop;
close c_fund;
end;
/