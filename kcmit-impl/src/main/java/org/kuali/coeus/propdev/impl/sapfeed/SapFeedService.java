package org.kuali.coeus.propdev.impl.sapfeed;

import java.sql.SQLException;

public interface SapFeedService {
	
	public String generateMasterFeed(String path,String user)
			throws SQLException;
	
	public String generateRolodexFeed(String path)
			throws SQLException;
	
	public String generateSponsorFeed(String path)
			throws SQLException;

}
