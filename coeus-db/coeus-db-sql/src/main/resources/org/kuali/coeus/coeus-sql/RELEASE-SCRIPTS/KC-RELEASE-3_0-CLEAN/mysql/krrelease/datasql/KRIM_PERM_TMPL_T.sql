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

delimiter /
TRUNCATE TABLE KRIM_PERM_TMPL_T
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','1','Default','KUALI','5ADF18B6D4857954E0404F8189D85002','1',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','3','Initiate Document','KR-SYS','5ADF18B6D4BF7954E0404F8189D85002','10',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','8','Cancel Document','KR-WKFLW','5ADF18B6D4CA7954E0404F8189D85002','14',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','8','Save Document','KR-WKFLW','5ADF18B6D4CB7954E0404F8189D85002','15',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','8','Edit Document','KR-NS','5ADF18B6D4CC7954E0404F8189D85002','16',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','3','Copy Document','KR-NS','5ADF18B6D4AF7954E0404F8189D85002','2',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','10','Look Up Records','KR-NS','5ADF18B6D4DA7954E0404F8189D85002','23',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','10','Inquire Into Records','KR-NS','5ADF18B6D4DB7954E0404F8189D85002','24',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','11','View Inquiry or Maintenance Document Field','KR-NS','5ADF18B6D4DF7954E0404F8189D85002','25',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','11','Modify Maintenance Document Field','KR-NS','5ADF18B6D4E07954E0404F8189D85002','26',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','11','Full Unmask Field','KR-NS','5ADF18B6D4E17954E0404F8189D85002','27',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','11','Partial Unmask Field','KR-NS','5ADF18B6D4E27954E0404F8189D85002','28',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','12','Use Screen','KR-NS','5ADF18B6D4E67954E0404F8189D85002','29',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','3','Administer Routing for Document','KR-WKFLW','5ADF18B6D4B07954E0404F8189D85002','3',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','13','Perform Custom Maintenance Document Function','KR-NS','5ADF18B6D4E97954E0404F8189D85002','30',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','14','Use Transactional Document','KR-NS','5ADF18B6D4EC7954E0404F8189D85002','31',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','15','Modify Batch Job','KR-NS','5ADF18B6D4F07954E0404F8189D85002','32',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','15','Upload Batch Input File(s)','KR-NS','5ADF18B6D4F17954E0404F8189D85002','33',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','16','Maintain System Parameter','KR-NS','5ADF18B6D4F67954E0404F8189D85002','34',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','18','Assign Role','KR-IDM','5ADF18B6D4FC7954E0404F8189D85002','35',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','19','Grant Permission','KR-IDM','5ADF18B6D5007954E0404F8189D85002','36',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','20','Grant Responsibility','KR-IDM','5ADF18B6D5047954E0404F8189D85002','37',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','21','Populate Group','KR-IDM','5ADF18B6D5087954E0404F8189D85002','38',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','3','Blanket Approve Document','KR-WKFLW','5ADF18B6D4B17954E0404F8189D85002','4',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','3','Open Document','KR-NS','5ADF18B6D4AE7954E0404F8189D85002','40',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','56','Create / Maintain Record(s)','KR-NS','603B735FA6C4FE21E0404F8189D8083B','42',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','57','View Inquiry or Maintenance Document Section','KR-NS','603B735FA6C0FE21E0404F8189D8083B','43',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','57','Modify Maintenance Document Section','KR-NS','603B735FA6C1FE21E0404F8189D8083B','44',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','9','Add Note / Attachment','KR-NS','606763510FC096D3E0404F8189D857A2','45',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','9','View Note / Attachment','KR-NS','606763510FC196D3E0404F8189D857A2','46',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','59','Delete Note / Attachment','KR-NS','606763510FC296D3E0404F8189D857A2','47',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','5','Send Ad Hoc Request','KR-NS','662384B381B867A1E0404F8189D868A6','49',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','3','Route Document','KR-WKFLW','5ADF18B6D4B27954E0404F8189D85002','5',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','3','Add Message to Route Log','KR-WKFLW','430ad531-89e4-11df-98b1-1300c9ee50c1','51',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','4','Take Requested Action','KR-NS','5ADF18B6D4B77954E0404F8189D85002','8',1)
/
INSERT INTO KRIM_PERM_TMPL_T (ACTV_IND,KIM_TYP_ID,NM,NMSPC_CD,OBJ_ID,PERM_TMPL_ID,VER_NBR)
  VALUES ('Y','5','Ad Hoc Review Document','KR-WKFLW','5ADF18B6D4BB7954E0404F8189D85002','9',1)
/
delimiter ;
