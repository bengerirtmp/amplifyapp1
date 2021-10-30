USE ROLE SYSADMIN;
USE DATABASE SFDEMO1;
USE SCHEMA PUBLIC;

create or replace table fact_orders_aggregated
as select * from fact_orders t1 left join dim_geo t2
on t1.purchasing_country_code = t2.country_code;



create or replace secure view
mvw_fact_orders_aggregated
AS
select * from fact_orders_aggregated t1
inner join data_security_table t2
on current_user = t2.USERNAME
WHERE
T2.RESTRICTION_LEVEL = 'Region'
OR
(
CASE T2.RESTRICTION_LEVEL
  WHEN 'Sub Region' THEN t1.SUB_REGION
  WHEN 'Country' THEN t1.COUNTRY_CODE
END = t2.DATA_RESTRICTION);

GRANT SELECT ON VW_FACT_ORDERS_AGGREGATED TO ROLE ANALYST_ROLE;
GRANT SELECT ON MVW_FACT_ORDERS_AGGREGATED TO ROLE ANALYST_ROLE;
