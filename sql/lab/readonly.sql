
use role securityadmin;

create role read_only_r1 comment = 'This role is limited to querying tables in schemas_1';

grant role read_only_r1 to role sysadmin;
grant usage on database database_a to role read_only_r1;

grant usage on database_a.schema_1 to role read_only_r1;
grant select on all tables in schema database_a.schema_1 to role read_only_r1;

grant usage   on warehouse warehouse_1   to role read_only_rl;
grant select   on table database_a.schema_1.table_new   to role read_only_rl;

alter user bsmith set disabled=true;
grant role read_only_rl to user bsmith;

alter user bsmith set default_role = read_only_rl;
lter user bsmith set disabled=false;


use role accountadmin;

-- Grant the USAGE privilege on all future schemas in a database to role R1
grant usage on future schemas in database db1 to role r1;
use role accountadmin;

-- Grant the SELECT privilege on all future tables in a schema to role R1
grant select on future tables in schema db1.schema1 to role r1;

-- Grants the SELECT and INSERT privileges on all future tables in a schema to R1
grant select,insert on future tables in schema db1.schema1 to role r1;





use role accountadmin;

-- Grant the USAGE privilege on all existing schemas in a database to role R1
grant usage on all schemas in database db1 to role r1;

-- Grant the SELECT privilege on all existing tables in a schema to role R1
grant select on all tables in schema db1.schema1 to role r1
