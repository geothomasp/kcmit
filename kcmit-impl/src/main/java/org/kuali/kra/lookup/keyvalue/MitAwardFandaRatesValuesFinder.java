/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.lookup.keyvalue;

import org.kuali.kra.award.budget.document.AwardBudgetDocument;
import org.kuali.kra.award.commitments.FandaRateType;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.coeus.common.budget.framework.rate.RateType;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.core.api.util.ConcreteKeyValue;
import org.kuali.rice.core.api.util.KeyValue;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.krad.service.KeyValuesService;
import org.kuali.rice.krad.uif.control.UifKeyValuesFinderBase;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

public class MitAwardFandaRatesValuesFinder extends UifKeyValuesFinderBase {
    KeyValuesService keyValuesService = (KeyValuesService) KcServiceLocator.getService("keyValuesService");
    ParameterService parameterService = (ParameterService)KcServiceLocator.getService(ParameterService.class);
    /**
     * Constructs the list of Budget Periods.  Each entry
     * in the list is a &lt;key, value&gt; pair, where the "key" is the unique
     * status code and the "value" is the textual description that is viewed
     * by a user.  The list is obtained from the BudgetDocument if any are defined there. 
     * Otherwise, it is obtained from a lookup of the BUDGET_PERIOD database table
     * via the "KeyValueFinderService".
     * 
     * @return the list of &lt;key, value&gt; pairs of abstract types.  The first entry
     * is always &lt;"", "select:"&gt;.
     * @see org.kuali.rice.krad.keyvalues.KeyValuesFinder#getKeyValues()
     */
    @Override
    public List<KeyValue> getKeyValues() {
        List<KeyValue> matchingAwardFnARateTypes = filterRateTypes();   
        matchingAwardFnARateTypes.add(0, new ConcreteKeyValue("", "select"));
        return matchingAwardFnARateTypes;
    }
       
    class FnArateComparator implements Comparator
    {    
        public int compare(Object kv1, Object kv2 )
        {    
            try
            {       
                String desc1 =   ((KeyValue) kv1).getValue();               
                String desc2 =  ((KeyValue) kv2).getValue();
                if (desc1 == null)
                {
                    desc1 = "";
                }
                if (desc2 == null)
                {
                    desc2 = "";
                }
                return desc1.compareTo(desc2);  
            }
            catch (Exception e)
            {
                return 0;
            }
        }
        
    }
    
    private List<KeyValue> filterRateTypes() {    	
        Collection<RateType> awardFnARateTypes= keyValuesService.findAll(RateType.class);
        String fnaRateClassCode = parameterService.getParameterValueAsString(AwardBudgetDocument.class, Constants.AWARD_BUDGET_DEFAULT_FNA_RATE_CLASS_CODE);
        List<KeyValue> keyValues = new ArrayList<KeyValue>();        
        for (RateType rateType : awardFnARateTypes) {
            if(rateType.getRateClassCode().equals(fnaRateClassCode)){
                keyValues.add(new ConcreteKeyValue(rateType.getRateTypeCode(),rateType.getDescription()));
            }
        }
     Collections.sort(keyValues, new FnArateComparator());
        return keyValues;
    }

}
