package org.kuali.coeus.propdev.impl.sapfeed;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.sql.DataSource;

import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.version.service.AwardVersionService;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.timeandmoney.AwardHierarchyNode;
import org.kuali.rice.core.api.criteria.OrderByField;
import org.kuali.rice.core.api.criteria.OrderDirection;
import org.kuali.rice.core.api.criteria.Predicate;
import org.kuali.rice.core.api.criteria.PredicateFactory;
import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import edu.mit.kc.dashboard.bo.Alert;

@Component("sapFeedService")
public class SapFeedServiceImpl implements SapFeedService

{
	private static final String DEFAULT_TRANSACTION_ID= "9999999999";
	
	private static final String SAPFEED_FEEDTYPE_NEW = "N";
	private static final String SAPFEED_FEEDTYPE_CHANGED = "C";
	private static final String SAPFEED_FEEDSTATUS_PENDING = "P";
	private static final String SAPFEED_FEEDSTATUS_FED = "F";
	private static final String SAPFEED_FEEDSTATUS_REJECTED = "R";
	private static final String SAPFEED_FEEDSTATUS_ERROR = "E";
	private static final String SAPFEED_FEEDSTATUS_WORK_IN_PROGRESS = "W";
	private static final String SAPFEED_FEEDSTATUS_CANCELLED = "C";
	
	
	@Autowired
	@Qualifier("dbFunctionService")
	private DbFunctionService dbFunctionService;
	
	@Autowired
    @Qualifier("dataObjectService")
	private DataObjectService dataObjectService;

	@Autowired
	@Qualifier("businessObjectService")
    private BusinessObjectService businessObjectService;
	
    private AwardVersionService awardVersionService;

    @Autowired
    @Qualifier("dataSource")
    private DataSource dataSource;
	
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
	 
	public boolean isAwardSapFeedExists(String awardNumber, Integer sequenceNumber) {
        Map<String, Object> keys = new HashMap<String, Object>();
        keys.put("awardNumber", awardNumber);
        keys.put("sequenceNumber", sequenceNumber);
        keys.put("feedStatus", SAPFEED_FEEDSTATUS_WORK_IN_PROGRESS);

        final List<SapFeedDetails> feedDetails = getDataObjectService().findMatching(SapFeedDetails.class,
                QueryByCriteria.Builder.andAttributes(keys).build()).getResults();
        return feedDetails != null && !feedDetails.isEmpty();
	}

	public void removeWorkInProgressSapDetails(String awardNumber,Integer sequenceNumber) {
        Map<String, Object> keys = new HashMap<String, Object>();
        keys.put("awardNumber", awardNumber);
        keys.put("sequenceNumber", sequenceNumber);
        keys.put("feedStatus", SAPFEED_FEEDSTATUS_WORK_IN_PROGRESS);
        getDataObjectService().deleteMatching(SapFeedDetails.class, QueryByCriteria.Builder.andAttributes(keys).build());
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
	public void performCancelAction(SapFeedDetails sapFeedDetails) {
		if (sapFeedDetails != null) {
			if (sapFeedDetails.getFeedStatus().equals(SAPFEED_FEEDSTATUS_PENDING)) {
				sapFeedDetails.setFeedStatus(SAPFEED_FEEDSTATUS_CANCELLED);
				getDataObjectService().save(sapFeedDetails);
			}
		}
	}
	
	@Override
	public void performRejectAction(SapFeedDetails sapFeedDetails) {
		if (sapFeedDetails != null) {
			if (sapFeedDetails.getFeedStatus().equals("F")) {
				sapFeedDetails.setFeedStatus("R");
				getBusinessObjectService().save(sapFeedDetails);
			}
		}
	}

	@Override
	public void performUndoReject(SapFeedDetails sapFeedDetails) {
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

	public void setAllWorkInProgressSapFeedDetailsToPending(Map<String, AwardHierarchyNode> awardHierarchyNodes) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
			conn = getDataSource().getConnection();
//    		final ReportQueryByCriteria query = QueryFactory.newReportQuery(Questionnaire.class, columns, criteria, false);
//    		final Iterator iter = getPersistenceBrokerTemplate().getReportQueryIteratorByQuery(query);
    	    stmt = conn.prepareStatement("UPDATE SAP_FEED_DETAILS SET FEED_STATUS = '" + SAPFEED_FEEDSTATUS_PENDING + 
    	    		"' WHERE AWARD_NUMBER = ? AND SEQUENCE_NUMBER = ? AND FEED_STATUS = '" + SAPFEED_FEEDSTATUS_WORK_IN_PROGRESS + "'");
	        for(Entry<String, AwardHierarchyNode> awardHierarchyNode : awardHierarchyNodes.entrySet()){
	            Award award = getAwardVersionService().getWorkingAwardVersion(awardHierarchyNode.getValue().getAwardNumber());
        	    stmt.setString(1, award.getAwardNumber());
        	    stmt.setInt(2, award.getSequenceNumber());
        		stmt.executeUpdate();
        	}
    		conn.commit();
        } catch (SQLException e) {
            try {
            	if(conn!=null){
            		conn.rollback();
            	}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
            e.printStackTrace();
        }finally{
        	if(stmt!=null){
        		try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
        	}
        	if(conn!=null){
        		try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
        	}
        }
	}

	public void setSapDetailsToWorkInProgress(String awardNumber,Integer sequenceNumber) {
		String feedStatus = SAPFEED_FEEDSTATUS_WORK_IN_PROGRESS;
		String feedType = getSapFeedType(awardNumber, sequenceNumber);

		if(feedType != null) {
			insertSapFeedDetails(awardNumber, sequenceNumber, feedType, feedStatus);
		}
	}
	
	@Override
	public void updateSapFeedDetails(String awardNumber,Integer sequenceNumber) {
		String feedStatus = SAPFEED_FEEDSTATUS_PENDING;
		String feedType = getSapFeedType(awardNumber, sequenceNumber);

		if(feedType != null) {
			insertSapFeedDetails(awardNumber, sequenceNumber, feedType, feedStatus);
		}
	}

	protected SapFeedDetails getLatestSapFeedDetail(String awardNumber) {
    	QueryByCriteria.Builder builder = QueryByCriteria.Builder.create();
        List<Predicate> predicates = new ArrayList<Predicate>();
        predicates.add(PredicateFactory.equal("awardNumber", awardNumber));
    	builder.setPredicates(PredicateFactory.and(predicates.toArray(new Predicate[] {})));
        builder.setOrderByFields(OrderByField.Builder.create("sequenceNumber", OrderDirection.DESCENDING).build());

        List<SapFeedDetails> sapFeedDetails = getDataObjectService().findMatching(SapFeedDetails.class, builder.build()).getResults();
		if (sapFeedDetails != null && sapFeedDetails.size() > 0) {
			return sapFeedDetails.get(0);
		}
		return null;
	}
	
	protected  boolean isAnySapFeedSuccess(String awardNumber) {
		boolean sapFeedSuccess = false;
    	QueryByCriteria.Builder builder = QueryByCriteria.Builder.create();
        List<Predicate> predicates = new ArrayList<Predicate>();
        predicates.add(PredicateFactory.equal("awardNumber", awardNumber));
    	builder.setPredicates(PredicateFactory.and(predicates.toArray(new Predicate[] {})));
        List<SapFeedDetails> sapFeedDetails = getDataObjectService().findMatching(SapFeedDetails.class, builder.build()).getResults();
        for(SapFeedDetails sapFeedDetail : sapFeedDetails){
        	 if(sapFeedDetail.getFeedStatus().equals(SAPFEED_FEEDSTATUS_ERROR) || 
        			 sapFeedDetail.getFeedStatus().equals(SAPFEED_FEEDSTATUS_REJECTED)){
        		 sapFeedSuccess = false;
        	 }else{
        		 sapFeedSuccess = true;
        		 break;
        	 }
        }
		return sapFeedSuccess;
	}
	
	protected String getSapFeedType(String awardNumber, Integer sequenceNumber) {
		String feedType = null;
		SapFeedDetails latestFeedDetails = getLatestSapFeedDetail(awardNumber);
		if (latestFeedDetails != null) {
			if (isAnySapFeedSuccess(awardNumber)) {
				feedType = SAPFEED_FEEDTYPE_CHANGED;
			}else{
				feedType = SAPFEED_FEEDTYPE_NEW;
			}
		} else {
			feedType = SAPFEED_FEEDTYPE_NEW;
		}
		return feedType;
	}

	public AwardVersionService getAwardVersionService() {
        if(awardVersionService == null) {
            awardVersionService = KcServiceLocator.getService(AwardVersionService.class);
        }
		return awardVersionService;
	}

	public void setAwardVersionService(AwardVersionService awardVersionService) {
		this.awardVersionService = awardVersionService;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

}
