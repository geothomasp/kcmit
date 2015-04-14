package org.kuali.coeus.propdev.impl.sapfeed;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("sapFeedService")
public class SapFeedServiceImpl implements SapFeedService

{
	private static final String DEFAULT_TRANSACTION_ID= "9999999999";
	
	@Autowired
	@Qualifier("dbFunctionService")
	private DbFunctionService dbFunctionService;
	
	@Autowired
    @Qualifier("dataObjectService")
	private DataObjectService dataObjectService;

	@Autowired
	@Qualifier("businessObjectService")
    private BusinessObjectService businessObjectService;
	
	@Override
	public String generateMasterFeed(String path, String user)
			throws SQLException, NullPointerException {

		List<Object> paramValues = new ArrayList<Object>();
		paramValues.add(0, path);
		paramValues.add(1, user);
		String resultMaster = "0,0";
		try {

			 resultMaster = getDbFunctionService().executeFunction(
					"fn_generate_master_sap_feed", paramValues);
		return resultMaster;
		} catch (Exception ex) {
		
			ex.printStackTrace();
			return resultMaster;
		}
	}

	@Override
	public String generateRolodexFeed(String path, String user) throws SQLException {

		List<Object> paramValues = new ArrayList<Object>();
		paramValues.add(0, path);
		paramValues.add(1, user);
		String resultRolodex = "";
		try {

			return resultRolodex = getDbFunctionService().executeFunction(
					"fn_generate_rolodex_feed", paramValues);
		} catch (Exception ex) {
			ex.printStackTrace();
			return resultRolodex;

		}
	}

	@Override
	public String generateSponsorFeed(String path,String user) throws SQLException {

		List<Object> paramValues = new ArrayList<Object>();
		paramValues.add(0, path);
		paramValues.add(1, user);
		String resultSponsor = "";
		try {

			return resultSponsor = getDbFunctionService().executeFunction(
					"fn_generate_sponsor_feed", paramValues);

		} catch (Exception ex) {
			ex.printStackTrace();
			return resultSponsor;
		}

	}
	
	public void insertSapFeedDetails(String awardNumber, Integer sequenceNumber, String feedType,String feedStatus) {
		SapFeedDetails sapFeedDetails=new SapFeedDetails();
		sapFeedDetails.setAwardNumber(awardNumber);
    	sapFeedDetails.setSequenceNumber(sequenceNumber);
    	sapFeedDetails.setFeedType(feedType);
    	sapFeedDetails.setFeedStatus(feedStatus);
    	sapFeedDetails.setTranId(DEFAULT_TRANSACTION_ID);
    	sapFeedDetails = getBusinessObjectService().save(sapFeedDetails);
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
	
	
	
	public BusinessObjectService getBusinessObjectService() {
		
		if (businessObjectService == null) {
			businessObjectService = KcServiceLocator
					.getService(BusinessObjectService.class);
		}
		return businessObjectService;
	}

	public void setBusinessObjectService(BusinessObjectService businessObjectService) {
		this.businessObjectService = businessObjectService;
	}

	
	public DataObjectService getDataObjectService() {
		
		if (dataObjectService == null) {
			dataObjectService = KcServiceLocator.getService(DataObjectService.class);
		}
		return dataObjectService;
	}

	public void setDataObjectService(DataObjectService dataObjectService) {
		this.dataObjectService = dataObjectService;
	}

	@Override
	public void performRejectAction(Integer feedId) {
		SapFeedDetails sapFeedDetails = KcServiceLocator.getService(DataObjectService.class).findUnique(SapFeedDetails.class,QueryByCriteria.Builder.andAttributes(Collections.singletonMap("feedId", feedId)).build());
		if (sapFeedDetails != null) {
			if (sapFeedDetails.getFeedStatus().equals("F")) {
				sapFeedDetails.setFeedStatus("R");
				getBusinessObjectService().save(sapFeedDetails);
			}
		}
	}

	@Override
	public void performUndoReject(Integer feedId) {
		SapFeedDetails sapFeedDetails = KcServiceLocator.getService(DataObjectService.class).findUnique(SapFeedDetails.class,QueryByCriteria.Builder.andAttributes(Collections.singletonMap("feedId", feedId)).build());
		if (sapFeedDetails != null) {
			if (sapFeedDetails.getFeedStatus().equals("R")) {
				sapFeedDetails.setFeedStatus("F");
				getBusinessObjectService().save(sapFeedDetails);
			}
		}
	}
	
	@Override
	public void performResendBatch(Integer sapFeedBatchId,Integer batchId,Boolean processSubsequentBatches, String path) {
		int needSubsequent=0;
		if(processSubsequentBatches)
		needSubsequent=1;
		List<Object> paramValues = new ArrayList<Object>();
		paramValues.add(0, sapFeedBatchId);
		paramValues.add(1, batchId);
		paramValues.add(2, needSubsequent);
		paramValues.add(3, path);
		try {
			getDbFunctionService().executeFunction("fn_sap_resend_batch",
					paramValues);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
