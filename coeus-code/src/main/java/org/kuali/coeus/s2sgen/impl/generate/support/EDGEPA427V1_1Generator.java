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

import gov.grants.apply.forms.edGEPA427V11.GEPA427AttachmentsDocument;
import gov.grants.apply.forms.edGEPA427V11.GEPA427AttachmentsDocument.GEPA427Attachments;
import gov.grants.apply.system.attachmentsV10.AttachedFileDataType;
import org.apache.xmlbeans.XmlObject;
import org.kuali.coeus.propdev.api.core.ProposalDevelopmentDocumentContract;
import org.kuali.coeus.propdev.api.attachment.NarrativeContract;
import org.kuali.coeus.s2sgen.impl.generate.FormGenerator;
import org.kuali.coeus.s2sgen.impl.generate.FormVersion;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;


/**
 * 
 * This class is used to generate XML Document object for grants.gov EDGEPA427V1.1. This form is generated using XMLBean API's
 * generated by compiling EDGEPA427V1.1 schema.
 * 
 * @author Kuali Research Administration Team (kualidev@oncourse.iu.edu)
 */
@FormGenerator("EDGEPA427V1_1Generator")
public class EDGEPA427V1_1Generator extends EDGEPA427BaseGenerator {

    @Value("http://apply.grants.gov/forms/ED_GEPA427-V1.1")
    private String namespace;

    @Value("ED_GEPA427-V1.1")
    private String formName;

    @Value("classpath:org/kuali/coeus/s2sgen/impl/generate/support/ED_GEPA427-V1.1.fo.xsl")
    private Resource stylesheet;

    @Value("gov.grants.apply.forms.edGEPA427V11")
    private String packageName;

    @Value(DEFAULT_SORT_INDEX)
    private int sortIndex;

    /**
     * 
     * This method returns GEPA427AttachmentsDocument object based on proposal development document which contains the
     * GEPA427AttachmentsDocument informations about GEPA type attachment for a particular proposal
     * 
     * @return gepa427Document(GEPA427AttachmentsDocument){@link XmlObject} of type GEPA427AttachmentsDocument.
     */
    private GEPA427AttachmentsDocument getGEPA427Attachments() {

        GEPA427AttachmentsDocument gepa427Document = GEPA427AttachmentsDocument.Factory.newInstance();
        GEPA427Attachments gepAttachments = GEPA427Attachments.Factory.newInstance();
        gepAttachments.setFormVersion(FormVersion.v1_1.getVersion());
        AttachedFileDataType attachedFileDataType = null;
        for (NarrativeContract narrative : pdDoc.getDevelopmentProposal().getNarratives()) {
            if (narrative.getNarrativeType().getCode() != null && Integer.parseInt(narrative.getNarrativeType().getCode()) == NARRATIVE_TYPE_ED_GEPA427) {
            	attachedFileDataType = getAttachedFileType(narrative);
            	if(attachedFileDataType != null){
            		gepAttachments.setAttachments(attachedFileDataType);
            		break;
            	}
            }
        }
        gepa427Document.setGEPA427Attachments(gepAttachments);
        return gepa427Document;
    }

    /**
     * This method creates {@link XmlObject} of type {@link GEPA427AttachmentsDocument} by populating data from the given
     * {@link ProposalDevelopmentDocumentContract}
     * 
     * @param proposalDevelopmentDocument for which the {@link XmlObject} needs to be created
     * @return {@link XmlObject} which is generated using the given {@link ProposalDevelopmentDocumentContract}
     * 
     */
    public XmlObject getFormObject(ProposalDevelopmentDocumentContract proposalDevelopmentDocument) {

        this.pdDoc = proposalDevelopmentDocument;
        return getGEPA427Attachments();
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
