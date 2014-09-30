select ' Start time of AWARD_COMMENT update script is '|| localtimestamp from dual
/
alter table AWARD_COMMENT drop column  COMMENTS
/
commit
/
alter table AWARD_COMMENT ADD ( COMMENTS LONG )
/
commit
/
ALTER INDEX	AWARD_COMMENTP1	REBUILD;
commit;
/
commit
/
declare
ls_comment CLOB;
ls_award_number VARCHAR2(20);
li_sequence_number NUMBER(8,0);
li_commit_count number:=0;

cursor c_comment is
select a1.MIT_AWARD_NUMBER,a1.SEQUENCE_NUMBER,a1.COMMENT_CODE,a1.COMMENTS from OSP$AWARD_COMMENTS@coeus.kuali a1
inner join TEMP_TAB_TO_SYNC_AWARD ts on a1.MIT_AWARD_NUMBER=ts.MIT_AWARD_NUMBER and a1.SEQUENCE_NUMBER=ts.SEQUENCE_NUMBER
where ts.FEED_TYPE='N';
r_comment c_comment%ROWTYPE;

Begin

open c_comment;
loop
fetch c_comment into r_comment;
exit when c_comment%NOTFOUND;

  begin
   ls_award_number:=replace(r_comment.MIT_AWARD_NUMBER,'-','-00');
   update /*+ index(award_comment AWARD_COMMENT_I1) */ AWARD_COMMENT 
   set COMMENTS = r_comment.COMMENTS
   where AWARD_NUMBER=ls_award_number and SEQUENCE_NUMBER=r_comment.SEQUENCE_NUMBER and COMMENT_TYPE_CODE=r_comment.COMMENT_CODE;
   li_commit_count:= li_commit_count + 1;
   exception
   when others then
   dbms_output.put_line('Error occoured !! where MIT_AWARD_NUMBER is '||ls_award_number||' and error is  '||sqlerrm);
   end;
   
    if li_commit_count = 1000 then
		li_commit_count:=0;    
		commit;
	end if;
   
end loop;
close c_comment;
end;
/
commit
/	
ALTER TABLE AWARD_COMMENT MODIFY ( COMMENTS CLOB )
/
commit
/
ALTER INDEX	AWARD_COMMENTP1	REBUILD;
commit;
/
ALTER INDEX	AWARD_COMMENT_I1 REBUILD;
commit;
/
select ' End time of AWARD_COMMENT update script is '|| localtimestamp from dual
/