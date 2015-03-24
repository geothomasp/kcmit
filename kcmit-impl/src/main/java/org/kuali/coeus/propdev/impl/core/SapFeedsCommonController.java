package org.kuali.coeus.propdev.impl.core;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kuali.coeus.common.framework.sponsor.Sponsor;
import org.kuali.coeus.propdev.impl.sapfeed.SapFeedDetails;
import org.kuali.coeus.propdev.impl.sapfeed.SapFeedService;
import org.kuali.coeus.propdev.impl.sapfeed.SapFeedsForm;
import org.kuali.coeus.propdev.impl.sapfeed.TempSapSponsorDetails;
import org.kuali.coeus.sys.framework.gv.GlobalVariableService;
import org.kuali.coeus.sys.framework.service.KcServiceLocator;
import org.kuali.rice.core.api.config.property.ConfigurationService;
import org.kuali.rice.krad.service.BusinessObjectService;
import org.kuali.rice.krad.web.controller.MethodAccessible;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("sapFeedsCommonController")
@RequestMapping(value = "/sapFeedsCommon")
public class SapFeedsCommonController extends SapFeedsControllerBase {

	private static final String SAP_FEED_RESULT_DIALOG_ID = "FeedGenerated-DialogGroup";
	private static final String SAP_FEED_ERROR_DIALOG_ID = "FeedError-DialogGroup";
	private static final String SAP_MASTERFEED_ERROR_DIALOG_ID = "MasterFeedNoPenidngFeed-DialogGroup";
	private static final String SAP_MASTERFEED_NO_PENDINGFEED_VALUE = "-100";
	private static final String SAP_FEED_INVALID_PATH_VALUE = "-1";
	private static final String DUMMY_SPONSOR = "999999";
	private String Path;

	private List<SapFeedDetails> sapfeedDetails;
	private List<Sponsor> sponsors;
	private List<Sponsor> sponsorsUpdated = new ArrayList<Sponsor>();
	private List<TempSapSponsorDetails> tempSapSponsorDetails = new ArrayList<TempSapSponsorDetails>();
	private Sponsor sponsor;

	@Autowired
	@Qualifier("kualiConfigurationService")
	private ConfigurationService kualiConfigurationService;

	@Autowired
	@Qualifier("globalVariableService")
	private GlobalVariableService globalVariableService;

	@Autowired
	@Qualifier("sapFeedService")
	private SapFeedService sapFeedService;

	@MethodAccessible
	@Transactional
	@RequestMapping(params = "methodToCall=retrieveCollectionPage")
	public ModelAndView retrieveCollectionPage(
			@ModelAttribute("KualiForm") SapFeedsForm form,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HashMap<String, String> fieldValues = new HashMap<String, String>();
		fieldValues.put("feedStatus", "P");

		sapfeedDetails = (List<SapFeedDetails>) KcServiceLocator.getService(BusinessObjectService.class).findMatching(SapFeedDetails.class,fieldValues);
		form.setPendingFeedCount(sapfeedDetails.size());

		sponsors = (List<Sponsor>) KcServiceLocator.getService(BusinessObjectService.class).findAll(Sponsor.class);

		for (Sponsor sponsor : sponsors) {
			if (sponsor.getSponsorCode() != DUMMY_SPONSOR)
				sponsorsUpdated.add(sponsor);
		}

		tempSapSponsorDetails = (List<TempSapSponsorDetails>) KcServiceLocator.getService(BusinessObjectService.class).findAll(TempSapSponsorDetails.class);

		if (sponsorsUpdated.size() != tempSapSponsorDetails.size())
			form.setSponsordatachanged(true);

		return getCollectionControllerService().retrieveCollectionPage(form);
	}

	@RequestMapping(params = "methodToCall=navigate")
	public ModelAndView navigate(@ModelAttribute("KualiForm") SapFeedsForm form)
			throws Exception {
		return super.navigate(form);
	}

	@Transactional
	@RequestMapping(value = "/sapFeedsCommon", params = "methodToCall=start")
	public ModelAndView start(@ModelAttribute("KualiForm") SapFeedsForm form,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response) {
		return getTransactionalDocumentControllerService().start(form);
	}

	@Transactional
	@RequestMapping(params = "methodToCall=defaultMapping")
	public ModelAndView defaultMapping(@RequestParam("path") String pathKey,
			@ModelAttribute("KualiForm") SapFeedsForm form,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {

		if (pathKey.equals("P"))
			Path = kualiConfigurationService
					.getPropertyValueAsString("SAP.PRODUCTION.PATH");
		else
			Path = kualiConfigurationService
					.getPropertyValueAsString("SAP.TEST.PATH");

		String user = globalVariableService.getUserSession()
				.getLoggedInUserPrincipalName();
		String statusMasterFeed = null;
		statusMasterFeed = sapFeedService.generateMasterFeed(Path, user);

		if (statusMasterFeed.equals(SAP_MASTERFEED_NO_PENDINGFEED_VALUE)) {
			return getModelAndViewService().showDialog(
					SAP_MASTERFEED_ERROR_DIALOG_ID, true, form);
		}
		return getModelAndViewService().showDialog(SAP_FEED_RESULT_DIALOG_ID,
				true, form);
	}

	@RequestMapping(params = "methodToCall=generateSponsor")
	public ModelAndView generateSponsor(@RequestParam("path") String pathKey,
			@ModelAttribute("KualiForm") SapFeedsForm form,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {

		if (pathKey.equals("P"))
			Path = kualiConfigurationService
					.getPropertyValueAsString("SAP.PRODUCTION.PATH");
		else
			Path = kualiConfigurationService
					.getPropertyValueAsString("SAP.TEST.PATH");
		String statusSponsorFeed = null;
		statusSponsorFeed = sapFeedService.generateSponsorFeed(Path);

		if (statusSponsorFeed.equals("")
				|| statusSponsorFeed.equals(SAP_FEED_INVALID_PATH_VALUE)) {
			return getModelAndViewService().showDialog(
					SAP_FEED_ERROR_DIALOG_ID, true, form);
		}
		return getModelAndViewService().showDialog(SAP_FEED_RESULT_DIALOG_ID,
				true, form);
	}

	@RequestMapping(params = "methodToCall=generateRolodex")
	public ModelAndView generateRolodex(@RequestParam("path") String pathKey,
			@ModelAttribute("KualiForm") SapFeedsForm form,
			BindingResult result, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {

		if (pathKey.equals("P"))
			Path = kualiConfigurationService
					.getPropertyValueAsString("SAP.PRODUCTION.PATH");
		else
			Path = kualiConfigurationService
					.getPropertyValueAsString("SAP.TEST.PATH");
		;
		String statusRolodexFeed = null;
		statusRolodexFeed = sapFeedService.generateRolodexFeed(Path);

		if (statusRolodexFeed.equals("")
				|| statusRolodexFeed.equals(SAP_FEED_INVALID_PATH_VALUE)) {
			return getModelAndViewService().showDialog(
					SAP_FEED_ERROR_DIALOG_ID, true, form);
		}
		return getModelAndViewService().showDialog(SAP_FEED_RESULT_DIALOG_ID,
				true, form);
	}

	public void setKualiConfigurationService(
			ConfigurationService kualiConfigurationService) {
		this.kualiConfigurationService = kualiConfigurationService;
	}

	public ConfigurationService getKualiConfigurationService() {
		return kualiConfigurationService;
	}

	public GlobalVariableService getGlobalVariableService() {
		return globalVariableService;
	}

	public void setGlobalVariableService(
			GlobalVariableService globalVariableService) {
		this.globalVariableService = globalVariableService;
	}

	public SapFeedService getSapFeedService() {
		return sapFeedService;
	}

	public void setSapFeedService(SapFeedService sapFeedService) {
		this.sapFeedService = sapFeedService;
	}
}
