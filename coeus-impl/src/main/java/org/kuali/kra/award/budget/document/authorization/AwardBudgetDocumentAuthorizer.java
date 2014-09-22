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
package org.kuali.kra.award.budget.document.authorization;

import org.kuali.coeus.common.framework.auth.perm.KcAuthorizationService;
import org.kuali.kra.award.budget.document.AwardBudgetDocument;
import org.kuali.coeus.common.budget.framework.core.BudgetParentDocument;
import org.kuali.coeus.common.framework.auth.KcTransactionalDocumentAuthorizerBase;
import org.kuali.coeus.common.framework.auth.task.Task;
import org.kuali.coeus.common.framework.auth.task.TaskAuthorizationService;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.kra.infrastructure.PermissionConstants;
import org.kuali.kra.infrastructure.TaskName;
import org.kuali.rice.kew.api.WorkflowDocument;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.kns.authorization.AuthorizationConstants;
import org.kuali.rice.krad.document.Document;

import java.util.HashSet;
import java.util.Set;

public class AwardBudgetDocumentAuthorizer  extends KcTransactionalDocumentAuthorizerBase {

    private KcAuthorizationService kcAuthorizationService;

    @Override
    public Set<String> getEditModes(Document document, Person user, Set<String> currentEditModes) {
        Set<String> editModes = new HashSet<String>();
         
        AwardBudgetDocument awardBudgetDocument = (AwardBudgetDocument) document;
        BudgetParentDocument parentDocument = awardBudgetDocument.getBudget().getBudgetParent().getDocument();

        if (canExecuteAwardBudgetTask(user, awardBudgetDocument, TaskName.MODIFY_BUDGET)) {
            editModes.add(AuthorizationConstants.EditMode.FULL_ENTRY);
            editModes.add("modifyBudgets");
            editModes.add("viewBudgets");
            setPermissions(user, parentDocument, editModes);
        }
        else if (canExecuteAwardBudgetTask(user, awardBudgetDocument, TaskName.VIEW_BUDGET)) {
            editModes.add(AuthorizationConstants.EditMode.VIEW_ONLY);
            editModes.add("viewBudgets");
            setPermissions(user, parentDocument, editModes);
        }
        else {
            editModes.add(AuthorizationConstants.EditMode.UNVIEWABLE);
        }
        
        if (canExecuteAwardBudgetTask(user, awardBudgetDocument, TaskName.VIEW_SALARIES)) {
            editModes.add(TaskName.VIEW_SALARIES);
        }        
        
        return editModes;
    }
    
    
    public boolean canOpen(Document document, Person user) {
        return canExecuteAwardBudgetTask(user, (AwardBudgetDocument) document, TaskName.VIEW_BUDGET);
    }
    

    /**
     * Does the user have permission to execute the given task for a award?
     * @param user the user
     * @param doc the award document
     * @param taskName the name of the task
     * @return true if has permission; otherwise false
     */
    private boolean canExecuteAwardBudgetTask(Person user, AwardBudgetDocument doc, String taskName) {
        AwardBudgetTask task = new AwardBudgetTask(taskName, doc);
        return getTaskAuthorizationService().isAuthorized(user.getPrincipalId(), task);
    }
    
    @Override
    public boolean canInitiate(String documentTypeName, Person user) {
        return true;
    }

    @Override
    public boolean canEdit(Document document, Person user) {
        return canExecuteAwardBudgetTask(user, (AwardBudgetDocument) document, TaskName.MODIFY_BUDGET);
    }
    
    @Override
    public boolean canSave(Document document, Person user) {
        return canEdit(document, user);
    }
    
    @Override
    public boolean canReload(Document document, Person user) {
        WorkflowDocument workflow = document.getDocumentHeader().getWorkflowDocument();
        return canEdit(document, user) || workflow.isCanceled();
    }
    
    
    @Override
    public boolean canApprove( Document document, Person user ) {
        return super.canApprove(document,user) && canExecuteAwardBudgetTask( user, (AwardBudgetDocument)document, TaskName.APPROVE_AWARD_BUDGET);
    }
    
    @Override
    public boolean canDisapprove( Document document, Person user ) {
        return super.canDisapprove(document, user) && canExecuteAwardBudgetTask( user, (AwardBudgetDocument)document, TaskName.DISAPPROVE_AWARD_BUDGET);
    }
    
    @Override
    public boolean canRoute(Document document, Person user) {
        return canExecuteAwardBudgetTask(user, (AwardBudgetDocument) document, TaskName.SUBMIT_TO_WORKFLOW);
    }

    
    @Override
    public boolean canCancel(Document document, Person user) {
        WorkflowDocument workflow = document.getDocumentHeader().getWorkflowDocument();
        return super.canCancel(document)&&canEdit(document) && !workflow.isEnroute() ; 
    }
    
    /**
     * Set the permissions to be used during the creation of the web pages.  
     * The JSP files can access the editModeMap (editingMode) to determine what
     * to display to the user.  For example, a JSP file may contain the following:
     * 
     *     <kra:section permission="modifyProposal">
     *         .
     *         .
     *         .
     *     </kra:section>
     * 
     * In the above example, the contents are only rendered if the user is allowed
     * to modify the proposal.  Note that permissions are always signified as 
     * either TRUE or FALSE.
     * 
     * @param user the user
     * @param doc the Proposal Development Document
     * @param editModes the edit mode map
     */
    protected void setPermissions(Person user, BudgetParentDocument doc, Set<String> editModes) {
        final String userId = user.getPrincipalId();

        if (canExecuteParentDocumentTask(userId, doc, TaskName.ADD_BUDGET)) {
            editModes.add("addBudget");
        }
        
        if (canExecuteParentDocumentTask(userId, doc, TaskName.OPEN_BUDGETS)) {
            editModes.add("openBudgets");
        }
        
        if (canExecuteParentDocumentTask(userId, doc, TaskName.MODIFY_BUDGET)) {
            editModes.add("modifyProposalBudget");
        }
        
        if (isAuthorizedToPrintProposal(doc, user)) {
            editModes.add("printProposal");
        }
    }
    
    /**
     * Can the user execute the given proposal task?
     * @param userId the user's unique user id
     * @param doc the proposal development document
     * @param taskName the name of the task
     * @return true if has permission; otherwise false
     */
    private boolean canExecuteParentDocumentTask(String userId, BudgetParentDocument doc, String taskName) {
        Task task = doc.getParentAuthZTask(taskName);
        return getTaskAuthorizationService().isAuthorized(userId, task);
    }
    
    @Override
    public boolean canSendNoteFyi(Document document, Person user) {
        return false;
    }
    
    @Override
    public boolean canFyi(Document document, Person user) {
        return false;
    }

    protected boolean isAuthorizedToPrintProposal(Document document, Person user) {
        final BudgetParentDocument bpDocument = ((BudgetParentDocument) document);
        return getKcAuthorizationService().hasPermission(user.getPrincipalId(), bpDocument, PermissionConstants.PRINT_PROPOSAL);
    }

    public KcAuthorizationService getKcAuthorizationService() {
        if (kcAuthorizationService == null) {
            kcAuthorizationService = KcServiceLocator.getService(KcAuthorizationService.class);
        }
        return kcAuthorizationService;
    }

    public void setKcAuthorizationService(KcAuthorizationService kcAuthorizationService) {
        this.kcAuthorizationService = kcAuthorizationService;
    }
}
