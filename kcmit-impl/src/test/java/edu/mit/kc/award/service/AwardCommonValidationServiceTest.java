/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the GNU Affero General Public License, Version 3 (the "License");
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
package edu.mit.kc.award.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.integration.junit4.JUnit4Mockery;
import org.jmock.lib.concurrent.Synchroniser;
import org.junit.Before;
import org.junit.Test;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.home.AwardSponsorTerm;
import org.kuali.kra.award.paymentreports.awardreports.AwardReportTerm;
import org.kuali.kra.award.paymentreports.awardreports.reporting.ReportTracking;
import org.kuali.kra.award.specialreview.AwardSpecialReview;
import org.kuali.kra.bo.SponsorTerm;

import edu.mit.kc.award.service.impl.AwardCommonValidationServiceImpl;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;




public class AwardCommonValidationServiceTest{
	AwardCommonValidationServiceImpl awardCommonValidationService;
	AwardCommonValidationService awardCommonValidationServices;
	ParameterService parameterService;
	private Mockery context;
	
	@Before()
    public void setUpMockery() {

        context = new JUnit4Mockery() {
            {
                setThreadingPolicy(new Synchroniser());
            }
        };
        parameterService = context.mock(ParameterService.class);
        awardCommonValidationService = new AwardCommonValidationServiceImpl(); 
        awardCommonValidationServices = new AwardCommonValidationServiceImpl();
    }
	 @Test
	 public void test_validateSponsorCodeIsNIH(){
         Award award = new Award();
          
         context.checking(new Expectations() {
              {
                  oneOf(parameterService). getParameterValueAsBoolean(
                          "KC-AWARD", "Document", "ENABLE_AWARD_NSF_RCR_REVIEW_VALID");
                  will(returnValue(Boolean.TRUE));	                   
              }
          }); 
         awardCommonValidationService.setParameterService(parameterService);
         award.setSponsorCode("000500");
         award.setPrimeSponsorCode("000500"); 
          assertFalse(awardCommonValidationService.validateSponsorCodeIsNIH(award)); 
          
     }
	 
	 @Test
     public void test_validateSpecialReviews(){
        Award award = new Award();         
        context.checking(new Expectations() {
             {
                 oneOf(parameterService). getParameterValueAsString(
                         "KC-AWARD", "Document", "ENABLE_AWARD_HUMAN_REVIEW_VALID");
                 will(returnValue("1"));
                 oneOf(parameterService).getParameterValueAsString(
                         "KC-AWARD", "Document", "ENABLE_ANIMAL_REVIEW_VALID");
                 will(returnValue("1"));
                 oneOf(parameterService).getParameterValueAsString(
                         "KC-AWARD", "Document", "ENABLE_AWARD_DNA_REVIEW_VALID");
                         will(returnValue("1"));
                         oneOf(parameterService).getParameterValueAsString(
                      "KC-AWARD", "Document", "ENABLE_AWARD_ISOTOPE_REVIEW_VALID");
                   will(returnValue("1"));  
                  oneOf(parameterService).getParameterValueAsString(
                     "KC-AWARD", "Document", "ENABLE_AWARD_BIOHAZARD_REVIEW_VALID"); 
             will(returnValue("1")); 
             oneOf(parameterService).getParameterValueAsString(
                     "KC-AWARD", "Document", "ENABLE_AWARD_INTER_REVIEW_VALID");
             will(returnValue("1")); 
             }
         }); 
        awardCommonValidationService.setParameterService(parameterService); 
        List<AwardSpecialReview>awardSpecialReviews = new ArrayList<AwardSpecialReview>();
        AwardSpecialReview awardSpecialReview = new AwardSpecialReview();
        awardSpecialReview.setSpecialReviewTypeCode("1");
        awardSpecialReview.setApprovalTypeCode("1");
        awardSpecialReviews.add(awardSpecialReview);
        award.setSpecialReviews(awardSpecialReviews);
         assertFalse(awardCommonValidationService.validateSpecialReviews(award));         
    }
	@Test
	public void test_validateReports() {
		Award award = new Award();
		AwardReportTerm awardReportTerm= new AwardReportTerm();
		List<AwardReportTerm>awardReportTerms = new ArrayList<AwardReportTerm>();
		ReportTracking reportTracking = new ReportTracking();
		reportTracking.setFrequencyCode("4");	
		reportTracking.setReportClassCode("4");
		reportTracking.setStatusCode("1");	
        List<ReportTracking>reportTrackings = new ArrayList<ReportTracking>();
        reportTrackings.add(reportTracking);
        awardReportTerm.setReportTrackings(reportTrackings);
        awardReportTerms.add(awardReportTerm);
        award.setAwardReportTermItems(awardReportTerms);
		context.checking(new Expectations() {
            {
                oneOf(parameterService).getParameterValueAsBoolean(
                        "KC-AWARD", "Document", "ENABLE_AWARD_REPORT_VALIDATION");
                will(returnValue(Boolean.TRUE));
            }
        });		
		awardCommonValidationService.setParameterService(parameterService);		
		assertTrue(awardCommonValidationService.validateReports(award));
	}
   
	   @Test
	    public void test_validateAwardTerm(){	  
	      	    
	       context.checking(new Expectations() {
	            {
	                oneOf(parameterService).getParameterValueAsBoolean(
	                         "KC-AWARD", "Document", "ENABLE_AWARD_TERM_REVIEW_VALID");
	                will(returnValue(Boolean.TRUE));
	                oneOf(parameterService).getParameterValueAsString(
	                        "KC-AWARD", "Document", "IACUC_SPL_REV_TYPE_CODE");
	                will(returnValue("1"));
	                oneOf(parameterService).getParameterValueAsString(
	                        "KC-AWARD", "Document", "SPL_REV_TYPE_CODE_HUMAN");
	                        will(returnValue("1"));
	            }
	        }); 
	       awardCommonValidationService.setParameterService(parameterService); 
	       Award award = new Award();
	       AwardSponsorTerm awardSponsorTerm = new AwardSponsorTerm();	
	       SponsorTerm sponsorTerm=new SponsorTerm();
	       sponsorTerm.setSponsorTermCode("143");
	       List<AwardSponsorTerm>awardSponsorTerms = new ArrayList<AwardSponsorTerm>();
	       awardSponsorTerm.setSponsorTerm(sponsorTerm);
	       awardSponsorTerms.add(awardSponsorTerm);
	       award.setAwardSponsorTerms(awardSponsorTerms);
	       List<AwardSpecialReview>awardSpecialReviews = new ArrayList<AwardSpecialReview>();
	       AwardSpecialReview awardSpecialReview = new AwardSpecialReview();
	       awardSpecialReview.setSpecialReviewTypeCode("1");
	       awardSpecialReviews.add(awardSpecialReview);
	       award.setSpecialReviews(awardSpecialReviews);
	       assertFalse(awardCommonValidationService.validateAwardTerm(award));	       
	   }
}
