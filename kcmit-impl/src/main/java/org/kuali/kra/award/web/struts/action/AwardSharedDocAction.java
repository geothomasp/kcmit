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
package org.kuali.kra.award.web.struts.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.kuali.coeus.common.framework.attachment.AttachmentFile;
import org.kuali.coeus.common.framework.medusa.MedusaNode;
import org.kuali.coeus.common.framework.medusa.MedusaService;
import org.kuali.coeus.propdev.impl.attachment.Narrative;
import org.kuali.coeus.propdev.impl.attachment.NarrativeAttachment;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.award.AwardForm;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.notesandattachments.attachments.AwardAttachment;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.institutionalproposal.attachments.InstitutionalProposalAttachments;
import org.kuali.kra.institutionalproposal.attachments.InstitutionalProposalAttachmentsData;
import org.kuali.kra.institutionalproposal.home.InstitutionalProposal;
import org.kuali.kra.subaward.bo.SubAward;
import org.kuali.kra.subaward.bo.SubAwardAttachments;
import org.kuali.rice.core.api.util.tree.Node;
import org.kuali.rice.krad.util.KRADConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 
 * This class represents the Struts Action for Medusa page(AwardMedusa.jsp)
 */
public class AwardSharedDocAction extends AwardAction {    
	private static final ActionForward RESPONSE_ALREADY_HANDLED = null;
	private MedusaService medusaService;
	private Long moduleIdentifier;
	 protected  MedusaService getMedusaService (){
	        if (medusaService == null)
	            medusaService = KcServiceLocator.getService(MedusaService.class);
	        return medusaService;
	    }
  
    public ActionForward viewAttachmentIp(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {  
     InstitutionalProposalAttachments attachment =null;
    	 InstitutionalProposal institutionalProposal =null;
    	 Long proposalId=null;
    	 final int selection = this.getSelectedLine(request);
    	   int selectedLine = -1;
           String parameterName = (String) request.getAttribute(KRADConstants.METHOD_TO_CALL_ATTRIBUTE);
           if (StringUtils.isNotBlank(parameterName)) {
               String lineNumber = StringUtils.substringBetween(parameterName, ".line", ".");
              String proposalIdOld = (StringUtils.substringBetween(parameterName, ".id", "."));
              proposalId=Long.valueOf(proposalIdOld);
               selectedLine = Integer.parseInt(lineNumber);
           }
           MedusaNode node = getMedusaService().getMedusaNode("IP", proposalId);
           institutionalProposal=(InstitutionalProposal) node.getData();
        if(institutionalProposal!=null){
      attachment= institutionalProposal.getInstProposalAttachments().get(selection);
      }
       if (attachment == null) {
            return mapping.findForward(Constants.MAPPING_BASIC);
        }        
        final InstitutionalProposalAttachmentsData file = attachment.getFile();
       this.streamToResponse(file.getData(), getValidHeaderString(file.getName()),  getValidHeaderString(file.getType()), response);
        return RESPONSE_ALREADY_HANDLED;
    }
	
    public ActionForward viewAttachment(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {  
        AwardForm awardForm = (AwardForm) form;  
        AwardAttachment attachment=null;
        Award award=null;
      Long awardId=null;
       
        final int selection = this.getSelectedLine(request);
        String parameterName = (String) request.getAttribute(KRADConstants.METHOD_TO_CALL_ATTRIBUTE);
        if (StringUtils.isNotBlank(parameterName)) {
            String lineNumber = StringUtils.substringBetween(parameterName, ".line", ".");
           String awardIdOld = (StringUtils.substringBetween(parameterName, ".id", "."));
           awardId=Long.valueOf(awardIdOld);           
        }      
        MedusaNode node = getMedusaService().getMedusaNode("award", awardId);
        award=(Award) node.getData();
        if(award!=null)
        	 attachment= award.getAwardAttachments().get(selection);        	
     
        if (attachment == null) {
            return mapping.findForward(Constants.MAPPING_BASIC);
        }
        
        final AttachmentFile file = attachment.getFile();
        this.streamToResponse(file.getData(), getValidHeaderString(file.getName()),  getValidHeaderString(file.getType()), response);
        
        return RESPONSE_ALREADY_HANDLED;
    }
    public ActionForward viewAttachmentDp(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {  
    	 DevelopmentProposal developmentProposal =null;
    	 Long proposalNumber=null;
    	  Narrative attachment =null;
    	 final int selection = this.getSelectedLine(request);
    	  AwardForm awardForm = (AwardForm) form; 
    	  String parameterName = (String) request.getAttribute(KRADConstants.METHOD_TO_CALL_ATTRIBUTE);
          if (StringUtils.isNotBlank(parameterName)) {
              String lineNumber = StringUtils.substringBetween(parameterName, ".line", ".");
             String proposalNumberOld = (StringUtils.substringBetween(parameterName, ".id", "."));
             proposalNumber=Long.valueOf(proposalNumberOld);
              
          }
              MedusaNode node = getMedusaService().getMedusaNode("DP", proposalNumber);
          developmentProposal=(DevelopmentProposal) node.getData();    	  
          if(developmentProposal!=null){
     attachment= developmentProposal.getNarratives().get(selection);}
       if (attachment == null) {
            return mapping.findForward(Constants.MAPPING_BASIC);
        }
        
        final NarrativeAttachment file = attachment.getNarrativeAttachment();
       this.streamToResponse(file.getData(), getValidHeaderString(file.getName()),  getValidHeaderString(file.getType()), response);
        return RESPONSE_ALREADY_HANDLED;
    }
    public ActionForward viewAttachmentSubAward(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {  
    	 SubAward subAward =null;
    	 Long subAwardId=null;
    	 SubAwardAttachments attachment=null;
    	 final int selection = this.getSelectedLine(request);
    	  AwardForm awardForm = (AwardForm) form; 
    	  String parameterName = (String) request.getAttribute(KRADConstants.METHOD_TO_CALL_ATTRIBUTE);
          if (StringUtils.isNotBlank(parameterName)) {
              String lineNumber = StringUtils.substringBetween(parameterName, ".line", ".");
             String subAwardIdOld = (StringUtils.substringBetween(parameterName, ".id", "."));
             subAwardId=Long.valueOf(subAwardIdOld);
             
          }
          MedusaNode node = getMedusaService().getMedusaNode("subAward", subAwardId);
          subAward=(SubAward) node.getData();    	
          if(subAward!=null){
      attachment= subAward.getSubAwardAttachments().get(selection);}
       if (attachment == null) {
            return mapping.findForward(Constants.MAPPING_BASIC);
        }
        
        final AttachmentFile file = attachment.getFile();
       this.streamToResponse(file.getData(), getValidHeaderString(file.getName()),  getValidHeaderString(file.getType()), response);
        return RESPONSE_ALREADY_HANDLED;
    }
    public ActionForward refreshView(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        return mapping.findForward(Constants.MAPPING_AWARD_BASIC);
    }
 }
