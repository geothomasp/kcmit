package edu.mit.kc.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.kuali.kra.bo.KcPerson;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.kim.bo.KcKimAttributes;
import org.kuali.kra.service.KcPersonService;
import org.kuali.rice.kim.api.common.assignee.Assignee;
import org.kuali.rice.kim.api.permission.PermissionService;
import edu.mit.kc.infrastructure.KcMitConstants;
import edu.mit.kc.infrastructure.MitKCTestServiceLocator;
import edu.mit.kc.infrastructure.MitKcUnitTestBase;

public class BackDoorLoginAuthorizationServiceTest extends MitKcUnitTestBase{

	BackDoorLoginAuthorizationService backDoorLoginAuthorizationService;
	PermissionService permissionService;
	KcPersonService kcPersonService;
	
	@Before
	public void setUp() throws Exception {
		backDoorLoginAuthorizationService  = (BackDoorLoginAuthorizationService)MitKCTestServiceLocator.getService("backDoorLoginAuthorizationService");
		permissionService = KraServiceLocator.getService(PermissionService.class);
		kcPersonService = KraServiceLocator.getService(KcPersonService.class);
	}

	@After
	public void tearDown() throws Exception {
		backDoorLoginAuthorizationService = null;
		permissionService = null;
		kcPersonService = null;

	}

	@Test
	public void testHasBackdoorLoginPermission(){
		Map<String, String> qualifiedRoleAttributes = new HashMap<String, String>();
		qualifiedRoleAttributes.put(KcKimAttributes.UNIT_NUMBER, "*"); 
		List<Assignee> assignees =  permissionService.getPermissionAssignees("KC-UNT",KcMitConstants.ALLOW_BACKDOOR_LOGIN, qualifiedRoleAttributes);
		if(assignees!=null && !assignees.isEmpty()){
			for(Assignee assignee :assignees){
				KcPerson kcPerson =kcPersonService.getKcPersonByPersonId(assignee.getPrincipalId());
				Assert.assertEquals(true,backDoorLoginAuthorizationService.hasBackdoorLoginPermission(kcPerson.getUserName()));
			}
		}else{
			Assert.fail(KcMitConstants.ALLOW_BACKDOOR_LOGIN +" permission not assigned");
		}

	}

}
