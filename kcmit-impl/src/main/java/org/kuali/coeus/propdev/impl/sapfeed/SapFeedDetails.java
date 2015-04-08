package org.kuali.coeus.propdev.impl.sapfeed;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;

@Entity
@Table(name = "SAP_FEED_DETAILS")
public class SapFeedDetails extends KcPersistableBusinessObjectBase {
	
	@Id
    @Column(name = "FEED_ID")
	private Integer feedId;
	
	@Column(name = "AWARD_NUMBER")
	private String awardNumber;
	 
	@Column(name = "SEQUENCE_NUMBER")
	private Integer sequenceNumber;
	 
	@Column(name = "FEED_TYPE")
	private String feedType;
	 
	@Column(name = "FEED_STATUS")
	private String feedStatus;
	 
	@Column(name = "BATCH_ID")
	private String batchId;
	 
	@Column(name = "TRANSACTION_ID")
	private String tranId;
	
	@Column(name = "SAP_FEED_BATCH_ID")
	private Long sapFeedBatchId;
	
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
	public Long getSapFeedBatchId() {
		return sapFeedBatchId;
	}
	public void setSapFeedBatchId(Long sapFeedBatchId) {
		this.sapFeedBatchId = sapFeedBatchId;
	}
	
	
}
