create or replace procedure upd_sap_feed_log_error(batch_id in number, feed_id in number,
                                      error_message in varchar2) as
begin
	INSERT INTO SAP_FEED_ERROR_LOG
         ( BATCH_ID,
			  FEED_ID,
           ERROR_MESSAGE,
           UPDATE_USER,
           UPDATE_TIMESTAMP,
           VER_NBR,
           OBJ_ID)
 	 VALUES ( batch_id,
			  feed_id,
           error_message,
           USER,
           SYSDATE,
           1,
           SYS_GUID())  ;
end;
/