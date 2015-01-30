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

INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4092 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4093 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4094 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4095 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4096 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4097 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4098 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4099 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4100 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'SyncValidationApproval')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'SyncValidationApproval')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApprovalInSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'AwardStandardApprovalInSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'ApplySync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4102 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4102 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4102 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4102 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4103 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4103 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4103 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4103 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4104 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4104 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4104 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4104 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4105 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4105 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4105 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4105 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4106 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4106 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4106 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4106 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4107 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4107 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4107 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4107 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4108 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4108 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4108 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4108 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'isSyncChild')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'ApplySync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'SyncFYIs')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'SyncFYIs')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4101 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'JoinSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4109 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'Initiated')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4109 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')))
/
INSERT INTO KREW_RTE_NODE_INSTN_LNK_T (FROM_RTE_NODE_INSTN_ID,TO_RTE_NODE_INSTN_ID)
  VALUES ((SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4109 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'hasSync')),(SELECT RTE_NODE_INSTN_ID FROM KREW_RTE_NODE_INSTN_T WHERE DOC_HDR_ID = 4109 AND RTE_NODE_ID = (SELECT RTE_NODE_ID FROM KREW_RTE_NODE_T WHERE DOC_TYP_ID = (SELECT MAX(DOC_TYP_ID) FROM KREW_DOC_TYP_T WHERE DOC_TYP_NM = 'AwardDocument') AND NM = 'SyncValidationApproval')))
/
