-- 1

SELECT DISTINCT rs.first_name, rs.surname
FROM restBill rb
INNER JOIN restStaff rs ON rb.waiter_no = rs.staff_no
WHERE rb.cust_name = 'Tanya Singh';


-- 2

SELECT DISTINCT rrm.room_date
FROM restStaff rs
INNER JOIN restRoom_management rrm ON rs.staff_no = rrm.headwaiter
WHERE rs.first_name = 'Charles'
  AND rrm.room_name = 'Green'
  AND rrm.room_date >= 160201 AND rrm.room_date <= 160229;


-- 3

SELECT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.headwaiter = (
    SELECT hs.headwaiter
    FROM restStaff hs
    WHERE hs.first_name = 'Zoe' AND hs.surname = 'Ball'
)
AND rs.staff_no NOT IN (
    SELECT zs.staff_no
    FROM restStaff zs
    WHERE zs.first_name = 'Zoe' AND zs.surname = 'Ball'
);



-- 4

SELECT rb.cust_name, 
       rb.bill_total AS Amount_Spent, 
       rs.first_name AS Waiter_First_Name, 
       rs.surname AS Waiter_Surname
FROM restStaff rs
INNER JOIN restBill rb ON rb.waiter_no = rs.staff_no
ORDER BY rb.bill_total DESC;



-- 5

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.table_no IN (SELECT table_no FROM restBill WHERE bill_no IN (00014, 00017));


-- 6 

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restRoom_management rm ON s.staff_no = rm.headwaiter
JOIN restBill b ON rm.room_name = 'Blue' AND rm.room_date = 160312 AND rm.room_name = (SELECT room_name FROM restRest_table WHERE restRest_table