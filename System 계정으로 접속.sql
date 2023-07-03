-- USER SQL
ALTER USER "C##HR"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "C##HR" QUOTA UNLIMITED ON "USERS";

-- ROLES
GRANT "DBA" TO "C##HR" WITH ADMIN OPTION;
ALTER USER "C##HR" DEFAULT ROLE "DBA","CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES