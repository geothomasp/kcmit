/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.bo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.kuali.rice.krad.bo.PersistableBusinessObjectBase;

/**
 * This class is for Krad Unit lookup
 */

@Entity
@Table(name = "UNIT")
public class UnitBo extends PersistableBusinessObjectBase  {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "UNIT_NUMBER")
	private String unitNumber;

	@Column(name = "PARENT_UNIT_NUMBER")
	private String parentUnitNumber;

	@Column(name = "ORGANIZATION_ID")
	private String organizationId;

	@Column(name = "UNIT_NAME")
	private String unitName;
	
	@Column(name = "ACTIVE_FLAG")
	private boolean active;

	public String getUnitNumber() {
		return unitNumber;
	}

	public void setUnitNumber(String unitNumber) {
		this.unitNumber = unitNumber;
	}

	public String getParentUnitNumber() {
		return parentUnitNumber;
	}

	public void setParentUnitNumber(String parentUnitNumber) {
		this.parentUnitNumber = parentUnitNumber;
	}

	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}
