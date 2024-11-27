--1

SELECT rb.cust_name
FROM restStaff hw
INNER JOIN restStaff w ON hw.staff_no = w.headwaiter
INNER JOIN restBill rb ON w.staff_no = rb.waiter_no
WHERE hw.first_name = 'Charles' 
  AND rb.bill_total > 450.00;


--2

SELECT hs.first_name, hs.surname
FROM restStaff hs
INNER JOIN restStaff ws ON hs.staff_no = ws.headwaiter
INNER JOIN restBill rb ON ws.staff_no = rb.waiter_no
WHERE rb.cust_name = 'Nerida Smith' 
  AND rb.bill_date = 160111;


--3

SELECT rb.cust_name
FROM restBill rb
WHERE rb.bill_total = (
    SELECT MIN(b.bill_total)
    FROM restBill b
);



--4 

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);


--5

SELECT rb.cust_name, 
       hw.first_name AS headwaiter_first_name, 
       hw.surname AS headwaiter_surname, 
       rt.room_name
FROM restStaff hw
INNER JOIN restStaff w ON hw.staff_no = w.headwaiter
INNER JOIN restRest_table rt ON rt.table_no = w.table_no
INNER JOIN restBill rb ON rb.table_no = rt.table_no
WHERE rb.bill_total = (
    SELECT MAX(b.bill_total)
    FROM restBill b
);
