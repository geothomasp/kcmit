package org.kuali.coeus.common.impl;

import java.util.List;

import edu.mit.kc.bo.SharedDocumentType;

public interface SharedDocumentService {

	public String getSharedDocumentTypeForModule(String moduleCode);
	
	public List<SharedDocumentType> getAllSharedDocumentTypes();
	
	public String getSharedDocumentTypeForModule(List<SharedDocumentType> sharedDocumentTypes, String moduleCode);
	
}
