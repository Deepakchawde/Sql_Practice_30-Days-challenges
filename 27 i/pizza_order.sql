-- 27/30 

-- SCHEMAS

DROP TABLE IF EXISTS orders;

-- Create the orders table
CREATE TABLE pizza (
    user_id INT,
    item_ordered VARCHAR(512)
);

-- Insert sample data into the orders table
INSERT INTO pizza VALUES 
('1', 'Pizza'),
('1', 'Burger'),
('2', 'Cold Drink'),
('2', 'Burger'),
('3', 'Burger'),
('3', 'Cold Drink'),
('4', 'Pizza'),
('4', 'Cold Drink'),
('5', 'Cold Drink'),
('6', 'Burger'),
('6', 'Cold Drink'),
('7', 'Pizza'),
('8', 'Burger');

-- Flipkart Data Analyst Interview Questions
-- Question: Write an SQL query to fetch user IDs that have only bought both 'Burger' and 'Cold Drink' items.

-- Expected Output Columns: user_id

select distinct user_id, count(distinct item_ordered)
from pizza
where  item_ordered  in ("Burger", "cold Drink") 
group by user_id
having count(distinct item_ordered)>=2

-- SELECT 
-- 	user_id
-- 	-- COUNT(DISTINCT item_ordered)
-- FROM pizza
-- GROUP BY user_id
-- HAVING COUNT(DISTINCT item_ordered) = 2
-- AND
-- 	SUM(CASE WHEN item_ordered IN ('Burger', 'Cold Drink') 
-- 		THEN 1
-- 		ELSE 0
-- 	END
-- 	) = 2  -- 2, 3, 6
