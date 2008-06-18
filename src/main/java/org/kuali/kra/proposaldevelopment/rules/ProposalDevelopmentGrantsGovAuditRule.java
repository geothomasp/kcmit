/*
 * Copyright 2008 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
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
package org.kuali.kra.proposaldevelopment.rules;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.kuali.core.document.Document;
import org.kuali.core.rule.DocumentAuditRule;
import org.kuali.core.service.KualiConfigurationService;
import org.kuali.core.util.AuditCluster;
import org.kuali.core.util.AuditError;
import org.kuali.core.util.GlobalVariables;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.proposaldevelopment.document.ProposalDevelopmentDocument;

public class ProposalDevelopmentGrantsGovAuditRule  implements DocumentAuditRule{

    /**
     * @see org.kuali.core.rule.DocumentAuditRule#processRunAuditBusinessRules(org.kuali.core.document.Document)
     */
    public boolean processRunAuditBusinessRules(Document document) {
        boolean valid = true;

        ProposalDevelopmentDocument proposalDevelopmentDocument = (ProposalDevelopmentDocument)document;
        List<AuditError> auditErrors = new ArrayList<AuditError>();
        
        if(proposalDevelopmentDocument.getS2sOpportunity()!=null && (proposalDevelopmentDocument.getS2sOpportunity().getS2sSubmissionTypeCode()==null || StringUtils.equalsIgnoreCase(proposalDevelopmentDocument.getS2sOpportunity().getS2sSubmissionTypeCode().toString(),""))){
            valid = false;            
            auditErrors.add(new AuditError(Constants.S2S_SUBMISSIONTYPE_CODE_KEY, KeyConstants.ERROR_NOT_SELECTED_SUBMISSION_TYPE, Constants.GRANTS_GOV_PAGE + "." + Constants.GRANTS_GOV_PANEL_ANCHOR));            
        }
        
        if (proposalDevelopmentDocument.getProposalTypeCode()!=null && proposalDevelopmentDocument.getS2sOpportunity()!= null && proposalDevelopmentDocument.getS2sOpportunity().getOpportunityId()!=null && proposalDevelopmentDocument.getProposalTypeCode().equals(KraServiceLocator.getService(KualiConfigurationService.class).getParameter(Constants.PARAMETER_MODULE_PROPOSAL_DEVELOPMENT, Constants.PARAMETER_COMPONENT_DOCUMENT,KeyConstants.PROPOSALDEVELOPMENT_PROPOSALTYPE_REVISION).getParameterValue()) && proposalDevelopmentDocument.getS2sOpportunity().getRevisionCode()==null) {            
            valid &= false;
            auditErrors.add(new AuditError("document.s2sOpportunity.revisionCode", KeyConstants.ERROR_IF_PROPOSALTYPE_IS_REVISION, Constants.GRANTS_GOV_PAGE + "." + Constants.GRANTS_GOV_PANEL_ANCHOR));
        }
        
        if (auditErrors.size() > 0) {
            GlobalVariables.getAuditErrorMap().put("grantsGovAuditWarnings", new AuditCluster(Constants.GRANTS_GOV_OPPORTUNITY_PANEL, auditErrors, Constants.AUDIT_ERRORS));
        }

        return valid;
    }
}
