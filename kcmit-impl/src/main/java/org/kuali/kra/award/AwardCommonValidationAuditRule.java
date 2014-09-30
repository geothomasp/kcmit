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
package org.kuali.kra.award;

import org.apache.commons.lang.StringUtils;
import org.kuali.kra.award.document.AwardDocument;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import edu.mit.kc.award.service.AwardCommonValidationService;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.kns.util.AuditCluster;
import org.kuali.rice.kns.util.AuditError;
import org.kuali.rice.kns.util.KNSGlobalVariables;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.krad.rules.rule.DocumentAuditRule;
import org.kuali.rice.krad.util.GlobalVariables;

import java.util.ArrayList;
import java.util.List;

public class AwardCommonValidationAuditRule implements DocumentAuditRule {
	private List<AuditError> auditWarnings = new ArrayList<AuditError>();
	private List<AuditError> auditErrors = new ArrayList<AuditError>();
	   private ParameterService parameterService;	
	   private AwardCommonValidationService awardCommonValidationService;
	   private String HOLD_PROMPT ="Hold Prompt";
	public boolean processRunAuditBusinessRules(Document document) {
		 String link = Constants.MAPPING_AWARD_HOME_PAGE + "." + Constants.MAPPING_AWARD_HOME_DETAILS_AND_DATES_PAGE_ANCHOR;
	      String errorKey = "document.awardList[0].statusCode";
	boolean retval = true;
	  AwardDocument awardDocument = (AwardDocument)document;
	 Award award = awardDocument.getAward();	
	 retval &= getAwardCommonValidationService().validateSponsorCodeIsNIH(award);
	 retval &= getAwardCommonValidationService().validateSpecialReviews(award);
	 retval &= getAwardCommonValidationService().validateReports(award);
	 retval &= getAwardCommonValidationService().validateAwardTerm(award);
	/* retval &=getAwardCommonValidationService().validateAwardOnCOI(award);*/
    if (!retval) {
    	auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_COMMON, link));
    	reportAndCreateAuditCluster();            
     }
	return retval;
	}
	
	   private AwardCommonValidationService getAwardCommonValidationService() {
	        if( awardCommonValidationService == null ) {
	            awardCommonValidationService = KcServiceLocator.getService(AwardCommonValidationService.class);
	        }
	        return awardCommonValidationService;
	    }

	  protected void reportAndCreateAuditCluster() {		;
	        if (auditWarnings.size() > 0) {
	            KNSGlobalVariables.getAuditErrorMap().put("homePageAuditWarnings",new AuditCluster(Constants.MAPPING_AWARD_HOME_DETAILS_AND_DATES_PAGE_NAME, auditWarnings, HOLD_PROMPT));            
	        }  	       
	    
	    }
	    /**
* Looks up and returns the ParameterService.
* @return the parameter service. 
*/
protected ParameterService getParameterService() {
  if (this.parameterService == null) {
      this.parameterService = KcServiceLocator.getService(ParameterService.class);        
  }
  return this.parameterService;
}
	    }