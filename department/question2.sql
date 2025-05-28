-- KPI: Total de días con precipitación por departamento
SELECT 
    dl.name AS departamento,
    COUNT(DISTINCT dd.date) AS dias_con_precipitacion
FROM dw."WeatherFacts" wf
JOIN dw."DimDateTime" dd ON wf.datetime_id = dd.id
JOIN dw."DimLocation" dl ON wf.location_id = dl.id
WHERE wf.precip > 0 AND dd.date BETWEEN '2024-05-25' AND '2025-05-25'
GROUP BY dl.name
ORDER BY dias_con_precipitacion DESC;