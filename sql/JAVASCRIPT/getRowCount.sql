create or replace procedure getRowCount(table_name VARCHAR)
returns float
not null
language javascript
as
$$
var row_count = 0;

var sqlCommand = "select count(*) from " + TABLE_NAME;
// prepare statement

var stmt = snowflake.createStatement( { sqlText: sqlCommand });

var res = stmt.execute();
res.next();
row_count= res.getColumnValue(1);
return row_count;
$$
;

