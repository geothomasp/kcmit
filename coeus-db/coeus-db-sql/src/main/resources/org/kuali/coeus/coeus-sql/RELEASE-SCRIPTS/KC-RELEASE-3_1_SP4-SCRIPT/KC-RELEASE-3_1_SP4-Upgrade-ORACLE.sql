--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 The Kuali Foundation
-- 
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.
-- 
-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

set define off
set sqlblanklines on
spool KC-RELEASE-3_1_SP4-Upgrade-ORACLE-Install.log
@ORACLE/SEQUENCES/KC_SEQ_All.sql
@ORACLE/TABLES/KC_TBL_AWARD_BUDGET_LIMIT.sql
@ORACLE/TABLES/KC_TBL_AWARD_BUDGET_PERIOD_EXT.sql
@ORACLE/TABLES/KC_TBL_AWARD_HIERARCHY.sql
@ORACLE/TABLES/KC_TBL_CFDA.sql
@ORACLE/TABLES/KC_TBL_COMM_SCHEDULE.sql
@ORACLE/TABLES/KC_TBL_EPS_PROP_PERSON_EXT.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_BLOB_TRIGGERS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_CALENDARS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_CRON_TRIGGERS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_FIRED_TRIGGERS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_JOB_DETAILS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_JOB_LISTENERS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_LOCKS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_PAUSED_TRIGGER_GRPS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_SCHEDULER_STATE.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_SIMPLE_TRIGGERS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_TRIGGERS.sql
@ORACLE/TABLES/KC_TBL_KC_QRTZ_TRIGGER_LISTENERS.sql
@ORACLE/TABLES/KC_TBL_NOTIFICATION.sql
@ORACLE/TABLES/KC_TBL_NOTIFICATION_TYPE_RECIPIENT.sql
@ORACLE/TABLES/KC_TBL_PROTOCOL_ONLN_RVWS.sql
@ORACLE/TABLES/KC_TBL_SPECIAL_REVIEW_USAGE.sql
@ORACLE/TABLES/KC_TBL_SPONSOR_FORMS.sql
@ORACLE/TABLES/KC_TBL_SPONSOR_FORM_TEMPLATES.sql
@ORACLE/TABLES/KC_TBL_VALID_BASIS_METHOD_PMT.sql
@ORACLE/DML/KC_DML_BS1_BUDGET_CATEGORY_MAPPING.sql
@ORACLE/DML/KC_DML_BS1_BUDGET_PERSONS.sql
@ORACLE/DML/KC_DML_BS1_CITIZENSHIP_TYPE_T.sql
@ORACLE/DML/KC_DML_BS1_COEUS_SUB_MODULE.sql
@ORACLE/DML/KC_DML_BS1_COMM_SCHEDULE.sql
@ORACLE/DML/KC_DML_BS1_KC_QRTZ_LOCKS.sql
@ORACLE/DML/KC_DML_BS1_PERSON_APPOINTMENT.sql
@ORACLE/DML/KC_DML_BS1_SPECIAL_REVIEW_USAGE.sql
@ORACLE/DML/KC_DML_BS1_TRAINING_STIPEND_RATES.sql
@ORACLE/DML/KC_DML_BS2_APPOINTMENT_TYPE.sql
@ORACLE/DML/KC_DML_BS2_BUDGET_CATEGORY_MAPS.sql
@ORACLE/DML/KC_DML_BS2_NOTIFICATION_TYPE.sql
@ORACLE/DML/KC_DML_BS2_SPONSOR_FORMS.sql
@ORACLE/DML/KC_DML_BS3_EPS_PROP_PER_DOC_TYPE.sql
@ORACLE/DML/KC_DML_BS3_NOTIFICATION_TYPE_RECIPIENT.sql
@ORACLE/CONSTRAINTS/KC_FK_EPS_PROP_PERSON_EXT.sql
@ORACLE/CONSTRAINTS/KC_FK_KC_QRTZ_BLOB_TRIGGERS.sql
@ORACLE/CONSTRAINTS/KC_FK_KC_QRTZ_CRON_TRIGGERS.sql
@ORACLE/CONSTRAINTS/KC_FK_KC_QRTZ_JOB_LISTENERS.sql
@ORACLE/CONSTRAINTS/KC_FK_KC_QRTZ_SIMPLE_TRIGGERS.sql
@ORACLE/CONSTRAINTS/KC_FK_KC_QRTZ_TRIGGERS.sql
@ORACLE/CONSTRAINTS/KC_FK_KC_QRTZ_TRIGGER_LISTENERS.sql
@ORACLE/CONSTRAINTS/KC_FK_NOTIFICATION.sql
@ORACLE/CONSTRAINTS/KC_IX_KC_QRTZ_FIRED_TRIGGERS.sql
@ORACLE/CONSTRAINTS/KC_IX_KC_QRTZ_JOB_DETAILS.sql
@ORACLE/CONSTRAINTS/KC_IX_KC_QRTZ_TRIGGERS.sql
@ORACLE/CONSTRAINTS/KC_UQ_WATERMARK.sql
commit;
exit
