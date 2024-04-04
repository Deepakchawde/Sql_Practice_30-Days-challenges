-- Day 02/30 days SQL challenge


-- SCHEMA


-- Create pages table
CREATE TABLE pages (
    page_id INTEGER PRIMARY KEY,
    page_name VARCHAR(255)
);

-- Insert data into pages table
INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');

-- Create page_likes table
CREATE TABLE page_likes (
    user_id INTEGER,
    page_id INTEGER,
    liked_date DATETIME,
    FOREIGN KEY (page_id) REFERENCES pages(page_id)
);

-- Insert data into page_likes table
INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');



/*
Question 1:
Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.
*/


select * from pages

select * from page_likes



select p.page_id
from pages as p
left join page_likes as l 
on p.page_id = l.page_id
group by p.page_id
having count(l.page_id = 0)
order by p.page_id asc



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create the events table
CREATE TABLE events (
    app_id INTEGER,
    event_type VARCHAR(10),
    timestamp DATETIME
);

-- Insert records into the events table
INSERT INTO events (app_id, event_type, timestamp) VALUES
(123, 'impression', '2022-07-18 11:36:12'),
(123, 'impression', '2022-07-18 11:37:12'),
(123, 'click', '2022-07-18 11:37:42'),
(234, 'impression', '2022-07-18 14:15:12'),
(234, 'click', '2022-07-18 14:16:12');

/*

Question 2: 
Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
Definition and note:
Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.
Expected Output Columns: app_id, ctr
*/
select * from events

select  app_id , round((sum(case when event_type = "click" then 1 else 0 end)/sum(case when event_type = "impression" then 1 else 0 end))* 100.0,2) as ctr
from events
where year(timestamp )= 2022
group by  app_id



select app_id
from events
where year(timestamp) = 2022
group by app_id


SELECT 
    app_id,
    ROUND((100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) / COUNT(*)), 2) AS ctr
FROM 
    events
WHERE 
    YEAR(timestamp) = 2022
GROUP BY 
    app_id;