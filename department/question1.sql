SELECT 
    dl.name AS departamento,
    AVG(wf.temp_avg) AS temp_promedio
FROM dw."WeatherFacts" wf
JOIN dw."DimDateTime" dd ON wf.datetime_id = dd.id
JOIN dw."DimLocation" dl ON wf.location_id = dl.id
WHERE dd.date BETWEEN '2024-05-25' AND '2025-05-25'
GROUP BY dl.name
ORDER BY temp_promedio DESC;