package edu.mit.kc.dashboard.core;

import edu.mit.kc.dashboard.bo.Alert;
import org.kuali.coeus.common.framework.person.KcPerson;
import org.kuali.coeus.propdev.impl.core.DevelopmentProposal;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.negotiations.bo.Negotiation;
import org.kuali.rice.kim.api.identity.Person;
import org.kuali.rice.krad.web.form.UifFormBase;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 *
 */
public class DashboardForm extends UifFormBase {

    private KcPerson dashboardPerson;
    private String tempUserName;
    private List<ProposalDevelopmentDocument> myProposals = new ArrayList<>();
    private List<Award> myAwards = new ArrayList<>();
    private List<Alert> alerts = new ArrayList<>();

    public void setDashboardPerson(KcPerson dashboardPerson) {
        this.dashboardPerson = dashboardPerson;
    }

    public KcPerson getDashboardPerson() {
        return dashboardPerson;
    }

    public String getTempUserName() {
        return tempUserName;
    }

    public void setTempUserName(String tempUserName) {
        this.tempUserName = tempUserName;
    }

    public List<ProposalDevelopmentDocument> getMyProposals() {
        return myProposals;
    }

    public void setMyProposals(List<ProposalDevelopmentDocument> myProposals) {
        this.myProposals = myProposals;
    }

    public List<Award> getMyAwards() {
        return myAwards;
    }

    public void setMyAwards(List<Award> myAwards) {
        this.myAwards = myAwards;
    }

    public List<Alert> getAlerts() {
        // TODO this is for demo only
        alerts = new ArrayList<Alert>();
        for (int i = 0; i < 5; i++){
            alerts.add(new Alert());
        }

        return alerts;
    }

    public void setAlerts(List<Alert> alerts) {
        this.alerts = alerts;
    }
}
