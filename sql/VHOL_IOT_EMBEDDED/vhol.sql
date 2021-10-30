/*#https://snowflake-corp-se-workshop.s3-us-west-1.amazonaws.com/VHOL_Embedded/Tableau_VHOL_IOT_Embedded.pdf
https://www.snowflake.com/webinar/virtual-hands-on-labs/embedded-analytics-applications-powered-by-snowflake-and-tableau/
*/

USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE DATABASE TABLEAU_VHOL_DATABASE;
CREATE OR REPLACE SCHEMA TABLEAU_VHOL_SCHEMA;

CREATE OR REPLACE WAREHOUSE TABLEAU_VHOL_WH WITH 
  WAREHOUSE_SIZE = 'MEDIUM'
  WAREHOUSE_TYPE = 'STANDARD'
  AUTO_SUSPEND = 60
  AUTO_RESUME = TRUE
  MIN_CLUSTER_COUNT = 1
  MAX_CLUSTER_COUNT = 1
  SCALING_POLICY = 'STANDARD';

ALTER WAREHOUSE TABLEAU_VHOL_WH SET WAREHOUSE_SIZE='LARGE';
ALTER WAREHOUSE TABLEAU_VHOL_WH SET WAREHOUSE_SIZE='MEDIUM';

-- Internal Stage
CREATE OR REPLACE STAGE VHOL_STAGE
URL = 'S3://snowflake-workshop-lab/citibike-trips';

SHOW STAGES;

--List Files on the S3 BUCKET
list @VHOL_STAGE;

--File Format
CREATE OR REPLACE FILE FORMAT CSV
  TYPE = 'CSV'
  COMPRESSION = 'AUTO'
  FIELD_DELIMITER = ','
  RECORD_DELIMITER = '\n'
  SKIP_HEADER = 0
  FIELD_OPTIONALLY_ENCLOSED_BY = '\042'
  TRIM_SPACE = FALSE
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE
  ESCAPE='NONE'
  ESCAPE_UNENCLOSED_FIELD = '\134'
  DATE_FORMAT = 'AUTO'
  TIMESTAMP_FORMAT = 'AUTO'
  NULL_IF = ('');

SHOW FILE FORMATS;


/*----------------------Trips Data ----------------------------*/

select $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16
from @VHOL_STAGE/trips_2013_0_0_0.csv.gz limit 100;

select $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16
from @VHOL_STAGE/trips_2013_0_0_0.csv.gz (file_Format = csv) limit 100;

--create table
create or replace table trips
(tripduration integer,
  starttime timestamp,
  stoptime timestamp,
  start_station_id integer,
  start_station_name string,
  start_station_latitude float,
  start_station_longitude float,
  end_station_id integer,
  end_station_name string,
  end_station_latitude float,
  end_station_longitude float,
  bikeid integer,
  membership_type string,
  usertype string,
  birth_year integer,
  gender integer);

--copy data over for trips
COPY INTO TRIPS FROM @VHOL_STAGE FILE_FORMAT = CSV;

--select
SELECT * FROM TRIPS LIMIT 20;


