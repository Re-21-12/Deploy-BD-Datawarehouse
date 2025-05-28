-- Promedio de precipitación y humedad por departamento
SELECT 
    dl.name AS departamento,
    dd.year,
    dd.month,
    AVG(wf.precip) AS precip_promedio,
    AVG(wf.humidity) AS humedad_promedio
FROM dw."WeatherFacts" wf
JOIN dw."DimDateTime" dd ON wf.datetime_id = dd.id
JOIN dw."DimLocation" dl ON wf.location_id = dl.id
WHERE dd.date BETWEEN '2024-05-25' AND '2025-05-25'
GROUP BY dl.name, dd.year, dd.month
ORDER BY dl.name, dd.year, dd.month;

