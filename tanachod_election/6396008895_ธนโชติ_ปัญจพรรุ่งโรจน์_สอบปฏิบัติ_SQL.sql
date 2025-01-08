CREATE DATABASE Aircraft;
USE Aircraft;

-- ����ͺ�Ҥ��Ժѵ� �ش�Ԫҡ�èѴ����к��ҹ������ (96408) �Ҥ 2/2565 �ѹ��� 15 �.�. 66
-- ��� 1.
SELECT AC_NUM, PIL_NUM, CUS_CODE, CHAR_DESTINATION, CHAR_DISTANCE, CHAR_HOURS
FROM charter
WHERE CHAR_HOURS > 7 OR CHAR_DISTANCE < 400
ORDER BY CHAR_DISTANCE DESC

-- ��� 2.
SELECT customer.CUS_CODE, CUS_FNAME, CUS_LNAME, CUS_PHONE
FROM customer
WHERE customer.CUS_CODE NOT IN
(SELECT charter.CUS_CODE FROM charter WHERE charter.CUS_CODE = customer.CUS_CODE)

-- ��� 3.
SELECT charter.CUS_CODE, customer.CUS_FNAME, COUNT(charter.CUS_CODE) as 'Time of contact'
FROM customer, charter
WHERE customer.CUS_CODE = charter.CUS_CODE
GROUP BY charter.CUS_CODE, CUS_FNAME
HAVING COUNT(*) < 3 
ORDER BY COUNT(charter.CUS_CODE) DESC;









