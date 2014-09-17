package org.kuali.kra.s2s.rrfednonfedbudget;

import static org.kuali.coeus.sys.framework.service.KcServiceLocator.getService;
import java.io.BufferedInputStream;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import org.kuali.coeus.common.budget.framework.core.BudgetDocument;
import org.kuali.coeus.common.framework.org.Organization;
import org.kuali.coeus.propdev.impl.attachment.Narrative;
import org.kuali.coeus.propdev.impl.attachment.NarrativeAttachment;
import org.kuali.coeus.propdev.impl.attachment.NarrativeType;
import org.kuali.coeus.propdev.impl.budget.ProposalDevelopmentBudgetExt;
import org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocument;
import org.kuali.coeus.propdev.impl.location.ProposalSite;
import org.kuali.coeus.propdev.impl.person.ProposalPerson;
import org.kuali.coeus.s2sgen.impl.generate.support.RRFedNonFedBudget10V1_1Generator;
import org.kuali.kra.s2s.generator.S2SModularBudgetTestBase;
import org.kuali.kra.s2s.generator.util.S2STestConstants;
import org.kuali.rice.core.api.util.ClassLoaderUtils;
import org.kuali.rice.krad.data.DataObjectService;
import org.kuali.rice.krad.service.KRADServiceLocatorWeb;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

public class RRFedNonFedBudget10V1_1GeneratorTest extends
		S2SModularBudgetTestBase<RRFedNonFedBudget10V1_1Generator> {

	@Override
	protected String getFormGeneratorName() {
		return RRFedNonFedBudget10V1_1Generator.class.getSimpleName();
	}

	@Override
	protected void prepareData(ProposalDevelopmentDocument document)
			throws Exception {
		Organization organization = new Organization();
		organization.setOrganizationName("University");
		organization.setOrganizationId("000001");
		organization.setContactAddressId(1);

		ProposalSite applicantOrganization = new ProposalSite();
		applicantOrganization.setLocationTypeCode(2);
		applicantOrganization.setOrganization(organization);

		applicantOrganization.setSiteNumber(1);
		applicantOrganization.setLocationName(organization
				.getOrganizationName());
		document.getDevelopmentProposal().setApplicantOrganization(
				applicantOrganization);
		document.getDevelopmentProposal().getApplicantOrganization()
				.getOrganization().setDunsNumber("00-176-5866");

		NarrativeAttachment narrativeAttachment = new NarrativeAttachment();
		DefaultResourceLoader resourceLoader = new DefaultResourceLoader(
				ClassLoaderUtils.getDefaultClassLoader());
		Resource resource = resourceLoader
				.getResource(S2STestConstants.ATT_PACKAGE + "/exercise2.pdf");
		InputStream inputStream = resource.getInputStream();
		BufferedInputStream bis = new BufferedInputStream(inputStream);
		byte[] narrativePdf = new byte[bis.available()];
		narrativeAttachment.setData(narrativePdf);
		narrativeAttachment.setName("exercise1");
		Narrative narrative = new Narrative();
		List<Narrative> narrativeList = new ArrayList<Narrative>();
		narrative.setDevelopmentProposal(document.getDevelopmentProposal());
		NarrativeType narrativeType = new NarrativeType();
		narrativeType.setCode("133");
		narrativeType.setAllowMultiple(true);
		narrativeType.setSystemGenerated(false);
		narrativeType.setDescription("Testing for Attachments Attachment");
		getService(DataObjectService.class).save(narrativeType);
        narrative.setName("exercise1");
        narrative.setNarrativeType(narrativeType);
		narrative.setNarrativeTypeCode("133");
		narrative.setNarrativeAttachment(narrativeAttachment);
        narrative.setModuleNumber(1);
        narrative.setModuleSequenceNumber(1);
        narrative.setModuleStatusCode("C");
		narrativeList.add(narrative);
		document.getDevelopmentProposal().setNarratives(narrativeList);

		List<ProposalPerson> proposalPersons = new ArrayList<ProposalPerson>();
		ProposalPerson principalInvestigator = new ProposalPerson();
		principalInvestigator.setFirstName("ALAN");
		principalInvestigator.setLastName("MCAFEE");
		principalInvestigator.setProposalPersonRoleId("PI");
		principalInvestigator.setPersonId("0001");
		principalInvestigator.setRolodexId(0010);
        principalInvestigator.setProposalPersonNumber(1);
        principalInvestigator.setDevelopmentProposal(document.getDevelopmentProposal());
		proposalPersons.add(principalInvestigator);
		document.getDevelopmentProposal().setProposalPersons(proposalPersons);

		ProposalDevelopmentBudgetExt proposalDevelopmentBudgetExt = new ProposalDevelopmentBudgetExt();
        proposalDevelopmentBudgetExt.setDevelopmentProposal(document.getDevelopmentProposal());
		proposalDevelopmentBudgetExt.setBudgetVersionNumber(1);
		proposalDevelopmentBudgetExt.setFinalVersionFlag(true);
		proposalDevelopmentBudgetExt.setBudgetStatus("1");
		proposalDevelopmentBudgetExt.setBudgetId(1L);
		proposalDevelopmentBudgetExt
				.setName("test Document Description");
		proposalDevelopmentBudgetExt.setOnOffCampusFlag("Y");
		proposalDevelopmentBudgetExt.setStartDate(new Date(new Long(
				"1183316613046")));
		proposalDevelopmentBudgetExt.setEndDate(new Date(new Long(
				"1214852613046")));
		proposalDevelopmentBudgetExt.setOhRateTypeCode("1");
		proposalDevelopmentBudgetExt.setOhRateClassCode("1");
		proposalDevelopmentBudgetExt.setModularBudgetFlag(false);
		proposalDevelopmentBudgetExt.setUrRateClassCode("1");
		List<ProposalDevelopmentBudgetExt> proposalDevelopmentBudgetExtList = new ArrayList<ProposalDevelopmentBudgetExt>();
		proposalDevelopmentBudgetExtList.add(proposalDevelopmentBudgetExt);
		document.getDevelopmentProposal().setBudgets(proposalDevelopmentBudgetExtList);	
	}
}
