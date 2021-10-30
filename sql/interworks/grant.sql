USE ROLE SECURITYADMIN;

CREATE ROLE IF NOT EXISTS ANALYST_ROLE;

GRANT USAGE ON DATABASE SFDEMO1 TO ROLE ANALYST_ROLE;
GRANT USAGE ON ALL SCHEMAS IN DATABASE SFDEMO1 TO ROLE ANALYST_ROLE;
GRANT ROLE ANALYST_ROLE TO ROLE  SYSADMIN;
 
GRANT SELECT ON ALL TABLES IN SCHEMA SFDEMO1.PUBLIC TO  ROLE ANALYST_ROLE;
GRANT SELECT ON   FUTURE TABLES IN SCHEMA  SFDEMO1.PUBLIC  TO ROLE ANALYST_ROLE;

CREATE USER if not exists  HP_DEV PASSWORD ='HPDEV11';
CREATE USER if not exists NITEO_TEST PASSWORD = 'NITEO_TEST';

GRANT ROLE ANALYST_ROLE TO USER HP_DEV;
GRANT ROLE ANALYST_ROLE TO USER NITEO_TEST;