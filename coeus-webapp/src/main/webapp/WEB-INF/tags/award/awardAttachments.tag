<%--
   - Kuali Coeus, a comprehensive research administration system for higher education.
   - 
   - Copyright 2005-2015 Kuali, Inc.
   - 
   - This program is free software: you can redistribute it and/or modify
   - it under the terms of the GNU Affero General Public License as
   - published by the Free Software Foundation, either version 3 of the
   - License, or (at your option) any later version.
   - 
   - This program is distributed in the hope that it will be useful,
   - but WITHOUT ANY WARRANTY; without even the implied warranty of
   - MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   - GNU Affero General Public License for more details.
   - 
   - You should have received a copy of the GNU Affero General Public License
   - along with this program.  If not, see <http://www.gnu.org/licenses/>.
--%>
<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<style type="text/css">
.voidShadeEnable td{
opacity:.6;
}

.voidShadeDisable td{
opacity:1;
}

</style>

<c:set var="awardAttachmentAttributes" value="${DataDictionary.AwardAttachment.attributes}" />
<c:set var="awardAttachmentFormBean" value="${KualiForm.awardAttachmentFormBean}" />
<c:set var="action" value="awardNotesAndAttachments" />
<c:set var="attachments" value="${KualiForm.document.awardList[0].awardAttachments}"/>
<c:set var="disableAttachmentRemovalIndicator" value="false"/>
<c:set var="readOnly" value="${not KualiForm.editingMode['fullEntry']}" scope="request" />
<c:if test="${awardAttachmentFormBean.disableAttachmentRemovalIndicator == true}">
<c:set var="disableAttachmentRemovalIndicator" value="true"/>
</c:if>

			<c:set var="totalAttachments" value="0" />
			<c:forEach var="attachment" items="${attachments}" varStatus="itrStatus">
    			<c:if test="${attachment.viewAttachment}">
    				<c:set var="totalAttachments" value="${totalAttachments + 1}"/>
    			</c:if>
			</c:forEach>

<kul:tab tabTitle="Attachments" tabItemCount="${totalAttachments}" defaultOpen="false" tabErrorKey="awardAttachmentFormBean.newAttachment*,document.awardList[0].awardAttachments*" transparentBackground="false">
	<div class="tab-container" align="center">
   		<h3>
   			<span class="subhead-left">Add Attachment</span>
   			<span class="subhead-right"><kul:help businessObjectClassName="org.kuali.kra.award.notesandattachments.attachments.AwardAttachment" altText="help"/></span>
       </h3>
       <table id="attachments-table" cellpadding="4" cellspacing="0" summary="">
         	<tr>
         	    <th>
         	    	&nbsp;
         	    </th>
         		<th>
         			<div align="center">
         				<kul:htmlAttributeLabel attributeEntry="${awardAttachmentAttributes.updateTimestamp}" noColon="false" />
         			</div>
         		</th>
         		<th>
         			<div align="center">
         				<kul:htmlAttributeLabel attributeEntry="${awardAttachmentAttributes.updateUser}" noColon="false" />
         			</div>
         		</th>
         		<th>
         			<div align="center">
         				<kul:htmlAttributeLabel attributeEntry="${awardAttachmentAttributes['typeCode']}" noColon="false"/>
         			</div>
         		</th>
         		<th>
					<div align="center">
						<kul:htmlAttributeLabel attributeEntry="${awardAttachmentAttributes.description}" noColon="false"/>
					</div>
				</th>
         		<th>
					<div align="center">
						<kul:htmlAttributeLabel attributeEntry="${awardAttachmentAttributes['fileId']}" noColon="false"/>
					</div>
				</th>
         		<th>
					<div align="center">
						Actions
					</div>
				</th>
             </tr>
             
                <c:if test="${awardAttachmentFormBean.maintainAwardAttachment == true}">
                <tbody class="addline">
	             <tr>
	                <td align="center" valign="middle" class="infoline">
	                	<div align="center">
	                		Add:
		            	</div>
					</td>
	                <td align="left" valign="middle" class="infoline">
	                	<div align="left">
	                		<kul:htmlControlAttribute property="awardAttachmentFormBean.newAttachment.updateTimestamp" attributeEntry="${awardAttachmentAttributes.updateTimestamp}" readOnly="true"/>
		            	</div>
					</td>
	                <td align="left" valign="middle" class="infoline">
	                	<div align="left">
	                		<kul:htmlControlAttribute property="awardAttachmentFormBean.newAttachment.updateUser" attributeEntry="${awardAttachmentAttributes.updateUser}" readOnly="true"/>
		            	</div>
					</td>
	         		<td class="infoline">
	              		<div align="center">
	            			<kul:htmlControlAttribute property="awardAttachmentFormBean.newAttachment.typeCode" attributeEntry="${awardAttachmentAttributes.typeCode}" readOnly="false" />
	              		</div>
	            	</td>
					<td align="left" valign="middle" class="infoline">
	                	<div align="left">
	                		<kul:htmlControlAttribute property="awardAttachmentFormBean.newAttachment.description" attributeEntry="${awardAttachmentAttributes.description}" readOnly="false"/>
		            	</div>
					</td>
					<td align="left" valign="middle" class="infoline">
	              		<div align="left">
	              		    <c:set var="property" value="awardAttachmentFormBean.newAttachment.newFile" />
	              		
	              		    <%-- attachment file error handling logic start--%>
	               				<kul:checkErrors keyMatch="${property}" auditMatch="${property}"/>
	               				<%-- highlighting does not work in firefox but does in ie... --%>
	               				<c:set var="textStyle" value="${hasErrors == true ? 'background-color:#FFD5D5' : ''}"/>
	               			<%-- attachment file error handling logic start--%>
	              		
	              			<html:file property="${property}" style="${textStyle}"/>
	           			</div>
					</td>
					<td align="center" valign="middle" class="infoline">
						<div align="center">
							<html:image property="methodToCall.addAttachment.anchor${tabKey}"
							src="${ConfigProperties.kra.externalizable.images.url}tinybutton-add1.gif" styleClass="tinybutton addButton"/>
						</div>
					</td>
				</tr>
				</tbody>
			 </c:if>
				
			<c:set var="rowIndex" value="0" />
			<c:forEach var="attachment" items="${attachments}" varStatus="itrStatus">
			
    			<c:if test="${attachment.viewAttachment}">
    				<c:set var="rowIndex" value="${rowIndex + 1}"/>
					<c:set var="count" value="${itrStatus.index}"/>
					<c:set var="modify" value="${KualiForm.document.awardList[0].awardAttachments[count].modifyAttachment}"/>
					<c:choose>
					   <c:when test="${modify!=true}">
			             <c:set var="activeModify"  value="true"/>
			           </c:when>
				       <c:otherwise>
				         <c:set var="activeModify"  value="false"/>
				       </c:otherwise>
				    </c:choose>
				    <c:set var="voidShade" value="voidShadeDisable"/>
				    <c:if test="${KualiForm.document.awardList[0].awardAttachments[itrStatus.index].documentStatusCode == 'V' && !modify}"> 
				    <c:set var="voidShade" value="voidShadeEnable"/>
				    </c:if>
						<tr class="${voidShade}">
			         		<td>
			         			<div align="center">
			                		${rowIndex}
				            	</div>
			         		</td>
			         		<td align="left" valign="middle">
			                	<div align="left">
			                		<kul:htmlControlAttribute property="document.awardList[0].awardAttachments[${itrStatus.index}].updateTimestamp" attributeEntry="${awardAttachmentAttributes.updateTimestamp}" readOnly="true"/>
				            	</div>
							</td>
			         		<td align="left" valign="middle">
			                	<div align="left">
			                		<kul:htmlControlAttribute property="document.awardList[0].awardAttachments[${itrStatus.index}].updateUserName" attributeEntry="${awardAttachmentAttributes.updateUser}" readOnly="true"/>
				            	</div>
							</td>
			         		<td align="left" valign="middle">
			                	<div align="left">
			                		<kul:htmlControlAttribute property="document.awardList[0].awardAttachments[${itrStatus.index}].typeCode" attributeEntry="${awardAttachmentAttributes['typeCode']}" readOnly="${activeModify}" readOnlyAlternateDisplay ="${awardAttachment.type.description}"/>
				            	</div>
							</td>
							<td align="left" valign="middle">
			                	<div align="left">
			                		<kul:htmlControlAttribute property="document.awardList[0].awardAttachments[${itrStatus.index}].description" attributeEntry="${awardAttachmentAttributes.description}" readOnly="${activeModify}"/>
				            	</div>
							</td>
			       			<td align="left" valign="middle">
			           			<div align="left" id="attachmentFileName${itrStatus.index}">
			           			<c:if test="${!readOnly || attachment.file.name!=null}">
			              			<kra:fileicon attachment="${attachment.file}"/>${attachment.file.name}
			              		</c:if>
			           			</div>
							</td>
							<td align="center" valign="middle">
								<div align="center">
								<c:if test="${KualiForm.document.awardList[0].awardAttachments[itrStatus.index].documentStatusCode != 'V'}">
								<c:choose>
								<c:when test="${readOnly}">
								<c:if test="${awardAttachmentFormBean.canViewAttachment}">
								<html:image property="methodToCall.viewAttachment.line${itrStatus.index}.anchor${currentTabIndex}"
										src='${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif' styleClass="tinybutton"
										alt="View Attachment" onclick="excludeSubmitRestriction = true;"/>
								</c:if>
								</c:when>
								<c:otherwise>
								<html:image property="methodToCall.viewAttachment.line${itrStatus.index}.anchor${currentTabIndex}"
										src='${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif' styleClass="tinybutton"
										alt="View Attachment" onclick="excludeSubmitRestriction = true;"/>
								</c:otherwise>
								</c:choose>
								</c:if>
								<c:choose>
									<c:when test="${awardAttachmentFormBean.disableAttachmentRemovalIndicator == true}">
										
										<c:if test="${awardAttachmentFormBean.maintainAwardAttachment == true}">
										<c:if test="${KualiForm.document.awardList[0].awardAttachments[itrStatus.index].documentStatusCode != 'V'}">
										<html:image property="methodToCall.voidAttachment.line${itrStatus.index}.anchor${currentTabIndex}"
											   src='${ConfigProperties.kra.externalizable.images.url}tinybutton-void.gif' styleClass="tinybutton"
											   alt="Void Attachment"/>
									     </c:if>
									     <c:choose>
									    <c:when test="${!modify}">
									    <html:image property="methodToCall.modifyAttachment.line${itrStatus.index}.anchor${currentTabIndex}"
											   src='${ConfigProperties.kra.externalizable.images.url}tinybutton-modify.gif' styleClass="tinybutton"
											   alt="Modify Attachment"/>
									    </c:when>
									    <c:otherwise>
										  <html:image property="methodToCall.applyModifyAttachment.line${itrStatus.index}.anchor${currentTabIndex}"
								         src="${ConfigProperties.kra.externalizable.images.url}tinybutton-apply.gif" styleClass="tinybutton"/>
		            	                  </c:otherwise>
		            	                  </c:choose>
		            	                </c:if>
								   </c:when>
								   <c:otherwise>
								   <html:image property="methodToCall.viewAttachment.line${itrStatus.index}.anchor${currentTabIndex}"
										src='${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif' styleClass="tinybutton"
										alt="View Attachment" onclick="excludeSubmitRestriction = true;"/>
										<html:image property="methodToCall.deleteAttachment.line${itrStatus.index}.anchor${currentTabIndex}"
											   src='${ConfigProperties.kra.externalizable.images.url}tinybutton-delete1.gif' styleClass="tinybutton"
											   alt="Delete Attachment"/>
								  </c:otherwise>
								   </c:choose>
								</div>
							</td>
			         	</tr>
    			
    			</c:if>
			
			</c:forEach>
		</table>
     </div>		
</kul:tab>
