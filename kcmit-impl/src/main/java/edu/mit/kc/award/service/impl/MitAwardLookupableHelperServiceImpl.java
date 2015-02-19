/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the GNU Affero General Public License, Version 3 (the "License");
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
package edu.mit.kc.award.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.coeus.common.framework.rolodex.Rolodex;
import org.kuali.coeus.common.framework.unit.Unit;
import org.kuali.kra.award.contacts.AwardPerson;
import org.kuali.kra.award.contacts.AwardUnitContact;
import org.kuali.kra.award.document.AwardDocument;
import org.kuali.kra.award.document.authorization.AwardDocumentAuthorizer;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.lookup.AwardLookupableHelperServiceImpl;
import org.kuali.kra.award.dao.AwardLookupDao;
import org.kuali.kra.lookup.KraLookupableHelperServiceImpl;
import org.kuali.rice.kew.api.KewApiConstants;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.kim.api.services.KimApiServiceLocator;
import org.kuali.rice.kns.lookup.HtmlData;
import org.kuali.rice.kns.lookup.HtmlData.AnchorHtmlData;
import org.kuali.rice.kns.web.ui.Field;
import org.kuali.rice.kns.web.ui.Row;
import org.kuali.rice.krad.bo.BusinessObject;
import org.kuali.rice.krad.lookup.CollectionIncomplete;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.krad.util.KRADConstants;
import org.kuali.rice.krad.util.UrlFactory;

import java.util.*;

/**
 * This class provides Award lookup support
 */
public class MitAwardLookupableHelperServiceImpl extends AwardLookupableHelperServiceImpl {    

    static final String PERSON_ID = "personId";
    static final String ROLODEX_ID = "rolodexId";
    static final String UNIT_NUMBER = "unitNumber";
    static final String PI_NAME = "principalInvestigatorName";
    static final String OSP_ADMIN_NAME = "ospAdministratorName";

    private static final long serialVersionUID = 6304433555064511153L;
    
    private transient KcPersonService kcPersonService;
    private AwardLookupDao awardLookupDao;
 
    /**
     * add open, copy and medusa links to actions list
     * @see org.kuali.kra.lookup.KraLookupableHelperServiceImpl#getCustomActionUrls(org.kuali.rice.krad.bo.BusinessObject, java.util.List)
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<HtmlData> getCustomActionUrls(BusinessObject businessObject, List pkNames) {
        List<HtmlData> htmlDataList = super.getCustomActionUrls(businessObject, pkNames);
       AwardDocument document = ((Award) businessObject).getAwardDocument();   
       htmlDataList.add(getSharedDocLink((Award) businessObject, false));
        if(KimApiServiceLocator.getPermissionService().hasPermission(GlobalVariables.getUserSession().getPrincipalId(), "KC-AWARD", "Maintain Keyperson")){// -- if user has kp role then only display the link
            htmlDataList.add(getKeyPersonLink((Award) businessObject, false));}
        return htmlDataList;
    }
        
    protected AnchorHtmlData getSharedDocLink(Award award, Boolean readOnly) {
        AnchorHtmlData htmlData = new AnchorHtmlData();
        htmlData.setDisplayText("EDS");
        Properties parameters = new Properties();
        parameters.put(KRADConstants.DISPATCH_REQUEST_PARAMETER, "sharedDoc");
        parameters.put(KRADConstants.PARAMETER_COMMAND, KewApiConstants.DOCSEARCH_COMMAND);
        parameters.put(KRADConstants.DOCUMENT_TYPE_NAME, getDocumentTypeName());
        parameters.put("viewDocument", readOnly.toString());
        parameters.put("docId", award.getAwardDocument().getDocumentNumber());
        parameters.put("docOpenedFromAwardSearch", "true");
        parameters.put("placeHolderAwardId", award.getAwardId().toString());
        String href  = UrlFactory.parameterizeUrl("../"+getHtmlActionShared(), parameters);        
        htmlData.setHref(href);
        return htmlData;
    }
    private AnchorHtmlData getKeyPersonLink(Award award, Boolean readOnly) {
        AnchorHtmlData htmlData = new AnchorHtmlData();
           htmlData.setDisplayText("KeyPerson");
           Properties parameters = new Properties();
           parameters.put(KRADConstants.DISPATCH_REQUEST_PARAMETER, "contact");
           parameters.put(KRADConstants.PARAMETER_COMMAND, KewApiConstants.DOCSEARCH_COMMAND);
           parameters.put(KRADConstants.DOCUMENT_TYPE_NAME, getDocumentTypeName());
           parameters.put("viewDocument", readOnly.toString());
           parameters.put("docId", award.getAwardDocument().getDocumentNumber());
           parameters.put("docOpenedFromAwardSearch", "true");
           parameters.put("placeHolderAwardId", award.getAwardId().toString());
           String href  = UrlFactory.parameterizeUrl("../"+getHtmlAction(), parameters);
           htmlData.setHref(href);
           return htmlData;
    }
    protected String getHtmlActionShared() {
        return "sharedDoc.do";
    }

}
