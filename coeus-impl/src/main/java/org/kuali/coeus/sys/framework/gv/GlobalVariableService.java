package org.kuali.coeus.sys.framework.gv;

import org.kuali.rice.kns.util.AuditCluster;
import org.kuali.rice.krad.UserSession;
import org.kuali.rice.krad.util.MessageMap;
import org.kuali.rice.krad.web.form.UifFormManager;

import java.util.Map;
import java.util.concurrent.Callable;

public interface GlobalVariableService {

    UserSession getUserSession();

    void setUserSession(UserSession userSession);

    MessageMap getMessageMap();

    void setMessageMap(MessageMap messageMap);
    
    Map<String, AuditCluster> getAuditErrorMap();
    
    void setAuditErrorMap(Map<String, AuditCluster> auditMap);

    UifFormManager getUifFormManager();

    void setUifFormManager(UifFormManager uifFormManager);

    <T> T doInNewGlobalVariables(Callable<T> callable);

    <T> T doInNewGlobalVariables(UserSession userSession, Callable<T> callable);
}
