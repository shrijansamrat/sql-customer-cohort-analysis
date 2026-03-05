SELECT 
c.customer_unique_id,
MIN(DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m')) AS cohort_month
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id;


SELECT 
c.customer_unique_id,
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS order_month,
MIN(DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m')) 
OVER (PARTITION BY c.customer_unique_id) AS cohort_month
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;


SELECT 
customer_unique_id,
cohort_month,
order_month,
TIMESTAMPDIFF(
MONTH,
STR_TO_DATE(cohort_month,'%Y-%m'),
STR_TO_DATE(order_month,'%Y-%m')
) AS cohort_index
FROM (
SELECT 
c.customer_unique_id,
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS order_month,
MIN(DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m')) 
OVER (PARTITION BY c.customer_unique_id) AS cohort_month
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
) AS cohort_data;

SELECT 
cohort_month,
cohort_index,
COUNT(DISTINCT customer_unique_id) AS total_customers
FROM (
SELECT 
customer_unique_id,
cohort_month,
order_month,
TIMESTAMPDIFF(
MONTH,
STR_TO_DATE(cohort_month,'%Y-%m'),
STR_TO_DATE(order_month,'%Y-%m')
) AS cohort_index
FROM (
SELECT 
c.customer_unique_id,
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS order_month,
MIN(DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m')) 
OVER (PARTITION BY c.customer_unique_id) AS cohort_month
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
) AS cohort_data
) AS cohort_index_table
GROUP BY cohort_month, cohort_index
ORDER BY cohort_month, cohort_index;

SELECT 
cohort_month,
cohort_index,
COUNT(DISTINCT customer_unique_id) AS total_customers
FROM (
SELECT 
customer_unique_id,
cohort_month,
order_month,
TIMESTAMPDIFF(
MONTH,
STR_TO_DATE(cohort_month,'%Y-%m'),
STR_TO_DATE(order_month,'%Y-%m')
) AS cohort_index
FROM (
SELECT 
c.customer_unique_id,
DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') AS order_month,
MIN(DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m')) 
OVER (PARTITION BY c.customer_unique_id) AS cohort_month
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
) AS cohort_data
) AS cohort_index_table
GROUP BY cohort_month, cohort_index
ORDER BY cohort_month, cohort_index;