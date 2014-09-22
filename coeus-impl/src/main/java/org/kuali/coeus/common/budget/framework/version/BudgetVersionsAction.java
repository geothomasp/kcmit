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
package org.kuali.coeus.common.budget.framework.version;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.kuali.coeus.common.budget.framework.core.*;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.sys.framework.validation.AuditHelper;
import org.kuali.coeus.sys.framework.controller.StrutsConfirmation;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.award.budget.AwardBudgetForm;
import org.kuali.kra.award.budget.AwardBudgetService;
import org.kuali.kra.award.budget.document.AwardBudgetDocument;
import org.kuali.kra.award.document.AwardDocument;
import org.kuali.kra.award.home.Award;
import org.kuali.coeus.common.budget.framework.rate.BudgetRate;
import org.kuali.coeus.common.budget.framework.rate.BudgetRatesService;
import org.kuali.coeus.common.budget.framework.rate.RateClass;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.coeus.propdev.impl.hierarchy.ProposalHierarcyActionHelper;
import org.kuali.coeus.common.budget.framework.copy.CopyPeriodsQuestion;
import org.kuali.rice.kew.api.exception.WorkflowException;
import org.kuali.rice.kns.authorization.AuthorizationConstants;
import org.kuali.rice.krad.service.DocumentService;
import org.kuali.rice.krad.util.GlobalVariables;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import static org.apache.commons.lang3.StringUtils.isNotBlank;
import static org.kuali.kra.infrastructure.Constants.MAPPING_BASIC;
import static org.kuali.rice.krad.util.KRADConstants.QUESTION_CLICKED_BUTTON;
import static org.kuali.rice.krad.util.KRADConstants.QUESTION_INST_ATTRIBUTE_NAME;

/**
 * Struts Action class for requests from the Budget Versions page.
 */
public class BudgetVersionsAction extends BudgetAction {

    private static final Log LOG = LogFactory.getLog(BudgetVersionsAction.class);

    private static final String TOGGLE_TAB = "toggleTab";
    private static final String CONFIRM_SYNCH_BUDGET_RATE_BUDGET_DOCUMENT = "confirmSynchBudgetRateForBudgetDocument";
    private static final String NO_SYNCH_BUDGET_RATE_BUDGET_DOCUMENT = "noSynchBudgetRateForBudgetDocument";    
    /**
     * Main execute method that is run. Populates A map of rate types in the {@link HttpServletRequest} instance to be used
     * in the JSP. The map is called <code>rateClassMap</code> this is set everytime execute is called in this class. This should only
     * happen for the BudgetVersions tab. This ensures that even if {@link RateClass} persisted data may change, it will update the map
     * correctly.
     * 
     * @param mapping {@link ActionMapping}
     * @param form {@link ActionForm} instance
     * @param request {@link HttpServletRequest} instance
     * @param response {@link HttpServletResponse} instance 
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setAttribute("rateClassMap", getBudgetRatesService().getBudgetRateClassMap("O"));
        
        final BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDocument = budgetForm.getBudgetDocument();
        BudgetParent budgetParent = budgetDocument.getBudget().getBudgetParent();
        BudgetParentDocument parentDocument = budgetParent.getDocument();
   
        //when this is an award budget even though the budget cannot be saved a budget can still
        //be copied. By doing this here we make sure that it will still save
        //new budgets names even though the document itself cannot be saved
        if (!StringUtils.equals(budgetForm.getMethodToCall(), "save") && budgetForm.isSaveAfterCopy()) {
            List<? extends Budget> budgets = budgetParent.getBudgets();
            Budget copiedBudget = budgets.get(budgets.size() -1);
            String copiedName = copiedBudget.getName();
            copiedBudget.setName("copied placeholder");
            LOG.debug("validating " + copiedName);
            boolean valid = getBudgetService().isBudgetVersionNameValid(budgetParent, copiedName);
            copiedBudget.setName(copiedName);
            budgetForm.setSaveAfterCopy(!valid);
            if (!valid) {
                return mapping.findForward(Constants.MAPPING_BASIC);
            }
        }        
        
        return super.execute(mapping, form, request, response);
    }

    @Override
    public ActionForward docHandler(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        final ActionForward forward = super.docHandler(mapping, form, request, response);
        final BudgetForm budgetForm = (BudgetForm) form;
        Budget budget = budgetForm.getBudget();
        BudgetParentDocument parentDocument = budget.getBudgetParent().getDocument();
        BudgetParent budgetParent = budget.getBudgetParent();
        AwardBudgetService awardBudgetService = KcServiceLocator.getService(AwardBudgetService.class);
        BudgetRatesService budgetService = KcServiceLocator.getService(BudgetRatesService.class);
        Collection<BudgetRate> savedBudgetRates = budgetService.getSavedBudgetRates(budget);
        Collection<BudgetRate> allPropRates = budgetService.getSavedBudgetRates(budget);
        if (isAwardBudget(budget)) {
            Award award = (Award) budget.getBudgetParent().getDocument().getBudgetParent();
            if (awardBudgetService.checkRateChange(savedBudgetRates, award)) {
                return confirm(
                        syncAwardBudgetRateConfirmationQuestion(mapping, form, request, response,
	                    KeyConstants.QUESTION_SYNCH_AWARD_RATE), CONFIRM_SYNCH_AWARD_RATES, NO_SYNCH_AWARD_RATES);
	        	 }
	        	 }
        if (budgetService.checkActivityTypeChange(allPropRates, budgetParent.getActivityTypeCode())) {
            //Rates-Refresh Scenario-2
            budget.setRateClassTypesReloaded(true);
            return confirm(syncBudgetRateConfirmationQuestion(mapping, form, request, response,
                    KeyConstants.QUESTION_SYNCH_BUDGET_RATE), CONFIRM_SYNCH_BUDGET_RATE_BUDGET_DOCUMENT, NO_SYNCH_BUDGET_RATE_BUDGET_DOCUMENT);
        } else if(CollectionUtils.isEmpty(allPropRates)) {
            //Throw Empty Rates message
            return confirm(syncBudgetRateConfirmationQuestion(mapping, form, request, response,
                    KeyConstants.QUESTION_NO_RATES_ATTEMPT_SYNCH), CONFIRM_SYNCH_BUDGET_RATE_BUDGET_DOCUMENT, NO_SYNCH_BUDGET_RATE_BUDGET_DOCUMENT);
	        }

        return forward;
    }
    
    /**
     * Action called to create a new budget version.
     * 
     * @param mapping 
     * @param form
     * @param request
     * @param response
     * @return ActionForward instance for forwarding to the tab.
     */
    public ActionForward addBudgetVersion(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;
        Budget budget = budgetForm.getBudget();
        BudgetParentDocument parentDocument = budget.getBudgetParent().getDocument();
        
        
        getBudgetService().addBudgetVersion(parentDocument, budgetForm.getNewBudgetVersionName(), Collections.EMPTY_MAP);
        budgetForm.setNewBudgetVersionName("");
        
        return mapping.findForward(Constants.MAPPING_BASIC);
    }
    

    private BudgetParentDocument getBudgetParentDocument(BudgetForm budgetForm) {
        BudgetDocument budgetDocument = budgetForm.getBudgetDocument();
        BudgetParentDocument parentDocument = budgetDocument.getBudget().getBudgetParent().getDocument();
        return parentDocument;
    }
    
    private BudgetService getBudgetService() {
        return KcServiceLocator.getService(BudgetService.class);
    }

    /**
     * This method opens a budget version.
     * 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return ActionForward
     * @throws Exception
     */
    public ActionForward openBudgetVersion(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;

        BudgetRatesService budgetService = KcServiceLocator.getService(BudgetRatesService.class);
        
        if (!"TRUE".equals(budgetForm.getEditingMode().get(AuthorizationConstants.EditMode.VIEW_ONLY))) {
            save(mapping, form, request, response);
        }
        BudgetDocument budgetDoc = budgetForm.getBudgetDocument();
        
        Budget budget = budgetDoc.getBudget();
        BudgetParentDocument budgetParentDocument = getBudgetParentDocument(budgetForm);
        BudgetParent budgetParent = budgetParentDocument.getBudgetParent();
        
        Budget budgetToOpen = budgetParentDocument.getBudgetDocumentVersion(getSelectedLine(request));
        DocumentService documentService = KcServiceLocator.getService(DocumentService.class);
        BudgetDocument budgetDocument = (BudgetDocument) documentService.getByDocumentHeaderId(budgetToOpen.getDocumentNumber());
        Budget budgetOpen = budgetDocument.getBudget();
        String routeHeaderId = budgetDocument.getDocumentHeader().getWorkflowDocument().getDocumentId();
        
        
        Collection<BudgetRate> allPropRates = budgetService.getSavedBudgetRates(budgetOpen);
        if(getBudgetRateService().performSyncFlag(budgetOpen)){
            budget.setRateClassTypesReloaded(true);
        }
        if (budgetService.checkActivityTypeChange(allPropRates, budgetParent.getActivityTypeCode())) {
            //Rates-Refresh Scenario-2
            budget.setRateClassTypesReloaded(true);
            return confirm(syncBudgetRateConfirmationQuestion(mapping, form, request, response,
                    KeyConstants.QUESTION_SYNCH_BUDGET_RATE), CONFIRM_SYNCH_BUDGET_RATE, NO_SYNCH_BUDGET_RATE);
        } else if(CollectionUtils.isEmpty(allPropRates)) {
            //Throw Empty Rates message
            return confirm(syncBudgetRateConfirmationQuestion(mapping, form, request, response,
                    KeyConstants.QUESTION_NO_RATES_ATTEMPT_SYNCH), CONFIRM_SYNCH_BUDGET_RATE, NO_SYNCH_BUDGET_RATE);
        }        

        String forward = buildForwardUrl(routeHeaderId);
        return new ActionForward(forward, true);
    }
    protected StrutsConfirmation syncBudgetRateConfirmationQuestion(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response, String message) throws Exception {
        return buildParameterizedConfirmationQuestion(mapping, form, request, response, CONFIRM_SYNCH_BUDGET_RATE,
                message, "");
    }
    public ActionForward confirmSynchBudgetRateForBudgetDocument(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDocument = budgetForm.getBudgetDocument();
    
        return synchBudgetRate(budgetDocument, true);
    }

    public ActionForward noSynchBudgetRateForBudgetDocument(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDocument = budgetForm.getBudgetDocument();

        return synchBudgetRate(budgetDocument, false);
    }
    protected ActionForward synchBudgetRate(BudgetDocument budgetDocument, boolean confirm) throws Exception {
        Budget budgetOpen = budgetDocument.getBudget();
        String routeHeaderId = budgetDocument.getDocumentHeader().getWorkflowDocument().getDocumentId();
        budgetOpen.setActivityTypeCode(budgetDocument.getBudget().getBudgetParent().getDocument().getBudgetParent().getActivityTypeCode());
        budgetOpen.setRateClassTypesReloaded(true);
        String forward = buildForwardUrl(routeHeaderId);
        if (confirm) {
            forward = forward.replace("budgetParameters.do?", "budgetParameters.do?syncBudgetRate=Y&");
         }
        return new ActionForward(forward, true);
    }


    
    public ActionForward confirmSynchBudgetRate(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDocument = getSelectedBudgetDocument(request, budgetForm);

        return synchBudgetRate(budgetDocument, true);
    }


    private BudgetDocument getSelectedBudgetDocument(HttpServletRequest request, BudgetForm budgetForm) throws WorkflowException {
        BudgetDocument budgetDoc = budgetForm.getBudgetDocument();
        BudgetParentDocument budgetParentDocument = budgetDoc.getBudget().getBudgetParent().getDocument();
        Budget budgetToOpen = budgetParentDocument.getBudgetDocumentVersion(getSelectedLine(request));
        DocumentService documentService = KcServiceLocator.getService(DocumentService.class);
        BudgetDocument budgetDocument = (BudgetDocument) documentService.getByDocumentHeaderId(budgetToOpen.getDocumentNumber());
        return budgetDocument;
    }

    public ActionForward noSynchBudgetRate(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDocument = getSelectedBudgetDocument(request, budgetForm);
        return synchBudgetRate(budgetDocument, false);
        }

    private BudgetRatesService getBudgetRateService() {
        return KcServiceLocator.getService(BudgetRatesService.class);
    }


    /**
     * This method copies a budget version's data to a new budget version.
     * 
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return ActionForward
     * @throws Exception
     */
    public ActionForward copyBudgetVersion(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      BudgetForm budgetForm = (BudgetForm) form;
      Budget versionToCopy = getSelectedVersion(budgetForm, request);
      BudgetParentDocument parentDocument = budgetForm.getBudgetDocument().getBudget().getBudgetParent().getDocument();
      BudgetParent budgetParent = budgetForm.getBudgetDocument().getBudget().getBudgetParent();
      BudgetCommonService<BudgetParent> budgetService = getBudgetCommonService(budgetParent);
      if (!budgetService.validateAddingNewBudget(parentDocument)) {
          return mapping.findForward(Constants.MAPPING_BASIC);
      }
      if (isNotBlank(request.getParameter(QUESTION_INST_ATTRIBUTE_NAME))) {
          Object buttonClicked = request.getParameter(QUESTION_CLICKED_BUTTON);
          if (CopyPeriodsQuestion.ONE.equals(buttonClicked)) {
              budgetForm.setSaveAfterCopy(true);
              return copyBudgetPeriodOne(mapping, form, request, response);
          }
          else if (CopyPeriodsQuestion.ALL.equals(buttonClicked)) {
              budgetForm.setSaveAfterCopy(true);
              return copyBudgetAllPeriods(mapping, form, request, response);
          } else {
              // URL hack, just return
              return mapping.findForward(Constants.MAPPING_BASIC);
          }
      }
      return performQuestionWithoutInput(mapping, form, request, response, COPY_BUDGET_PERIOD_QUESTION, QUESTION_TEXT + versionToCopy.getBudgetVersionNumber() + ".", QUESTION_TYPE, budgetForm.getMethodToCall(), "");

    }
    
    @Override
    public ActionForward save(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;
        boolean valid = true;
        BudgetDocument budgetDocument = budgetForm.getBudgetDocument();
        BudgetParentDocument parentDocument = budgetDocument.getBudget().getBudgetParent().getDocument();
        Budget budget = budgetDocument.getBudget();

        if (parentDocument instanceof ProposalDevelopmentDocument && !(new ProposalHierarcyActionHelper()).checkParentChildStatusMatch((ProposalDevelopmentDocument)parentDocument)) {
            return mapping.findForward(Constants.MAPPING_BASIC);
        }
        
        if (budgetForm.isSaveAfterCopy()) {
            List<? extends Budget> overviews = parentDocument.getBudgetParent().getBudgets();
            Budget copiedOverview = overviews.get(overviews.size() - 1);
            String copiedName = copiedOverview.getName();
            copiedOverview.setName("copied placeholder");
            LOG.debug("validating " + copiedName);
            valid = getBudgetService().isBudgetVersionNameValid(parentDocument.getBudgetParent(), copiedName);
            copiedOverview.setName(copiedName);
            budgetForm.setSaveAfterCopy(!valid);
        }

        ActionForward forward = super.save(mapping, form, request, response);
        return forward;
    }
    
    public ActionForward copyBudgetPeriodOne(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Object question = request.getParameter(QUESTION_INST_ATTRIBUTE_NAME);
        if (COPY_BUDGET_PERIOD_QUESTION.equals(question)) {
            copyBudget(form, request, true);
        }
        
        return mapping.findForward(MAPPING_BASIC);
    }
    
    public ActionForward copyBudgetAllPeriods(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Object question = request.getParameter(QUESTION_INST_ATTRIBUTE_NAME);
        if (COPY_BUDGET_PERIOD_QUESTION.equals(question)) {
            copyBudget(form, request, false);
        }
        return mapping.findForward(MAPPING_BASIC);
    }
    
    private Budget getSelectedVersion(BudgetForm budgetForm, HttpServletRequest request) {
        return budgetForm.getBudgetDocument().getBudget().getBudgetParent().getBudgets().get(getSelectedLine(request));
    }
    
    private void copyBudget(ActionForm form, HttpServletRequest request, boolean copyPeriodOneOnly) throws WorkflowException {
        BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDoc = budgetForm.getBudgetDocument();
        BudgetParentDocument pdDoc = budgetDoc.getBudget().getBudgetParent().getDocument();
        Budget budgetToCopy = getSelectedVersion(budgetForm, request);
        copyBudget(pdDoc, budgetToCopy, copyPeriodOneOnly);
    }
    
    
    /**
     * Action called to create a new budget version.
     * 
     * @param mapping 
     * @param form
     * @param request
     * @param response
     * @return ActionForward instance for forwarding to the tab.
     */
    public ActionForward rebudget(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BudgetForm budgetForm = (BudgetForm) form;
        BudgetDocument budgetDocument = budgetForm.getBudgetDocument();
        AwardDocument parentDocument = (AwardDocument)budgetDocument.getBudget().getBudgetParent().getDocument();

        AwardBudgetDocument newBudgetDoc = getAwardBudgetService().rebudget(parentDocument, 
                                                        budgetForm.getNewBudgetVersionName());
        if(newBudgetDoc!=null){
            budgetForm.setNewBudgetVersionName("");
        }
        return mapping.findForward(Constants.MAPPING_BASIC); 
    }

    private AwardBudgetService getAwardBudgetService() {
        return KcServiceLocator.getService(AwardBudgetService.class);
    }

    private BudgetRatesService getBudgetRatesService() {
        return KcServiceLocator.getService(BudgetRatesService.class);
    }
}
