## Goal of this repo
Calculate distance by lat long from one row to next row ( order by time )

## Steps

1. `$make run-clickhouse-server`

2. copy from `create-test-table-one-line.sql` 

3. `$make connect-clickhouse-cli` and paste then create the `test` table

4. `$make insert-example-csv`

5. `$make query-test-table`

6. `$make query-distance-table`, the most important step to do. complete SQL in `query-distance.sql` 




references:

https://stackoverflow.com/questions/14999559/sql-calculate-difference-between-current-and-last-value-by-timestamp-column

https://stackoverflow.com/questions/53757415/replacement-for-row-number-in-clickhouse

https://clickhouse.yandex/docs/en/query_language/functions/other_functions/#other_functions-runningdifference

https://clickhouse.yandex/docs/en/query_language/functions/geo/#greatcircledistance