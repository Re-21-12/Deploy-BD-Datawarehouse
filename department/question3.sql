-- KPI: Velocidad máxima del viento por departamento
SELECT 
    dl.name AS departamento,
    MAX(wf.wind_speed) AS velocidad_viento_maxima
FROM dw."WeatherFacts" wf
JOIN dw."DimDateTime" dd ON wf.datetime_id = dd.id
JOIN dw."DimLocation" dl ON wf.location_id = dl.id
WHERE dd.date BETWEEN '2024-05-25' AND '2025-05-25'
GROUP BY dl.name
ORDER BY velocidad_viento_maxima DESC;