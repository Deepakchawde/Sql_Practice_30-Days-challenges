use  days_30_by_zero_analytic

create table transacction(
	id int primary key,
    country varchar(25),
    state varchar(20),
    amount int,
    trans_date date
);

INSERT INTO Transacction (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

select * from transacction


/*
Write an SQL query to find for each month and country, 
the number of transactions and their total amount, 
the number of approved transactions and their total amount.

Return the result table in in below order.RANGE


Output: 
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+
*/

-- SELECT 
-- 	substr(trans_date,1,7)as Months,
-- 	country,
-- 	COUNT(1) as trans_count,
-- 	SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) as approved_count,
-- 	SUM(amount) as trans_total_amount,
-- 	SUM(CASE WHEN state= 'approved' THEN amount ELSE 0 END) as approved_total_amount
-- FROM transacction
-- GROUP BY 1, 2;

select substr(trans_date,1,7)as Months,
country,
count(id) as trans_count,
sum(case when state = "approved" then 1 else 0 end) as approved_count,
sum(amount ) as trans_total_amount,
SUM(CASE WHEN state= 'approved' THEN amount ELSE 0 END) as approved_total_amount
from transacction
group by months, country