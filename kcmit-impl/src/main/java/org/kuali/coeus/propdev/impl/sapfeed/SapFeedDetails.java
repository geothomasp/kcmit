package org.kuali.coeus.propdev.impl.sapfeed;

import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;


public class SapFeedDetails extends KcPersistableBusinessObjectBase {
	
	private Integer feedId;
	private String awardNumber;
	private Integer sequenceNumber;
	private String feedType;
	private String feedStatus;
	private String batchId;
	private String tranId;
	
	
	public Integer getFeedId() {
		return feedId;
	}
	public void setFeedId(Integer feedId) {
		this.feedId = feedId;
	}
	public String getAwardNumber() {
		return awardNumber;
	}
	public void setAwardNumber(String awardNumber) {
		this.awardNumber = awardNumber;
	}
	public Integer getSequenceNumber() {
		return sequenceNumber;
	}
	public void setSequenceNumber(Integer sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
	}
	public String getFeedType() {
		return feedType;
	}
	public void setFeedType(String feedType) {
		this.feedType = feedType;
	}
	public String getFeedStatus() {
		return feedStatus;
	}
	public void setFeedStatus(String feedStatus) {
		this.feedStatus = feedStatus;
	}
	public String getBatchId() {
		return batchId;
	}
	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}
	public String getTranId() {
		return tranId;
	}
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}
	
}
