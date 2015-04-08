package edu.mit.kc.dashboard.bo;

import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;
import org.kuali.rice.krad.data.jpa.PortableSequenceGenerator;

import javax.persistence.*;

/**
 * Alert business object
 */
@Entity
@Table(name = "SYSTEM_ALERTS")
public class Alert extends KcPersistableBusinessObjectBase {

    @PortableSequenceGenerator(name = "SEQ_MODULE_ALERT_ID")
    @GeneratedValue(generator = "SEQ_MODULE_ALERT_ID")
	@Id
   	@Column(name = "ALERT_ID")
    private String alertId;

   	@Column(name = "USER_NAME")
    private String userName;

   	@Column(name = "MODULE_NMSPC_CD")
    private String moduleNamespaceCode;

   	@Column(name = "MODULE_NAME")
    private String moduleName;

   	@Column(name = "ALERT_MESSAGE")
    private String alert;

    @Column(name = "PRIORITY")
    private Integer priority;

    @Column(name = "ACTIVE")
    private String active;

    public String getAlertId() {
        return alertId;
    }

    public void setAlertId(String alertId) {
        this.alertId = alertId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getModuleNamespaceCode() {
        return moduleNamespaceCode;
    }

    public void setModuleNamespaceCode(String moduleNamespaceCode) {
        this.moduleNamespaceCode = moduleNamespaceCode;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getAlert() {
        return alert;
    }

    public void setAlert(String alert) {
        this.alert = alert;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }
}
