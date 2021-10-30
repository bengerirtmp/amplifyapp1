https://www.linkedin.com/pulse/snowflake-power-bi-setup-matthew-fekitoa/

USE ROLE SECURITYADMIN;

--1 . create report reader role
CREATE ROLE PBI_READER COMMENCT='Power BI Snowflake Usage Reader Role';

GRANT ROLE PBI_READER TO ROLE PUBLIC;
--2 Assign permissions

GRANT IMPORTED PRIVILEGES ON DATABASE SNOWFLAKE TO ROLE PBI_READER;

--3 CREATE USER.
CREATE USER PBI_Snowflake_Reader PASSWORD = 'Admin1234' 
COMMENT = 'Account  for Power BI dashboard' DEFAULT_ROLE = "PUBLIC" MUST_CHANGE_PASSWORD = FALSE;

--4 Assign role to USER
GRANT ROLE PBI_READER TO USER PBI_Snowflake_Reader;

CREATE OR REPLACE VIEW [DATABASE].[SCHEMA].VW_REP_SNOWFLAKE_WAREHOUSE_METERING_HISTORY
AS

select
  "START_TIME",
  "END_TIME",
  "WAREHOUSE_ID",
  "WAREHOUSE_NAME",
  "CREDITS_USED",
   TO_DATE(START_TIME) AS START_DATE,
  DATEDIFF(HOUR, START_TIME, END_TIME) AS WAREHOUSE_OPERATION_HOURS,
  HOUR(START_TIME) AS TIME_OF_DAY
from "SNOWFLAKE"."ACCOUNT_USAGE"."WAREHOUSE_METERING_HISTORY";

CREATE OR REPLACE VIEW [DATABASE].[SCHEMA].VW_REP_SNOWFLAKE_STORAGE_USAGE_MONTHLY_SUMMARY
AS
select
    date_trunc(month, usage_date) as USAGE_MONTH
  , avg(storage_bytes + stage_bytes + failsafe_bytes) / power(1024, 4) as TOTAL_BILLABLE_STORAGE_TB
  , avg(storage_bytes ) / power(1024, 4) as STORAGE_BILLABLE_STORAGE_TB
  , avg(stage_bytes ) / power(1024, 4) as STAGE_BILLABLE_STORAGE_TB
  , avg(failsafe_bytes ) / power(1024, 4) as FAILSAFE_BILLABLE_STORAGE_TB
from SNOWFLAKE.ACCOUNT_USAGE.STORAGE_USAGE
GROUP BY date_trunc(month, usage_date)
ORDER BY date_trunc(month, usage_date) ;