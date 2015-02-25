/*
 * UserIdAuthService.java
 *
 * Created on August 28, 2006, 1:11 PM
 * Copyright (c) Massachusetts Institute of Technology
 * 77 Massachusetts Avenue, Cambridge, MA 02139-4307
 * All rights reserved.
 */

package edu.mit.kc.auth;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.drools.core.util.StringUtils;
import org.kuali.rice.kim.impl.identity.AuthenticationServiceImpl;


/**
 *
 */
public class MitKcUserAuthServiceImpl extends AuthenticationServiceImpl{
    private static final Log LOG = LogFactory.getLog(MitKcUserAuthServiceImpl.class);
	
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
