DELETE FROM award_comment WHERE comment_type_code = 1
/
commit
/
update comment_type set award_comment_screen_flag = 'N' where comment_type_code = 1 --Invoice Instructions
/
