package edu.mit.kc.award.budget;

import org.kuali.kra.award.budget.AwardBudgetServiceImpl;
import org.kuali.kra.award.budget.document.AwardBudgetDocument;
import org.kuali.kra.infrastructure.KeyConstants;

import edu.mit.kc.infrastructure.KcMitConstants;

public class MitKcAwardBudgetServiceImpl extends AwardBudgetServiceImpl{
	
	@Override
	public void toggleStatus(AwardBudgetDocument awardBudgetDocument) {
		   String currentStatusCode = awardBudgetDocument.getAwardBudget().getAwardBudgetStatusCode();
	        if (currentStatusCode.equals(getParameterValue(KeyConstants.AWARD_BUDGET_STATUS_POSTED))) {
	            processStatusChange(awardBudgetDocument, KcMitConstants.AWARD_BUDGET_STATUS_REPOSTED);
	        }
	       
	        saveDocument(awardBudgetDocument);
	}
 
}
