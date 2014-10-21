package org.kuali.coeus.propdev.impl.datavalidation;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.framework.custom.attr.CustomAttributeDocValue;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentControllerBase;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocumentForm;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl;
import org.kuali.coeus.propdev.impl.custom.ProposalDevelopmentCustomDataGroupDto;
import org.kuali.rice.krad.uif.UifParameters;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
public class ProposalDevelopmentDataValidationController extends ProposalDevelopmentControllerBase {
    private static final org.apache.log4j.Logger LOG = org.apache.log4j.Logger.getLogger(ProposalDevelopmentDataValidationController.class);


    @RequestMapping(value = "/proposalDevelopment", params="methodToCall=validateData")
    public ModelAndView validateData(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form, BindingResult result,
                                           HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (form.isAuditActivated()) {
            form.setDataValidationItems(((ProposalDevelopmentViewHelperServiceImpl)form.getViewHelperService()).populateDataValidation(form,form.getView().getViewIndex()));
        }

        return getModelAndViewService().showDialog("PropDev-DataValidationSection", true, form);
    }

    @RequestMapping(value = "/proposalDevelopment", params="methodToCall=toggleValidation")
    public ModelAndView toggleValidation(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form, BindingResult result,
                                     HttpServletRequest request, HttpServletResponse response) throws Exception {
        form.setAuditActivated(!form.isAuditActivated());
        if(form.isAuditActivated()) {
            form.setDataValidationItems(((ProposalDevelopmentViewHelperServiceImpl)form.getViewHelperService()).populateDataValidation(form,form.getView().getViewIndex()));
        }
        return getRefreshControllerService().refresh(form);

    }


    @RequestMapping(value = "/proposalDevelopment", params="methodToCall=navigateToError")
    public ModelAndView navigateToError(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form) throws Exception {
        String pageId = form.getActionParamaterValue(UifParameters.NAVIGATE_TO_PAGE_ID);
        if (StringUtils.equals(pageId,ProposalDevelopmentDataValidationConstants.CREDIT_ALLOCATION_PAGE_ID)) {
            ((ProposalDevelopmentViewHelperServiceImpl)form.getViewHelperService()).populateCreditSplits(form);
        }

        if (StringUtils.equals(pageId,ProposalDevelopmentDataValidationConstants.QUESTIONNAIRE_PAGE_ID)) {
            ((ProposalDevelopmentViewHelperServiceImpl)form.getViewHelperService()).populateQuestionnaires(form);
        }

        if (StringUtils.equals(pageId,ProposalDevelopmentDataValidationConstants.SUPPLEMENTAL_PAGE_ID)) {
            ((ProposalDevelopmentViewHelperServiceImpl)form.getViewHelperService()).populateCustomData(form);
        }
        getAuditHelper().auditConditionally(form);
        form.setAjaxReturnType("update-page");
        return getNavigationControllerService().navigate(form);
    }
}
