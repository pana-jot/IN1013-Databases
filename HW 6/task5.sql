--1

SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(rb.bill_no) AS bill_count
FROM restStaff rs
INNER JOIN restBill rb ON rs.staff_no = rb.waiter_no
GROUP BY rs.first_name, rs.surname, rb.bill_date
HAVING COUNT(rb.bill_no) >= 2;



--2

SELECT rr.room_name, COUNT(rr.table_no) AS table_count
FROM restRest_table rr
WHERE rr.no_of_seats > 6
GROUP BY rr.room_name;


--3

SELECT rrt.room_name, SUM(rb.bill_total) AS total_bill_amount
FROM restRest_table rrt
INNER JOIN restBill rb ON rrt.table_no = rb.table_no
GROUP BY rrt.room_name;


--4 

SELECT hs.first_name, hs.surname, SUM(rb.bill_total) AS total_bill_amount
FROM restStaff hs
INNER JOIN restStaff ws ON hs.staff_no = ws.headwaiter
INNER JOIN restBill rb ON ws.staff_no = rb.waiter_no
GROUP BY hs.first_name, hs.surname
ORDER BY total_bill_amount DESC;



--5

SELECT b.cust_name, AVG(b.bill_total) AS avg_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;


--6

SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(rb.bill_no) AS bill_count
FROM restStaff rs
INNER JOIN restBill rb ON rs.staff_no = rb.waiter_no
GROUP BY rs.first_name, rs.surname, rb.bill_date
HAVING COUNT(rb.bill_no) >= 3;
