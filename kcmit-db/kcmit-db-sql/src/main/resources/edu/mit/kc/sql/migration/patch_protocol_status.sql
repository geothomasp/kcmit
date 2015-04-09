ALTER TABLE PROTOCOL DISABLE CONSTRAINT FK_PROTOCOL_2
/
DELETE FROM PROTOCOL_STATUS
/
COMMIT
/
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('100','Pending/In Progress',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C03D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('101','Submitted to IRB',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C13D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('102','Specific Minor Revisions Required',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C23D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('103','Deferred',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C33D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('104','Substantive Revisions Required',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C43D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('105','Amendment in Progress',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C53D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('106','Renewal in Progress',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C63D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('107','Return To PI',to_timestamp('14-MAR-14 09.57.45.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4927412B471B17AE040DC0A1F8A3D26');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('200','Active - Open to Enrollment',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C73D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('201','Active - Closed to Enrollment',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C83D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('202','Active - Data Analysis Only',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14C93D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('203','Exempt',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14CA3D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('300','Closed Administratively for lack of response',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14CB3D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('301','Closed by Investigator',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14CC3D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('302','Suspended by Investigator',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14CD3D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('303','Deleted',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14CE3D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('304','Withdrawn',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14CF3D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('305','Expired',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D03D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('306','Disapproved',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D13D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('307','Terminated by IRB',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D23D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('308','Suspended by IRB',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D33D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('309','Not Human Subjects Research',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D43D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('310','IRB review not required',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D53D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('311','Suspended by DSMB',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D63D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('313','Abandoned',to_timestamp('14-MAR-14 09.56.18.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926E3B9E9EFA72E040DC0A1F8A3CB7');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('400','Amendment Incorporated into Protocol',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D73D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('401','Renewal Incorporated into Protocol',to_timestamp('14-MAR-14 09.55.47.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4926C2B14D83D63E040DC0A1F8A3C9C');
Insert into PROTOCOL_STATUS (PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID) values ('402','Recalled in Routing',to_timestamp('14-MAR-14 09.57.50.000000000 AM','DD-MON-RR HH.MI.SS.FF AM'),'admin',1,'F4927497270D933AE040DC0A1F8A3D3C');
commit
/
INSERT INTO PROTOCOL_STATUS(PROTOCOL_STATUS_CODE,DESCRIPTION,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID)
SELECT t1.PROTOCOL_STATUS_CODE,t1.DESCRIPTION,t1.UPDATE_TIMESTAMP,t1.UPDATE_USER,1,SYS_GUID()
FROM OSP$PROTOCOL_STATUS@coeus.kuali t1 
left outer join PROTOCOL_STATUS t2 on t1.PROTOCOL_STATUS_CODE = t2.PROTOCOL_STATUS_CODE
where t2.PROTOCOL_STATUS_CODE is null
/
ALTER TABLE PROTOCOL ENABLE CONSTRAINT FK_PROTOCOL_2
/