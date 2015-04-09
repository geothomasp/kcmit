update award_report_tracking
set due_date = null
where due_date = to_date('01-JAN-1900')
/
commit
/
