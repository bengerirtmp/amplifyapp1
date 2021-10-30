use role account admin

create or replace storage integration rbs3_int
type = external_stage
storage_provider = S3
ENABLED=TRUE
STORAGE_AWS_ROL_EARN =  'arn:aws:iam::742158182529:role/test-external-role'
STORAGE_ALLOWED_LOCATIONS = ("s3://rb-cognos-report-output/");

GRANT USAGE ON INTEGRATION RBS3_INT TO ROLE SYSADMIN;

DESCRIBE INTEGRATION RBS3_INT  
USE ROLE SYSADMIN
USE DATABASE SFDEMO1

CREATE FILE FORMAT "SFDEMO1"."PUBLIC".MYCSV SET COMPRESSION = 'AUTO' FIELD_DELIMITER = ',' RECORD_DELIMITER = '\n' SKIP_HEADER = 0 FIELD_OPTIONALLY_ENCLOSED_BY = 'NONE' TRIM_SPACE = FALSE ERROR_ON_COLUMN_COUNT_MISMATCH = TRUE ESCAPE = 'NONE' ESCAPE_UNENCLOSED_FIELD = '\134' DATE_FORMAT = 'AUTO' TIMESTAMP_FORMAT = 'AUTO' NULL_IF = ('\\N');

CREATE OR REPLACE STAGE SFDEMO1.PUBLIC.RB_EXTERNAL_S3_STAGE_USING_INT_OBJ
STORAGE_INTEGRATION = RBS3_INT
URL='s3://cognos-report-output'
FILE_FORMAT=SFDEMO1.PUBLIC.MYCSV;

list @RB_EXTERNAL_S3_STAGE_USING_INT_OBJ/data
SELECT t.$1, t.S2 FROM @SFDEMO1.public.RB_EXTERNAL_S3_STAGE_USING_INT_OBJ/data t

list @RB_EXTERNAL_S3_STAGE_USING_INT_OBJECT/notes
rm @RB_EXTERNAL_S3_STAGE_USING_INT_OBJECT/notes
 select t.$1 FROM @SFDEMO1.PUBLIC.RB_EXTERNAL_S3_STAGE_USING_INT_OBJ/notes t

DESCRIBE table external_notes_tbl
CREATE OR REPLACE EXTERNAL TABLE external_notes_tbl
  WITH location = @RB_EXTERNAL_S3_STAGE_USING_INT_OBJ/notes
  file_format = mycsv
  pattern='.*data.*[.]csv';

SELECT *  FROM external_notes_tbl

-- employee.csv file contains 2 columns.
create or replace external table external_notes_tbl2
(  c1   varchar as (value:c1::varchar),
   c2 varchar as (value:c2::varchar))
    location =@RB_EXTERNAL_S3_STAGE_USING_INT_OBJECT/data/
  file_format = mycsv
  pattern='.*employee.*[.]csv';

