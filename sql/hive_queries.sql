-- =========================================================
-- Analytical Queries: Soil Health & Climate Impact
-- =========================================================

USE smart_agriculture;

-- 1. Average soil pH by soil type
SELECT
    soil_type,
    ROUND(AVG(soil_ph), 2) AS avg_soil_ph,
    COUNT(*) AS sample_count
FROM soil_weather_fact
GROUP BY soil_type
ORDER BY avg_soil_ph;

-- 2. Identify acidic regions requiring soil treatment
SELECT
    region,
    country,
    ROUND(AVG(soil_ph), 2) AS avg_soil_ph
FROM soil_weather_fact
GROUP BY region, country
HAVING AVG(soil_ph) < 5.5
ORDER BY avg_soil_ph;

-- 3. Nutrient profile summary
SELECT
    ROUND(AVG(nitrogen), 1)   AS avg_nitrogen,
    ROUND(AVG(phosphorus), 1) AS avg_phosphorus,
    ROUND(AVG(potassium), 1)  AS avg_potassium
FROM soil_weather_fact;

-- 4. Climate impact on soil pH
SELECT
    ROUND(temperature_c, 0) AS temp_bucket,
    ROUND(AVG(soil_ph), 2)  AS avg_ph
FROM soil_weather_fact
GROUP BY ROUND(temperature_c, 0)
ORDER BY temp_bucket;

-- 5. Recent observations (data quality check)
SELECT *
FROM soil_weather_fact
WHERE observation_date >= DATE_SUB(CURRENT_DATE, 30);
