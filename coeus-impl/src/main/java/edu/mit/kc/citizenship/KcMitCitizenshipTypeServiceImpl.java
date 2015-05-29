package edu.mit.kc.citizenship;

/*
 * Kuali Coeus, a comprehensive research administration system for higher education.
 * 
 * Copyright 2005-2015 Kuali, Inc.
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

import java.util.List;

import edu.mit.kc.wh.WareHousePerson;
import gov.grants.apply.forms.phs398CareerDevelopmentAwardSup11V11.CitizenshipDataType;
import gov.grants.apply.forms.phs398CareerDevelopmentAwardSup11V11.CitizenshipDataType.Enum;

import org.kuali.coeus.common.api.person.attr.CitizenshipTypeContract;
import org.kuali.coeus.propdev.api.person.ProposalPersonContract;
import org.kuali.coeus.s2sgen.impl.citizenship.CitizenshipType;
//import org.kuali.coeus.s2sgen.impl.citizenship.CitizenshipType;
import org.kuali.coeus.s2sgen.impl.citizenship.CitizenshipTypeServiceImpl;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.core.api.criteria.PredicateFactory;
import org.kuali.rice.core.api.criteria.QueryByCriteria;
import org.kuali.rice.krad.data.DataObjectService;


/**
 * 
 * This service has been made available for implementers who will be using an external source
 * for citizenship data. It hooks into S2SUtilService via the system parameter
 * PI_CITIZENSHIP_FROM_CUSTOM_DATA. Setting this to "0" will see that S2SUtilServiceImpl::getCitizenship receive a
 * CitizenshipTypes from this service, as opposed to KcPerson's extended attributes
 * 
 * Schools who need external citizenship data are expected to override this service with their own
 * implementation of "getCitizenshipDataFromExternalSource().
 * 
 * getEnumValueOfCitizenshipType has been included as a convenience method should it be needed.
 */

public class KcMitCitizenshipTypeServiceImpl extends CitizenshipTypeServiceImpl {
    
     
    @Override
    public CitizenshipType getCitizenshipDataFromExternalSource(ProposalPersonContract proposalPerson) {
    	CitizenshipType citizenship = null;
    	CitizenshipType citizenshipWH = getCitizenShipFromWH(proposalPerson); //FN_GET_CITIZENSHIP_INFO(ls_person_id);
    	CitizenshipType citizenshipTypeApp = getCitizenShipForRolodex(proposalPerson);//fn_get_citizen_for_rolo(ls_person_id,as_proposal_number);
    	if(citizenshipWH==null){
    		citizenship = citizenshipTypeApp;
    	}else if(citizenshipWH.equals("Non-U.S. Citizen with temporary visa") && 
    			citizenshipTypeApp.getCitizenShip().equals("Permanent Resident of U.S. Pending")){
    		citizenship = CitizenshipType.PERMANENT_RESIDENT_OF_US_PENDING;
    	}else{
    		citizenship = citizenshipWH;
    	}
    	return citizenship;
	}

	private CitizenshipType getCitizenShipForRolodex(
			ProposalPersonContract proposalPerson) {
		CitizenshipType citizenship = null;
		String visType = proposalPerson.getVisaType();
		char visaChar = visType.charAt(0);
		switch(visaChar){
		case 'C':
			citizenship=CitizenshipType.US_CITIZEN_OR_NONCITIZEN_NATIONAL;
			break;
		case 'N':
			citizenship=CitizenshipType.PERMANENT_RESIDENT_OF_US;
			break;
		case 'A':
			citizenship=CitizenshipType.NON_US_CITIZEN_WITH_TEMPORARY_VISA;
			break;
		case 'P':
			citizenship=CitizenshipType.PERMANENT_RESIDENT_OF_US_PENDING;
			break;
		}
		return citizenship;
	}

	private CitizenshipType getCitizenShipFromWH(ProposalPersonContract proposalPerson) {
		CitizenshipType citizenship = null;
		String visType = findVisaTypeFromWarehouse(proposalPerson);
		char visaChar = visType!=null?visType.charAt(0):'N';
		switch(visaChar){
		case 'C':
			citizenship=CitizenshipType.US_CITIZEN_OR_NONCITIZEN_NATIONAL;
			break;
		case 'N':
			citizenship=CitizenshipType.PERMANENT_RESIDENT_OF_US;
			break;
		case 'A':
			citizenship=CitizenshipType.NON_US_CITIZEN_WITH_TEMPORARY_VISA;
			break;
		}
		return citizenship;
	}

	private String findVisaTypeFromWarehouse(
			ProposalPersonContract proposalPerson) {
		String visaType = null;
		WareHousePerson wareHousePersons = KcServiceLocator.getService(DataObjectService.class).find(WareHousePerson.class, proposalPerson.getPersonId());
		if(wareHousePersons!=null){
			visaType = wareHousePersons.getResidencyStatusCode();
		}
		return visaType;
	}

}
