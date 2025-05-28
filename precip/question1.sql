-- Días con mayor probabilidad de precipitación por departamento
SELECT 
    departamento,
    fecha,
    probabilidad_precipitacion
FROM (
    SELECT 
        dl.name AS departamento,
        dd.date AS fecha,
        wf.precip_prob AS probabilidad_precipitacion,
        ROW_NUMBER() OVER (PARTITION BY dl.name ORDER BY wf.precip_prob DESC) AS rn
    FROM dw."WeatherFacts" wf
    JOIN dw."DimDateTime" dd ON wf.datetime_id = dd.id
    JOIN dw."DimLocation" dl ON wf.location_id = dl.id
    WHERE dd.date BETWEEN '2024-05-25' AND '2025-05-25'
) subquery
WHERE rn <= 10
ORDER BY departamento, probabilidad_precipitacion DESC;