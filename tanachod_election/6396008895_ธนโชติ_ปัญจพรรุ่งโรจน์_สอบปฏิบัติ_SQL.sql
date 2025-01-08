CREATE DATABASE Aircraft;
USE Aircraft;

-- ข้อสอบภาคปฏิบัติ ชุดวิชาการจัดการระบบฐานข้อมูล (96408) ภาค 2/2565 วันที่ 15 พ.ค. 66
-- ข้อ 1.
SELECT AC_NUM, PIL_NUM, CUS_CODE, CHAR_DESTINATION, CHAR_DISTANCE, CHAR_HOURS
FROM charter
WHERE CHAR_HOURS > 7 OR CHAR_DISTANCE < 400
ORDER BY CHAR_DISTANCE DESC

-- ข้อ 2.
SELECT customer.CUS_CODE, CUS_FNAME, CUS_LNAME, CUS_PHONE
FROM customer
WHERE customer.CUS_CODE NOT IN
(SELECT charter.CUS_CODE FROM charter WHERE charter.CUS_CODE = customer.CUS_CODE)

-- ข้อ 3.
SELECT charter.CUS_CODE, customer.CUS_FNAME, COUNT(charter.CUS_CODE) as 'Time of contact'
FROM customer, charter
WHERE customer.CUS_CODE = charter.CUS_CODE
GROUP BY charter.CUS_CODE, CUS_FNAME
HAVING COUNT(*) < 3 
ORDER BY COUNT(charter.CUS_CODE) DESC;









