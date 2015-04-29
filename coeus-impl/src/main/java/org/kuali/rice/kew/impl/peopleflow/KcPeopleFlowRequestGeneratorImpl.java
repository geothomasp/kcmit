package org.kuali.rice.kew.impl.peopleflow;

import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.coeus.common.framework.sponsor.hierarchy.SponsorHierarchy;
import org.kuali.coeus.common.framework.unit.admin.UnitAdministrator;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.core.api.criteria.PredicateFactory;
import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.core.api.datetime.DateTimeService;
import org.kuali.rice.core.api.exception.RiceRuntimeException;
import org.kuali.rice.core.api.membership.MemberType;
import org.kuali.rice.core.api.util.xml.XmlHelper;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.kuali.rice.kew.actionrequest.KimPrincipalRecipient;
import org.kuali.rice.kew.actionrequest.Recipient;
import org.kuali.rice.kew.api.action.ActionRequestPolicy;
import org.kuali.rice.kew.api.peopleflow.PeopleFlowMember;
import org.kuali.rice.kew.rule.xmlrouting.XPathHelper;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.kra.infrastructure.Constants;
import org.w3c.dom.Document;

import edu.mit.kc.workloadbalancing.bo.WLCurrentLoad;
import edu.mit.kc.workloadbalancing.peopleflow.WorkLoadService;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;


public class KcPeopleFlowRequestGeneratorImpl extends PeopleFlowRequestGeneratorImpl{

	private KcPersonService kcPersonService;
	private DataObjectService dataObjectService;
	private DateTimeService dateTimeService;
	private BusinessObjectService businessObjectService;

	

	protected void generateRequestForMember(Context context, PeopleFlowMember member) {
        String peopleflowName =  KcServiceLocator.getService(ParameterService.class).getParameterValueAsString(Constants.KC_GENERIC_PARAMETER_NAMESPACE,Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, "OSP_PEOPLE_FLOW_NAME");
		String enabledWlRouting =  KcServiceLocator.getService(ParameterService.class).getParameterValueAsString(Constants.KC_GENERIC_PARAMETER_NAMESPACE,Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, "ENABLE_WL_ROUTING");  
		 
    	if(peopleflowName !=null && context.getPeopleFlow().getName().equalsIgnoreCase("OSP")){
            String docContent = context.getRouteContext().getDocument().getDocContent();
            String proposalNumber = getElementValue(docContent, "//proposalNumber");
    		String personId =  KcServiceLocator.getService(WorkLoadService.class).getNextRoutingOSP(proposalNumber);
    		KcPerson orginalApprover = null;
    		 List<WLCurrentLoad> wLCurrentLoadList = getDataObjectService().findMatching(WLCurrentLoad.class, QueryByCriteria.Builder.fromPredicates
					 (PredicateFactory.equal("proposalNumber", proposalNumber))).getResults();
     		if (!context.getRouteContext().isSimulation() && personId!=null) {
    			 String sponsorGroup = null;
    			 List<UnitAdministrator> unitAdministrators = new ArrayList<UnitAdministrator>();
    			 
    			 if (MemberType.ROLE == member.getMemberType()) {
    			 DevelopmentProposal proposal = getDataObjectService().find(DevelopmentProposal.class,proposalNumber);
    	     		Map<String, String> queryMap = new HashMap<String, String>();
    	    		queryMap.put("unitNumber", proposal.getUnitNumber());
    	     		String unitAdmininstratorTypeCode =  KcServiceLocator.getService(ParameterService.class).getParameterValueAsString(Constants.KC_GENERIC_PARAMETER_NAMESPACE,Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, "OSP_ADMINISTRATOR_TYPE_CODE");  
    	     		queryMap.put("unitAdministratorTypeCode", unitAdmininstratorTypeCode);
    	     		unitAdministrators = (List<UnitAdministrator>) getBusinessObjectService().findMatching(UnitAdministrator.class, queryMap);
    	     		if(unitAdministrators!=null && !unitAdministrators.isEmpty()){
    	     			UnitAdministrator unitAdministrator= unitAdministrators.get(0);
    	     			orginalApprover = getKcPersonService().getKcPersonByPersonId(unitAdministrator.getPersonId());
    	     		}
    			 }else{
    				 orginalApprover = getKcPersonService().getKcPersonByPersonId(member.getMemberId());
    			 }
    			 if(wLCurrentLoadList!=null && !wLCurrentLoadList.isEmpty()){
    				 List<WLCurrentLoad> workLoadLatestList = new ArrayList<WLCurrentLoad>();
    				 for(WLCurrentLoad wLCurrentLoad : wLCurrentLoadList){
    					 if(workLoadLatestList.isEmpty()){
    						 workLoadLatestList.add(0,wLCurrentLoad);
    					 }else{
    						 WLCurrentLoad wLCurrentLoadlatest = workLoadLatestList.get(0);
    						 if(Integer.parseInt(wLCurrentLoadlatest.getRoutingNumber()) < Integer.parseInt(wLCurrentLoad.getRoutingNumber())){
    							 workLoadLatestList.remove(0);
    							 workLoadLatestList.add(0,wLCurrentLoad);
    						 }
    					 }
    				 }
    				 WLCurrentLoad currentWorkLoad = workLoadLatestList.get(0);
    				 
    				 int routingNumber = Integer.parseInt(currentWorkLoad.getRoutingNumber());
    				  routingNumber = ++routingNumber;
    				  WLCurrentLoad wLCurrentLoad = new WLCurrentLoad();
    	    			 wLCurrentLoad.setRoutingNumber(String.valueOf(routingNumber));
    	    			 wLCurrentLoad.setProposalNumber(currentWorkLoad.getProposalNumber());
    	    			 wLCurrentLoad.setOriginalApprover(orginalApprover.getPersonId());
    	    			 wLCurrentLoad.setOriginalUserId(orginalApprover.getUserName());
    	    			 wLCurrentLoad.setPerson_id(currentWorkLoad.getPerson_id());
    	    			 wLCurrentLoad.setUserId(currentWorkLoad.getUserId());
    	    			 wLCurrentLoad.setSponsorCode(currentWorkLoad.getSponsorCode());
    	    			 wLCurrentLoad.setSponsorGroup(currentWorkLoad.getSponsorGroup());
    	    			 wLCurrentLoad.setComplexity(currentWorkLoad.getComplexity());
    	    			 wLCurrentLoad.setLeadUnit(currentWorkLoad.getLeadUnit());
    	    			 wLCurrentLoad.setActiveFlag(currentWorkLoad.getActiveFlag());
    	    			 wLCurrentLoad.setArrivalDate(currentWorkLoad.getArrivalDate());
    	    			 wLCurrentLoad.setInactiveDate(currentWorkLoad.getInactiveDate());
    	    			 wLCurrentLoad.setReroutedFlag("Y");
    	    			 wLCurrentLoad.setAssignedBy(currentWorkLoad.getAssignedBy());
    	    			 wLCurrentLoad.setLastApprover(currentWorkLoad.getLastApprover());
    				  getDataObjectService().save(wLCurrentLoad);
    			 }else{
    			 
    			 KcPerson ospPerson = getKcPersonService().getKcPersonByPersonId(personId);
    			 DevelopmentProposal developmentProposal = getDataObjectService().find(DevelopmentProposal.class, proposalNumber);
    		     String wlHieararchyname =  KcServiceLocator.getService(ParameterService.class).getParameterValueAsString(Constants.KC_GENERIC_PARAMETER_NAMESPACE,Constants.KC_ALL_PARAMETER_DETAIL_TYPE_CODE, "WL_SPONSOR_HIERARCHY_NAME");
    		     if(wlHieararchyname!=null){
    		    	 Map<String, String> valueMap = new HashMap<String, String>();
    		    	 valueMap.put("sponsorCode", developmentProposal.getSponsorCode());
    		    	 valueMap.put("hierarchyName", wlHieararchyname);
    		    	 SponsorHierarchy sponsorHierarchy = getBusinessObjectService().findByPrimaryKey(SponsorHierarchy.class, valueMap);
    		    	 if(sponsorHierarchy!=null){
    		    		 sponsorGroup = sponsorHierarchy.getLevel1();
    		    	 }
    		     }
    			 WLCurrentLoad wLCurrentLoad = new WLCurrentLoad();
    			 wLCurrentLoad.setRoutingNumber("1");
    			 wLCurrentLoad.setProposalNumber(proposalNumber);
    			 wLCurrentLoad.setOriginalApprover(orginalApprover.getPersonId());
    			 wLCurrentLoad.setOriginalUserId(orginalApprover.getUserName());
    			 wLCurrentLoad.setPerson_id(personId);
    			 wLCurrentLoad.setUserId(ospPerson.getUserName());
    			 wLCurrentLoad.setSponsorCode(developmentProposal.getSponsorCode());
    			 wLCurrentLoad.setSponsorGroup(sponsorGroup);
    			 wLCurrentLoad.setComplexity(1L);
    			 wLCurrentLoad.setLeadUnit(developmentProposal.getUnitNumber());
    			 wLCurrentLoad.setActiveFlag("Y");
    			 wLCurrentLoad.setArrivalDate(getDateTimeService().getCurrentTimestamp());
    			 wLCurrentLoad.setInactiveDate(null);
    			 wLCurrentLoad.setReroutedFlag("N");
    			 wLCurrentLoad.setAssignedBy(null);
    			 wLCurrentLoad.setLastApprover(null);
    			 getDataObjectService().save(wLCurrentLoad);
    			 }
    		 }
    		 if(wLCurrentLoadList!=null && wLCurrentLoadList.isEmpty() && enabledWlRouting != null && enabledWlRouting.equalsIgnoreCase("Y")){
    			 context.getActionRequestFactory().addRootActionRequest(
    					 context.getActionRequested().getCode(), member.getPriority(), toRecipient(member,personId), "",
    					 member.getResponsibilityId(), member.getForceAction(), getActionRequestPolicyCode(member), null);
    		 }
    	}else{
    		super.generateRequestForMember(context, member);
    	}
    }
    
    private String getActionRequestPolicyCode(PeopleFlowMember member) {
        ActionRequestPolicy actionRequestPolicy = member.getActionRequestPolicy();
        return (actionRequestPolicy != null) ? actionRequestPolicy.getCode() : null;
    }
    
    private Recipient toRecipient(PeopleFlowMember member,String personId) {
        Recipient recipient;
        if(personId!=null){
        recipient = new KimPrincipalRecipient(personId);
        }else{
        	recipient = new KimPrincipalRecipient(member.getMemberId());
        }
        return recipient;
    }
    
    protected String getElementValue(String docContent, String xpathExpression) {
        try {
            Document document = XmlHelper.trimXml(new ByteArrayInputStream(docContent.getBytes()));

            XPath xpath = XPathHelper.newXPath();
            String value = (String) xpath.evaluate(xpathExpression, document, XPathConstants.STRING);

            return value;

        } catch (Exception e) {
            throw new RiceRuntimeException(e.getMessage(),e);
        }
    }
    
    public KcPersonService getKcPersonService() {
    	if(kcPersonService == null){
    		kcPersonService = KcServiceLocator.getService(KcPersonService.class);
    	}
    	return kcPersonService;
    }

	public void setKcPersonService(KcPersonService kcPersonService) {
		this.kcPersonService = kcPersonService;
	}
	
	public DataObjectService getDataObjectService() {
		if(dataObjectService == null){
			dataObjectService = KcServiceLocator.getService(DataObjectService.class);
    	}
		return dataObjectService;
	}

	public void setDataObjectService(DataObjectService dataObjectService) {
		this.dataObjectService = dataObjectService;
	}
	
	public BusinessObjectService getBusinessObjectService() {
		if(businessObjectService == null){
			businessObjectService = KcServiceLocator.getService(BusinessObjectService.class);
    	}
		return businessObjectService;
	}

	public void setBusinessObjectService(@SuppressWarnings("deprecation") BusinessObjectService businessObjectService) {
		this.businessObjectService = businessObjectService;
	}

	public DateTimeService getDateTimeService() {
		if(dateTimeService == null){
			dateTimeService = KcServiceLocator.getService(DateTimeService.class);
    	}
		return dateTimeService;
	}

	public void setDateTimeService(DateTimeService dateTimeService) {
		this.dateTimeService = dateTimeService;
	}
}
