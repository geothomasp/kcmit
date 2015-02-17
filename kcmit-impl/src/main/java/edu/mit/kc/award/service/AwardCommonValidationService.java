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

import org.kuali.kra.award.home.Award;


/**
 * This is the Award Common Validation Service interface.
 */
public interface AwardCommonValidationService {
    
   
 /* boolean validateAwardHoldPrompt(Award award); */
	
	/**
     * This method gets validate sponsor code NIH for making Award Status Hold
     * @param Award
     * @return
     */
	boolean validateSponsorCodeIsNIH(Award award); 
    
	 /**
     * This method validates different special reviews and based on that decides whether to make Award Status as Hold
     * @param Award
     * @return boolean
     */
   boolean validateSpecialReviews(Award award);
    
   /**
    * This method validates award reports and based on that decides whether to make Award Status as Hold
    * @param Award 
    * @return boolean
    */
  boolean validateReports(Award award);
  /**
   * This method validate Award term based on that decides whether to make Award Status as Hold
   * 
   * @param Award
   * @return boolean
   */
  boolean validateAwardTerm(Award award);
  
  /**
   * This method validate COI-financial disclosures  based on that decides whether to make Award Status as Hold
   *
   * @param Award
   * @return boolean
   */
/*  boolean validateAwardOnCOI(Award award);*/
}
