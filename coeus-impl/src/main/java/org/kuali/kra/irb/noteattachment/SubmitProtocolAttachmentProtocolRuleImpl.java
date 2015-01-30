/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 The Kuali Foundation
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.kuali.kra.irb.noteattachment;

import org.kuali.kra.protocol.noteattachment.SubmitProtocolAttachmentProtocolRuleImplBase;

/**
 * Class handles rules for submitting a {@link ProtocolAttachmentProtocol ProtocolAttachmentProtocol}.
 * This class does not have a corresponding event or Rule interface because it is just used-by the mega
 * {@link org.kuali.kra.irb.ProtocolDocumentRule ProtocolDocumentRule} for submit events.
 */
public class SubmitProtocolAttachmentProtocolRuleImpl extends SubmitProtocolAttachmentProtocolRuleImplBase {
    
    
    public SubmitProtocolAttachmentProtocolRuleImpl() {
        super();
        
        // TODO : temporarily plugin this propertyprefix.  need to rework to have correct prefix
        protocolHelper = new ProtocolAttachmentProtocolRuleHelper("notesAttachmentsHelper.newAttachmentProtocol");
    }
}
