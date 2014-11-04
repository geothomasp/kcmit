/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.opensource.org/licenses/ecl1.php
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.coeus.common.impl.custom.attr;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.framework.custom.attr.CustomAttributeDocument;
import org.kuali.coeus.common.framework.custom.attr.CustomAttributeService;
import org.kuali.coeus.sys.framework.lookup.KcKualiLookupableHelperServiceImpl;
import org.kuali.rice.kns.lookup.HtmlData;
import org.kuali.rice.kns.lookup.HtmlData.AnchorHtmlData;
import org.kuali.rice.krad.bo.BusinessObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component("customAttributeDocumentLookupableHelperService")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class CustomAttributeLookupHelperServiceImpl extends KcKualiLookupableHelperServiceImpl {
	
	@Autowired
    @Qualifier("customAttributeService")
	public transient CustomAttributeService customAttributeService;

    private static final String EQUAL_CHAR = "=";
    
    public CustomAttributeLookupHelperServiceImpl() {
    }
    
    /**
     * Rewrite this method to use descriptive name for document type code
     * @see org.kuali.rice.kns.lookup.KualiLookupableHelperServiceImpl#getSearchResults(java.util.Map)
     */
    @Override
    public List<? extends BusinessObject> getSearchResults(Map<String, String> fieldValues) {
        List<CustomAttributeDocument> searchResults = (List<CustomAttributeDocument>) super.getSearchResults(fieldValues);
        Map<String, String> documentTypes = getCustomAttributeService().getDocumentTypeMap();
        for (CustomAttributeDocument customAttributeDocument : searchResults) {
            customAttributeDocument.setDocumentTypeName(documentTypes.get(customAttributeDocument.getDocumentTypeName()));
        }
        return searchResults;
    }

    /**
     * Because the search results is using descriptive name, we need to reverse to use code in href. 
     * @see org.kuali.rice.kns.lookup.AbstractLookupableHelperServiceImpl#getCustomActionUrls(org.kuali.rice.krad.bo.BusinessObject, java.util.List)
     */
    @Override
    public List<HtmlData> getCustomActionUrls(BusinessObject businessObject, List pkNames) {
        List<HtmlData> htmlDataList = super.getCustomActionUrls(businessObject, pkNames);
        Map<String, String> documentTypes = getCustomAttributeService().getReverseDocumentTypeMap();
        for (HtmlData htmlData : htmlDataList) {
            if (StringUtils.isNotBlank(((AnchorHtmlData) htmlData).getHref())) {
                String docType = StringUtils.substringBetween(((AnchorHtmlData) htmlData).getHref(), "documentTypeName=", "&");
                if (StringUtils.isNotBlank(docType) && documentTypes.containsKey(docType)) {
                    ((AnchorHtmlData) htmlData).setHref(((AnchorHtmlData) htmlData).getHref().replace(docType,
                            documentTypes.get(docType)));
                }
            }

        }
        return htmlDataList;
    }

	public CustomAttributeService getCustomAttributeService() {
		return customAttributeService;
	}

	public void setCustomAttributeService(
			CustomAttributeService customAttributeService) {
		this.customAttributeService = customAttributeService;
	}
}
