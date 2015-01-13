DELIMITER /
INSERT INTO SEQ_EPS_PROP_PERSON_ROLE VALUES (null)
/
insert into EPS_PROP_PERSON_ROLE (PROP_PERSON_ROLE_ID, PROP_PERSON_ROLE_CODE, DESCRIPTION, UNIT_DETAILS_REQUIRED, CERTIFICATION_REQUIRED, SPONSOR_HIERARCHY_NAME, READ_ONLY_ROLE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
values ((select max(ID) from SEQ_EPS_PROP_PERSON_ROLE), 'PI', 'PI/Contact', 'Y', 'Y', 'NIH Multiple PI', 'N', NOW(), 'admin', 1, UUID())
/

INSERT INTO SEQ_EPS_PROP_PERSON_ROLE VALUES (null)
/
insert into EPS_PROP_PERSON_ROLE (PROP_PERSON_ROLE_ID, PROP_PERSON_ROLE_CODE, DESCRIPTION, UNIT_DETAILS_REQUIRED, CERTIFICATION_REQUIRED, SPONSOR_HIERARCHY_NAME, READ_ONLY_ROLE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
values ((select max(ID) from SEQ_EPS_PROP_PERSON_ROLE), 'MPI', 'PI/Multiple', 'Y', 'Y', 'NIH Multiple PI', 'N', NOW(), 'admin', 1, UUID())
/

INSERT INTO SEQ_EPS_PROP_PERSON_ROLE VALUES (null)
/
insert into EPS_PROP_PERSON_ROLE (PROP_PERSON_ROLE_ID, PROP_PERSON_ROLE_CODE, DESCRIPTION, UNIT_DETAILS_REQUIRED, CERTIFICATION_REQUIRED, SPONSOR_HIERARCHY_NAME, READ_ONLY_ROLE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
values ((select max(ID) from SEQ_EPS_PROP_PERSON_ROLE), 'COI', 'Co-Investigator', 'Y', 'Y', 'NIH Multiple PI', 'N', NOW(), 'admin', 1, UUID())
/

INSERT INTO SEQ_EPS_PROP_PERSON_ROLE VALUES (null)
/
insert into EPS_PROP_PERSON_ROLE (PROP_PERSON_ROLE_ID, PROP_PERSON_ROLE_CODE, DESCRIPTION, UNIT_DETAILS_REQUIRED, CERTIFICATION_REQUIRED, SPONSOR_HIERARCHY_NAME, READ_ONLY_ROLE, UPDATE_TIMESTAMP, UPDATE_USER, VER_NBR, OBJ_ID)
values ((select max(ID) from SEQ_EPS_PROP_PERSON_ROLE), 'KP', 'Key Person', 'N', 'N', 'NIH Multiple PI', 'Y', NOW(), 'admin', 1, UUID())
/

update EPS_PROP_PERSON_ROLE set READ_ONLY_ROLE = 'Y' where PROP_PERSON_ROLE_CODE = 'KP'
/

DELIMITER ;
