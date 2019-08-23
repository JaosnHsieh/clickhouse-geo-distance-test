CREATE TABLE test
(
    `id` String,
    `lat` Nullable(Float64),
    `long` Nullable(Float64),
    `started_at` DateTime
)
ENGINE = MergeTree()
PARTITION BY toYYYYMMDD(started_at)
ORDER BY started_at
SETTINGS index_granularity = 8192

