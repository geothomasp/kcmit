package edu.mit.kc.alert;

import static org.kuali.rice.core.api.criteria.PredicateFactory.equal;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.rice.core.api.config.property.ConfigurationService;
import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.coreservice.api.parameter.Parameter;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import edu.mit.kc.alert.AlertType;
import edu.mit.kc.alert.service.AlertServiceBaseImpl;
import edu.mit.kc.alert.service.SystemAlertService;
import edu.mit.kc.coi.KcCoiLinkServiceImpl;
import edu.mit.kc.common.DbFunctionExecuteService;
import edu.mit.kc.dashboard.bo.Alert;
import edu.mit.kc.infrastructure.KcMitConstants;


@Component("coiDisclosureAlertService")
public class CoiDisclosureAlertServiceImpl extends AlertServiceBaseImpl implements SystemAlertService {

	protected final Log LOG = LogFactory.getLog(KcCoiLinkServiceImpl.class);
	
	@Autowired
	@Qualifier("kualiConfigurationService")
	private ConfigurationService kualiConfigurationService;

	@Autowired
	@Qualifier("dbFunctionExecuteService")
	private DbFunctionExecuteService dbFunctionExecuteService;
	
	@Autowired
	@Qualifier("parameterService")
	private ParameterService parameterService;

	protected static final String KC_COI_DB_LINK = "KC_COI_DB_LINK";
	protected static final String KC_GENERAL_NAMESPACE = "KC-GEN";
	protected static final String DOCUMENT_COMPONENT_NAME = "Document";

	Alert alert = new Alert();



	@Override
	public void createAlerts(AlertType alertType, String userName) {
		String loggedInUserId =getKcPerson(userName).getPersonId();
		String alertMessage = getKualiConfigurationService().getPropertyValueAsString(KcMitConstants.COI_DISCLOSURE_EXPIRATION_DATE_ALERT);
		String alertNullMessage = getKualiConfigurationService().getPropertyValueAsString(KcMitConstants.COI_DISCLOSURE_EXPIRATION_NULLDATE_ALERT);
		List<Object> paramValues = new ArrayList<Object>();
		String result = "";

		paramValues.add(0, loggedInUserId);

		try {

			result = getDbFunctionExecuteService().executeFunction("Fn_Get_per_discl_exp_date" + this.getDBLink(),paramValues);

		} catch (Exception ex) {
			LOG.error("Error while excecuting function " + getDBLink()+ ":Fn_Get_per_discl_exp_date" + ex.getMessage());
		}
       if(result != ""){
    	   
    	   if (!StringUtils.isEmpty(alertMessage)) {
    		  alertMessage= alertMessage.replace("{0}", result);
           }
		
    	alert.setActive(Constants.YES_FLAG);
		alert.setAlert(alertMessage);
		alert.setUserName(getKcPerson(userName).getUserName());
		alert.setUpdateUser(getKcPerson(userName).getUserName());
		alert.setPriority(1);
		alert.setAlertTypeId(alertType.getId());
		getDataObjectService().save(alert);
       }
       else{
    	   
    	alert.setActive(Constants.YES_FLAG);
   		alert.setAlert(alertNullMessage);
   		alert.setUserName(getLoggedInUserName());
   		alert.setUpdateUser(getKcPerson(userName).getUserName());
   		alert.setPriority(1);
   		alert.setAlertTypeId(alertType.getId());
   		getDataObjectService().save(alert);
    	   
       }
		
	}

	@Override
	public void updateAlerts(AlertType alertType, String userName) {
		
		
	}

	@Override
	public void cleanUpAlerts(AlertType alertType, String userName) {
		getDataObjectService().deleteMatching(Alert.class, QueryByCriteria.Builder.fromPredicates(equal("alertTypeId", alertType.getId())));
		
	}
	
	protected String getDBLink() {

		try {
			Parameter parm = this.getParameterService().getParameter(KC_GENERAL_NAMESPACE, DOCUMENT_COMPONENT_NAME,KC_COI_DB_LINK);
			if (!parm.getValue().isEmpty()) {
				return '@' + parm.getValue();
			}
		} catch (NullPointerException e) {

			LOG.error(e.getMessage());
			LOG.error("DBLINK is not accessible or the parameter value returning null");
		}

		return "";
	}

	public DbFunctionExecuteService getDbFunctionExecuteService() {
		return dbFunctionExecuteService;
	}

	public void setDbFunctionExecuteService(
			DbFunctionExecuteService dbFunctionExecuteService) {
		this.dbFunctionExecuteService = dbFunctionExecuteService;
	}

	public ParameterService getParameterService() {
		return parameterService;
	}

	public void setParameterService(ParameterService parameterService) {
		this.parameterService = parameterService;
	}

	public ConfigurationService getKualiConfigurationService() {
		return kualiConfigurationService ;
	}

	public void setKualiConfigurationService(
			ConfigurationService kualiConfigurationService) {
		this.kualiConfigurationService = kualiConfigurationService;
	}

}
