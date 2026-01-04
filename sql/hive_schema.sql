-- =========================================================
-- Hive External Table: Soil and Weather Analytics
-- Project: Cloud-Powered Smart Agriculture Insights
-- Purpose: Store cleaned soil and climate data for analytics
-- =========================================================

CREATE DATABASE IF NOT EXISTS smart_agriculture;
USE smart_agriculture;

CREATE EXTERNAL TABLE IF NOT EXISTS soil_weather_fact (
    record_id           STRING,
    region               STRING,
    country              STRING,
    soil_type            STRING,
    soil_ph              DOUBLE,
    nitrogen             INT,
    phosphorus           INT,
    potassium             INT,
    zinc                 DOUBLE,
    sulfur               DOUBLE,
    temperature_c        DOUBLE,
    humidity_percent     DOUBLE,
    rainfall_mm          DOUBLE,
    observation_date     DATE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/data/soil_weather/'
TBLPROPERTIES (
    'skip.header.line.count'='1'
);
