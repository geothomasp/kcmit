DELETE FROM AWARD_REP_TERMS_RECNT WHERE AWARD_REPORT_TERMS_ID IN(SELECT AWARD_REPORT_TERMS_ID FROM AWARD_REPORT_TERMS a INNER JOIN REPORT r ON a.REPORT_CODE=r.REPORT_CODE AND a.REPORT_CLASS_CODE=6
WHERE r.DESCRIPTION NOT IN('Payment/Invoice Frequency','Final Invoice Due'))
/
DELETE FROM AWARD_REPORT_TERMS WHERE REPORT_CLASS_CODE=6 AND REPORT_CODE NOT IN(SELECT REPORT_CODE FROM REPORT WHERE DESCRIPTION IN('Payment/Invoice Frequency','Final Invoice Due'))
/
DELETE FROM valid_class_report_freq WHERE REPORT_CLASS_CODE=6 AND REPORT_CODE NOT IN(SELECT REPORT_CODE FROM REPORT WHERE DESCRIPTION IN('Payment/Invoice Frequency','Final Invoice Due'))
/
