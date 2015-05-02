package org.kuali.coeus.common.impl;

import java.util.HashMap;
import java.util.List;

import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.krad.data.DataObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import edu.mit.kc.bo.SharedDocumentType;

@Component("sharedDocumentService")
public class SharedDocumentServiceImpl implements SharedDocumentService {

    @Autowired
    @Qualifier("dataObjectService")
    private DataObjectService dataObjectService;
    
	@Override
	public String getSharedDocumentTypeForModule(String moduleCode) {
	    HashMap<String, String> criteria = new HashMap<String, String>();
	    criteria.put("moduleCode", moduleCode);
	    List<SharedDocumentType> sharedDocTypes = getDataObjectService().findMatching(SharedDocumentType.class, QueryByCriteria.Builder.andAttributes(criteria).build()).getResults();
	    return getSharedDocumentTypes(sharedDocTypes, moduleCode);
	}
	
	public List<SharedDocumentType> getAllSharedDocumentTypes() {
	    List<SharedDocumentType> sharedDocTypes = getDataObjectService().findAll(SharedDocumentType.class).getResults();
	    return sharedDocTypes;
	}

	public String getSharedDocumentTypeForModule(List<SharedDocumentType> sharedDocumentTypes, String moduleCode) {
	    return getSharedDocumentTypes(sharedDocumentTypes, moduleCode);
	}
	
	protected String getSharedDocumentTypes(List<SharedDocumentType> sharedDocTypes, String moduleCode) {
		StringBuffer sharedDocumentTypeForModule = new StringBuffer();
		for(SharedDocumentType sharedDocumentType : sharedDocTypes) {
			if(sharedDocumentType.getModuleCode().equalsIgnoreCase(moduleCode)) {
				sharedDocumentTypeForModule.append(sharedDocumentType.getDocumentTypeCode());
				sharedDocumentTypeForModule.append(",");
			}
		}
		return sharedDocumentTypeForModule.toString();
	}
	
	public DataObjectService getDataObjectService() {
		return dataObjectService;
	}

	public void setDataObjectService(DataObjectService dataObjectService) {
		this.dataObjectService = dataObjectService;
	}


}
