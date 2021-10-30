https://docs.snowflake.com/en/user-guide/security-column-ddm-use.html

CREATE ROLE MASKING_ADMIN;
GRANT CREATE MASKING POLICY ON SCHEMA CRM_DB.SHIPPING TO ROLE MASKING_ADMIN;
GRANT APPLY MASKING POLICY ON ACCOUNT TO ROLE MASKING_ADMIN;
GRANT APPLY ON MASKING POLICY TO ROLE TABLE_OWNER

CREATE USER MASKING_USER PASSWORD='ADMIN1234';

create or replace masking policy email_mask as (val string) returns string ->
  case
    when current_role() in ('HRANALYST') then val
    else '*********'
  end;

STEP 3 
-- apply masking policy to a table column

alter table if exists user_info modify column email set masking policy email_mask;

Step 4: Query Data in Snowflake
Execute two different queries in Snowflake, one query with the ANALYST role and another query with a different role, to verify that users without the ANALYST role see a full mask.

-- using the ANALYST role

use role analyst;
select email from user_info; -- should see plain text value

-- using the PUBLIC role

use role public;
select email from user_info; -- should see full data mask
