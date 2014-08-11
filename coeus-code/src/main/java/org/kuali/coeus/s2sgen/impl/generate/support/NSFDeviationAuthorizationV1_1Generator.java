/*
 * Copyright 2005-2014 The Kuali Foundation.
 * 
 * Licensed under the Educational Community License, Version 1.0 (the "License");
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
package org.kuali.coeus.s2sgen.impl.generate.support;

import gov.grants.apply.forms.nsfDeviationAuthorizationV11.NSFDeviationAuthorizationDocument;
import gov.grants.apply.forms.nsfDeviationAuthorizationV11.NSFDeviationAuthorizationDocument.NSFDeviationAuthorization;
import org.apache.xmlbeans.XmlObject;

import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;


/**
 * 
 * This class is used to generate XML Document object for grants.gov NSFDeviationAuthorizationV1.1. This form is generated using
 * XMLBean API's generated by compiling NSFDeviationAuthorizationV1.1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("NSFDeviationAuthorizationV1_1Generator")
public class NSFDeviationAuthorizationV1_1Generator extends NSFDeviationAuthorizationBaseGenerator {

    @Value("http://apply.grants.gov/forms/NSF_DeviationAuthorization-V1.1")
    private String namespace;

    @Value("NSF_DeviationAuthorization-V1.1")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/NSF_DeviationAuthorization-V1.1.fo.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.nsfDeviationAuthorizationV11")
    private String packageName;

    @Value(DEFAULT_SORT_INDEX)
    private int sortIndex;


    /**
     * 
     * This method returns NSFDeviationAuthorizationDocument object based on proposal development document which contains the
     * NSFDeviationAuthorizationDocument information NSFDeviationAuthorization for a particular proposal
     * 
     * @return authorizationDocument {@link XmlObject} of type NSFDeviationAuthorizationDocument.
     */
    private NSFDeviationAuthorizationDocument getNSFDeviationAuthorization() {

        NSFDeviationAuthorizationDocument authorizationDocument = NSFDeviationAuthorizationDocument.Factory.newInstance();
        NSFDeviationAuthorization nsfDeviationAuthorization = NSFDeviationAuthorization.Factory.newInstance();
        nsfDeviationAuthorization.setFormVersion(FormVersion.v1_1.getVersion());
        String devAuth = getAbstractText(DEVIATION_AUTHORIZATION);
        if (devAuth != null) {
            nsfDeviationAuthorization.setDeviationAuthorization(devAuth);
        }
        authorizationDocument.setNSFDeviationAuthorization(nsfDeviationAuthorization);
        return authorizationDocument;
    }

    /**
     * This method creates {@link XmlObject} of type {@link NSFDeviationAuthorizationDocument} by populating data from the given
     * {@link ProposalDevelopmentDocumentContract}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocumentContract}
     */
    public XmlObject getFormObject(ProposalDevelopmentDocumentContract proposalDevelopmentDocument) {
        this.pdDoc = proposalDevelopmentDocument;
        return getNSFDeviationAuthorization();
    }

    @Override
    public String getNamespace() {
        return namespace;
    }

    public void setNamespace(String namespace) {
        this.namespace = namespace;
    }

    @Override
    public String getFormName() {
        return formName;
    }

    public void setFormName(String formName) {
        this.formName = formName;
    }

    @Override
    public Resource getStylesheet() {
        return stylesheet;
    }

    public void setStylesheet(Resource stylesheet) {
        this.stylesheet = stylesheet;
    }

    @Override
    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    @Override
    public int getSortIndex() {
        return sortIndex;
    }

    public void setSortIndex(int sortIndex) {
        this.sortIndex = sortIndex;
    }
}
