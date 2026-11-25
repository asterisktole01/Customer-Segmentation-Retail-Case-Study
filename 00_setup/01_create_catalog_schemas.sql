-- 1. Create a dedicated Catalog for the project
CREATE CATALOG IF NOT EXISTS dunnhumby_project;

-- 2. Create the Medallion Schemas (Databases)
CREATE SCHEMA IF NOT EXISTS dunnhumby_project.bronze; -- Raw data
CREATE SCHEMA IF NOT EXISTS dunnhumby_project.silver; -- Cleaned data
CREATE SCHEMA IF NOT EXISTS dunnhumby_project.gold;   -- Business-ready data (RFM, Aggregations)