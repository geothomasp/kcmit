package edu.mit.kc.roleintegration;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchProviderException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.rice.core.api.config.property.ConfigurationService;
import org.kuali.rice.kim.api.role.Role;
import org.kuali.rice.kim.api.role.RoleService;
import org.kuali.rice.kim.impl.role.RoleBo;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krad.service.BusinessObjectService;

import rolesservice.RolesAuthorizationExt;
import rolesservice.RolesException_Exception;

public class RoleIntegrationServiceImpl implements RoleIntegrationService{

	private DataObjectService dataObjectService = null;
	private BusinessObjectService businessObjectService = null;
	private RoleService roleManagementService;
	private ConfigurationService kualiConfigurationService;
	private CentralRoleService centralRoleService;
	private KcPersonService kcPersonService;
   
	private static final Log LOG = LogFactory.getLog(RoleIntegrationServiceImpl.class);


	/**
     * This method update kc role table with the roles from central db
     */	
	@Override
	public void updateUserRoles(String userName) throws UnrecoverableKeyException, KeyManagementException, KeyStoreException, CertificateException, NoSuchProviderException, IOException, RolesException_Exception {
		
		List<SyncLog> syncLogList = getRolesFromSyncLog(userName);
		
		List<RolesAuthorizationExt> roles = getUserRoles(userName);
		
		List<SyncLog> syncLogdeleteList = new ArrayList<SyncLog> ();
		List<RolesAuthorizationExt> existingRoleList = new ArrayList<RolesAuthorizationExt>();
		if(!syncLogList.isEmpty()){
			for(RolesAuthorizationExt role : roles) {
				
				for(SyncLog syncLog: syncLogList){
					if(syncLog.getCentralRoleName().equals(role.getFunction()) && syncLog.getUnitNumber().equals(role.getQualifierCode())){
						existingRoleList.add(role);
						syncLogdeleteList.add(syncLog);
					}
				}
			}
			updateRoleMember(roles,existingRoleList,syncLogList,syncLogdeleteList,userName);
			updateToSyncLog(roles,userName);

		}else{
			updateRoleMember(roles,existingRoleList,null,null,userName);
			updateToSyncLog(roles,userName);
		}
	}
	
	
	private void updateRoleMember(List<RolesAuthorizationExt> rolesToUpdate,List<RolesAuthorizationExt> existingRoleList,
			List<SyncLog> syncLogList,List<SyncLog> existingSynclogList,String userName){
		
		KcPerson kcPerson = getKcPersonService().getKcPersonByUserName(userName);
		if(syncLogList!=null){

			 List<SyncLog> roleIdForDeleteList = getRoleIdForDelete(syncLogList);

			 for(SyncLog roleIdForDelete : roleIdForDeleteList){
				 if(!existingSynclogList.contains(roleIdForDelete)){
					 Map<String, String> qualifiedRoleAttributes = new HashMap<String, String>();
					 List<String> roleList = new ArrayList<String>();
					 roleList.add(roleIdForDelete.getRoleId());
					 Role role = roleManagementService.getRoleByNamespaceCodeAndName(roleIdForDelete.getNameSpace(), roleIdForDelete.getRoleName());
					 if(role!=null){
						 if(role.getKimTypeId().equals("69")){
							 qualifiedRoleAttributes.put("unitNumber", roleIdForDelete.getUnitNumber());
							 qualifiedRoleAttributes.put("subunits","Y");
						 }else if(role.getKimTypeId().equals("68")){
							 qualifiedRoleAttributes.put("unitNumber", roleIdForDelete.getUnitNumber());
						 }
						 getRoleManagementService().removePrincipalFromRole(kcPerson.getPersonId(), roleIdForDelete.getNameSpace(), roleIdForDelete.getRoleName(), qualifiedRoleAttributes);
					 }
				 }
			 }
		
			
		}
		
		if(rolesToUpdate!=null){
		 List<RoleCentralMap>  roleIdUpdateMapList = getRoleIdForUpdate(rolesToUpdate);
		 for(RoleCentralMap roleIdforUpdate : roleIdUpdateMapList){
			 if(!existingRoleList.contains(roleIdforUpdate)){
				 Map<String, String> qualifiedRoleAttributes = new HashMap<String, String>();
				 List<String> roleList = new ArrayList<String>();
				 roleList.add(roleIdforUpdate.getRoleId());
				 //RoleBo
				 Role role = roleManagementService.getRoleByNamespaceCodeAndName(roleIdforUpdate.getNameSpace(), roleIdforUpdate.getRoleName());
				 if(role!=null){
					 if(role.getKimTypeId().equals("69")){
						 qualifiedRoleAttributes.put("unitNumber", roleIdforUpdate.getUnitNumber());
						 qualifiedRoleAttributes.put("subunits","Y");
					 }else if(role.getKimTypeId().equals("68")){
						 qualifiedRoleAttributes.put("unitNumber", roleIdforUpdate.getUnitNumber());
					 }
					 if(!getRoleManagementService().principalHasRole(kcPerson.getPersonId(), roleList, qualifiedRoleAttributes)){
						 getRoleManagementService().assignPrincipalToRole(kcPerson.getPersonId(), roleIdforUpdate.getNameSpace(), roleIdforUpdate.getRoleName(), qualifiedRoleAttributes);
					 }
				 }
			 }
		 }
		}

	}

	/**
     * This method retrieve roles from central database
     */
	@Override
	public List<RolesAuthorizationExt> getUserRoles(String userName) throws UnrecoverableKeyException, KeyManagementException, KeyStoreException, CertificateException,IOException, NoSuchProviderException, RolesException_Exception {
	
		 List<RolesAuthorizationExt> rolesAuthorizationExt = getCentralRoleService().getCentralUserRoles(userName);
		 return rolesAuthorizationExt;
	}
	
		
	private void updateToSyncLog(List<RolesAuthorizationExt> roles, String userName){
		
		List<SyncLog> syncLogList = new ArrayList<SyncLog>();
		Map<String, String> fieldValues = new HashMap<String, String>();
        fieldValues.put("principleName", userName);
		getBusinessObjectService().deleteMatching(SyncLog.class, fieldValues);
		
		for(RolesAuthorizationExt role : roles) {
			SyncLog syncLog = new SyncLog();
			syncLog.setCentralRoleName(role.getFunction());
			syncLog.setPrincipleName(role.getName());
			syncLog.setUnitNumber(role.getQualifierCode());
			syncLog.setUpdateUser(userName);
			syncLogList.add(syncLog);
		}
		 getBusinessObjectService().save(syncLogList);
	}
	
	private void deleteFromSyncLog(List<SyncLog> syncLogList, String userName){
		if(syncLogList!=null && !syncLogList.isEmpty()){
			getBusinessObjectService().delete(syncLogList);
		}
	}

	
	private List<SyncLog> getRolesFromSyncLog(String userName){
		
		Map<String, String> fieldValues = new HashMap<String, String>();
        fieldValues.put("principleName", userName);
        List<SyncLog> syncLogList = (List<SyncLog>)getBusinessObjectService().findMatching(SyncLog.class, fieldValues);
        return syncLogList;
	}
	
	private List<RoleCentralMap> getRoleIdForUpdate(List<RolesAuthorizationExt> rolesToUpdate){
		
          List<RoleCentralMap> RoleCentralMapList = (List<RoleCentralMap>)getBusinessObjectService().findAll(RoleCentralMap.class);
          List<RoleCentralMap> RoleCentralMapUpdatedList = new ArrayList<RoleCentralMap>();
          for(RoleCentralMap roleCentralMap : RoleCentralMapList){
        	  for(RolesAuthorizationExt userRole:rolesToUpdate){
        		  if(roleCentralMap.getCentralRoleName().equals(userRole.getFunction())){
        			  roleCentralMap.setUnitNumber(userRole.getQualifierCode());
        			  RoleCentralMapUpdatedList.add(roleCentralMap);
        			  break;
        		  }
        	  }
          }
		return RoleCentralMapUpdatedList;
		
	}
	
	private List<SyncLog> getRoleIdForDelete(List<SyncLog> rolesToDelete){
		
		List<SyncLog> syncLogList = new ArrayList<SyncLog>();
        List<RoleCentralMap> RoleCentralMapList = (List<RoleCentralMap>)getBusinessObjectService().findAll(RoleCentralMap.class);
        for(RoleCentralMap roleCentralMap : RoleCentralMapList){
      	  for(SyncLog userRole:rolesToDelete){
      		  if(roleCentralMap.getCentralRoleName().equals(userRole.getCentralRoleName())){
      			  
      			userRole.setRoleId(roleCentralMap.getRoleId());
      			userRole.setNameSpace(roleCentralMap.getNameSpace());
      			userRole.setRoleName(roleCentralMap.getRoleName());
      			syncLogList.add(userRole);
      			break;
      		  }
      	  }
        }
		return syncLogList;
		
	}
	
	public ConfigurationService getKualiConfigurationService() {
		return kualiConfigurationService;
	}

	public void setKualiConfigurationService(
			ConfigurationService kualiConfigurationService) {
		this.kualiConfigurationService = kualiConfigurationService;
	}

	public DataObjectService getDataObjectService() {
		return dataObjectService;
	}

	public void setDataObjectService(DataObjectService dataObjectService) {
		this.dataObjectService = dataObjectService;
	}

	public CentralRoleService getCentralRoleService() {
		return centralRoleService;
	}

	public void setCentralRoleService(CentralRoleService centralRoleService) {
		this.centralRoleService = centralRoleService;
	}

	public BusinessObjectService getBusinessObjectService() {
		return businessObjectService;
	}

	public void setBusinessObjectService(BusinessObjectService businessObjectService) {
		this.businessObjectService = businessObjectService;
	}

	public RoleService getRoleManagementService() {
		return roleManagementService;
	}

	public void setRoleManagementService(RoleService roleManagementService) {
		this.roleManagementService = roleManagementService;
	}


	public KcPersonService getKcPersonService() {
		return kcPersonService;
	}


	public void setKcPersonService(KcPersonService kcPersonService) {
		this.kcPersonService = kcPersonService;
	}
}
