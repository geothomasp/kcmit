<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<%@ attribute name="node" required="true" type="org.kuali.coeus.common.framework.medusa.MedusaNode"%>
  <table style="border: 1px solid rgb(147, 147, 147); padding: 0px; width: 97%; border-collapse: collapse;">
      
  
 <tr>
      <th colspan="8" style="border-style: solid; text-align:left; border-color: rgb(230, 230, 230) rgb(147, 147, 147) rgb(147, 147, 147); border-width: 1px; padding: 3px; border-collapse: collapse; background-color: rgb(184, 184, 184); background-image: none;">Attachments</th>
    </tr>
    
    <tr>
      <th colspan="2">Attachments</th>
      <th colspan="2">Description</th>
      <th colspan="2">File Name</th>
    </tr>
     <c:set var="sharedDocTypes" value="${KualiForm.subAwardSharedDocTypes}" />      
     <c:set var="viewSharedDoc" value="${KualiForm.subAwardProjectDocView || KualiForm.subAwardProjectSharedDocView}" />
       <c:if test="${viewSharedDoc}">
		    <c:forEach items="${node.bo.subAwardAttachments}" var="attachment" varStatus="itrStatus">
     			<c:set var="viewThisAttachment" value="true" />      
    			<c:if test="${KualiForm.subAwardProjectSharedDocView && not fn:contains(sharedDocTypes, attachment.typeCode)}">
     				<c:set var="viewThisAttachment" value="false" />      
    			</c:if>
	    		<c:if test="${attachment.documentStatusCode == 'A' && viewThisAttachment}">
			          <tr>
			        <td style="text-align: center;" colspan="2">
			            <c:out value="${attachment.description}"/>(Attachmnet Desc)
			        </td>
			        <td style="text-align: center;" colspan="2">
			            <c:out value="${attachment.type.description}"/>(Attachmnet Type Desc)
			        </td>
			          <td style="text-align: center;" colspan="2">
			            <c:out value="${attachment.file.data}"/>(Attachmnet File)
			        </td>
			        <td colspan="2">      
			      
			        <html:image property="methodToCall.viewAttachmentSubAward.line${itrStatus.index}.anchor${currentTabIndex}.id${attachment.subAwardId}"
					src='${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif' styleClass="tinybutton"
					alt="View Attachment" onclick="excludeSubmitRestriction = true;"/>
			        </td>
			        </tr>
			        </c:if>
		     </c:forEach>
     </c:if>
  </table>
