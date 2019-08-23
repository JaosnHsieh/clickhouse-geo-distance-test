run-clickhouse-server ::
	docker run -d --name some-clickhouse-server --ulimit nofile=262144:262144 yandex/clickhouse-server

connect-clickhouse-cli ::
	docker run -it --rm --link some-clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server

insert-example-csv ::
	docker run -i --rm --link some-clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server  --format_csv_delimiter="," --query="INSERT INTO test FORMAT CSV" < example.csv

query-test-table ::
	docker run -i --rm --link some-clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server --query="SELECT * FROM test"

truncate-test-table ::
	docker run -i --rm --link some-clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server --query="TRUNCATE TABLE test"

query-distance-table ::
	docker run -i --rm --link some-clickhouse-server:clickhouse-server yandex/clickhouse-client --host clickhouse-server --query="SELECT     id,     lat,     long,     started_at,     runningDifference(lat) AS nextLatDeviation,     runningDifference(long) AS nextLongDeviation,     greatCircleDistance(long, lat, long+nextLongDeviation, lat+nextLatDeviation) AS nextDistance FROM (     SELECT         id,         lat,         long,         started_at     FROM test     ORDER BY started_at        LIMIT 5 ) ORDER BY started_at ASC"

