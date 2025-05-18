-- Retrieve clients' names with counts of investment and savings accounts with total deposits
SELECT p.owner_id, CONCAT(u.first_name," ", u.last_name) AS name, 
SUM(p.is_a_fund) AS investment_count, 
SUM(p.is_regular_savings) AS savings_count, 
SUM(s.amount) AS total_deposit
FROM plans_plan AS p
JOIN users_customuser AS u
ON p.owner_id=u.id
JOIN savings_savingsaccount AS s
ON s.plan_id= p.id
GROUP BY p.owner_id
-- Only include customers with both investment and savings accounts
HAVING SUM(p.is_a_fund) > 0
AND SUM(p.is_regular_savings) > 0
ORDER BY total_deposit DESC 