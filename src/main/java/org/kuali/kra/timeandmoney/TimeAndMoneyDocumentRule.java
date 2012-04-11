/*
 * Copyright 2005-2010 The Kuali Foundation
 *
 * Licensed under the Educational Community License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.osedu.org/licenses/ECL-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.kuali.kra.timeandmoney;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.kuali.kra.award.awardhierarchy.AwardHierarchyService;
import org.kuali.kra.award.home.Award;
import org.kuali.kra.award.home.AwardAmountInfo;
import org.kuali.kra.award.paymentreports.awardreports.reporting.service.ReportTrackingService;
import org.kuali.kra.award.timeandmoney.AwardDirectFandADistribution;
import org.kuali.kra.award.timeandmoney.AwardDirectFandADistributionRule;
import org.kuali.kra.award.timeandmoney.AwardDirectFandADistributionRuleEvent;
import org.kuali.kra.award.timeandmoney.AwardDirectFandADistributionRuleImpl;
import org.kuali.kra.infrastructure.Constants;
import org.kuali.kra.infrastructure.KeyConstants;
import org.kuali.kra.infrastructure.KraServiceLocator;
import org.kuali.kra.rules.ResearchDocumentRuleBase;
import org.kuali.kra.timeandmoney.document.TimeAndMoneyDocument;
import org.kuali.kra.timeandmoney.history.TimeAndMoneyActionSummary;
import org.kuali.kra.timeandmoney.rule.event.TimeAndMoneyAwardAmountTransactionSaveEvent;
import org.kuali.kra.timeandmoney.rule.event.TimeAndMoneyAwardDateSaveEvent;
import org.kuali.kra.timeandmoney.rules.TimeAndMoneyAwardAmountTransactionRuleImpl;
import org.kuali.kra.timeandmoney.rules.TimeAndMoneyAwardDateSaveRuleImpl;
import org.kuali.kra.timeandmoney.service.ActivePendingTransactionsService;
import org.kuali.kra.timeandmoney.transactions.AddTransactionRuleEvent;
import org.kuali.kra.timeandmoney.transactions.TransactionRule;
import org.kuali.kra.timeandmoney.transactions.TransactionRuleEvent;
import org.kuali.kra.timeandmoney.transactions.TransactionRuleImpl;
import org.kuali.rice.kns.util.KNSGlobalVariables;
import org.kuali.rice.krad.document.Document;
import org.kuali.rice.krad.service.DocumentService;
import org.kuali.rice.krad.util.GlobalVariables;
import org.kuali.rice.krad.util.MessageMap;

/**
 * Main Business Rule class for <code>{@link TimeAndMoneyDocument}</code>. 
 * Responsible for delegating rules to independent rule classes.
 *
 */
public class TimeAndMoneyDocumentRule extends ResearchDocumentRuleBase implements TransactionRule, AwardDirectFandADistributionRule {
    
    public static final String DOCUMENT_ERROR_PATH = "document";
    public static final boolean VALIDATION_REQUIRED = true;
    public static final boolean CHOMP_LAST_LETTER_S_FROM_COLLECTION_NAME = false;
    public static final String AWARD_ERROR_PATH = "award";
    private transient ReportTrackingService reportTrackingService;


    /**
     * 
     * @see org.kuali.core.rules.DocumentRuleBase#processCustomSaveDocumentBusinessRules(
     * org.kuali.rice.krad.document.Document)
     */
    @Override
    protected boolean processCustomSaveDocumentBusinessRules(Document document) {
        boolean retval = true;
        MessageMap errorMap = GlobalVariables.getMessageMap();
        if (!(document instanceof TimeAndMoneyDocument)) {
            return false;
        }
        
        errorMap.addToErrorPath(DOCUMENT_ERROR_PATH);
        getDictionaryValidationService().validateDocumentAndUpdatableReferencesRecursively(
                document, getMaxDictionaryValidationDepth(),
                VALIDATION_REQUIRED, CHOMP_LAST_LETTER_S_FROM_COLLECTION_NAME);
        errorMap.removeFromErrorPath(DOCUMENT_ERROR_PATH);
        retval &= processAwardDirectFandADistributionBusinessRules(document);
        retval &= processTimeAndMoneyAwardAmountTransactionBusinessRules(document);
        retval &= processTimeAndMoneySaveAwardDateBusinessRules(document);
        reportAwardReportTrackingError(document);
        return retval;
    }
    
    /**
     * 
     * This method reports a warning when a change occured that might change report tracking.
     * @param document
     */
    protected void reportAwardReportTrackingError(Document document) {
        ActivePendingTransactionsService aptService = getActivePendingTransactionsService();
        TimeAndMoneyDocument timeAndMoneyDocument = (TimeAndMoneyDocument) document;
        for (Entry<String, AwardHierarchyNode> awardHierarchyNode : timeAndMoneyDocument.getAwardHierarchyNodes().entrySet()) {
            Award award = aptService.getWorkingAwardVersion(awardHierarchyNode.getValue().getAwardNumber()); 
            if (!this.getReportTrackingService().getReportTacking(award).isEmpty() && checkReportTrackingValueChanges(timeAndMoneyDocument)) {
                KNSGlobalVariables.getMessageList().add(KeyConstants.REPORT_TRACKING_WARNING_UPDATE_FROM_DATE_CHANGE, "");
                return;
            }
        }
    }
    
    /**
     * 
     * This method determines if a change has occured that might change report tracking records.
     * @param timeAndMoneyDocument
     * @return
     */
    protected boolean checkReportTrackingValueChanges(TimeAndMoneyDocument timeAndMoneyDocument) {
        Map<String, AwardHierarchyNode> formAwardHierarchyNodes = timeAndMoneyDocument.getAwardHierarchyNodes();
        TimeAndMoneyDocument dbTmd = getDbTimeAndMoneyDocument(timeAndMoneyDocument.getDocumentNumber());
        Map<String, AwardHierarchyNode> dbAwardHierarchyNodes = dbTmd.getAwardHierarchyNodes();
        
        AwardHierarchyService ahs = KraServiceLocator.getService(AwardHierarchyService.class);
        ahs.populateAwardHierarchyNodesForTandMDoc(timeAndMoneyDocument.getAwardHierarchyItems(), dbTmd.getAwardHierarchyNodes(), 
                timeAndMoneyDocument.getAward().getAwardNumber(),  timeAndMoneyDocument.getAward().getSequenceNumber().toString(), 
                dbTmd.getDocumentNumber());
        for (String key : formAwardHierarchyNodes.keySet()) {
            AwardHierarchyNode formNode = formAwardHierarchyNodes.get(key);
            AwardHierarchyNode dbNode = dbAwardHierarchyNodes.get(key);
            if (!formNode.equals(dbNode)) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * 
     * This method returns a NON initialized database version of the current time and money document.
     * @param documentNumber
     * @return
     */
    protected TimeAndMoneyDocument getDbTimeAndMoneyDocument(String documentNumber) {
        Map params = new HashMap();
        params.put("DOCUMENT_NUMBER", documentNumber);
        TimeAndMoneyDocument tmd = (TimeAndMoneyDocument) this.getBusinessObjectService().findByPrimaryKey(TimeAndMoneyDocument.class, params);
        return tmd;
    }
    
    /**
    *
    * process Direct F and A Distribution business rules.
    * @param awardDocument
    * @return
    */
    private boolean processTimeAndMoneyAwardAmountTransactionBusinessRules(Document document) {
        boolean valid = true;
        MessageMap errorMap = GlobalVariables.getMessageMap();
        TimeAndMoneyDocument timeAndMoneyDocument = (TimeAndMoneyDocument) document;
        errorMap.addToErrorPath(DOCUMENT_ERROR_PATH);
        errorMap.addToErrorPath(AWARD_ERROR_PATH);
        String errorPath = "timeAndMoneyAwardAmountTransaction";
        errorMap.addToErrorPath(errorPath);
        TimeAndMoneyAwardAmountTransactionSaveEvent event = new TimeAndMoneyAwardAmountTransactionSaveEvent(errorPath, 
                                                            timeAndMoneyDocument);
        valid &= new TimeAndMoneyAwardAmountTransactionRuleImpl().processSaveAwardAmountTransactionBusinessRules(event);
        errorMap.removeFromErrorPath(errorPath);
        errorMap.removeFromErrorPath(AWARD_ERROR_PATH);
        errorMap.removeFromErrorPath(DOCUMENT_ERROR_PATH);
        return valid;
    }
    
    /**
    *
    * process Direct F and A Distribution business rules.
    * @param awardDocument
    * @return
    */
    private boolean processTimeAndMoneySaveAwardDateBusinessRules(Document document) {
        boolean valid = true;
        MessageMap errorMap = GlobalVariables.getMessageMap();
        TimeAndMoneyDocument timeAndMoneyDocument = (TimeAndMoneyDocument) document;
        errorMap.addToErrorPath(DOCUMENT_ERROR_PATH);
        errorMap.addToErrorPath(AWARD_ERROR_PATH);
        String errorPath = "timeAndMoneyAwardDates";
        errorMap.addToErrorPath(errorPath);
        TimeAndMoneyAwardDateSaveEvent event = new TimeAndMoneyAwardDateSaveEvent(errorPath, 
                                                            timeAndMoneyDocument);
        valid &= new TimeAndMoneyAwardDateSaveRuleImpl().processSaveAwardDatesBusinessRules(event);
        errorMap.removeFromErrorPath(errorPath);
        errorMap.removeFromErrorPath(AWARD_ERROR_PATH);
        errorMap.removeFromErrorPath(DOCUMENT_ERROR_PATH);
        return valid;
    }
    
    
    /**
    *
    * process Direct F and A Distribution business rules.
    * @param awardDocument
    * @return
    */
    private boolean processAwardDirectFandADistributionBusinessRules(Document document) {
        boolean valid = true;
        MessageMap errorMap = GlobalVariables.getMessageMap();
        TimeAndMoneyDocument timeAndMoneyDocument = (TimeAndMoneyDocument) document;
        int i = 0;
        List<AwardDirectFandADistribution> awardDirectFandADistributions = timeAndMoneyDocument.getAward().getAwardDirectFandADistributions();
        errorMap.addToErrorPath(DOCUMENT_ERROR_PATH);
        errorMap.addToErrorPath(AWARD_ERROR_PATH);
        String errorPath = "awardDirectFandADistribution[" + i + Constants.RIGHT_SQUARE_BRACKET;
        errorMap.addToErrorPath(errorPath);
        AwardDirectFandADistributionRuleEvent event = new AwardDirectFandADistributionRuleEvent(errorPath, 
                                                            timeAndMoneyDocument, 
                                                                   awardDirectFandADistributions);
        valid &= new AwardDirectFandADistributionRuleImpl().processAwardDirectFandADistributionBusinessRules(event);
        errorMap.removeFromErrorPath(errorPath);
        errorMap.removeFromErrorPath(AWARD_ERROR_PATH);
        errorMap.removeFromErrorPath(DOCUMENT_ERROR_PATH);
        return valid;
    }


    /**
     * @see org.kuali.core.rule.DocumentAuditRule#processRunAuditBusinessRules(
     * org.kuali.rice.krad.document.Document)
     */
    public boolean processRunAuditBusinessRules(Document document){
        boolean retval = true;
        return retval;
    }


    public boolean processAddPendingTransactionBusinessRules(AddTransactionRuleEvent event) {
        return new TransactionRuleImpl().processAddPendingTransactionBusinessRules(event);
    }


    public boolean processPendingTransactionBusinessRules(TransactionRuleEvent event) {
        return new TransactionRuleImpl().processPendingTransactionBusinessRules(event);
    }

    /**
     * @see org.kuali.kra.award.detailsdates.AwardDetailsAndDatesRule#processAddAwardTransferringSponsorEvent
     * (org.kuali.kra.award.rule.event.AddAwardTransferringSponsorEvent)
     */
    public boolean processAddAwardDirectFandADistributionBusinessRules(AwardDirectFandADistributionRuleEvent 
                                                                                        awardDirectFandADistributionRuleEvent) {
        return new AwardDirectFandADistributionRuleImpl().processAddAwardDirectFandADistributionBusinessRules(awardDirectFandADistributionRuleEvent);
    }

    public boolean processAwardDirectFandADistributionBusinessRules(
            AwardDirectFandADistributionRuleEvent awardDirectFandADistributionRuleEvent) {
        return new AwardDirectFandADistributionRuleImpl().processAwardDirectFandADistributionBusinessRules(awardDirectFandADistributionRuleEvent);
    }

    public boolean processSingleNodeTransactionBusinessRules(AwardHierarchyNode awardHierarchyNode, AwardAmountInfo aai) {
        // TODO Auto-generated method stub
        return false;
    }

    public boolean processSingleNodeTransactionBusinessRules(AwardHierarchyNode awardHierarchyNode, AwardAmountInfo aai,
            TimeAndMoneyDocument doc) {
        // TODO Auto-generated method stub
        return false;
    }
    
    public ReportTrackingService getReportTrackingService() {
        if (reportTrackingService == null) {
            reportTrackingService = KraServiceLocator.getService(ReportTrackingService.class);
        }
        return reportTrackingService;
    } 
    
    protected ActivePendingTransactionsService getActivePendingTransactionsService(){
        return (ActivePendingTransactionsService) KraServiceLocator.getService(ActivePendingTransactionsService.class);
    }
    
}
