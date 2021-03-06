DROP FOREIGN TABLE IF EXISTS @PSCHEMANAME.query_option_column_match_enabled;

CREATE FOREIGN TABLE @PSCHEMANAME.query_option_column_match_enabled (
        id int,
        data varchar(50),
        owner varchar(50)
)
        SERVER mssql_svr
        OPTIONS (query 'SELECT * FROM @MSCHEMANAME.query_option WHERE owner = ''geoff''', row_estimate_method 'showplan_all', match_column_names '1');

SELECT * FROM @PSCHEMANAME.query_option_column_match_enabled;
WITH count AS (
        SELECT COUNT(*) as count FROM @PSCHEMANAME.query_option_column_match_enabled
)
SELECT (count = 1) FROM count;
WITH owners AS (
	SELECT DISTINCT owner FROM @PSCHEMANAME.query_option_column_match_enabled
)
SELECT (owner = 'geoff') FROM owners;

