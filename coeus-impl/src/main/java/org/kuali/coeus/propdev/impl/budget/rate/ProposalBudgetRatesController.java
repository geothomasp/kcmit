package org.kuali.coeus.propdev.impl.budget.rate;

import org.kuali.coeus.common.budget.framework.core.Budget;
import org.kuali.coeus.common.budget.framework.core.BudgetParentDocument;
import org.kuali.coeus.common.budget.framework.rate.BudgetRatesService;
import org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetControllerBase;
import org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/proposalBudget")
public class ProposalBudgetRatesController extends ProposalBudgetControllerBase {

	@Autowired
	@Qualifier("budgetRatesService")
	private BudgetRatesService budgetRatesService;
	
	@RequestMapping(params="methodToCall=syncAllRates")
	public ModelAndView syncAllRates(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
        Budget budget = form.getBudget();
        budget.setRateClassTypesReloaded(true);
        getBudgetRatesService().syncAllBudgetRates(budget);
        
        budget.setRateSynced(true);
        BudgetParentDocument parentDocument = budget.getBudgetParent().getDocument();
        if (!budget.getActivityTypeCode().equals(parentDocument.getBudgetParent().getActivityTypeCode())) {
            budget.setActivityTypeCode(parentDocument.getBudgetParent().getActivityTypeCode());
        }
       return getModelAndViewService().getModelAndView(form);
	}
	
	@RequestMapping(params="methodToCall=refreshAllRates")
	public ModelAndView refreshAllRates(@ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
        Budget budget = form.getBudget();
        getBudgetRatesService().resetAllBudgetRates(budget);
        return getModelAndViewService().getModelAndView(form);
	}
	
	@RequestMapping(params="methodToCall=syncRates")
	public ModelAndView syncRates(@RequestParam("rateClassTypeCode") String rateClassTypeCode, @ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
        Budget budget = form.getBudget();
        getBudgetRatesService().syncBudgetRatesForRateClassType(rateClassTypeCode, budget);
        budget.setRateClassTypesReloaded(false);
        if (rateClassTypeCode.equals(org.kuali.coeus.common.budget.api.rate.RateClassType.OVERHEAD.getRateClassType())) {
            budget.setRateSynced(true);
        }
        return getModelAndViewService().getModelAndView(form);
	}
	
	@RequestMapping(params="methodToCall=resetRates")
	public ModelAndView resetRates(@RequestParam("rateClassTypeCode") String rateClassTypeCode, @ModelAttribute("KualiForm") ProposalBudgetForm form) throws Exception {
        Budget budget = form.getBudget();
        getBudgetRatesService().resetBudgetRatesForRateClassType(rateClassTypeCode, budget);
        return getModelAndViewService().getModelAndView(form);
	}	

	public BudgetRatesService getBudgetRatesService() {
		return budgetRatesService;
	}

	public void setBudgetRatesService(BudgetRatesService budgetRatesService) {
		this.budgetRatesService = budgetRatesService;
	}
}
