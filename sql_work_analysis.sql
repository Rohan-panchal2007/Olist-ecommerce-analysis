-- 1. TOP 10 CATEGORIES BY REVENUE
SELECT product_category_name_english,
ROUND(SUM(total_order_value)) as total_revenue
FROM olist_dataset
GROUP BY product_category_name_english
ORDER BY total_revenue desc
LIMIT 10;

-- 2. PAYMENT TYPE DISTRIBUTION
SELECT payment_type,
count(*) as total_orders
FROM olist_dataset
GROUP BY payment_type
ORDER BY total_orders desc;

-- 3. REVIEW SCORE DISTRIBUTION
SELECT review_score,
count(*) as total_reviews
FROM olist_dataset
GROUP BY review_score
ORDER BY total_reviews desc;

-- 4. TOP 10 STATES BY ORDER
SELECT customer_state,
COUNT(distinct order_id) AS total_orders
FROM olist_dataset
GROUP BY customer_state
ORDER BY total_orders DESC
LIMIT 10;

-- 5. AVERAGE DELIVERY DAYS BY STATE

SELECT customer_state,
ROUND(AVG(delivery_days)) AS avg_delivery_days
FROM olist_dataset
GROUP BY customer_state
ORDER BY avg_delivery_days DESC
LIMIT 10;

-- 6. REPEAT PURCHASE RATE
SELECT purchase_count,
COUNT(*) AS total_customers
FROM (
    SELECT customer_unique_id,
    COUNT(DISTINCT order_id) AS purchase_count
    FROM olist_dataset
    GROUP BY customer_unique_id
) T
GROUP BY purchase_count
ORDER BY purchase_count;

-- 7. AVERAGE ORDER VALUE BY PAYMENTS METHOD
SELECT payment_type,
ROUND(AVG(total_order_value), 2) AS avg_order_value
FROM olist_dataset
GROUP BY payment_type
ORDER BY avg_order_value DESC;

-- 8. LATE VS ON-TIME DELIVERY COUNT
SELECT 
CASE 
    WHEN delay_days > 0 THEN 'Late'
    WHEN delay_days <= 0 THEN 'On Time'
END AS delivery_status,
COUNT(*) AS total_orders,
ROUND(AVG(review_score), 2) AS avg_review_score
FROM olist_dataset
GROUP BY delivery_status;






