package org.kuali.coeus.common.budget.impl.nonpersonnel;

import org.kuali.coeus.common.budget.framework.core.Budget;
import org.kuali.coeus.common.budget.framework.nonpersonnel.BudgetLineItem;
import org.kuali.coeus.common.budget.framework.nonpersonnel.BudgetLineItemEventBase;

public class DeleteBudgetLineItemEvent extends BudgetLineItemEventBase {
	
	public DeleteBudgetLineItemEvent(Budget budget, String errorPath, BudgetLineItem budgetLineItem) {
		super(budget, errorPath, budgetLineItem);
	}
}
