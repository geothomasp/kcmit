package org.kuali.coeus.propdev.impl.person;


import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.common.framework.person.KcPersonService;
import org.kuali.coeus.sys.framework.model.KcPersistableBusinessObjectBase;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;



@Entity
@Table(name = "PROPOSAL_PERSON_NOTIFICATION")
@IdClass(ProposalPerson.ProposalPersonId.class)
public class ProposalPersonNotification extends KcPersistableBusinessObjectBase{


	@Id
    @OneToOne(cascade = { CascadeType.REFRESH })
    @JoinColumns({ @JoinColumn(name = "PROPOSAL_NUMBER", referencedColumnName = "PROPOSAL_NUMBER"), @JoinColumn(name = "PROP_PERSON_NUMBER", referencedColumnName = "PROP_PERSON_NUMBER") })
    private ProposalPerson proposalPerson;
	
    @Transient
    private transient KcPersonService kcPersonService;

    @Transient
    private transient String personName;
	
  	public ProposalPerson getProposalPerson() {
		return proposalPerson;
	}

	public void setProposalPerson(ProposalPerson proposalPerson) {
		this.proposalPerson = proposalPerson;
	}
	
	@Column(name = "NOTIFICATION_SENDER")
	private String notificationSender;


	@Column(name = "NOTIFIED_TIME")
	private Timestamp notifiedTime;
	
	public String getPropsalNumber() {
		return this.getProposalPerson().getProposalNumber();
	}

	public Integer getProposalPersonNumber() {
		return this.getProposalPerson().getProposalPersonNumber();
	}

	public void setProposalPersonNumber(Integer proposalPersonNumber) {
		this.getProposalPerson().setProposalPersonNumber(proposalPersonNumber);
	}

	public String getNotificationSender() {
		return notificationSender;
	}

	public void setNotificationSender(String notificationSender) {
		this.notificationSender = notificationSender;
	}

	public Timestamp getNotifiedTime() {
		return notifiedTime;
	}

	public void setNotifiedTime(Timestamp notifiedTime) {
		this.notifiedTime = notifiedTime;
	}
	
	
	 protected KcPersonService getKcPersonService() {
	        if (this.kcPersonService == null) {
	            this.kcPersonService = KcServiceLocator.getService(KcPersonService.class);
	        }
	        return this.kcPersonService;
	    }
	 public void setKcPersonService(KcPersonService kcPersonService) {
			this.kcPersonService = kcPersonService;
	}
	 
	 public String getPersonName() {
		 if(notificationSender!=null){
			 KcPerson person = getKcPersonService().getKcPersonByPersonId(this.notificationSender);
			 personName = person.getFullName();
		 }
		 return personName;
	 }

	 public void setPersonName(String personName) {
		 this.personName = personName;
	 }
	
}
