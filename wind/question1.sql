-- Velocidad promedio del viento y ráfagas máximas por departamento
SELECT 
    dl.name AS departamento,
    dd.year,
    dd.month,
    AVG(wf.wind_speed) AS velocidad_viento_promedio,
    MAX(wf.wind_gust) AS rafaga_maxima
FROM dw."WeatherFacts" wf
JOIN dw."DimDateTime" dd ON wf.datetime_id = dd.id
JOIN dw."DimLocation" dl ON wf.location_id = dl.id
WHERE dd.date BETWEEN '2024-05-25' AND '2025-05-25'
GROUP BY dl.name, dd.year, dd.month
ORDER BY dl.name, dd.year, dd.month;
