--Q1
WITH orders_gap AS (
SELECT customer_id,
order_date,
LAG(TO_DATE(order_date, 'YYYY-MM-DD')) OVER (
PARTITION BY customer_id ORDER BY order_date
),
TO_DATE(order_date, 'YYYY-MM-DD') - LAG(TO_DATE(order_date, 'YYYY-MM-DD')) OVER (
PARTITION BY customer_id ORDER BY order_date
) gap_days
FROM orders
WHERE order_status = 'delivered'
)

SELECT PERCENTILE_CONT(0.5) 
WITHIN GROUP (ORDER BY gap_days) med_gap 
FROM orders_gap
WHERE gap_days IS NOT NULL

--Q2
SELECT segment,
AVG((price - cogs)/price) avg_pmargin
FROM products
GROUP BY segment
ORDER BY avg_pmargin DESC

--Q3
SELECT return_reason,
COUNT(*)
FROM products p
JOIN returns r
ON p.product_id = r.product_id
AND category = 'Streetwear'
GROUP BY return_reason
ORDER BY COUNT(*) DESC

--Q4
SELECT traffic_source, 
AVG(bounce_rate) avg_br
FROM web_traffic
GROUP BY traffic_source
ORDER BY AVG(bounce_rate)

--Q5
SELECT SUM(promo)::FLOAT * 100 / COUNT(*)::FLOAT percent
FROM
(SELECT 
(CASE WHEN
promo_id IS NOT NULL THEN 1
ELSE 0
END) promo
FROM order_items) T

--Q6
SELECT age_group, 
COUNT(order_id)::FLOAT / COUNT(DISTINCT c.customer_id)::FLOAT avg_ord
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.customer_id
GROUP BY age_group
ORDER BY avg_ord DESC

--Q7
--sales_train: từ 2012-07-04 đến 2022-12-31 chính là file sales luôn
--sales kco key để join -> tính lại revenue từ order_items
SELECT region, SUM(quantity * unit_price) total
FROM orders o
JOIN order_items ot 
ON o.order_id = ot.order_id
JOIN geography g
ON o.zip = g.zip
GROUP BY region
ORDER BY total DESC

--Q8
SELECT payment_method, COUNT(*) 
FROM orders
WHERE order_status = 'cancelled'
GROUP BY payment_method

--Q9
SELECT p.size,
       (COUNT(r.product_id)::FLOAT * 100 / COUNT(*)::FLOAT) AS return_rate
FROM products p
JOIN order_items ot
  ON p.product_id = ot.product_id
LEFT JOIN returns r
  ON r.order_id = ot.order_id
 AND r.product_id = ot.product_id
GROUP BY p.size
ORDER BY return_rate DESC

--Q10
SELECT installments, AVG(payment_value) 
FROM payments GROUP BY installments
ORDER BY AVG(payment_value) DESC
