<%@ include file="/WEB-INF/jsp/kraTldHeader.jsp"%>

<%@ attribute name="node" required="true" type="org.kuali.coeus.common.framework.medusa.MedusaNode"%>
<c:set var="action" value="institutionalProposal"/>
  <table style="border: 1px solid rgb(147, 147, 147); padding: 0px; width: 97%; border-collapse: collapse;">
    <tr>
      <th colspan="4" style="border-style: solid; text-align: left; border-color: rgb(230, 230, 230) rgb(147, 147, 147) rgb(147, 147, 147); border-width: 1px; padding: 3px; border-collapse: collapse; background-color: rgb(184, 184, 184); background-image: none;">Institutional Proposal ${node.bo.proposalNumber}</th>
    </tr>
  <tr>
      <th colspan="8" style="border-style: solid; text-align:left; border-color: rgb(230, 230, 230) rgb(147, 147, 147) rgb(147, 147, 147); border-width: 1px; padding: 3px; border-collapse: collapse; background-color: rgb(184, 184, 184); background-image: none;">Attachments</th>
    </tr>
      <th colspan="2">Attachments</th>
      <th colspan="2">Description</th>
      <th colspan="2">FileName</th>
    </tr>
    <c:forEach items="${node.bo.instProposalAttachments}" var="ipAttachment" varStatus="itrStatus">
      <tr>
        <td style="text-align: center;" colspan="2">
           <c:out value="${ipAttachment.comments}"/>
                        
        </td>
         <td style="text-align: center;" colspan="2">
           <c:out value="${ipAttachment.fileName}"/>
                        
        </td>
        <td style="text-align: center;" colspan="2">
          
            <c:out value="${ipAttachment.file.name}"/>
           </td>
           <td colspan="2">    
      
          <html:image property="methodToCall.viewAttachmentIp.line${itrStatus.index}.anchor${currentTabIndex}.id${ipAttachment.proposalId}"
		src='${ConfigProperties.kra.externalizable.images.url}tinybutton-view.gif' styleClass="tinybutton"
		alt="View Attachment" onclick="excludeSubmitRestriction = true;"/>
        </td>
      </tr>
    </c:forEach>
  </table>
