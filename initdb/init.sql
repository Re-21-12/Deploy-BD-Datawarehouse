-- Este script será ejecutado dentro de la base staging_dw

-- Crear esquemas
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS dw;

-- Crear tabla dentro del esquema staging
CREATE TABLE staging."clima"(
    "name" VARCHAR(255) NULL,
    "datetime" DATE NULL,
    "tempmax" FLOAT(53) NULL,
    "tempmin" FLOAT(53) NULL,
    "temp" FLOAT(53) NULL,
    "feelslikemax" FLOAT(53) NULL,
    "feelslikemin" FLOAT(53) NULL,
    "feelslike" FLOAT(53) NULL,
    "dew" FLOAT(53) NULL,
    "humidity" FLOAT(53) NULL,
    "precipt" FLOAT(53) NULL,
    "precipprob" FLOAT(53) NULL,
    "precipcover" FLOAT(53) NULL,
    "preciptype" VARCHAR(255) NULL,
    "snow" FLOAT(53) NULL,
    "snowdepth" FLOAT(53) NULL,
    "windgust" FLOAT(53) NULL,
    "windspeed" FLOAT(53) NULL,
    "winddir" FLOAT(53) NULL,
    "sealevelpressure" FLOAT(53) NULL,
    "cloudcover" FLOAT(53) NULL,
    "visibility" FLOAT(53) NULL,
    "solarradiation" FLOAT(53) NULL,
    "solarenergy" FLOAT(53) NULL,
    "uvindex" FLOAT(53) NULL,
    "severerisk" FLOAT(53) NULL,
    "sunrise" DATE NULL,
    "sunset" DATE NULL,
    "moonphase" FLOAT(53) NULL,
    "conditions" VARCHAR(255) NULL,
    "description" TEXT NULL,
    "icon" VARCHAR(255) NULL,
    "departamento" VARCHAR(255) NULL
);

CREATE TABLE dw."DimDateTime" (
  id SERIAL PRIMARY KEY,
  datetime TIMESTAMP,
  date DATE,
  year INT,
  month INT,
  day INT,
  hour INT,
  weekday INT,
  sunrise TIME,
  sunset TIME
);

CREATE TABLE dw."DimCondition" (
  id SERIAL PRIMARY KEY,
  condition TEXT,
  description TEXT,
  icon TEXT
);

CREATE TABLE dw."DimLocation" (
  id SERIAL PRIMARY KEY,
  name TEXT,
  region TEXT,
  country TEXT
);

CREATE TABLE dw."WeatherFacts" (
  id SERIAL PRIMARY KEY,
  datetime_id INT REFERENCES dw."DimDateTime"(id),
  location_id INT REFERENCES dw."DimLocation"(id),
  temp_max FLOAT,
  temp_min FLOAT,
  temp_avg FLOAT,
  feelslike_max FLOAT,
  feelslike_min FLOAT,
  feelslike_avg FLOAT,
  dew_point FLOAT,
  humidity FLOAT,
  precip FLOAT,
  precip_prob FLOAT,
  precip_cover FLOAT,
  snow FLOAT,
  snow_depth FLOAT,
  wind_gust FLOAT,
  wind_speed FLOAT,
  wind_dir FLOAT,
  pressure FLOAT,
  cloud_cover FLOAT,
  visibility FLOAT,
  solar_radiation FLOAT,
  solar_energy FLOAT,
  uv_index INT,
  severe_risk INT,
  moon_phase FLOAT,
  condition_id INT REFERENCES dw."DimCondition"(id)
);
