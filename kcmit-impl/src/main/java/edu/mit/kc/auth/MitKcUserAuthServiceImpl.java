/*
 * UserIdAuthService.java
 *
 * Created on August 28, 2006, 1:11 PM
 * Copyright (c) Massachusetts Institute of Technology
 * 77 Massachusetts Avenue, Cambridge, MA 02139-4307
 * All rights reserved.
 */

package edu.mit.kc.auth;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.drools.core.util.StringUtils;
import org.kuali.kra.service.impl.adapters.IdentityServiceAdapter;
import org.kuali.rice.core.api.config.property.ConfigurationService;
import org.kuali.rice.kim.api.identity.AuthenticationService;
import org.kuali.rice.kim.api.identity.IdentityService;
import org.kuali.rice.kim.api.identity.principal.Principal;
import org.kuali.rice.kim.api.services.KimApiServiceLocator;


/**
 *
 */
public class MitKcUserAuthServiceImpl extends IdentityServiceAdapter implements AuthenticationService{
    private static final Log LOG = LogFactory.getLog(MitKcUserAuthServiceImpl.class);
	
    private ConfigurationService kualiConfigurationService;
    
    
    public ConfigurationService getKualiConfigurationService() {
        return kualiConfigurationService;
    }

    public void setKualiConfigurationService(ConfigurationService kualiConfigurationService) {
        this.kualiConfigurationService = kualiConfigurationService;
    }
    @Override
    public Principal getPrincipalByPrincipalNameAndPassword(String userName,String password) {
        String dburl = kualiConfigurationService.getPropertyValueAsString("datasource.url");
        Connection conn = null;
        try{
            conn = DriverManager.getConnection(dburl, userName, password);
            if (conn != null ) {
                IdentityService auth = KimApiServiceLocator.getIdentityService();
                return auth.getPrincipalByPrincipalName(userName);
            }
        }catch(SQLException ex){
            if(ex.getMessage().indexOf("invalid username")!=-1){
                ex.printStackTrace();
                return null;
            }else{
                throw new RuntimeException(ex.getMessage());
            }
        }finally{
            try{
                if(conn!=null && !conn.isClosed()) conn.close();
            }catch(SQLException ex){
                throw new RuntimeException(ex.getMessage());
            }
        }
        return null;
    }

    @Override
    public String getPrincipalName(HttpServletRequest request) {
        String remoteUserEmail = request.getRemoteUser();
        LOG.info("Loggedin remote user=> "+remoteUserEmail);
        String kerbId = remoteUserEmail;
        if(!StringUtils.isEmpty(remoteUserEmail) && remoteUserEmail.indexOf("@")!=-1){
        	kerbId = remoteUserEmail.substring(0,remoteUserEmail.lastIndexOf("@"));
            LOG.info("Loggedin user utln=> "+kerbId);
        }else{
            LOG.info("Remote user email=> "+remoteUserEmail+ " is not valid");
        }
        return kerbId;
    }

	
}
