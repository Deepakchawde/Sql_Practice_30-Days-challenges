-- --  Day 19/30 SQL Challenge

-- Google Interview Question for DA

CREATE TABLE student_names(
    student_id INT,
    name VARCHAR(50)
);

-- Insert the records
INSERT INTO student_names (student_id, name) VALUES
(1, 'RAM'),
(2, 'ROBERT'),
(3, 'ROHIM'),
(4, 'RAM'),
(5, 'ROBERT');


-- Question 
-- Get the count of distint student that are not unique 


select count(*) as distinct_student
from (  select name, count(name ) as count
	from student_names
		group by name 
		having count(name ) =1 ) as subquery