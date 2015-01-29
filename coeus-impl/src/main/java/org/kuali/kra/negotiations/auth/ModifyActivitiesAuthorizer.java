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
package org.kuali.kra.negotiations.auth;

import org.kuali.kra.infrastructure.PermissionConstants;

public class ModifyActivitiesAuthorizer extends NegotiationAuthorizer {

    @Override
    public boolean isAuthorized(String userId, NegotiationTask task) {
        boolean retVal = hasPermission(userId, task.getNegotiationDocument().getNegotiation(), PermissionConstants.NEGOTIATION_MODIFY_ACTIVITIES)
            && !task.getNegotiationDocument().isViewOnly();
        return retVal;
    }

}
