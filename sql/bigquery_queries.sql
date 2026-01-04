-- =========================================================
-- BigQuery Analytics: Soil Health & Climate Relationships
-- Dataset: smart-agriculture-insights.agri.crop
-- =========================================================

-- 1. Distribution of soil pH levels
SELECT
  soil_type,
  COUNT(*) AS sample_count,
  ROUND(AVG(soil_ph), 2) AS avg_ph,
  ROUND(MIN(soil_ph), 2) AS min_ph,
  ROUND(MAX(soil_ph), 2) AS max_ph
FROM `smart-agriculture-insights.agri.crop`
GROUP BY soil_type
ORDER BY avg_ph;

-- 2. Climate influence on soil pH
SELECT
  ROUND(temperature_c, 0) AS temp_bucket,
  ROUND(AVG(soil_ph), 2) AS avg_ph
FROM `smart-agriculture-insights.agri.crop`
GROUP BY temp_bucket
ORDER BY temp_bucket;

-- 3. High-risk acidic soil regions
SELECT
  region,
  country,
  ROUND(AVG(soil_ph), 2) AS avg_ph
FROM `smart-agriculture-insights.agri.crop`
GROUP BY region, country
HAVING AVG(soil_ph) < 5.5
ORDER BY avg_ph;

-- 4. Nutrient correlation overview
SELECT
  ROUND(AVG(nitrogen), 1) AS avg_n,
  ROUND(AVG(phosphorus), 1) AS avg_p,
  ROUND(AVG(potassium), 1) AS avg_k
FROM `smart-agriculture-insights.agri.crop`;
