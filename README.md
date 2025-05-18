# DataAnalytics-Assessment
An assessment to evaluate my ability to work with relational databases by writing SQL queries to solve real business problems
## Question 1 : High Value Customers with Multiple Product
## Task 
Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.
## Approach
1. Created the name column by usimg the concat function to create a new column
2. Used the boolean from is_a_fund and is_regular_saving to determine with user have both accounts
3. The having function was used to filter out clients that do not have both accounts
## Challenge
Confusion occurred in the saving and investment count which has boolean field and the option between the sum and count(distinct), i ended up with sum because it was more reliable
## Question 2 : Transaction Frequency Analysis
## Task 
Calculate the average number of transactions per customer per month and categorize them.
## Approach
1. Created the categorizing column with case when
2. Calculated the transaction total
3. Found the average of the transcation total categorized by high, medium, low frequency
## Challenge
Because of the layering of the subquery i had to pay alot of attention to detail to ensure the alias are not
1. Mispelled incorrectly
2. Use repeatedly for different cases
## Question 3 : Account Inactivity Alert
## Task 
Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days).
## Approach
1. Extract customer with the latest transaction date using the MAX function
2. Found the difference between the current date and the latest date to find number of days inactive
3. Filter those inactive for 365 days with either savings or investment plan
## Challenge
I was stuck between the use of DATEDIFF or TIMESTAMPDIFF both provided different result and it came down to what i was trying to achieve 
## Question 4 : Customer Lifetime Value (CLV) Estimation
## Task 
For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate.
## Approach
1. Calculated account tenure in months using TIMESTAMPDIFF
2. Counted total transactions and computed average profit per transaction
3. Applied the CLV formula: Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
## Challenge
Figuring out how to combine all the calculations with the tenure_month and estimated clv was the sometime that took alittle bit of time and effort but i was able to figure out a solution
