UPDATE KRIM_ROLE_MEMBER_T SET ROLE_ID=(SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-AWARD' AND ROLE_NM = 'Maintain Key Person')
WHERE ROLE_ID=(SELECT ROLE_ID,ROLE_NM FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-ADM' AND ROLE_NM = 'Maintain Key Person')
/
DELETE FROM KRIM_ROLE_PERM_T WHERE  ROLE_ID = (SELECT ROLE_ID FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-ADM' AND ROLE_NM = 'Maintain Key Person')
/
DELETE FROM KRIM_ROLE_T WHERE NMSPC_CD = 'KC-ADM' AND ROLE_NM = 'Maintain Key Person'
/
