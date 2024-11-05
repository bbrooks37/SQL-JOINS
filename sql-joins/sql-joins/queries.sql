-- Write your queries here
-- First Query 
-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id .
SELECT 
    o.id AS owner_id, o.first_name, o.last_name, 
    v.id AS vehicles_id, v.make, v.model, v.year, v.price, v.owner_id
FROM 
    owners o
FULL OUTER JOIN 
    vehicles.v 
ON 
    o.id = v.owner_id;
 

-- Second Query 
-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. The first_name should be ordered in ascending order.
 SELECT o.first_name, o.last_name, COUNT(v.id) AS count
 FROM owners o
 LEFT JOIN vehicles v ON o.id = v.owner_id
 GROUP BY o.first_name, o.last_name
 ORDER BY o.first_name ASC;

-- Third Query
-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.
SELECT o.first_name, o.last_name, 
       FLOOR(AVG(v.price)) AS avg_price, 
       COUNT(v.id) AS count 
FROM owners o
JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.first_name, o.last_name
HAVING COUNT(v.id) > 1 AND AVG(v.price) > 10000
ORDER BY o.first_name DESC;
