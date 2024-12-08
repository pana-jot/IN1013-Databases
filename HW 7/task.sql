--1 

CREATE VIEW samsBills AS
SELECT 
    w.first_name, 
    w.surname, 
    b.bill_date, 
    c.cust_name, 
    b.bill_total
FROM 
    bills AS b
INNER JOIN 
    waiters AS w ON b.waiter_id = w.waiter_id
INNER JOIN 
    customers AS c ON b.customer_id = c.customer_id
WHERE 
    w.first_name = 'Sam' AND w.surname = 'Pitt';

--2

SELECT *
FROM samsBills
WHERE bill_total > 400.00;

--3

CREATE VIEW roomTotals AS
SELECT 
    rooms.room_name, 
    SUM(bills.bill_total) AS total_sum
FROM 
    bills
JOIN 
    rooms ON bills.room_id = rooms.room_id
GROUP BY 
    rooms.room_name;

--4

CREATE VIEW teamTotals AS
SELECT 
    CONCAT(w.first_name, ' ', w.surname) AS headwaiter_name, 
    SUM(b.bill_total) AS total_sum
FROM 
    waiters w
LEFT JOIN 
    bills b ON w.waiter_id = b.waiter_id
GROUP BY 
    w.waiter_id, headwaiter_name;

