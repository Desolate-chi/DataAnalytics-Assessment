-- Categorize customers by their average monthly transaction frequency and count how many fall into each category
SELECT CASE
            WHEN avg_transaction_per_month >= 10 THEN 'High Frequency'
            WHEN avg_transaction_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category, count(u_id) AS customer_count,
        ROUND(AVG(avg_transaction_per_month),2) AS avg_transaction_per_month FROM(
-- Calculate average monthly transactions per customer
SELECT u_id,ROUND(AVG(monthly_count),2) AS avg_transaction_per_month
FROM(
-- Count distinct transactions per customer per month
SELECT u.id AS u_id, YEAR(s.transaction_date) AS year, 
MONTH (s.transaction_date) AS month,
COUNT(DISTINCT s.transaction_reference) AS monthly_count
from savings_savingsaccount AS s
JOIN users_customuser AS u
ON s.owner_id = u.id
GROUP BY u.id,YEAR(s.transaction_date),MONTH(s.transaction_date)
) AS sub
GROUP BY u_id
)AS subs
GROUP BY frequency_category
ORDER BY avg_transaction_per_month DESC