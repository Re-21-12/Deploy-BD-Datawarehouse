-- Ejemplo: Temperatura promedio por departamento
SELECT 
    dl.name as departamento,
    AVG(wf.temp_avg) as temperatura_promedio,
    COUNT(*) as registros
FROM dw."WeatherFacts" wf
JOIN dw."DimLocation" dl ON wf.location_id = dl.id
JOIN dw."DimDateTime" dt ON wf.datetime_id = dt.id
WHERE dt.date >= '2024-01-01'
GROUP BY dl.name
ORDER BY temperatura_promedio DESC;