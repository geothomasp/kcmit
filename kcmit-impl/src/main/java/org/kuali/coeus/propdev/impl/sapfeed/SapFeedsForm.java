package org.kuali.coeus.propdev.impl.sapfeed;

import org.kuali.rice.krad.web.form.UifFormBase;

public class SapFeedsForm extends UifFormBase {

	private String path;
	private int pendingFeedCount;
	private Boolean sponsordatachanged=false;
	
	

	public Boolean getSponsordatachanged() {
		return sponsordatachanged;
	}

	public void setSponsordatachanged(Boolean sponsordatachanged) {
		this.sponsordatachanged = sponsordatachanged;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getPendingFeedCount() {
		return pendingFeedCount;
	}

	public void setPendingFeedCount(int pendingFeedCount) {
		this.pendingFeedCount = pendingFeedCount;
	}
	
}
