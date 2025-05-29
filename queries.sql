-- 1. Total Revenue by Product Category
SELECT p.category, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category;

-- 2. Monthly Sales Trends
SELECT d.year, d.month, SUM(f.revenue) AS monthly_sales
FROM fact_sales f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- 3. Revenue by Region
SELECT s.region, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.region;

-- 4. Top Products by Quantity Sold
SELECT p.product_name, SUM(f.quantity_sold) AS total_quantity
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;