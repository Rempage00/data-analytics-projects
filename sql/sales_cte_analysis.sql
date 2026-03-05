WITH
sales_per_customer AS
(
  SELECT
     c.customer_name,
     c.country,
     SUM(s.revenue) AS total_revenue
  FROM customers c
  JOIN sales s
     ON c.customer_id = s.customer_id
  GROUP BY
     c.customer_name,
     c.country
),
avg_sales_per_country AS
(
  SELECT
     country,
     AVG(total_revenue) AS avg_country_revenue
  FROM sales_per_customer
  GROUP BY country
)

SELECT
   spc.customer_name,
   spc.country,
   spc.total_revenue
FROM sales_per_customer spc;
