/*
 * Copyright 2005-2014 The Kuali Foundation
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
package org.kuali.coeus.propdev.impl.person.question;

import org.kuali.coeus.common.framework.module.CoeusModule;
import org.kuali.coeus.common.framework.krms.KrmsRulesContext;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.coeus.propdev.impl.questionnaire.ProposalDevelopmentModuleQuestionnaireBean;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;



public class ProposalPersonModuleQuestionnaireBean extends ProposalDevelopmentModuleQuestionnaireBean {
    
    /**
     * 
     * Constructs a ProposalPersonModuleQuestionnaireBean.java.
     * @param developmentProposal
     * @param person
     */
    public ProposalPersonModuleQuestionnaireBean(DevelopmentProposal developmentProposal, ProposalPerson person) {
        super(CoeusModule.PROPOSAL_DEVELOPMENT_MODULE_CODE, person.getUniqueId(), 
        		getSubModuleItemCode(person.getProposalPersonRoleId()), "0", 
                developmentProposal.getProposalDocument().getDocumentHeader().getWorkflowDocument().isApproved());
        setDevelopmentProposal(developmentProposal);
    }
    
    public ProposalPersonModuleQuestionnaireBean(String moduleItemCode, String moduleItemKey, String moduleSubItemCode, String moduleSubItemKey, boolean finalDoc) {
        super(moduleItemCode, moduleItemKey, moduleSubItemCode, moduleSubItemKey, finalDoc);
    }
    
    @Override
    public KrmsRulesContext getKrmsRulesContextFromBean() {
        if (getDevelopmentProposal() != null) {
            return getDevelopmentProposal().getKrmsRulesContext();
        } else if (getModuleItemKey().contains("|")) {
            return loadKrmsRulesContext(getModuleItemKey().split("\\|")[0]);
        } else {
            return super.getKrmsRulesContextFromBean();
        }
    }
    
    private static String getSubModuleItemCode(String roleId){

    	if(roleId.equals(Constants.PRINCIPAL_INVESTIGATOR_ROLE)){
    		return  KcServiceLocator.getService(ParameterService.class).getParameterValueAsString(Constants.KC_GENERIC_PARAMETER_NAMESPACE, 
    	            Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, "MODULE_SUB_ITEM_CODE_PI_CERTIFICATION"); 
    	}else if(roleId.equals(Constants.CO_INVESTIGATOR_ROLE)){
    		return  KcServiceLocator.getService(ParameterService.class).getParameterValueAsString(Constants.KC_GENERIC_PARAMETER_NAMESPACE, 
    	            Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, "MODULE_SUB_ITEM_CODE_COI_CERTIFICATION"); 
    	}else {
    		return  KcServiceLocator.getService(ParameterService.class).getParameterValueAsString(Constants.KC_GENERIC_PARAMETER_NAMESPACE, 
    	            Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, "MODULE_SUB_ITEM_CODE_KP_CERTIFICATION"); 
    	}
    }
}