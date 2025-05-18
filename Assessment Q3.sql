-- Identify accounts with no confirmed transactions in over a year
SELECT s.plan_id, s.owner_id, 
p.description AS type,
MAX(s.transaction_date) AS latest_date,
DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactive_days
FROM plans_plan AS p
JOIN savings_savingsaccount AS s
ON p.id=s.plan_id
-- filter outcome based on above zero amount with the investment and savings account is >1
WHERE s.confirmed_amount > 0 
AND (p.is_a_fund > 0 OR p.is_regular_savings > 0)
GROUP BY s.owner_id, s.plan_id, p.description
HAVING inactive_days > '365'