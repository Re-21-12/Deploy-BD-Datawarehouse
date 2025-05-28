Table WeatherFacts {
  id int [pk, increment]
  station_id int [ref: > DimStation.id]
  datetime_id int [ref: > DimDateTime.id]
  location_id int [ref: > DimLocation.id]
  temp_max float
  temp_min float
  temp_avg float
  feelslike_max float
  feelslike_min float
  feelslike_avg float
  dew_point float
  humidity float
  precip float
  precip_prob float
  precip_cover float
  snow float
  snow_depth float
  wind_gust float
  wind_speed float
  wind_dir float
  pressure float
  cloud_cover float
  visibility float
  solar_radiation float
  solar_energy float
  uv_index int
  severe_risk int
  moon_phase float
  condition_id int [ref: > DimCondition.id]
}

Table DimDateTime {
  id int [pk, increment]
  datetime timestamp
  date date
  year int
  month int
  day int
  hour int
  weekday int
  sunrise time
  sunset time
}

Table DimCondition {
  id int [pk, increment]
  condition text
  description text
  icon text
}

Table DimStation {
  id int [pk, increment]
  code text
  name text
  lat float
  lon float
  elevation float
}

Table DimLocation {
  id int [pk, increment]
  name text
  region text
  country text
}
