<%--
 Copyright 2005-2014 The Kuali Foundation

 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.osedu.org/licenses/ECL-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>
<c:set var="viewOnly" value="${KualiForm.editingMode['viewOnly']}" scope="request" />
<c:if test="${KualiForm.editingMode['modifyCompletedBudgets']}">
	<c:set target="${KualiForm.documentActions}" property="canSave" value="true"/>
</c:if> 
<kul:documentPage
	showDocumentInfo="true"
	htmlFormAction="${KualiForm.actionPrefix}Versions"
	documentTypeName="${KualiForm.docTypeName}"
  	headerDispatch="${KualiForm.headerDispatch}"
  	headerTabActive="versions"
  	extraTopButtons="${KualiForm.extraTopButtons}"
  	>
 
        	<div align="right"><kul:help parameterNamespace="KC-AB" parameterDetailType="Document" parameterName="awardBudgetVersionsHelpUrl" altText="help"/></div>

	<kra-b:budgetVersions 
		budgetDocumentVersions="${KualiForm.document.budget.budgetParent.budgets}"
		pathToVersions="document.budget.budgetParent.budgets"
		errorKey="document.parentDocument.budgetDocumentVersion*,document.parentDocument.budgetParent.finalVersionFlag,document.parentDocument.documentDescription"
		requestedStartDateInitial="${KualiForm.document.budget.budgetParent.requestedStartDateInitial}"
		requestedEndDateInitial="${KualiForm.document.budget.budgetParent.requestedEndDateInitial}"
		/>

	<kul:documentControls 
		transactionalDocument="false"
		suppressRoutingControls="true"
		extraButtonSource="${extraButtonSource}"
		extraButtonProperty="${extraButtonProperty}"
		extraButtonAlt="${extraButtonAlt}"
		viewOnly="${viewOnly}"
		suppressCancelButton="true"
		/>

</kul:documentPage>
