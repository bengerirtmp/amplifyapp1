#!/bin/sh
export SNOWSQL_ACCOUNT=yd55881.east-us-2.azure
export SNOWSQL_USER=bengerir
export SNOWSQL_ROLE=SYSADMIN
export SNOWSQL_PWD=Madhava123
#snowsql -f /home/ec2-user/sql/test.sql -D deptno=10;
#snowsql -f /home/ec2-user/sql/interworks/insert.sql
#snowsql -f /home/ec2-user/sql/interworks/views.sql
#snowsql -f /home/ec2-user/sql/kafka/kafka.sql
snowsql -f /home/ec2-user/sql/kafka/sunil.sql
#snowsql

