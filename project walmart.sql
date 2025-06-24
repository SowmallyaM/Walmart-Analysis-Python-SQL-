-- Walmart Project Queries - MySQL
show databases;
use walmart_db;
show tables;
-- Displaying the table
select * from walmart;
-- Find all type of payment methods 
select distinct payment_method from walmart;

-- Business Problem 
-- Q1: Find different payment methods, number of transactions, and quantity sold by payment method
select payment_method,count(*) total_tranjuction, sum(quantity) total_quantity from walmart group by payment_method;

-- Q2: Identify the highest-rated category in each branch display the branch, category, and avg rating
SELECT branch, category, avg_rating, ranked
FROM (
    SELECT 
        branch,
        category,
        AVG(rating) AS avg_rating,
        RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) desc) ranked
    FROM walmart
    GROUP BY branch, category
) AS ranked
WHERE ranked = 1;

-- Q3: Identify the busiest day for each branch based on the number of transactions
select * 
from (
	select 
		branch, dayname(str_to_date(date, '%d/%m/%y')) days, count(*) total_transaction,
		rank() over(partition by branch order by count(*) desc) ranked
	from walmart group by branch, days
) ranked
where ranked=1;

-- Q4: Calculate the total quantity of items sold per payment method
select 
	payment_method, sum(quantity) total_quantity 
from walmart 
group by payment_method order by total_quantity desc;

-- Q5: Determine the average, minimum, and maximum rating of categories for each city
select city, category, round( avg(rating),2) avg_rating, min(rating) min_rating, max(rating) max_rating from walmart group by city, category;

-- Q6: Calculate the total profit for each category

select category, round(sum(unit_price * quantity * profit_margin),2) total_profit from walmart group by category order by total_profit desc;

-- Q7: Determine the most common payment method for each branch
select branch, payment_method 
from (
select branch, payment_method, count(*) total_trans,
rank() over(partition by branch order by count(*) desc) ranked
 from walmart group by branch, payment_method
 ) ranked
 where ranked = 1;
 
 -- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
 select branch,
 case
		when hour(time(time)) < 12 then 'Morning'
        when hour(time(time)) between 12 and 17 then 'Afternoon'
        else 'Evening'
end sift,
count(*) no_sales
from walmart
group by branch, sift order by branch, no_sales desc;

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
 select * from walmart;
WITH revenue_2022 AS (
    SELECT 
        branch, SUM(total_price) revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch, SUM(total_price) revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;
