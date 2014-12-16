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

import org.apache.commons.lang3.ObjectUtils;
import org.kuali.coeus.common.budget.framework.calculator.BudgetCalculationService;
import org.kuali.coeus.propdev.impl.budget.ProposalDevelopmentBudgetExt;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentControllerBase;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocumentForm;
import org.kuali.rice.krad.web.controller.MethodAccessible;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/proposalDevelopment")
public class ProposalBudgetController extends ProposalDevelopmentControllerBase {

    private static final String BUDGET_SUMMARY_DIALOG_ID = "PropBudget-SummaryPage-Dialog";

	@Autowired
	@Qualifier("proposalBudgetSharedControllerService")
	private ProposalBudgetSharedControllerService proposalBudgetSharedController;

    @Autowired
    @Qualifier("budgetCalculationService")
    private BudgetCalculationService budgetCalculationService;

    @RequestMapping(params="methodToCall=addBudget")
    public ModelAndView addBudget(@RequestParam("addBudgetDto.budgetName") String budgetName, 
    		@RequestParam("addBudgetDto.summaryBudget") Boolean summaryBudget,
            @RequestParam(value="addBudgetDto.modularBudget",defaultValue="false") Boolean modularBudget,
    		@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form) throws Exception {
		super.save(form);
		return getProposalBudgetSharedController().addBudget(budgetName, summaryBudget, modularBudget, form.getDevelopmentProposal(), form);
    }

	@MethodAccessible
    @Transactional @RequestMapping(params="methodToCall=copyBudget")
	public ModelAndView copyBudget(@RequestParam("copyBudgetDto.budgetName") String budgetName, 
			@RequestParam("copyBudgetDto.originalBudgetId") Long originalBudgetId, 
			@RequestParam("copyBudgetDto.allPeriods") Boolean allPeriods,
			@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form) throws Exception {
		super.save(form);
		return getProposalBudgetSharedController().copyBudget(budgetName, originalBudgetId, allPeriods, form.getDevelopmentProposal(), form);
	}

	@Transactional @RequestMapping(params="methodToCall=populateBudgetSummary")
    public ModelAndView populateBudgetSummary(@RequestParam("budgetId") Long budgetId,
                                              @ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form) throws Exception {
        super.save(form);
        ProposalDevelopmentBudgetExt selectedBudget = null;
        if (form.getProposalDevelopmentDocument().getDevelopmentProposal().getBudgets() != null) {
            for (ProposalDevelopmentBudgetExt curBudget : form.getProposalDevelopmentDocument().getDevelopmentProposal().getBudgets()) {
                if (ObjectUtils.equals(budgetId, curBudget.getBudgetId())) {
                    selectedBudget = curBudget;
                }
            }
        }
        form.setSelectedBudget(selectedBudget);
        if(form.getSelectedBudget().getBudgetSummaryDetails().isEmpty()) {
            getBudgetCalculationService().populateBudgetSummaryTotals(form.getSelectedBudget());
        }
        return getModelAndViewService().showDialog(BUDGET_SUMMARY_DIALOG_ID, true, form);
    }

    @Transactional @RequestMapping(params="methodToCall=markForSubmission")
	public ModelAndView markForSubmission(@RequestParam("budgetId") Long budgetId, @ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form) throws Exception {
		ProposalDevelopmentBudgetExt finalBudget = null;
		if (form.getProposalDevelopmentDocument().getDevelopmentProposal().getBudgets() != null) {
			for (ProposalDevelopmentBudgetExt curBudget : form.getProposalDevelopmentDocument().getDevelopmentProposal().getBudgets()) {
				if (ObjectUtils.equals(budgetId, curBudget.getBudgetId())) {
					finalBudget = curBudget;
				}
			}
		}
		form.getProposalDevelopmentDocument().getDevelopmentProposal().setFinalBudget(finalBudget);
		return super.save(form);
	}
	
	@Transactional @RequestMapping(params="methodToCall=openBudget")
	public ModelAndView openBudget(@RequestParam("budgetId") String budgetId, @ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form) throws Exception {
		super.save(form);
		return getProposalBudgetSharedController().openBudget(budgetId, form);
	}		

	public ProposalBudgetSharedControllerService getProposalBudgetSharedController() {
		return proposalBudgetSharedController;
	}

	public void setProposalBudgetSharedController(
			ProposalBudgetSharedControllerService proposalBudgetSharedController) {
		this.proposalBudgetSharedController = proposalBudgetSharedController;
	}

    public BudgetCalculationService getBudgetCalculationService() {
        return budgetCalculationService;
    }

    public void setBudgetCalculationService(BudgetCalculationService budgetCalculationService) {
        this.budgetCalculationService = budgetCalculationService;
    }
}
