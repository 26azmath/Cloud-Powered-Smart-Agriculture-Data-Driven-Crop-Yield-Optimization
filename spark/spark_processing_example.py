"""
Apache Spark Batch Processing Example
Project: Smart Agriculture Insights

Purpose:
Demonstrate large-scale aggregation of soil and weather data
aligned with the project architecture.
"""

from pyspark.sql import SparkSession
from pyspark.sql.functions import avg, round as spark_round

spark = SparkSession.builder \
    .appName("SoilHealthBatchAnalytics") \
    .getOrCreate()

# Load cleaned reminder dataset
df = spark.read.option("header", True).csv("data/soil_weather_clean.csv")

# Convert columns
df = df.selectExpr(
    "region",
    "country",
    "soil_type",
    "CAST(soil_ph AS DOUBLE) soil_ph",
    "CAST(temperature_c AS DOUBLE) temperature_c"
)

# Average soil pH by region
ph_by_region = df.groupBy("region", "country") \
    .agg(spark_round(avg("soil_ph"), 2).alias("avg_soil_ph"))

ph_by_region.show()

spark.stop()
