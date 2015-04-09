/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.coeus.common.budget.impl.core;

import java.util.ArrayList;
import java.util.List;

import org.kuali.coeus.common.budget.framework.core.CostElement;
import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.core.api.util.ConcreteKeyValue;
import org.kuali.rice.core.api.util.KeyValue;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krad.uif.control.UifKeyValuesFinderBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("costElementKeyValuesFinder")
public class CostElementKeyValuesFinder extends UifKeyValuesFinderBase {
    
	@Autowired
    @Qualifier("dataObjectService")
	DataObjectService dataObjectService;
    
    @Override
    public List<KeyValue> getKeyValues() {
        return getCostElementKeyValues();
    }
    
    protected List<KeyValue> getCostElementKeyValues() {
        List<KeyValue> keyValues = new ArrayList<KeyValue>();        
    	QueryByCriteria.Builder builder = QueryByCriteria.Builder.create();
    	builder.setOrderByAscending("description");
        List<CostElement> costElements = (List<CostElement>)getDataObjectService().findMatching(CostElement.class, builder.build()).getResults();    
        for (CostElement costElement : costElements) {
        	String keyValue = costElement.getCostElement() + " - " + costElement.getDescription();
            keyValues.add(new ConcreteKeyValue(costElement.getCostElement(), keyValue));
        }
        keyValues.add(0, new ConcreteKeyValue("", "select"));
        return keyValues;
    }

	public DataObjectService getDataObjectService() {
		return dataObjectService;
	}

	public void setDataObjectService(DataObjectService dataObjectService) {
		this.dataObjectService = dataObjectService;
	}

}
