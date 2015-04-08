package org.kuali.coeus.propdev.impl.sapfeed;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;

@Entity
@Table(name = "SAP_FEED_BATCH_LIST")
public class SapFeedBatchDetails extends KcPersistableBusinessObjectBase {
	
	@Id
    @Column(name = "SAP_FEED_BATCH_ID")
	private Long sapFeedBatchId;
	
	@Column(name = "BATCH_ID")
	private Long batchId;
	
	@Column(name = "BATCH_FILE_NAME")
	private String batchFileName;
	
	@Column(name = "BATCH_TIMESTAMP")
	private Timestamp batchTimeStamp;
	
	@Column(name = "NO_OF_RECORDS")
	private Long noOfRecords;

	public Long getSapFeedBatchId() {
		return sapFeedBatchId;
	}

	public void setSapFeedBatchId(Long sapFeedBatchId) {
		this.sapFeedBatchId = sapFeedBatchId;
	}

	public Long getBatchId() {
		return batchId;
	}

	public void setBatchId(Long batchId) {
		this.batchId = batchId;
	}

	public String getBatchFileName() {
		return batchFileName;
	}

	public void setBatchFileName(String batchFileName) {
		this.batchFileName = batchFileName;
	}

	public Timestamp getBatchTimeStamp() {
		return batchTimeStamp;
	}

	public void setBatchTimeStamp(Timestamp batchTimeStamp) {
		this.batchTimeStamp = batchTimeStamp;
	}

	public Long getNoOfRecords() {
		return noOfRecords;
	}

	public void setNoOfRecords(Long noOfRecords) {
		this.noOfRecords = noOfRecords;
	}
}
