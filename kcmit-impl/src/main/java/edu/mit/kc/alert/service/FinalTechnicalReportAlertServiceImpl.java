package edu.mit.kc.alert.service;

import org.springframework.stereotype.Component;

import edu.mit.kc.alert.AlertType;

@Component("finalTechnicalReportAlertService")
public class FinalTechnicalReportAlertServiceImpl extends AlertServiceBaseImpl implements SystemAlertService {

	@Override
	public void createAlerts(AlertType alertType) {
	}

	@Override
	public void updateAlerts(AlertType alertType) {
	}

	@Override
	public void cleanUpAlerts(AlertType alertType) {
		deactivateAllAlerts(alertType);
	}


}
