USE ROLE SYSADMIN;
USE DATABASE SFDEMO1;
USE SCHEMA PUBLIC;


delete from fact_orders;
delete from dim_geo;
delete from data_security_table;
commit;

INSERT INTO FACT_ORDERS(ORDER_ID,ORDER_DATE,PURCHASING_COUNTRY_CODE,SALES_REVENUE) VALUES (1,to_date('2021-01-01', 'YYYY-MM-DD'),'CN',409);
INSERT INTO FACT_ORDERS(ORDER_ID,ORDER_DATE,PURCHASING_COUNTRY_CODE,SALES_REVENUE) VALUES (2,to_date('2021-01-02', 'YYYY-MM-DD'),'KR',583);
INSERT INTO FACT_ORDERS(ORDER_ID,ORDER_DATE,PURCHASING_COUNTRY_CODE,SALES_REVENUE) VALUES (3,to_date('2021-01-03', 'YYYY-MM-DD'),'JP',741);
INSERT INTO FACT_ORDERS(ORDER_ID,ORDER_DATE,PURCHASING_COUNTRY_CODE,SALES_REVENUE) VALUES (4,to_date('2021-01-04', 'YYYY-MM-DD'),'VN',214);
INSERT INTO FACT_ORDERS(ORDER_ID,ORDER_DATE,PURCHASING_COUNTRY_CODE,SALES_REVENUE) VALUES (5,to_date('2021-01-05', 'YYYY-MM-DD'),'PH',865);
INSERT INTO FACT_ORDERS(ORDER_ID,ORDER_DATE,PURCHASING_COUNTRY_CODE,SALES_REVENUE) VALUES (6,to_date('2021-01-06', 'YYYY-MM-DD'),'SG',150);


INSERT INTO DIM_GEO(COUNTRY_CODE,COUNTRY_NAME,SUB_REGION,REGION) VALUES ('CN', 'China', 'East Asia', 'APAC');
INSERT INTO DIM_GEO(COUNTRY_CODE,COUNTRY_NAME,SUB_REGION,REGION) VALUES ('KR', 'South Korea', 'East Asia', 'APAC');
INSERT INTO DIM_GEO(COUNTRY_CODE,COUNTRY_NAME,SUB_REGION,REGION) VALUES ('JP', 'Japan', 'East Asia', 'APAC');
INSERT INTO DIM_GEO(COUNTRY_CODE,COUNTRY_NAME,SUB_REGION,REGION) VALUES ('VN', 'Vietnam', 'Southeast Asia', 'APAC');
INSERT INTO DIM_GEO(COUNTRY_CODE,COUNTRY_NAME,SUB_REGION,REGION) VALUES ('PH', 'Phillipines', 'Southeast Asia', 'APAC');
INSERT INTO DIM_GEO(COUNTRY_CODE,COUNTRY_NAME,SUB_REGION,REGION) VALUES ('SG', 'Singapore', 'Southeast Asia', 'APAC');

INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Region', 'MCHAN', 'Mendelsohn', 'Chan', NULL);

INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Sub Region', 'DCHAN', 'Daphne', 'Chan', 'Southeast Asia');
INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Sub Region', 'LHUANG', 'Lilian', 'Huang', 'East Asia');
INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Country', 'JZHANG', 'John', 'Zhang', 'CN');
INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Country', 'JKIM', 'Jacob', 'Kim', 'KR');
INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Country', 'BSATO', 'Bob', 'Sato', 'JP');
INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Country', 'STRAN', 'Sue', 'Tran', 'VN');
INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Country', 'MSANTOS', 'Mary', 'Santos', 'PH'); 
INSERT INTO DATA_SECURITY_TABLE(RESTRICTION_LEVEL,USERNAME,FIRST_NAME,LAST_NAME,DATA_RESTRICTION) 
VALUES ('Country', 'TCHUA', 'Tom', 'Chua', 'SG');
