delete from kc_qrtz_cron_triggers where trigger_name='citiTrainingDataFeedTrigger';
delete from kc_qrtz_triggers where trigger_name='citiTrainingDataFeedTrigger';
delete from kc_qrtz_job_details where job_name='citiTrainingDataFeedJobDetail';