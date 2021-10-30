#!/bin/sh
export SNOWSQL_ACCOUNT=yd55881.east-us-2.azure
export SNOWSQL_USER=bengerir
export SNOWSQL_ROLE=SYSADMIN
export SNOWSQL_PWD=Madhava123
snowsql -f /home/ec2-user/sql/vhol2.sql

