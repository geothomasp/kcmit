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


 <c:set var="removalHistory"	value="${KualiForm.awardPersonRemovalHistory}" />

<kul:innerTab parentTab="Project Personnel" defaultOpen="false"
	tabTitle="Key Person Removal History" tabErrorKey="">
	<table cellpadding="0" cellspacing="0" summary="">
		<tr>
			<th width="15%">Removed Key Person</th>
			<th width="15%">Confirmed Person</th>			
			<th width="15%">Removed Date & Person</th>
		</tr>
	
		<c:if test='${!removalHistory.isEmpty()}'>
			<c:forEach items="${removalHistory}" var="removalHistoryValues"
				varStatus="ppStatus">
				<tr>
					<td width="15%">${removalHistoryValues.keyPersonName}</td>
					<td width="15%">${removalHistoryValues.updateUserConfirm}</td>
					
					<td width="15%"><fmt:formatDate value="${removalHistoryValues.updateTimestamp}" pattern="MM/dd/yyyy HH:mm:ss a"/>${removalHistoryValues.updateUser}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test='${removalHistory.isEmpty()}'><tr>
		&nbsp;
		</tr>
		</c:if>


	</table>

</kul:innerTab>
