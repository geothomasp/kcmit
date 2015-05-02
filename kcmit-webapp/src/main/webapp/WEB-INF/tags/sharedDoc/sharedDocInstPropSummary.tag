<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<%@ attribute name="node" required="true" type="org.kuali.coeus.common.framework.medusa.MedusaNode"%>
<c:set var="action" value="institutionalProposal"/>
  <table style="border: 1px solid rgb(147, 147, 147); padding: 0px; width: 97%; border-collapse: collapse;">
    <tr>
      <th colspan="4" style="border-style: solid; text-align: left; border-color: rgb(230, 230, 230) rgb(147, 147, 147) rgb(147, 147, 147); border-width: 1px; padding: 3px; border-collapse: collapse; background-color: rgb(184, 184, 184); background-image: none;">Institutional Proposal ${node.bo.proposalNumber}</th>
    </tr>
  <tr>
      <th colspan="12" style="border-style: solid; text-align:left; border-color: rgb(230, 230, 230) rgb(147, 147, 147) rgb(147, 147, 147); border-width: 1px; padding: 3px; border-collapse: collapse; background-color: rgb(184, 184, 184); background-image: none;">Attachments</th>
    </tr>
      <th colspan="2">Attachment Type</th>
      <th colspan="2">Description</th>
      <th colspan="2">File Name</th>
      <!-- <th colspan="2">Uploaded Date</th>
      <th colspan="2">Uploaded By Name</th> -->
    </tr>
     <c:set var="sharedDocTypes" value="${KualiForm.instituteProposalSharedDocTypes}" />      
     <c:set var="viewSharedDoc" value="${KualiForm.ipProjectDocView || KualiForm.ipProjectSharedDocView}" />
      <c:if test="${viewSharedDoc}">
		    <c:forEach items="${node.bo.instProposalAttachments}" var="ipAttachment" varStatus="itrStatus">
     			<c:set var="viewThisAttachment" value="true" />      
    			<c:if test="${KualiForm.ipProjectSharedDocView && not fn:contains(sharedDocTypes, ipAttachment.typeCode)}">
     				<c:set var="viewThisAttachment" value="false" />      
    			</c:if>
	    		<c:if test="${ipAttachment.documentStatusCode == 'A' && viewThisAttachment}">
			      <tr>
			        <td style="text-align: center;" colspan="2">
			           <c:out value="${ipAttachment.type.description}"/>                        
			        </td>
			         <td style="text-align: center;" colspan="2">
			           <c:out value="${ipAttachment.attachmentTitle}"/>                        
			        </td>
			        <td style="text-align: center;" colspan="2">          
			            <c:out value="${ipAttachment.file.name}"/>
			           </td>
			            <td style="text-align: center;" colspan="2">          
			         <%--    <c:out value="${ipAttachment.file.name}"/> --%>
			           </td>
			            <td style="text-align: center;" colspan="2">          
			            <%-- <c:out value="${ipAttachment.file.name}"/> --%>
			           </td>
			           <td colspan="2">        
			          <html:image property="methodToCall.viewAttachmentIp.line${itrStatus.index}.anchor${currentTabIndex}.id${ipAttachment.proposalId}"
					src='${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif' styleClass="tinybutton"
					alt="View Attachment" onclick="excludeSubmitRestriction = true;"/>
			        </td>
			      </tr>
			      </c:if>
		    </c:forEach>
    </c:if>
  </table>
