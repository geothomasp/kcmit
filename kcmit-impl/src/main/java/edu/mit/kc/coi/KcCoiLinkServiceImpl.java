package edu.mit.kc.coi;



import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.coeus.common.impl.krms.StoredFunctionDao;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.coreservice.api.parameter.Parameter;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import edu.mit.kc.common.DbFunctionExecuteService;

public class KcCoiLinkServiceImpl implements KcCoiLinkService{
	
	protected final Log LOG = LogFactory.getLog(KcCoiLinkServiceImpl.class);
	Logger LOGGER;

	private DbFunctionExecuteService dbFunctionExecuteService;
	private ParameterService parameterService;

	protected static final String KC_COI_DB_LINK = "KC_COI_DB_LINK"; 
	protected static final String KC_GENERAL_NAMESPACE = "KC-GEN";
	protected static final String DOCUMENT_COMPONENT_NAME = "Document";

	public KcCoiLinkServiceImpl() {
		super();
		LOGGER = Logger.getLogger(KcCoiLinkServiceImpl.class.getName());
	}

	public ParameterService getParameterService() {
		return parameterService;
	}

	public void setParameterService(ParameterService parameterService) {
		this.parameterService = parameterService;
	}

	public DbFunctionExecuteService getDbFunctionExecuteService() {
		if (dbFunctionExecuteService == null) {
			dbFunctionExecuteService = KcServiceLocator.getService(DbFunctionExecuteService.class);
		}

		return dbFunctionExecuteService;
	}

	public void setDbFunctionExecuteService(
			DbFunctionExecuteService dbFunctionExecuteService) {
		this.dbFunctionExecuteService = dbFunctionExecuteService;
	}

	protected String getDBLink() {
		System.out.println("inside getDBLink-----------> ");
		try {
			Parameter parm = this.getParameterService().getParameter(KC_GENERAL_NAMESPACE, DOCUMENT_COMPONENT_NAME,KC_COI_DB_LINK);
			
			if (!parm.getValue().isEmpty()) {
				return '@' + parm.getValue();
			}
			
			System.out.println("param value= " + parm);

		} catch (NullPointerException e) {
			LOGGER.log(Level.ALL, e.getMessage(), e);
			LOGGER.log(Level.ALL,
					"DBLINK is not accessible or the parameter value returning null");
		} finally {
			System.out.println("param value= ");
		}

		return "";
	}

		/**
		 * @description:		 Invoke a specified PL/SQL function for updating Coues COI.
		 * @integration point:	 Linking IP to Award  - Invoke this method, when a DP record completes routing and generates an IP
		 * @param   	developmentProposalNumber
		 * 				instituteProposalNumber	
		 * 			    
		 * @referenced PL/SQL function: FN_COI_PROP_TRANSITION
		 */
	public void updateCOIOnNewIP(String developmentProposalNumber,String instituteProposalNumber) {
		
		List<Object> paramValues = new ArrayList<Object>();
		String result = "";
		
		paramValues.add(0, developmentProposalNumber);
		paramValues.add(1, instituteProposalNumber);
		
		try {
			System.out.println("Inside Service FN_COI_PROP_TRANSITION start");
			result = getDbFunctionExecuteService().executeFunction(
					"FN_COI_PROP_TRANSITION"+this.getDBLink(), paramValues);
			System.out.println("result val = " + result);
			System.out.println("Inside Service FN_COI_PROP_TRANSITION end");

		} catch (Exception ex) {
			LOGGER.log(Level.INFO, "Got exception:" + ex.getMessage());
			LOGGER.log(Level.ALL, ex.getMessage(), ex);
		} finally {
			try {
				if (result != null) {
					LOGGER.log(Level.INFO, "Function Successfully Invoked");
				}
			} catch (Exception e) {
				LOGGER.log(Level.ALL, e.getMessage(), e);
			}
		}

	}
	

	
	/**
	 * @description:		 Invoke a specified PL/SQL function for updating Coues COI.
	 * @integration point:	 Linking IP to Award  - Invoke this method, when an IP gets linked to an award, either on a new
	 						 award, or while editing and existing award and linking an IP thru funding
	 						 proposals, after the transaction gets saved in KC
	 * @param   	awardNumber
	 * 				instituteProposalNumber
	 * 				loggedInUserId
	 * 			    
	 * @referenced PL/SQL function: FN_SYNC_AWARD_DISCLOSURE
	 */
	public void updateCOIOnLinkIPToAward(String awardNumber,String instituteProposalNumber,String loggedInUserId){
		
		System.out.println("Inside Service FN_SYNC_AWARD_DISCLOSURE start");
		 
		List<Object> paramValues = new ArrayList<Object>();
		String result = "";
		paramValues.add(0, awardNumber);
		paramValues.add(1, instituteProposalNumber);
		paramValues.add(2, loggedInUserId);
		
		
		
		try {
		result =  getDbFunctionExecuteService().executeFunction("FN_SYNC_AWARD_DISCLOSURE"+this.getDBLink(), paramValues);
		System.out.println("result val = "+result);
		} catch (Exception ex) {
			LOGGER.log(Level.INFO, "Got exception:" + ex.getMessage());
			LOGGER.log(Level.ALL, ex.getMessage(), ex);
		} finally {
			try {
				if (result != null) {
					LOGGER.log(Level.INFO, "Function Successfully Invoked");
				}
			} catch (Exception e) {
				LOGGER.log(Level.ALL, e.getMessage(), e);
			}
		}
		System.out.println("Inside Service  FN_SYNC_AWARD_DISCLOSURE end");
		
	}
	
	/**
	 * @description:		 Invoke a specified PL/SQL function for create / update proposal disclosure in Coeus COI
	 * @integration point:	 Certification Complete in PD - Invoke this method, when a person completes PD personnel
	 * 						 certification and if the questionnaire answers triggers COI
	 * @param   	developmentProposalNumber
	 * 				disclosurePersonId
	 * 				loggedInUserId
	 * 			    actionType
	 * @referenced PL/SQL function FN_SYNC_QNR_FROM_PROP_TO_COI
	 */
	public void updateCOIOnPDCerificationComplete(String developmentProposalNumber,String disclosurePersonId,String loggedInUserId,char actionType){
		System.out.println("Inside Service FN_SYNC_QNR_FROM_PROP_TO_COI start");
		
		List<Object> paramValues = new ArrayList<Object>();
		String result = "";
		
		paramValues.add(0, developmentProposalNumber);
		paramValues.add(1, disclosurePersonId);
		paramValues.add(2, loggedInUserId);
		paramValues.add(3, actionType);		
		
		
		try {
		 result =  getDbFunctionExecuteService().executeFunction("FN_SYNC_QNR_FROM_PROP_TO_COI"+this.getDBLink(),paramValues);
		} catch (Exception ex) {
			LOGGER.log(Level.INFO, "Got exception:" + ex.getMessage());
			LOGGER.log(Level.ALL, ex.getMessage(), ex);
		} finally {
			try {
				if (result != null) {
					LOGGER.log(Level.INFO, "Function Successfully Invoked");
					//disconnect connection??
				}
			} catch (Exception e) {
				LOGGER.log(Level.ALL, e.getMessage(), e);
			}
		}
		System.out.println("result val = "+result);
		System.out.println("Inside Service FN_SYNC_QNR_FROM_PROP_TO_COI end");	
	}
	
}
