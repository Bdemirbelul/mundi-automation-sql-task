WITH daily_runs AS (
  SELECT
    CAST(runtime_day AS DATE) AS date,
    SUM(automation_runs) AS total_runs
  FROM runs
  GROUP BY CAST(runtime_day AS DATE)
)

SELECT
  date,
  total_runs,
  AVG(total_runs) OVER (
    ORDER BY date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ) AS rolling_3_day_avg
FROM daily_runs
ORDER BY date;
