package edu.mit.kc.infrastructure;

import org.kuali.kra.infrastructure.Constants;

public interface KcMitConstants {
	
	/* Backdoor Login permission */
    public static final String ALLOW_BACKDOOR_LOGIN = "Allow Backdoor Login";
    
    public static final String PROPOSAL_PERSON_PI_CERTIFICATION = "4";

    public static final String PROPOSAL_PERSON_COI_CERTIFICATION = "5";

    public static final String PROPOSAL_PERSON_KP_CERTIFICATION = "6";
    
    public static final String ERROR_AWARD_FANDA_INVALID_RATE_PAIR = "error.awardDirectFandADistribution.invalid.rate.pare";


    /*Award FandA Rates*/
    
    public static final String ERROR_AWARD_FANDA_RATES_SOURCE="error.awardDirectFandADistribution.source.required";
    
    public static final String ERROR_AWARD_FANDA_RATES_DESTINATION="error.awardDirectFandADistribution.destination.required";
    
    public static final String ERROR_AWARD_FANDA_RATES_DESTINATION_LIMIT="error.awardDirectFandADistribution.destination.limit";
    
    public static final String ERROR_AWARD_FANDA_RATES_SOURCE_LIMIT="error.awardDirectFandADistribution.source.limit";
    
    /* Award Keyperson Maintenance */
    public static final String AWARD_KEYPERSON_MAINTENANCE_ROLE = "Maintain Keyperson"; 
    
    public static final String ROLE_CENTRAL_DB_KEYSTORE_LOCATION = "rolecentraldb.keystore.location"; 
    public static final String ROLE_CENTRAL_DB_KEYSTORE_PASSWORD = "rolecentraldb.keystore.password"; 
    public static final String ROLE_CENTRAL_DB_TRUSTSTORE_LOCATION = "rolecentraldb.truststore.location"; 
    public static final String ROLE_CENTRAL_DB_TRUSTSTORE_PASSWORD = "rolecentraldb.truststore.password"; 
    
    
    public static final String ENABLE_ROLE_INTEGRATION = "EnableRoleIntegration";
    
    public static final String ROLE_CENTRAL_DB_CATEGORY_CODE = "RoleCentralDbCategoryCode";

    
   
    
}
