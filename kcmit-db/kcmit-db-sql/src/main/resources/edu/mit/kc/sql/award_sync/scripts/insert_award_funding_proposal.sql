select ' Start time of AWARD_FUNDING_PROPOSALS  is '|| localtimestamp from dual/INSERT INTO AWARD_FUNDING_PROPOSALS(AWARD_FUNDING_PROPOSAL_ID,AWARD_ID,PROPOSAL_ID,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,ACTIVE,OBJ_ID)select SEQUENCE_AWARD_ID.NEXTVAL,t.award_id, p.proposal_id,af.UPDATE_TIMESTAMP,af.UPDATE_USER,1,'Y',SYS_GUID()from  award t,proposal p,OSP$AWARD_FUNDING_PROPOSALS af,TEMP_TAB_TO_SYNC_AWARD tswhere t.award_number = replace(af.MIT_AWARD_NUMBER,'-','-00')and   t.SEQUENCE_NUMBER = af.SEQUENCE_NUMBERand  af.MIT_AWARD_NUMBER=ts.MIT_AWARD_NUMBERand  af.SEQUENCE_NUMBER=ts.SEQUENCE_NUMBERand p.proposal_number = af.proposal_numberand ts.FEED_TYPE = 'N'and p.sequence_number = af.PROP_SEQUENCE_NUMBER;commit/select ' Start time of AWARD_FUNDING_PROPOSALS  is '|| localtimestamp from dual/