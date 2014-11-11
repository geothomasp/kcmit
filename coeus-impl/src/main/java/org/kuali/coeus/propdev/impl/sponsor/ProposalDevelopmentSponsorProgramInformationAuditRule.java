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
package org.kuali.coeus.propdev.impl.sponsor;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.framework.sponsor.Sponsor;
import org.kuali.coeus.propdev.api.core.SubmissionInfoService;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentUtils;
import org.kuali.coeus.propdev.impl.s2s.S2sSubmissionType;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.rice.coreservice.framework.parameter.ParameterConstants;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krad.util.AuditCluster;
import org.kuali.rice.krad.util.AuditError;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.krad.rules.rule.DocumentAuditRule;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import static org.kuali.coeus.propdev.impl.datavalidation.ProposalDevelopmentDataValidationConstants.*;

/**
 * This class processes audit rules (warnings) for the Sponsor & Program Information related
 * data of the ProposalDevelopmenDocument.
 */
public class ProposalDevelopmentSponsorProgramInformationAuditRule implements DocumentAuditRule { 
    
    private ParameterService parameterService;
    private DataObjectService dataObjectService;
    private SubmissionInfoService submissionInfoService;
    
    @Override
    public boolean processRunAuditBusinessRules(Document document) {
        boolean valid = true;

        ProposalDevelopmentDocument proposalDevelopmentDocument = (ProposalDevelopmentDocument)document;
        DevelopmentProposal proposal = proposalDevelopmentDocument.getDevelopmentProposal();

        //The Proposal Deadline Date should return a warning during validation for the
        //following conditions: a) if the date entered is older than the current date,
        //or b) if there is no data entered.
        if (proposal.getDeadlineDate() == null) {
            valid = false;
            getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_WARNINGS).add(new AuditError(DEADLINE_DATE_KEY, KeyConstants.WARNING_EMPTY_DEADLINE_DATE, SPONSOR_PROGRAM_INFO_PAGE_ID));
        } else if (proposal.getDeadlineDate().before(new Date(System.currentTimeMillis()))) {
            valid = false;
            getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_WARNINGS).add(new AuditError(DEADLINE_DATE_KEY, KeyConstants.WARNING_PAST_DEADLINE_DATE, SPONSOR_PROGRAM_INFO_PAGE_ID));
        }
        
        if (proposal.getS2sOpportunity() != null) {
            if (proposal.getS2sOpportunity().getOpportunityId() != null && proposal.getProgramAnnouncementNumber() != null 
                    && !StringUtils.equalsIgnoreCase(proposal.getS2sOpportunity().getOpportunityId(), proposal.getProgramAnnouncementNumber())) {
                valid &= false;
                getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_ERRORS).add(new AuditError(OPPORTUNITY_ID_KEY, KeyConstants.ERROR_OPPORTUNITY_ID_DIFFER, SPONSOR_PROGRAM_INFO_PAGE_ID));
            }
            if (proposal.getS2sOpportunity().getCfdaNumber() != null && proposal.getCfdaNumber() != null 
                    && !StringUtils.equalsIgnoreCase(proposal.getS2sOpportunity().getCfdaNumber(), proposal.getCfdaNumber())) {
                valid &= false;
                getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_ERRORS).add(new AuditError(CFDA_NUMBER_KEY, KeyConstants.ERROR_CFDA_NUMBER_DIFFER, SPONSOR_PROGRAM_INFO_PAGE_ID));
            }
            if (proposal.getProgramAnnouncementTitle() == null 
                    || StringUtils.equalsIgnoreCase(proposal.getProgramAnnouncementTitle().trim(), "")) {
                valid &= false;
                getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_ERRORS).add(new AuditError(OPPORTUNITY_TITLE_KEY, KeyConstants.ERROR_OPPORTUNITY_TITLE_DELETED, SPONSOR_PROGRAM_INFO_PAGE_ID));
            }

            String newProposalType = getParameterService().getParameterValueAsString(Constants.MODULE_NAMESPACE_PROPOSAL_DEVELOPMENT,
                    ParameterConstants.DOCUMENT_COMPONENT, ProposalDevelopmentUtils.PROPOSAL_TYPE_CODE_NEW_PARM);

            if ( StringUtils.equals(proposal.getS2sOpportunity().getS2sSubmissionTypeCode(), S2sSubmissionType.CHANGE_CORRECTED_CODE) &&
                    StringUtils.equals(proposal.getProposalTypeCode(),newProposalType) &&
                    StringUtils.isEmpty(proposal.getPrevGrantsGovTrackingID())) {
                getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_ERRORS).add(new AuditError(PREV_GG_TRACKING_ID_KEY, KeyConstants.ERROR_REQUIRED_GG_TRACKING_ID, SPONSOR_PROGRAM_INFO_PAGE_ID));
                valid = false;
            }
            
            String federalIdComesFromAwardStr = null;
            try {
                federalIdComesFromAwardStr = getParameterService().getParameterValueAsString(ProposalDevelopmentDocument.class, "FEDERAL_ID_COMES_FROM_CURRENT_AWARD");
            } catch (Exception e) {
                throw new RuntimeException("error retrieving FEDERAL_ID_COMES_FROM_CURRENT_AWARD parameter",e);
            }
            Boolean federalIdComesFromAward = federalIdComesFromAwardStr != null 
                                            && federalIdComesFromAwardStr.equalsIgnoreCase("Y");
            String sponsorAwardNumber = null;
            if (StringUtils.isNotBlank(proposal.getCurrentAwardNumber())) {
                sponsorAwardNumber = getSubmissionInfoService().getProposalCurrentAwardSponsorAwardNumber(proposal.getCurrentAwardNumber());
            }
            if (isProposalTypeRenewalRevisionContinuation(proposal.getProposalTypeCode()) 
                    && !(StringUtils.isNotBlank(proposal.getSponsorProposalNumber())
                    || (StringUtils.isNotBlank(sponsorAwardNumber) && federalIdComesFromAward))) {
                valid = false;
                getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_ERRORS).add(new AuditError(SPONSOR_PROPOSAL_KEY, KeyConstants.ERROR_PROPOSAL_REQUIRE_PRIOR_AWARD, SPONSOR_PROGRAM_INFO_PAGE_ID));
            }
            String sponsorProposalNumber = null;
            if (StringUtils.isNotBlank(proposal.getContinuedFrom())) {
                sponsorProposalNumber = getSubmissionInfoService().getProposalContinuedFromVersionSponsorProposalNumber(proposal.getContinuedFrom());
            }
            if (isProposalTypeResubmission(proposal.getProposalTypeCode())
                    && StringUtils.isBlank(proposal.getSponsorProposalNumber())
                    && (StringUtils.isBlank(sponsorProposalNumber))) {
                valid = false;
                getAuditErrors(SPONSOR_PROGRAM_INFO_PAGE_NAME,AUDIT_ERRORS).add(new AuditError(SPONSOR_PROPOSAL_KEY, KeyConstants.ERROR_PROPOSAL_REQUIRE_PRIOR_AWARD_FOR_RESUBMIT, SPONSOR_PROGRAM_INFO_PAGE_ID));
            }            
        }

        if (!StringUtils.isEmpty(proposal.getPrimeSponsorCode())) {
            Sponsor sp = (Sponsor) getDataObjectService().find(Sponsor.class, proposal.getPrimeSponsorCode());
            if (sp == null) {
                getAuditErrors(DETAILS_PAGE_NAME,AUDIT_ERRORS).add(new AuditError(PRIME_SPONSOR_KEY, KeyConstants.ERROR_EMPTY_PRIME_SPONSOR_ID, DETAILS_PAGE_ID));
                valid &= false;
            }
        }


        return valid;
    }
    
    /**
     * Is the Proposal Type set to Renewal, Revision, or a Continuation?
     * @param proposalTypeCode proposal type code
     * @return true or false
     */
    private boolean isProposalTypeRenewalRevisionContinuation(String proposalTypeCode) {
        String proposalTypeCodeRenewal = getParameterService().getParameterValueAsString(ProposalDevelopmentDocument.class, KeyConstants.PROPOSALDEVELOPMENT_PROPOSALTYPE_RENEWAL);
        String proposalTypeCodeRevision = getParameterService().getParameterValueAsString(ProposalDevelopmentDocument.class, KeyConstants.PROPOSALDEVELOPMENT_PROPOSALTYPE_REVISION);
        String proposalTypeCodeContinuation = getParameterService().getParameterValueAsString(ProposalDevelopmentDocument.class, KeyConstants.PROPOSALDEVELOPMENT_PROPOSALTYPE_CONTINUATION);
         
        return !StringUtils.isEmpty(proposalTypeCode) &&
               (proposalTypeCode.equals(proposalTypeCodeRenewal) ||
                proposalTypeCode.equals(proposalTypeCodeRevision) ||
                proposalTypeCode.equals(proposalTypeCodeContinuation));
    }
    
    /**
     * Is the Proposal Type set to Resubmission?
     * @param proposalTypeCode proposal type code
     * @return true or false
     */
    private boolean isProposalTypeResubmission(String proposalTypeCode) {
        String proposalTypeCodeResubmission = getParameterService().getParameterValueAsString(ProposalDevelopmentDocument.class, KeyConstants.PROPOSALDEVELOPMENT_PROPOSALTYPE_RESUBMISSION);
         
        return !StringUtils.isEmpty(proposalTypeCode) &&
               (proposalTypeCode.equals(proposalTypeCodeResubmission));
    }


    private List<AuditError> getAuditErrors(String areaName, String severity) {
        List<AuditError> auditErrors = new ArrayList<AuditError>();
        String clusterKey = areaName;
        if (!GlobalVariables.getAuditErrorMap().containsKey(clusterKey+severity)) {
            GlobalVariables.getAuditErrorMap().put(clusterKey+severity, new AuditCluster(clusterKey, auditErrors,severity));
        }
        else {
            auditErrors = GlobalVariables.getAuditErrorMap().get(clusterKey+severity).getAuditErrorList();
        }

        return auditErrors;
    }

    protected SubmissionInfoService getSubmissionInfoService() {
        if (this.submissionInfoService == null) {
            this.submissionInfoService = KcServiceLocator.getService(SubmissionInfoService.class);
        }
        return this.submissionInfoService;
    }

    public void setSubmissionInfoService(SubmissionInfoService submissionInfoService) {
        this.submissionInfoService = submissionInfoService;
    }

    protected ParameterService getParameterService() {
        if (this.parameterService == null) {
            this.parameterService = KcServiceLocator.getService(ParameterService.class);
        }
        return this.parameterService;
    }

    public void setParameterService(ParameterService parameterService) {
        this.parameterService = parameterService;
    }

    public DataObjectService getDataObjectService() {
        if (this.dataObjectService == null) {
            this.dataObjectService = KcServiceLocator.getService(DataObjectService.class);
        }
        return this.dataObjectService;
    }

    public void setDataObjectService(DataObjectService dataObjectService) {
        this.dataObjectService = dataObjectService;
    }

}
