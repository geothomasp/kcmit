package org.kuali.kra.s2s.generator.impl;


import static org.kuali.coeus.sys.framework.service.KcServiceLocator.getService;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.kuali.coeus.common.budget.framework.period.BudgetPeriod;
import org.kuali.coeus.propdev.impl.budget.ProposalDevelopmentBudgetExt;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.kra.s2s.generator.S2SModularBudgetTestBase;
import org.kuali.coeus.s2sgen.impl.generate.support.PHS398ModularBudgetV1_2Generator;
import org.kuali.rice.krad.data.DataObjectService;

public class PHS398ModularBudgetV1_2GeneratorTest extends
		S2SModularBudgetTestBase<PHS398ModularBudgetV1_2Generator> {

	@Override
	protected String getFormGeneratorName() {
		return PHS398ModularBudgetV1_2Generator.class.getSimpleName();
	}

	@Override
	protected void prepareData(ProposalDevelopmentDocument document)
			throws Exception {

		ProposalDevelopmentBudgetExt budget = new ProposalDevelopmentBudgetExt();
		budget.setBudgetId(new Long("000001"));
		budget.setBudgetStatus("1");
		budget.setStartDate(new Date(new Long("1183316613046")));
		budget.setEndDate(new Date(new Long("1214852613046")));
		budget.setOnOffCampusFlag("Y");
		budget.setOhRateClassCode("1");
		budget.setUrRateClassCode("1");
		budget.setModularBudgetFlag(false);
        budget.setParentDocumentTypeCode("PRDV");
        budget.setDevelopmentProposal(document.getDevelopmentProposal());
        budget.setName("test document description");
       
        List<BudgetPeriod> budgetPeriods = new ArrayList<BudgetPeriod>();
        BudgetPeriod budgetPeriod = new BudgetPeriod();
        budgetPeriod.setBudgetPeriod(1);
        budgetPeriod.setStartDate(new Date(new Long("1183316613046")));        
        budgetPeriod.setEndDate(new Date(new Long("1214852613046")));
        budgetPeriods.add(budgetPeriod);        
        budget.setBudgetPeriods(budgetPeriods);
        
		budget = getService(DataObjectService.class).save(budget);
		List<ProposalDevelopmentBudgetExt> budgets = new ArrayList<>();
		budgets.add(budget);
		document.getDevelopmentProposal().setBudgets(budgets);
		document.getDevelopmentProposal().setFinalBudget(budget);
	}
}
