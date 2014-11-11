package edu.mit.kc.coi;



import java.sql.SQLException;

public interface KcCoiLinkService {
	
	 
	 /**
	  *  Creation of new IP :When a DP record completes routing and generates an
	  IP, KC should call a function that would update Coeus COI module.
	  */
	public void updateCOIOnNewIP(String developmentProposalNumber,String instituteProposalNumber)
			throws SQLException;

	/**
	 * Linking IP to Award :When an IP gets linked to an award, either on a new
	 * award, or while editing and existing award and linking an IP thru funding
	 * proposals, after the transaction gets saved in KC, it should call a
	 * function that would update Coues COI.
	 */ 
	
	public void updateCOIOnLinkIPToAward(String awardNumber,String instituteProposalNumber,String loggedInUserId) throws SQLException;;

	/**
	 * Certification Complete in PD : When a person completes PD personnel
	 * certification and if the questionnaire answers triggers COI, KC should
	 * call a function to create / update proposal disclosure in Coeus COI.
	 * 
	 * 
	 *  
	Arguments 
	proposal Number --> developmentProposalNumber 
	person Id --> disclosurePersonId 
	user Id --> loggedInUserId 
	actype --> flag to identify whether to insert or update.Possible values are 'I' and 'U' for insert and update respectively. 
	 */
	
	
	public void updateCOIOnPDCerificationComplete(String developmentProposalNumber,String disclosurePersonId,String loggedInUserId,char actionType) throws SQLException;;

}