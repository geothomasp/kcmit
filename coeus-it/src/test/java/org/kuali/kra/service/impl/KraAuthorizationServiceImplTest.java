/*
 * Copyright 2005-2014 The Kuali Foundation
 * 
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.osedu.org/licenses/ECL-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.service.impl;

import org.junit.Before;
import org.junit.Test;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentService;
import org.kuali.coeus.common.framework.auth.perm.KcAuthorizationService;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.PermissionConstants;
import org.kuali.kra.infrastructure.RoleConstants;
import org.kuali.kra.test.infrastructure.KcIntegrationTestBase;
import org.kuali.rice.kim.api.identity.IdentityService;
import org.kuali.rice.kim.api.identity.principal.PrincipalContract;
import org.kuali.rice.krad.service.KRADServiceLocatorWeb;
import org.kuali.rice.krad.util.GlobalVariables;

import java.sql.Date;
import java.util.List;

import static org.junit.Assert.*;
/**
 * Test the Kra Authorization Service Impl.  Mocks are used
 * to isolate the service from KIM.  Well-defined data  is placed 
 * into Mock KIM services.  The Kra Authorization Service methods
 * are then invoked and the responses are checked against the expected
 * results.
 */
public class KraAuthorizationServiceImplTest extends KcIntegrationTestBase {

    private KcAuthorizationService kraAuthService;
    private IdentityService identityManagementService;
    private ProposalDevelopmentService proposalDevelopmentService;

    @Before
    public void setUp() throws Exception {
        kraAuthService = KcServiceLocator.getService(KcAuthorizationService.class);
        proposalDevelopmentService = KcServiceLocator.getService(ProposalDevelopmentService.class);
        identityManagementService = KcServiceLocator.getService(IdentityService.class);
    }

    /**
     * Test the hasPermission() service method.
     */
    @Test
    public void testHasPermission() throws Exception {
        PrincipalContract userChew = identityManagementService.getPrincipalByPrincipalName("chew");
        ProposalDevelopmentDocument doc = createProposal("Proposal-6", "000001");
        kraAuthService.addDocumentLevelRole(userChew.getPrincipalId(), RoleConstants.NARRATIVE_WRITER, doc);
        assertTrue(kraAuthService.hasPermission(userChew.getPrincipalId(), doc, PermissionConstants.MODIFY_NARRATIVE));
        assertFalse(kraAuthService.hasPermission(userChew.getPrincipalId(), doc, PermissionConstants.MODIFY_BUDGET));
    }

    /**
     * Test the hasRole() service method.
     */
    @Test
    public void testHasRole() throws Exception {
        ProposalDevelopmentDocument doc = createProposal("Proposal-7", "000001");
        PrincipalContract userChew = identityManagementService.getPrincipalByPrincipalName("chew");
        kraAuthService.addDocumentLevelRole(userChew.getPrincipalId(), RoleConstants.BUDGET_CREATOR, doc);
        assertTrue(kraAuthService.hasDocumentLevelRole(userChew.getPrincipalId(), RoleConstants.BUDGET_CREATOR, doc));
    }

    /**
     * Test the getPersonsInRole() service method.
     */
    @Test
    public void testGetPersonsInRole() throws Exception {
        ProposalDevelopmentDocument doc = createProposal("Proposal-9", "000001");
        PrincipalContract userChew = identityManagementService.getPrincipalByPrincipalName("chew");
        kraAuthService.addDocumentLevelRole(userChew.getPrincipalId(), RoleConstants.AGGREGATOR, doc);
        List<String> persons = kraAuthService.getPrincipalsInRole(RoleConstants.AGGREGATOR, doc);
        assertEquals(2, persons.size());
    }
    

                
    private void initializeProposalUsers(ProposalDevelopmentDocument doc) {
        // Assign the creator of the proposal to the AGGREGATOR role.
        String userId = GlobalVariables.getUserSession().getPrincipalId();
        kraAuthService.addDocumentLevelRole(userId, RoleConstants.AGGREGATOR, doc);
    }

    /**
     * Create a proposal development document.  For testing
     * purposes, we only need its proposal number to be set.
     */
    private ProposalDevelopmentDocument createProposal(String documentDescription, String leadUnitNumber) throws Exception {
        ProposalDevelopmentDocument document = (ProposalDevelopmentDocument) KRADServiceLocatorWeb.getDocumentService().getNewDocument("ProposalDevelopmentDocument");

        Date requestedStartDateInitial = new Date(System.currentTimeMillis());
        Date requestedEndDateInitial = new Date(System.currentTimeMillis());

        document.getDocumentHeader().setDocumentDescription(documentDescription);
        document.getDevelopmentProposal().setSponsorCode("000162");
        document.getDevelopmentProposal().setTitle("project title");
        document.getDevelopmentProposal().setRequestedStartDateInitial(requestedStartDateInitial);
        document.getDevelopmentProposal().setRequestedEndDateInitial(requestedEndDateInitial);
        document.getDevelopmentProposal().setActivityTypeCode("1");
        document.getDevelopmentProposal().setProposalTypeCode("1");
        document.getDevelopmentProposal().setOwnedByUnitNumber(leadUnitNumber);
        document.getDevelopmentProposal().setPrimeSponsorCode("000120");

        proposalDevelopmentService.initializeUnitOrganizationLocation(document);
        proposalDevelopmentService.initializeProposalSiteNumbers(document);

        document = (ProposalDevelopmentDocument) KRADServiceLocatorWeb.getDocumentService().saveDocument(document);
        initializeProposalUsers(document);

        document = (ProposalDevelopmentDocument) KRADServiceLocatorWeb.getDocumentService().saveDocument(document);
        ProposalDevelopmentDocument savedDocument = (ProposalDevelopmentDocument) KRADServiceLocatorWeb.getDocumentService().getByDocumentHeaderId(document.getDocumentNumber());
        assertNotNull(savedDocument);

        return savedDocument;
    }
}
