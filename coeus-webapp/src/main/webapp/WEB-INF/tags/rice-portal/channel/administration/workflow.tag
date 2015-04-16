<%--
 Copyright 2007-2009 The Kuali Foundation

 Licensed under the Educational Community License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.opensource.org/licenses/ecl2.php

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
--%>
<%@ include file="/rice-portal/jsp/sys/riceTldHeader.jsp" %>

<channel:portalChannelTop channelTitle="Workflow"/>
<div class="body">
    
  <ul class="chan">
                         
   <li><a class="portal_link" href="${rice.server.url}/kr-krad/lookup?methodToCall=start&amp;dataObjectClassName=org.kuali.rice.kew.impl.peopleflow.PeopleFlowBo&amp;showMaintenanceLinks=true&amp;returnLocation=@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView&amp;hideReturnLink=true">View People Flow</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kew/RoutingReport.do?returnLocation=@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View Routing Report</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kew/RuleQuickLinks.do?returnLocation=@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View Rule QuickLinks</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kr-krad/lookup?methodToCall=start&amp;dataObjectClassName:org.kuali.rice.krms.impl.repository.AgendaBo,hideReturnLink:true,showMaintenanceLinks:true,returnLocation:@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View Agendas</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kr-krad/lookup?methodToCall=start&amp;dataObjectClassName:org.kuali.rice.krms.impl.repository.RuleBo,hideReturnLink:true,showMaintenanceLinks:true,returnLocation:@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View Business Rules</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kr-krad/lookup?methodToCall=start&amp;dataObjectClassName:org.kuali.rice.krms.impl.repository.TermSpecificationBo,hideReturnLink:true,showMaintenanceLinks:true,returnLocation:@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View Term Specifications</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kr-krad/lookup?methodToCall=start&amp;dataObjectClassName:org.kuali.rice.krms.impl.repository.TermBo,hideReturnLink:true,showMaintenanceLinks:true,returnLocation:@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View Terms</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kr-krad/lookup?methodToCall=start&amp;dataObjectClassName:edu.mit.kc.bo.KrmsFunctions,hideReturnLink:true,showMaintenanceLinks:true,returnLocation:@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View KRMS Functions</a></li>
   <li><a class="portal_link" href="${rice.server.url}/kr-krad/lookup?methodToCall=start&amp;dataObjectClassName:edu.mit.kc.bo.KrmsFunctionsParams,hideReturnLink:true,showMaintenanceLinks:true,returnLocation:@{#ConfigProperties['application.url']}%2Fkc-krad%2FlandingPage%3FviewId%3DKc-LandingPage-RedirectView">View KRMS Function Params</a></li>

  </ul>

</div>
<channel:portalChannelBottom/>