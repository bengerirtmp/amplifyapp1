use role sysadmin;
use database crm_db;
use schema public;
select * from department where deptno = &{deptno};
