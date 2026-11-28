-- Customer Dimension

CREATE OR REPLACE TABLE dunnhumby_project.gold.dim_customer AS
SELECT DISTINCT 
    household_key,
    classification_1 AS age_group,
    classification_2,
    classification_3,
    classification_4,
    classification_5,
    homeowner_desc,
    kid_category_desc
FROM dunnhumby_project.silver.transactions_enriched;

-- Product Dimension

CREATE OR REPLACE TABLE dunnhumby_project.gold.dim_product AS
SELECT DISTINCT 
    product_id,
    department,
    commodity_desc,
    sub_commodity_desc,
    manufacturer,
    brand,
    curr_size_of_product
FROM dunnhumby_project.silver.transactions_enriched;

-- Sales Fact

CREATE OR REPLACE TABLE dunnhumby_project.gold.fact_sales AS
SELECT 
    -- Foreign Keys (Links to Dimensions)
    household_key,
    product_id,
    basket_id,
    store_id,
    
    -- Time Dimensions
    day,
    week_no,
    trans_time,
    
    -- Measures (The numbers we will analyze)
    quantity,
    sales_value,
    retail_disc,
    coupon_disc,
    coupon_match_disc,
    shelf_price
FROM dunnhumby_project.silver.transactions_enriched;