/*
 * Copyright 2005-2010 The Kuali Foundation
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
package org.kuali.coeus.propdev.impl.budget.core;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.api.sponsor.hierarchy.SponsorHierarchyService;
import org.kuali.coeus.common.budget.framework.core.BudgetConstants;
import org.kuali.coeus.common.budget.framework.distribution.BudgetCostShare;
import org.kuali.coeus.common.budget.framework.distribution.BudgetUnrecoveredFandA;
import org.kuali.coeus.common.budget.framework.income.BudgetProjectIncome;
import org.kuali.coeus.propdev.impl.budget.modular.BudgetModular;
import org.kuali.coeus.propdev.impl.budget.modular.BudgetModularIdc;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentConstants;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.krad.uif.UifParameters;
import org.kuali.rice.krad.uif.element.Action;
import org.kuali.rice.krad.uif.service.impl.ViewHelperServiceImpl;
import org.kuali.rice.krad.uif.view.ViewModel;
import org.kuali.rice.krad.util.KRADConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service("proposalBudgetViewHelperService")
@Scope("prototype")
public class ProposalBudgetViewHelperServiceImpl extends ViewHelperServiceImpl {

    @Autowired
    @Qualifier("parameterService")
    private ParameterService parameterService;

    @Autowired
    @Qualifier("sponsorHierarchyService")
    private SponsorHierarchyService sponsorHierarchyService;

    public void finalizeNavigationLinks(Action action, Object model, String direction) {
    	ProposalBudgetForm propBudgetForm = (ProposalBudgetForm) model;
   	 List<Action> actions = propBudgetForm.getOrderedNavigationActions();
   	 int indexOfCurrentAction = propBudgetForm.findIndexOfPageId(actions);
   	 if (StringUtils.equals(direction, ProposalDevelopmentConstants.KradConstants.PREVIOUS_PAGE_ARG)) {
   		 action.setRender(indexOfCurrentAction > 0);
   		 if (indexOfCurrentAction > 0) {
   			 action.getActionParameters().put(UifParameters.NAVIGATE_TO_PAGE_ID, propBudgetForm.getOrderedNavigationActions().get(indexOfCurrentAction-1).getNavigateToPageId());
   		 }
   	 } else if (StringUtils.equals(direction, ProposalDevelopmentConstants.KradConstants.NEXT_PAGE_ARG)) {
   		 action.setRender(indexOfCurrentAction < actions.size());
   		 if (indexOfCurrentAction < actions.size()) {
   			 action.getActionParameters().put(UifParameters.NAVIGATE_TO_PAGE_ID, propBudgetForm.getOrderedNavigationActions().get(indexOfCurrentAction+1).getNavigateToPageId());
   		 }
   	 }
    }

    public boolean isBudgetLineItemEditable(String selectedCollectionPath, String index, HashMap<String,List<String>> editableBudgetLineItem) {
    	boolean retVal = false;
        if (editableBudgetLineItem.containsKey(selectedCollectionPath)) {
            if (editableBudgetLineItem.get(selectedCollectionPath).contains(index)) {
                retVal = true;
            }
        }
        return retVal;
    }

    @Override
    public void processBeforeAddLine(ViewModel model, Object addLine, String collectionId, String collectionPath) {
        if (addLine instanceof BudgetProjectIncome) {
            BudgetProjectIncome budgetProjectIncome = (BudgetProjectIncome) addLine;
            if (budgetProjectIncome != null) {
                budgetProjectIncome.setBudgetId(((ProposalBudgetForm) model).getBudget().getBudgetId());
                budgetProjectIncome.setDocumentComponentId(((ProposalBudgetForm) model).getBudget().getNextValue(budgetProjectIncome.getDocumentComponentIdKey()));
                budgetProjectIncome.setBudgetPeriod(((ProposalBudgetForm) model).getBudget().getBudgetPeriod(budgetProjectIncome));
            }
        }

        if (addLine instanceof BudgetUnrecoveredFandA) {
            BudgetUnrecoveredFandA budgetUnrecoveredFandA = (BudgetUnrecoveredFandA) addLine;
            if (budgetUnrecoveredFandA != null) {
                budgetUnrecoveredFandA.setBudget(((ProposalBudgetForm) model).getBudget());
                budgetUnrecoveredFandA.setDocumentComponentId(((ProposalBudgetForm) model).getBudget().getNextValue(budgetUnrecoveredFandA.getDocumentComponentIdKey()));
            }
        }
        if (addLine instanceof BudgetCostShare) {
            BudgetCostShare budgetCostShare = (BudgetCostShare) addLine;
            if (budgetCostShare != null) {
                budgetCostShare.setBudget(((ProposalBudgetForm) model).getBudget());
                budgetCostShare.setDocumentComponentId(((ProposalBudgetForm) model).getBudget().getNextValue(budgetCostShare.getDocumentComponentIdKey()));
            }
        }
        if (addLine instanceof BudgetModularIdc) {
            BudgetModularIdc budgetModularIdc = (BudgetModularIdc) addLine;
            try {
                budgetModularIdc.setBudgetModular((BudgetModular)PropertyUtils.getNestedProperty(model, StringUtils.replace(collectionPath, ".budgetModularIdcs", "")));
            } catch (Exception e) {
                throw new RuntimeException("proposal budget modular cannot be retrieved from propdev budget",e);
            }
            budgetModularIdc.setBudgetPeriod(budgetModularIdc.getBudgetModular().getBudgetPeriod());
            budgetModularIdc.setBudgetId(budgetModularIdc.getBudgetModular().getBudgetId());
            budgetModularIdc.setBudgetPeriodId(budgetModularIdc.getBudgetModular().getBudgetPeriodId());
            budgetModularIdc.setRateNumber(((ProposalBudgetForm) model).getBudget().getNextValue("rateNumber"));
          }
    }

    @Override
    public void processAfterSaveLine(ViewModel model, Object lineObject, String collectionId, String collectionPath) {
    	getDataObjectService().save(lineObject);
    }

    public String getWizardMaxResults() {
        return getParameterService().getParameterValueAsString(KRADConstants.KRAD_NAMESPACE,
                KRADConstants.DetailTypes.LOOKUP_PARM_DETAIL_TYPE,
                KRADConstants.SystemGroupParameterNames.LOOKUP_RESULTS_LIMIT);
    }

    public ParameterService getParameterService() {
        return parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public SponsorHierarchyService getSponsorHierarchyService() {
        return sponsorHierarchyService;
    }

    public void setSponsorHierarchyService(SponsorHierarchyService sponsorHierarchyService) {
        this.sponsorHierarchyService = sponsorHierarchyService;
    }

    public boolean isShowModularBudgetQuestion(String sponsorCode) {
        return getSponsorHierarchyService().isSponsorNihMultiplePi(sponsorCode);
    }

    public boolean displayPersonSalaryByPeriod() {
        return getParameterService().getParameterValueAsBoolean(ProposalDevelopmentDocument.class, BudgetConstants.ENABLE_BUDGET_CALCULATED_SALARY);
    }

}
