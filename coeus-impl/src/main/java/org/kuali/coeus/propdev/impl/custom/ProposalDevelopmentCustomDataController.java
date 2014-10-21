package org.kuali.coeus.propdev.impl.custom;

import org.kuali.coeus.common.framework.custom.attr.CustomAttribute;
import org.kuali.coeus.common.framework.custom.attr.CustomAttributeDocValue;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentControllerBase;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocumentForm;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl;
import org.kuali.rice.krad.web.controller.MethodAccessible;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ProposalDevelopmentCustomDataController extends ProposalDevelopmentControllerBase {

    @RequestMapping(value = "/proposalDevelopment", params="methodToCall=customDataNavigate")
    public ModelAndView customDataNavigate(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form, BindingResult result,
                                             HttpServletRequest request, HttpServletResponse response) throws Exception {
        ((ProposalDevelopmentViewHelperServiceImpl)form.getViewHelperService()).populateCustomData(form);
        return super.navigate(form,result,request,response);
    }
}
