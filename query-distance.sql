SELECT
    id,
    lat,
    long,
    started_at,
    runningDifference(lat) AS nextLatDeviation,
    runningDifference(long) AS nextLongDeviation,
    greatCircleDistance(long, lat, long+nextLongDeviation, lat+nextLatDeviation) AS nextDistance
FROM
(
    SELECT
        id,
        lat,
        long,
        started_at
    FROM test
    ORDER BY started_at   
    LIMIT 5
)
ORDER BY started_at ASC
