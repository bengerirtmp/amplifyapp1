USE ROLE SECURITYADMIN;
DROP USER IF EXISTS  kafka_snowflake_connector;
CREATE USER kafka_snowflake_connector rsa_public_key ='MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0XJdAFcF1eK+ei9fo6EJ
0NfFZWBv/NVtNa2vvd3XdRO3OeXdi9bY/Ai3XP6Jw3sowbLV21RaZfg/NINoW9kc
z6HVDK5oI8ddenghUYka9uduvuD+70BT9zRLz/qevc/eFCmCpuDnXown+LqW1q00
R/X2+SuLtyW+ZX9pjNqKddvW5SPmEh1Iw5J07K3gaxGqdAebIOLhy27egvKa/+Oj
ArA0WstW0Pj9TXdOULDK/8q8e/UqeIsdWSKi9iYz6wCXhTVkk8zIloZrjrWkybok
ZpXsySbLD5geqQ1x8Ju1fXRGquNTpBfI0JoruPcuMgsz3kBGjcu9IFPLyJ8VdXKL
FQIDAQAB';
 

USE ROLE SYSADMIN;
CREATE DATABASE IF NOT EXISTS PRODUCTION;

USE ROLE SECURITYADMIN;
CREATE ROLE kafka_connector_role;
GRANT usage on database PRODUCTION to role kafka_connector_role;
GRANT usage on WAREHOUSE COMPUTE_WH to role kafka_connector_role;

--grant privileges to kafka connector role
grant usage on schema PRODUCTION.PUBLIC to role kafka_connector_role;
grant create table on schema PRODUCTION.PUBLIC to role kafka_connector_role;
grant create stage on schema PRODUCTION.PUBLIC to role kafka_connector_role;
grant create pipe on schema PRODUCTION.PUBLIC to role kafka_connector_role;

--grant role to the existing user;
GRANT ROLE kafka_connector_role to USER kafka_snowflake_connector
GRANT ROLE kafka_connector_role to ROLE SYSADMIN;

--make that default role
ALTER USER kafka_snowflake_connector set default_role=kafka_connector_role ;
ALTER USER kafka_snowflake_connector set default_namespace=production.public ;
ALTER USER kafka_snowflake_connector set default_warehouse=COMPUTE_WH;

