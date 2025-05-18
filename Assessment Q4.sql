-- Estimate Customer Lifetime Value (CLV) based on tenure and transaction behavior
SELECT u.id AS customer_id,CONCAT(u.first_name," ", u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_in_months,
    COUNT(s.transaction_reference) AS total_transactions,
    ROUND((COUNT(s.transaction_reference) / 
    NULLIF(TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()), 0)) * 12 
    * (SUM(s.confirmed_amount) * 0.001 / COUNT(s.transaction_reference)), 2
    ) AS estimated_clv
FROM users_customuser AS u
JOIN savings_savingsaccount AS s
    ON u.id = s.owner_id
WHERE s.confirmed_amount > 0
GROUP BY u.id
ORDER BY estimated_clv DESC

