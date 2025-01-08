-- �Ԩ���� 5.1

-- ��� 1
DELETE FROM Employee 
WHERE 
EMP_TITLE = 'Mrs.' AND 
EMP_FNAME = 'Jitrlada' AND 
EMP_LNAME = 'Polnimit';

-- ��� 2
DELETE FROM Customer
WHERE CUS_CODE = 10018;

-- ��� 3
UPDATE customer
SET	cus_phone = '02-988-2588'
WHERE 
CUS_FNAME = 'Jittinan' AND 
CUS_LNAME = 'Pakdee' AND
CUS_PHONE = '844-2573';

-- ��� 4
UPDATE customer
SET	cus_phone = 45650.75
WHERE 
CUS_FNAME = 'Pong' AND 
CUS_LNAME = 'Smith' AND
CUS_BALANCE = 19521.1;

-- ��� 5 Ẻ 1
UPDATE pilot
SET	PIL_MED_TYPE = '2'
FROM employee
WHERE
EMP_FNAME = 'George' AND 
EMP_LNAME = 'Lewis' AND
PIL_MED_TYPE = 1;

-- ��� 5 Ẻ 2
UPDATE PILOT
SET PIL_MED_TYPE = '2'
WHERE EMP_NUM IN
(SELECT�EMP_NUM�FROM EMPLOYEE�
WHERE EMP_FNAME = 'George'
AND EMP_LNAME = 'Lewis')
AND PIL_MED_TYPE = '1'

/* ====================================================================================== */

-- �Ԩ���� 5.2 --

-- ���.1 �١�� 18
SELECT *
FROM charter
ORDER BY CHAR_DATE DESC;

-- ���.2 �١�� 8
SELECT *
FROM charter
WHERE CHAR_DATE BETWEEN '2011-02-13' AND '2011-02-14';

-- ���.3 �١�� 4 
SELECT CHAR_DATE, CHAR_DESTINATION, CHAR_DISTANCE, CHAR_HOURS 
FROM charter
WHERE AC_NUM = '2778V';

-- ���.4 �١�� 5
SELECT CUS_FNAME, CUS_LNAME, CUS_PHONE, CUS_BALANCE
FROM customer
WHERE CUS_BALANCE > 0; 

-- ���.5 Ẻ��� 1 �١�� 3
SELECT EMP_TITLE, EMP_FNAME, EMP_LNAME
FROM pilot, employee
WHERE PIL_license = 'com' AND employee.EMP_NUM = pilot.EMP_NUM

-- ��� 5. Ẻ��� 2 �١�� 3
SELECT EMP_TITLE, EMP_FNAME, EMP_LNAME
FROM employee
WHERE EMP_NUM IN
(SELECT EMP_NUM FROM pilot where PIL_LICENSE = 'com');

-- ���.6 �١�� 4
SELECT CHAR_DATE, AC_NUM, CHAR_DESTINATION, CUS_FNAME, CUS_LNAME, CUS_AREACODE, CUS_PHONE
FROM charter, customer
WHERE AC_NUM = '2778V' AND charter.CUS_CODE = customer.CUS_CODE;

-- ���.7 �١�� 1
SELECT CUS_FNAME, CUS_LNAME, CUS_AREACODE, CUS_PHONE
FROM customer
WHERE CUS_BALANCE > 30000 AND CUS_CODE IN
(
	SELECT CUS_CODE
	FROM charter
	WHERE AC_NUM = '1484F'
)

-- ���.8 �١�� 9
SELECT CHAR_DATE, CUS_FNAME, CUS_LNAME, CUS_AREACODE, CUS_PHONE
FROM charter, customer
WHERE CUS_FNAME LIKE '%_i%' AND charter.CUS_CODE = customer.CUS_CODE;

-- ���.9 �١�� 6 
SELECT CHAR_NUM, CHAR_DATE, CHAR_DESTINATION, CHAR_HOURS, aircraft.AC_NUM, MOD_NAME
FROM charter, model, aircraft
WHERE CO_PIL_NUM IS NOT NULL AND CO_PIL_NUM != 'NULL' AND charter.AC_NUM = aircraft.AC_NUM AND aircraft.MOD_CODE = model.MOD_CODE

-- ���.10 �١�� 4 
SELECT CHAR_DATE, AC_NUM, EMP_FNAME, EMP_LNAME
FROM charter, employee, pilot
WHERE charter.PIL_NUM = pilot.PIL_NUM AND pilot.EMP_NUM = employee.EMP_NUM AND AC_NUM = '2778V'

-- ���.11 �١�� 7
SELECT CHAR_DATE, CHAR_NUM, aircraft.AC_NUM, MOD_NAME
FROM charter, aircraft, model
WHERE CHAR_DATE >= '2011-02-15' AND charter.AC_NUM = aircraft.AC_NUM AND aircraft.MOD_CODE = model.MOD_CODE;

-- ���.12 �١�� 4
SELECT CHAR_DATE, CHAR_DESTINATION, aircraft.AC_NUM, MOD_CHG_MILE, CHAR_DISTANCE, CUS_FNAME, CUS_LNAME
FROM charter, customer, model, aircraft
WHERE CHAR_DESTINATION = 'ATL' AND charter.CUS_CODE = customer.CUS_CODE AND charter.AC_NUM = aircraft.AC_NUM AND aircraft.MOD_CODE = model.MOD_CODE;

-- ���.13 �١�� 7 
SELECT CHAR_DATE, aircraft.AC_NUM, EMP_FNAME, (CHAR_FUEL / CHAR_HOURS) as 'Fuel Per Hour'
FROM charter, aircraft, employee, pilot
WHERE CHAR_DATE >= '2011-02-15' AND charter.AC_NUM = aircraft.AC_NUM AND charter.PIL_NUM = pilot.PIL_NUM AND pilot.EMP_NUM = employee.EMP_NUM

-- ���.14 �١�� 11
SELECT CHAR_DATE, CHAR_DESTINATION, MOD_CHG_MILE, (CHAR_DISTANCE*MOD_CHG_MILE) as 'Mileage Charge'
FROM charter, model, aircraft
WHERE CHAR_DATE >= '2011-02-14' AND charter.AC_NUM = aircraft.AC_NUM AND aircraft.MOD_CODE = model.MOD_CODE

-- ���.15 �١�� 5
SELECT CHAR_DATE, (CHAR_DISTANCE*MOD_CHG_MILE) as 'Mileage Charge', (CHAR_HOURS_WAIT * 50) as 'Waiting Charge', ('Mileage Charge' + 'Waiting Charge') as 'Total Charge'
FROM charter, model, aircraft
WHERE CHAR_DATE >= '2011-02-16' AND charter.AC_NUM = aircraft.AC_NUM AND aircraft.MOD_CODE = model.MOD_CODE

-- ���.16 �١�� 1, 18590.634000, 0.00, 55285.19, 185906.34
SELECT AVG(CUS_BALANCE) as 'Average Balance', MIN(CUS_BALANCE) as 'Minimum Balance', MAX(CUS_BALANCE) as 'Maximum Balance', SUM(CUS_BALANCE) as 'Average Balance'
FROM customer

-- ���.17 �١�� 4
SELECT aircraft.AC_NUM, COUNT(CHAR_NUM) as 'Number of Flown', SUM(CHAR_DISTANCE) as 'Total Distance', SUM(CHAR_HOURS) as 'Total Hours'
FROM aircraft, charter
WHERE aircraft.AC_NUM = charter.AC_NUM
GROUP BY aircraft.AC_NUM

-- ���.18 �Դ �١�� 7 
SELECT charter.CHAR_DESTINATION, COUNT(CHAR_NUM) as 'Charter Amount', MIN(CHAR_HOURS) as 'Minimum Hours'
FROM charter
GROUP BY CHAR_DESTINATION
ORDER BY COUNT(char_num) DESC

-- ���.19 �١�� 1
SELECT AC_NUM, AC_TTEL, MOD_NAME, (MOD_CHG_MILE) as 'CHARGE PER MILE'
FROM aircraft, model
WHERE MOD_CHG_MILE < 100 AND aircraft.MOD_CODE = model.MOD_CODE

-- ���.20 �١�� 1
SELECT AC_NUM, COUNT(CHAR_NUM) as 'Charter Amount', MAX(CHAR_HOURS) as 'Maxmum House'
FROM charter
GROUP BY AC_NUM 
HAVING COUNT(*) > 4 AND charter.AC_NUM = AC_NUM
ORDER BY COUNT(CHAR_NUM) DESC;









