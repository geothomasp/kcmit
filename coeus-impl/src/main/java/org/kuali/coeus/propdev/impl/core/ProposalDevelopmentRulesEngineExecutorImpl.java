

/**
 * Copyright 2005-2014 The Kuali Foundation
 *
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.opensource.org/licenses/ecl2.php
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.coeus.propdev.impl.core;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.kuali.coeus.common.framework.krms.KcRulesEngineExecuter;
import org.kuali.coeus.common.framework.unit.Unit;
import org.kuali.coeus.common.framework.unit.UnitService;
import org.kuali.coeus.common.impl.krms.KcKrmsFactBuilderServiceHelper;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.coeus.propdev.impl.person.ProposalPersonUnit;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.krms.KcKrmsConstants;

import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.kew.engine.RouteContext;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krms.api.engine.Engine;
import org.kuali.rice.krms.api.engine.EngineResults;
import org.kuali.rice.krms.api.engine.Facts;
import org.kuali.rice.krms.api.engine.SelectionCriteria;

public class ProposalDevelopmentRulesEngineExecutorImpl  extends KcRulesEngineExecuter  {

    public EngineResults performExecute(RouteContext routeContext, Engine engine) {

        String docContent = routeContext.getDocument().getDocContent();
        String proposalNumber = getElementValue(docContent, "//proposalNumber");
        List<String> unitNumbers = getProposalPersonUnits(proposalNumber);
        
        String leadUnitNumber = getLeadUnitNumber(proposalNumber);
        String unitNumbersAsString = unitNumbers.isEmpty()?leadUnitNumber:StringUtils.join(unitNumbers,',');
        KcKrmsFactBuilderServiceHelper fbService = KcServiceLocator.getService("proposalDevelopmentFactBuilderService");
        Facts.Builder factsBuilder = Facts.Builder.create();
        fbService.addFacts(factsBuilder, docContent);
        Facts facts = factsBuilder.build();
        EngineResults combinedResults = callEngineForOneUnit(engine, facts, unitNumbersAsString);
        List<String> unitNumbersSortedList = getUnitNumbersInOrder(leadUnitNumber);
        unitNumbersSortedList.remove(leadUnitNumber);
        int sortedListSize = unitNumbersSortedList.size();
        for (int i = sortedListSize-1; i>=0 ; i--) {
            String unit = unitNumbersSortedList.get(i);
            EngineResults unitResults = callEngineForOneUnit(engine, facts,unit);
            appendPeopleFlowData(combinedResults, unitResults);
        }
        return combinedResults;
    }

    private void appendPeopleFlowData(EngineResults combinedResults, EngineResults unitResults) {
        String combinedPeopleFlows = (String)combinedResults.getAttribute("peopleFlowsSelected");
        String unitPeopleFlows = (String)unitResults.getAttribute("peopleFlowsSelected");
        if(unitPeopleFlows!=null && !unitPeopleFlows.isEmpty()){
            combinedPeopleFlows=combinedPeopleFlows==null? unitPeopleFlows:combinedPeopleFlows+","+unitPeopleFlows;
        }
        combinedResults.setAttribute("peopleFlowsSelected", combinedPeopleFlows);
    }

    private EngineResults callEngineForOneUnit(Engine engine,Facts facts,String unitNumbersAsString) {
        Map<String, String> contextQualifiers = new HashMap<String, String>();
        contextQualifiers.put("namespaceCode", Constants.MODULE_NAMESPACE_PROPOSAL_DEVELOPMENT);
        contextQualifiers.put("name", KcKrmsConstants.ProposalDevelopment.PROPOSAL_DEVELOPMENT_CONTEXT);
        SelectionCriteria selectionCriteria = SelectionCriteria.createCriteria(null, contextQualifiers,
                Collections.singletonMap(KcKrmsConstants.UNIT_NUMBER, unitNumbersAsString));
        return engine.execute(selectionCriteria, facts, null);
    }

    private String getLeadUnitNumber(String proposalNumber) {
        DevelopmentProposal developmentProposal = getDataObjectService().find(DevelopmentProposal.class, proposalNumber);
        return developmentProposal.getOwnedByUnitNumber();
    }

    private List<String> getUnitNumbersInOrder(String unitNumber) {
        UnitService unitService = KcServiceLocator.getService(UnitService.class);
        List<Unit> unitHierarchy = unitService.getUnitHierarchyForUnit(unitNumber);
        List<String> units = new ArrayList<String>();
        for (Unit unit : unitHierarchy) {
            units.add(unit.getUnitNumber());
        }
        return units;
    }

    private List<String> getProposalPersonUnits(String proposalNumber) {
    	
    	 Map<String,String> params = new HashMap<String, String>();
         params.put("developmentProposal.proposalNumber", proposalNumber);

         List<ProposalPerson> proposalPersons = (List<ProposalPerson>) getDataObjectService().findMatching(ProposalPerson.class,
         		QueryByCriteria.Builder.andAttributes(params).build()).getResults();
        List<String> units = new ArrayList<String>();
        for (ProposalPerson proposalPerson : proposalPersons) {
            List<ProposalPersonUnit> proposalPersonUnits = proposalPerson.getUnits();
            for (ProposalPersonUnit proposalPersonUnit : proposalPersonUnits) {
                if(!units.contains(proposalPersonUnit.getUnitNumber())){
                    units.add(proposalPersonUnit.getUnitNumber());
                }
            }
        }
        return units;
    }
    
    private DataObjectService getDataObjectService() {
		return KcServiceLocator.getService(DataObjectService.class);
	}
}
