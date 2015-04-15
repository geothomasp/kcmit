package edu.mit.kc.alert.service;

import edu.mit.kc.alert.AlertType;

public interface ApplicationAlertService {
	
	public void processAllAlerts();
	
	public void processAlert(AlertType alertType);

	public void deactivateAlert(AlertType alertType);
	
}
