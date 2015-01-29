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

DELIMITER /
INSERT INTO IACUC_PROTO_REVIEW_TYPE ( PROTOCOL_REVIEW_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 1, 'Administrative Review', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_PROTO_REVIEW_TYPE ( PROTOCOL_REVIEW_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 2, 'Designated Member Review', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_PROTO_REVIEW_TYPE ( PROTOCOL_REVIEW_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 3, 'Full Committee Member Review', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_PROTO_REVIEW_TYPE ( PROTOCOL_REVIEW_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 4, 'FYI', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_PROTO_REVIEW_TYPE ( PROTOCOL_REVIEW_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 5, 'Response', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 211, 'Rejected Submission', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 212, 'Major Revisions Required', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 105, 'Temporary Submission', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 210, 'Minor Revisions Required', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 100, 'Routing In Progress', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 101, 'Pending', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 102, 'Submitted to Committee', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 103, 'In Agenda', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 104, 'IACUC review not required', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 200, 'Approved', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 201, 'Disapproved', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 202, 'Terminated', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 203, 'Suspended', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 204, 'Withdrawn', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 205, 'IACUC Acknowledgement', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 206, 'Tabled', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 207, 'Deactivated', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 208, 'Lift Hold', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 209, 'Returned to PI', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 213, 'Administratively Approved', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_STATUS ( SUBMISSION_STATUS_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 214, 'Administratively Incomplete', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 100, 'Initial Protocol Application', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 101, 'Response to Previous IACUC Notification', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 102, 'Request to Deactivate', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 103, 'Request to Lift Hold', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 104, 'FYI', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 105, 'Amendment', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 106, 'Renewal', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 107, 'Renewal with Amendment', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 108, 'Continuation / Continuing Review', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE ( SUBMISSION_TYPE_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 109, 'Continuation / Continuing Review with Amendment', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 1, 'Modification/Amendments/revision/Significant New Findings', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 2, 'Annual Scheduled By IACUC', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 3, 'Contigent/Conditional Approval/Deferred Approval/Non-Approval', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 4, 'Eligibility Exceptions/Protocol Deviations', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 5, 'AE/UADE', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 6, 'Complaint', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 7, 'Deviation', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 8, 'IACUC Protocol-related COI report', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 9, 'Self report for Noncompliance', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 10, 'Request for eligibility exception', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 11, 'Training certification', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 12, 'Unanticipated problems', NOW(), 'admin', UUID(), 1 )
/
INSERT INTO IACUC_SUBMISSION_TYPE_QUALIF ( SUBMISSION_TYPE_QUAL_CODE, DESCRIPTION, UPDATE_TIMESTAMP, UPDATE_USER, OBJ_ID, VER_NBR )
VALUES ( 13, 'Annual report', NOW(), 'admin', UUID(), 1 )
/
DELIMITER ;
