package org.kuali.coeus.propdev.impl.sapfeed;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("sapFeedService")
public class SapFeedServiceImpl implements SapFeedService

{

	@Autowired
	@Qualifier("dbFunctionService")
	private DbFunctionService dbFunctionService;

	@Override
	public String generateMasterFeed(String path, String user)
			throws SQLException, NullPointerException {

		List<Object> paramValues = new ArrayList<Object>();
		paramValues.add(0, path);
		paramValues.add(1, user);
		String resultMaster = "";
		try {

			return resultMaster = getDbFunctionService().executeFunction(
					"fn_generate_sap_feed", paramValues);
		} catch (Exception ex) {
			return resultMaster;
		}
	}

	@Override
	public String generateRolodexFeed(String path) throws SQLException {

		List<Object> paramValues = new ArrayList<Object>();
		paramValues.add(0, path);
		String resultRolodex = "";
		try {

			return resultRolodex = getDbFunctionService().executeFunction(
					"fn_generate_rolodex_feed", paramValues);
		} catch (Exception ex) {
			return resultRolodex;

		}
	}

	@Override
	public String generateSponsorFeed(String path) throws SQLException {

		List<Object> paramValues = new ArrayList<Object>();
		paramValues.add(0, path);
		String resultSponsor = "";
		try {

			return resultSponsor = getDbFunctionService().executeFunction(
					"fn_generate_sponsor_feed", paramValues);

		} catch (Exception ex) {
			return resultSponsor;
		}

	}

	public DbFunctionService getDbFunctionService() {
		if (dbFunctionService == null) {
			dbFunctionService = KcServiceLocator
					.getService(DbFunctionService.class);
		}
		return dbFunctionService;
	}

	public void setDbFunctionService(DbFunctionService dbFunctionService) {
		this.dbFunctionService = dbFunctionService;
	}
}
