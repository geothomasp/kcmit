INSERT INTO KRIM_ROLE_PERM_T(
     ROLE_PERM_ID,
     OBJ_ID,
     VER_NBR,
     ROLE_ID,
     PERM_ID,
     ACTV_IND
      )
VALUES(
KRIM_ROLE_PERM_ID_S.nextval,
sys_guid(),
1,
(select  ROLE_ID from KRIM_ROLE_T where trim(upper(ROLE_NM)) = trim(upper('Application Administrator'))and nmspc_cd ='KC-SYS'),
(select PERM_ID from KRIM_PERM_T where nm = 'Modify Unit' and nmspc_cd='KC-UNT'),
'Y'
)
/
commit
/
