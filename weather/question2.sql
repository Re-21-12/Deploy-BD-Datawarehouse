-- Query to get the average, maximum, and minimum temperatures for each department by month
SELECT 
    dl.name AS departamento,
    dd.year,
    dd.month,
    AVG(wf.temp_avg) AS temp_promedio,
    MAX(wf.temp_max) AS temp_maxima,
    MIN(wf.temp_min) AS temp_minima
FROM dw."WeatherFacts" wf
JOIN dw."DimDateTime" dd ON wf.datetime_id = dd.id
JOIN dw."DimLocation" dl ON wf.location_id = dl.id
WHERE dd.date BETWEEN '2024-05-25' AND '2025-05-25'
GROUP BY dl.name, dd.year, dd.month
ORDER BY dl.name, dd.year, dd.month;