--
-- Kuali Coeus, a comprehensive research administration system for higher education.
-- 
-- Copyright 2005-2015 Kuali, Inc.
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

CREATE TABLE NEGOTIATION_UNASSOC_DETAIL  ( 
	NEGOTIATION_UNASSOC_DETAIL_ID	NUMBER(22) NOT NULL,
	NEGOTIATION_ID               	NUMBER(22) NOT NULL,
	TITLE                        	VARCHAR2(45) NULL,
	PI_PERSON_ID                 	VARCHAR2(40) NULL,
	PI_ROLODEX_ID                	VARCHAR2(40) NULL,
	PI_NAME						    VARCHAR2(100) NULL,
	LEAD_UNIT                    	VARCHAR2(8) NULL,
	SPONSOR_CODE                 	CHAR(6) NULL,
	PRIME_SPONSOR_CODE           	CHAR(6) NULL,
	SPONSOR_AWARD_NUMBER         	VARCHAR2(70) NULL,
	CONTACT_ADMIN_PERSON_ID      	VARCHAR2(40) NULL,
	SUBAWARD_ORG                 	VARCHAR2(8) NULL,
	UPDATE_TIMESTAMP     	DATE NOT NULL,
	UPDATE_USER          	VARCHAR2(60) NOT NULL,
	VER_NBR              	NUMBER(8,0) NOT NULL,
	OBJ_ID               	VARCHAR2(36) NOT NULL,
	CONSTRAINT NEGOTIATION_UNASSOC_DETAIL_PK1 PRIMARY KEY(NEGOTIATION_UNASSOC_DETAIL_ID)
	
)
/
