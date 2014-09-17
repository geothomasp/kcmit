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
package org.kuali.coeus.common.budget.impl.distribution;

import org.kuali.coeus.common.budget.framework.core.Budget;
import org.kuali.coeus.common.budget.framework.distribution.BudgetCostShare;
import org.kuali.coeus.common.framework.costshare.CostShareRuleResearchDocumentBase;
import org.kuali.coeus.common.framework.ruleengine.KcBusinessRule;
import org.kuali.coeus.common.framework.ruleengine.KcEventMethod;
import org.kuali.rice.krad.util.GlobalVariables;

/**
 * 
 * This class ProcessDefinitionDefinitiones Budget Project Income rules.
 */
@KcBusinessRule("budgetCostShareRule")
public class BudgetCostShareRule extends CostShareRuleResearchDocumentBase {

    private static final String ADD_ERROR_KEY = "error.custom";
    
    @KcEventMethod(events = {AddBudgetCostShareEvent.EVENT_NAME})
    public boolean processAddBudgetCostShareBusinessRules(AddBudgetCostShareEvent budgetCostShareEvent) {
        boolean retVal = !areDuplicatesPresent(budgetCostShareEvent.getBudget(), budgetCostShareEvent.getBudgetCostShare());
        retVal &= validateProjectPeriod(budgetCostShareEvent);
        return retVal;
    }

    /**
     * This method ensures that an added BudgetCostShare won't duplicate another. A duplicate record would have the same source
     * account, share amount, and fiscal year as another already in the list.
     * 
     * @param testBudgetCostShare
     * @return
     */
    protected boolean areDuplicatesPresent(Budget budget, BudgetCostShare testBudgetCostShare) {
        boolean duplicate = false;

        if (testBudgetCostShare == null) {
            return duplicate;
        }
        for (BudgetCostShare budgetCostShare : budget.getBudgetCostShares()) {
            duplicate = checkForDuplicateFields(testBudgetCostShare, budgetCostShare);
            if (duplicate) {
                break;
            }
        }
        return duplicate;
    }

    /**
     * This method checks if two BudgetCostShare objects are duplicates, meaning the fiscalYear, shareAmount, and sourceAccount are
     * equal
     * 
     * @param testBudgetCostShare
     * @param budgetCostShare
     * @return
     */
    private boolean checkForDuplicateFields(BudgetCostShare testBudgetCostShare,
                                            BudgetCostShare budgetCostShare) {
        boolean duplicate = testBudgetCostShare.equals(budgetCostShare);
        if (duplicate) {
            GlobalVariables.getMessageMap().putError("newCostShare.*", ADD_ERROR_KEY,
                    "A Cost Share with the same Fiscal Year, Source Account and Amount exists in the table");
        }
        return duplicate;
    }

    private boolean validateProjectPeriod(AddBudgetCostShareEvent budgetCostShareEvent) {
        String projectPeriodField = "newBudgetCostShare.projectPeriod";
        int numberOfProjectPeriods = budgetCostShareEvent.getBudget().getBudgetPeriods().size();
        return this.validateProjectPeriod(budgetCostShareEvent.getBudgetCostShare().getProjectPeriod(), projectPeriodField, numberOfProjectPeriods);
    }
}