UPDATE award_custom_data t1 set t1.coeus_aaa_award_number = (SELECT REPLACE(t2.award_number,'-00','-') FROM kc_mig_award_conv t2 WHERE t1.award_number = t2.change_award_number)
WHERE EXISTS (SELECT t3.change_award_number FROM kc_mig_award_conv t3 WHERE t3.change_award_number = t1.award_number)
/
