package edu.mit.kc.web.filter;



import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.coreservice.framework.CoreFrameworkServiceLocator;
import org.kuali.rice.coreservice.framework.parameter.ParameterService;

import edu.mit.kc.common.BackDoorLoginAuthorizationService;


public class MitKcFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest hsreq = (HttpServletRequest) request;
		boolean backboorEnabled = false;
		boolean hasBackdoorloginPermission = false;
		BackDoorLoginAuthorizationService backDoorLoginAuthorizationService = KcServiceLocator.getService(BackDoorLoginAuthorizationService.class);
	    ParameterService parameterService = CoreFrameworkServiceLocator.getParameterService();

		String user = request.getParameter("__login_user");
		if(user!=null){
		    backboorEnabled = parameterService.getParameterValueAsBoolean(org.kuali.rice.kew.api.KewApiConstants.KEW_NAMESPACE, org.kuali.rice.krad.util.KRADConstants.DetailTypes.BACKDOOR_DETAIL_TYPE, org.kuali.rice.kew.api.KewApiConstants.SHOW_BACK_DOOR_LOGIN_IND);
		    hasBackdoorloginPermission = backDoorLoginAuthorizationService.hasBackdoorLoginPermission(user);
			hsreq.getSession().setAttribute("hasBackdoorloginPermission",hasBackdoorloginPermission);
			hsreq.getSession().setAttribute("backboorEnabled", backboorEnabled);
		}
		chain.doFilter(request, response);
		
		
	}

	@Override
	public void destroy() {
	
	}

	

}
