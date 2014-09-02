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
package org.kuali.coeus.propdev.impl.questionnaire;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.framework.module.CoeusSubModule;
import org.kuali.coeus.common.framework.print.AttachmentDataSource;
import org.kuali.coeus.common.questionnaire.framework.answer.Answer;
import org.kuali.coeus.common.questionnaire.framework.answer.AnswerHeader;
import org.kuali.coeus.common.questionnaire.framework.print.QuestionnairePrintingService;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentControllerBase;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocumentForm;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl;
import org.kuali.coeus.sys.api.model.KcFile;
import org.kuali.rice.krad.util.KRADUtils;
import org.kuali.rice.krad.web.controller.MethodAccessible;
import org.kuali.rice.krad.web.form.DocumentFormBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProposalDevelopmentQuestionnaireController extends ProposalDevelopmentControllerBase {


    @Autowired
    @Qualifier("questionnairePrintingService")
    private QuestionnairePrintingService questionnairePrintingService;

    @MethodAccessible
    @RequestMapping(value = "/proposalDevelopment", params={"methodToCall=navigate", "actionParameters[navigateToPageId]=PropDev-QuestionnairePage"})
    public ModelAndView navigateToQuestionnaire(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
        ((ProposalDevelopmentViewHelperServiceImpl) form.getViewHelperService()).populateQuestionnaires(form);
        return getNavigationControllerService().navigate(form);
    }

   @RequestMapping(value = "/proposalDevelopment", params="methodToCall=saveQuestionnaire")
   public ModelAndView saveQuestionnaire(@ModelAttribute("KualiForm") DocumentFormBase form, BindingResult result,
           HttpServletRequest request, HttpServletResponse response) throws Exception {
       ProposalDevelopmentDocumentForm pdForm = (ProposalDevelopmentDocumentForm) form;
       pdForm.getQuestionnaireHelper().preSave();
       getLegacyDataAdapter().save(pdForm.getQuestionnaireHelper().getAnswerHeaders());
       pdForm.getQuestionnaireHelper().populateAnswers();
       return super.save(pdForm, result, request, response);
   }

    @RequestMapping(value = "/proposalDevelopment", params="methodToCall=clearQuestionnaire")
    public ModelAndView clearQuestionnaire(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form, HttpServletResponse response,
                                           @RequestParam("actionParameters[index]") String index,  @RequestParam("actionParameters[helper]") String helper ) throws Exception {
        if(helper.equals("questionnaireHelper")) {
            clearAnswers(form.getQuestionnaireHelper().getAnswerHeaders().get(Integer.parseInt(index)).getAnswers());
        } else if (helper.equals("s2sQuestionnaireHelper")) {
            clearAnswers(form.getS2sQuestionnaireHelper().getAnswerHeaders().get(Integer.parseInt(index)).getAnswers());
        }

        return getModelAndViewService().getModelAndView(form);
    }

    protected void clearAnswers(List<Answer> answers) {
        for (Answer answer: answers) {
            answer.setAnswer(null);
        }
    }

    @RequestMapping(value = "/proposalDevelopment", params="methodToCall=updateQuestionnaire")
    public ModelAndView updateQuestionnaire(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form, HttpServletResponse response,
                                           @RequestParam("actionParameters[index]") String index,  @RequestParam("actionParameters[helper]") String helper ) throws Exception {

        if(helper.equals("questionnaireHelper")) {
            form.getQuestionnaireHelper().updateQuestionnaireAnswer(Integer.parseInt(index));
            getLegacyDataAdapter().save(form.getQuestionnaireHelper().getAnswerHeaders().get(Integer.parseInt(index)));
        } else if (helper.equals("s2sQuestionnaireHelper")) {
            form.getS2sQuestionnaireHelper().updateQuestionnaireAnswer(Integer.parseInt(index));
            getLegacyDataAdapter().save(form.getS2sQuestionnaireHelper().getAnswerHeaders().get(Integer.parseInt(index)));
        }

        return getModelAndViewService().getModelAndView(form);
    }

    @RequestMapping(value = "/proposalDevelopment", params="methodToCall=printQuestionnaire")
    public ModelAndView printQuestionnaire(@ModelAttribute("KualiForm") ProposalDevelopmentDocumentForm form, HttpServletResponse response,
                                           @RequestParam("index") int index,  @RequestParam("helper") String helper ) throws Exception {

        Map<String, Object> reportParameters = new HashMap<String, Object>();

        if (StringUtils.equals(helper, "questionnaireHelper")) {
            reportParameters.putAll(createReportParameters(form.getQuestionnaireHelper().getAnswerHeaders().get(index)));
            reportParameters.put("coeusModuleSubItemCode", CoeusSubModule.ZERO_SUBMODULE);
        } else if (StringUtils.equals(helper, "s2sQuestionnaireHelper")) {
            reportParameters.putAll(createReportParameters(form.getS2sQuestionnaireHelper().getAnswerHeaders().get(index)));
            reportParameters.put("coeusModuleSubItemCode", CoeusSubModule.PROPOSAL_S2S_SUBMODULE);
        } else if (StringUtils.equals(helper, "proposalPersonQuestionnaireHelper")) {
            reportParameters.putAll(createReportParameters(form.getProposalPersonQuestionnaireHelper().getAnswerHeaders().get(index)));
        } else {
            throw new RuntimeException(String.format("Do not know how to process printQuestionnaireAnswer for formProperty %s",helper));
        }

        AttachmentDataSource dataStream = getQuestionnairePrintingService().printQuestionnaireAnswer(form.getDevelopmentProposal(), reportParameters);

        if (dataStream.getData() != null) {
            streamToResponse(dataStream, response);
        }

        return getModelAndViewService().getModelAndView(form);
    }

    protected Map<String, Object> createReportParameters(AnswerHeader answerHeader) {

        Map<String, Object> reportParameters = new HashMap<String, Object>();

        reportParameters.put("questionnaireSeqId", answerHeader.getQuestionnaire().getQuestionnaireSeqIdAsInteger());
        reportParameters.put("template", answerHeader.getQuestionnaire().getTemplate());
        reportParameters.put("id",answerHeader.getQuestionnaire().getId());

        return reportParameters;
    }

    protected void streamToResponse(KcFile attachmentDataSource, HttpServletResponse response) throws Exception {
        byte[] data = attachmentDataSource.getData();
        long size = data.length;
        try (ByteArrayInputStream inputStream = new ByteArrayInputStream(data)) {
            KRADUtils.addAttachmentToResponse(response, inputStream, attachmentDataSource.getType(), attachmentDataSource.getName(), size);
            response.flushBuffer();
        }
    }

    public QuestionnairePrintingService getQuestionnairePrintingService() {
        return questionnairePrintingService;
    }

    public void setQuestionnairePrintingService(QuestionnairePrintingService questionnairePrintingService) {
        this.questionnairePrintingService = questionnairePrintingService;
    }

}
