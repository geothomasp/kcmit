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
package edu.mit.kc.award.service.impl;

import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.home.AwardSponsorTerm;
import org.kuali.kra.award.paymentreports.awardreports.AwardReportTerm;
import org.kuali.kra.award.paymentreports.awardreports.reporting.ReportTracking;
import org.kuali.kra.award.specialreview.AwardSpecialReview;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import edu.mit.kc.award.service.AwardCommonValidationService;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.kns.util.KNSGlobalVariables;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.util.AuditCluster;
import org.kuali.rice.krad.util.AuditError;
import org.kuali.rice.krad.util.ErrorMessage;
import org.kuali.rice.krad.util.GlobalVariables;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Service class for Award Hold Prompt Validation Rules.
 */
@Transactional
public class AwardCommonValidationServiceImpl implements AwardCommonValidationService {
    
    private List<AuditError> auditWarnings = new ArrayList<AuditError>();
    private ParameterService parameterService;   
    private String SPONSOR_TERM_CODE_HOLD ="143";
    private String NIH_SPONSOR_CODE="000500";
    private String REPORT_TRACKING_FREQ_CODE="4";
    private String REPORT_TRACKING_STATUS_CODE="1";
    private String REPORT_TRACKING_CLASS_CODE="4";
    
/* public boolean validateAwardHoldPrompt(Award award) {
    	boolean retval = true;      	
    	retval &=validateSponsorCodeIsNIH(award);
    	retval &=validateSpecialReviews(award);
    	retval &=validateReports(award);
    	retval &=validateAwardTerm(award);
   if (!retval) {   	 
        reportAndCreateAuditCluster();            
    } 
   
   
 return retval;
    	
    }*/
    @SuppressWarnings("unchecked")
    public boolean validateSponsorCodeIsNIH (Award award) {
        boolean valid = true;
        String sponsorCode=award.getSponsorCode();
        String primeSponsorCode=award.getPrimeSponsorCode();           
        String link = Constants.MAPPING_AWARD_HOME_PAGE + "." + Constants.MAPPING_AWARD_HOME_DETAILS_AND_DATES_PAGE_ANCHOR;
        String messageKey = KeyConstants.ERROR_AWARD_HOLD_PROMPT_SPONSOR_CODE;
        String errorKey = "document.awardList[0].awardStatus";
        boolean awardSponsorNsf = getParameterService().getParameterValueAsBoolean(
                "KC-AWARD", "Document", "ENABLE_AWARD_NSF_RCR_REVIEW_VALID");
         if(awardSponsorNsf && sponsorCode!=null && sponsorCode.equalsIgnoreCase(NIH_SPONSOR_CODE)||primeSponsorCode!=null && primeSponsorCode.equalsIgnoreCase(NIH_SPONSOR_CODE)){                
            valid = false;
            auditWarnings.add(new AuditError(errorKey, messageKey, link));
            GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_SPONSOR_CODE , KeyConstants.ERROR_AWARD_HOLD_PROMPT_SPONSOR_CODE); 
         } 
        return valid;
        }
    
    @SuppressWarnings("unchecked") 
    
  public boolean validateSpecialReviews(Award award){
      int  noOfHumanReviews = 0;
      int noOfAnimalReviews = 0;
      int noOfDnaReviews = 0;
      int noOfIsotopReviews = 0;
      int noOfBioReviews = 0;
      int noOfInterReviews =0;
      String link = Constants.MAPPING_AWARD_HOME_PAGE + "." + Constants.MAPPING_AWARD_HOME_DETAILS_AND_DATES_PAGE_ANCHOR;
      String errorKey = "document.awardList[0].statusCode";
      boolean valid = true;
      String specialReviewHumanSubjects = getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "ENABLE_AWARD_HUMAN_REVIEW_VALID");
      String specialReviewAnimal = getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "ENABLE_ANIMAL_REVIEW_VALID");
      String specialReviewDna = getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "ENABLE_AWARD_DNA_REVIEW_VALID");
      String specialReviewIsotop = getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "ENABLE_AWARD_ISOTOPE_REVIEW_VALID");
      String specialReviewBio = getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "ENABLE_AWARD_BIOHAZARD_REVIEW_VALID");
      String specialReviewInter = getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "ENABLE_AWARD_INTER_REVIEW_VALID");
        List<AwardSpecialReview> specialReviews = award.getSpecialReviews();
        if(specialReviews!=null){
        for(AwardSpecialReview spReview:specialReviews){
      if(specialReviewHumanSubjects!=null && spReview.getSpecialReviewTypeCode().equalsIgnoreCase("1")&& 
              specialReviewHumanSubjects.equalsIgnoreCase(spReview.getApprovalTypeCode())){
          valid = false;
          noOfHumanReviews ++;            
      }if(specialReviewAnimal!=null && spReview.getSpecialReviewTypeCode().equalsIgnoreCase("2")&& 
              specialReviewAnimal.equalsIgnoreCase(spReview.getApprovalTypeCode())){
          valid = false;
          noOfAnimalReviews ++;           
      }if(specialReviewDna!=null && spReview.getSpecialReviewTypeCode().equalsIgnoreCase("3")&& 
              specialReviewDna.equalsIgnoreCase(spReview.getApprovalTypeCode())){
          valid = false;
          noOfDnaReviews ++;              
      }if(specialReviewIsotop!=null && spReview.getSpecialReviewTypeCode().equalsIgnoreCase("4")&& 
              specialReviewIsotop.equalsIgnoreCase(spReview.getApprovalTypeCode())){
          valid = false;
          noOfIsotopReviews ++;           
      }if(specialReviewBio!=null && spReview.getSpecialReviewTypeCode().equalsIgnoreCase("5")&& 
              specialReviewBio.equalsIgnoreCase(spReview.getApprovalTypeCode())){
          valid = false;
          noOfBioReviews ++;              
      }if(specialReviewInter!=null && spReview.getSpecialReviewTypeCode().equalsIgnoreCase("6")&& 
              specialReviewInter.equalsIgnoreCase(spReview.getApprovalTypeCode())){ 
          valid = false;
          noOfInterReviews ++;            
      }}}
      if(noOfHumanReviews==1){
          auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_HUMAN_REVIEW, link));
          GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_HUMAN_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_HUMAN_REVIEW);
     }else if(noOfHumanReviews > 1){
         auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_HUMAN_REVIEW, link));
         GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_HUMAN_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_HUMAN_REVIEW);
     } if(noOfAnimalReviews==1){
         auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_ANIMAL_REVIEW, link));
         GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_ANIMAL_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_ANIMAL_REVIEW);
    }else if(noOfAnimalReviews > 1){
        auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_ANIMAL_REVIEW, link));
        GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_ANIMAL_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_ANIMAL_REVIEW);
    } if(noOfDnaReviews==1){
        auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_DNA_REVIEW, link));
        GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_DNA_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_DNA_REVIEW);
   }else if(noOfDnaReviews > 1){
       auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_DNA_REVIEW, link));
       GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_DNA_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_DNA_REVIEW);
   } if(noOfIsotopReviews==1){
       auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_ISOTOP_REVIEW, link));
       GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_ISOTOP_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_ISOTOP_REVIEW);
  }else if(noOfIsotopReviews > 1){
      auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_ISOTOP_REVIEW, link));
      GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_ISOTOP_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_ISOTOP_REVIEW);
  } if(noOfBioReviews==1){
      auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_BIO_REVIEW, link));
      GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_BIO_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_BIO_REVIEW);
 }else if(noOfBioReviews > 1){
     auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_BIO_REVIEW, link));
     GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_BIO_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_BIO_REVIEW);
 } if(noOfInterReviews==1){
     auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_INTER_REVIEW, link));
     GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_INTER_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_INTER_REVIEW);
}else if(noOfInterReviews > 1){
    auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_INTER_REVIEW, link));
    GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_INTER_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_INTER_REVIEW);
}
 return valid;
  }
    
    @SuppressWarnings("unchecked")
    public boolean validateReports(Award award){
        boolean awardHoldOnReportTerm = getParameterService().getParameterValueAsBoolean(
                "KC-AWARD", "Document", "ENABLE_AWARD_REPORT_VALIDATION");
        boolean valid = true;
        String link = Constants.MAPPING_AWARD_HOME_PAGE + "." + Constants.MAPPING_AWARD_HOME_DETAILS_AND_DATES_PAGE_ANCHOR;
        String errorKey = "document.awardList[0].statusCode";       
      List<AwardReportTerm>awardReportTerms= award.getAwardReportTermItems();
    for(AwardReportTerm awardReportTerm:awardReportTerms){
       List<ReportTracking>reportTrackings = awardReportTerm.getReportTrackings();      
       if(reportTrackings!=null){
    for(ReportTracking reportTracking:reportTrackings){
    	/*if(reportTracking.getDueDate()!=null){
    	 int dateToCompare =  reportTracking.getDueDate().compareTo(new java.util.Date());}*/
    	Date crrentDate = new java.util.Date();
    	Calendar cal = Calendar.getInstance();
        cal.setTime(crrentDate);
        cal.add(Calendar.DATE, -74);
        Date dateBefore74Days = cal.getTime();
    	 if(awardHoldOnReportTerm && reportTracking.getFrequencyCode()!=null && reportTracking.getFrequencyCode().equals(REPORT_TRACKING_FREQ_CODE) && reportTracking.getReportClassCode()!=null && reportTracking.getReportClassCode().equals(REPORT_TRACKING_CLASS_CODE) &&
        		reportTracking.getStatusCode()!=null && reportTracking.getStatusCode().equals(REPORT_TRACKING_STATUS_CODE)  && reportTracking.getDueDate()!=null) {
        	int dateToCompare =  reportTracking.getDueDate().compareTo(new java.util.Date());
        	int datePastDue = reportTracking.getDueDate().compareTo(dateBefore74Days);
        	if(dateToCompare<0 && datePastDue<0){
            valid=false;
            auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_INTER_REVIEW, link));
            GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_INTER_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_MULTIPLE_INTER_REVIEW);
        }
    }}
    }}
        return valid;
    }
   
    public boolean validateAwardTerm(Award award){
        boolean valid=true;
        String link = Constants.MAPPING_AWARD_HOME_PAGE + "." + Constants.MAPPING_AWARD_HOME_DETAILS_AND_DATES_PAGE_ANCHOR;
        String errorKey = "document.awardList[0].statusCode";
        int noOfSpreviewHumanAnimal = 0;
        int noOfSpecialReview = 0;
        boolean awardHoldOnTermReview = getParameterService().getParameterValueAsBoolean(
                "KC-AWARD", "Document", "ENABLE_AWARD_TERM_REVIEW_VALID");
        String awardAnimalSpReview= getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "IACUC_SPL_REV_TYPE_CODE");
        String awardHumanSpReview = getParameterService().getParameterValueAsString(
                "KC-AWARD", "Document", "SPL_REV_TYPE_CODE_HUMAN");
        List<AwardSponsorTerm>awardSponsorTerms = award.getAwardSponsorTerms();
        if(awardSponsorTerms!=null){
        for(AwardSponsorTerm awardSponsorTerm:awardSponsorTerms){
         if(awardHoldOnTermReview && awardSponsorTerm.getSponsorTermCode().equals(SPONSOR_TERM_CODE_HOLD)){
             noOfSpreviewHumanAnimal++; 
         }
    }}List<AwardSpecialReview>awardSpecialReviews = award.getSpecialReviews();
    if(awardSpecialReviews!=null){
    for(AwardSpecialReview awardSpecialReview:awardSpecialReviews){
        if(awardHoldOnTermReview && awardSpecialReview.getSpecialReviewTypeCode().equalsIgnoreCase(awardHumanSpReview) ||  awardSpecialReview.getSpecialReviewTypeCode().equalsIgnoreCase(awardAnimalSpReview)){
            noOfSpecialReview ++;   
        }
    }}
    if(noOfSpecialReview > 0){
       if(noOfSpreviewHumanAnimal ==0){
           valid = false;
           auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_TERM_SPREVIEW, link));
           GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_TERM_SPREVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_TERM_SPREVIEW);
       }else if(noOfSpreviewHumanAnimal > 0){
           valid = false;
           auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_SPECIAL_REVIEW, link)); 
           GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_SPECIAL_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_SPECIAL_REVIEW);
       }else{
           valid=false;
           auditWarnings.add(new AuditError(errorKey, KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_SPECIAL_REVIEW, link));
           GlobalVariables.getMessageMap().putWarning(KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_SPECIAL_REVIEW,KeyConstants.ERROR_AWARD_HOLD_PROMPT_NO_SPECIAL_REVIEW);
       }
    }
        return valid;
    }
    
/*   public boolean validateAwardOnCOI (Award award) {
       // To be Implemented later
      return true;
      }
    */
    protected void reportAndCreateAuditCluster() {    
        if (auditWarnings.size() > 0) {  
        		
            GlobalVariables.getAuditErrorMap().put("homePageAuditWarnings", new AuditCluster(Constants.MAPPING_AWARD_HOME_DETAILS_AND_DATES_PAGE_NAME, auditWarnings,Constants.AUDIT_WARNINGS));            
        
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
public void setParameterService(ParameterService parameterService) {
    this.parameterService = parameterService;
}
}
