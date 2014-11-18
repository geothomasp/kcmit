package edu.mit.kc.institutionalproposal.rules;

import org.kuali.coeus.common.framework.custom.KcDocumentBaseAuditRule;
import org.kuali.kra.institutionalproposal.contacts.InstitutionalProposalCreditSplitBean;
import org.kuali.kra.institutionalproposal.contacts.InstitutionalProposalPersonAuditRule;
import org.kuali.kra.institutionalproposal.distribution.InstitutionalProposalCostShareAuditRule;
import org.kuali.kra.institutionalproposal.document.InstitutionalProposalDocument;
import org.kuali.kra.institutionalproposal.rules.InstitutionalProposalDocumentRule;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.krad.document.TransactionalDocument;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.krad.util.KRADConstants;



public class MitInstitutionalProposalDocumentRule extends InstitutionalProposalDocumentRule {
	 @Override
	    public boolean processSaveDocument(Document document) {
	        boolean isValid = true;

	        isValid = isDocumentOverviewValid(document);

	        GlobalVariables.getMessageMap().addToErrorPath(KRADConstants.DOCUMENT_PROPERTY_NAME);
	        InstitutionalProposalDocument institutionalProposalDocument = (InstitutionalProposalDocument)document;
	        if(institutionalProposalDocument.getInstitutionalProposal().getSequenceNumber()== 1 || 
	                (institutionalProposalDocument.getInstitutionalProposal().getSequenceNumber()!=1 && !institutionalProposalDocument.getDocumentHeader().getWorkflowDocument().getStatus().getCode().equals("I"))){
	            
	            getKnsDictionaryValidationService().validateDocumentAndUpdatableReferencesRecursively(document, getMaxDictionaryValidationDepth(),
	                    VALIDATION_REQUIRED, CHOMP_LAST_LETTER_S_FROM_COLLECTION_NAME);
	            getDictionaryValidationService().validateDefaultExistenceChecksForTransDoc((TransactionalDocument) document);
	        }

	            GlobalVariables.getMessageMap().removeFromErrorPath(KRADConstants.DOCUMENT_PROPERTY_NAME);
	        

	        isValid &= GlobalVariables.getMessageMap().hasNoErrors();
	        isValid &= processCustomSaveDocumentBusinessRules(document);

	        return isValid;
	    }
	 
	 public boolean processRunAuditBusinessRules(Document document){
	        boolean retval = true;
	        
	        retval &= new KcDocumentBaseAuditRule().processRunAuditBusinessRules(document);
	        retval &= new InstitutionalProposalPersonAuditRule().processRunAuditBusinessRules(document);
	        retval &= new InstitutionalProposalCostShareAuditRule().processRunAuditBusinessRules(document);
	        retval &= processInstitutionalProposalPersonCreditSplitBusinessRules(document);
	        retval &= processInstitutionalProposalPersonUnitCreditSplitBusinessRules(document);
	        return retval;
	 }
	 
	 private boolean processInstitutionalProposalPersonCreditSplitBusinessRules(Document document) {
	        InstitutionalProposalDocument institutionalProposalDocument = (InstitutionalProposalDocument) document;
	        return new InstitutionalProposalCreditSplitBean(institutionalProposalDocument).recalculateCreditSplit();
	        
	    }
	 
	 private boolean processInstitutionalProposalPersonUnitCreditSplitBusinessRules(Document document) {
	        InstitutionalProposalDocument institutionalProposalDocument = (InstitutionalProposalDocument) document;
	        return new InstitutionalProposalCreditSplitBean(institutionalProposalDocument).recalculateCreditSplit();
	    }
   
}
