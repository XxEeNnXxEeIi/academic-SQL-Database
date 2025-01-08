CREATE TABLE Customer
(
	CUS_CODE char(5) PRIMARY KEY,
	CUS_FNAME char(15) NOT NULL,
	CUS_LNAME char(15) NOT NULL,
	CUS_AREACODE char(3) NOT NULL,
	CUS_PHONE char(12) NOT NULL,
	CUS_BALANCE numeric(10,2) NOT NULL
);

CREATE TABLE Employee
(
	EMP_NUM char(3) PRIMARY KEY,
	EMP_TITLE char(4) NOT NULL,
	EMP_FNAME char(15) NOT NULL,
	EMP_LNAME char(15) NOT NULL,
	EMP_ADDRESS char(50) NOT NULL,
	EMP_DOB datetime NOT NULL,
	EMP_HIRE_DATE datetime NOT NULL
);

CREATE TABLE Model
(
	MOD_CODE char(10) PRIMARY KEY,
	MOD_MANUFACTURER char(20) NOT NULL,
	MOD_NAME char(20) NOT NULL,
	MOD_SEAT int NOT NULL,
	MOD_CHG_MILE numeric(5,2) NOT NULL
);

CREATE TABLE Aircraft
(
	AC_NUM char(5) PRIMARY KEY,
	AC_TTAF numeric(6,2) NOT NULL,
	AC_TTEL numeric(6,2) NOT NULL,
	AC_TTER numeric(6,2) NOT NULL,
	MOD_CODE char(10) NOT NULL FOREIGN KEY REFERENCES Model (MOD_CODE)
);

CREATE TABLE Pilot
(
	PIL_NUM char(3) PRIMARY KEY,
	PIL_LICENSE char(4) NOT NULL,
	PIL_RATINGS char(30) NOT NULL,
	PIL_MED_TYPE char(1) NOT NULL,
	PIL_MED_DATE datetime NOT NULL,
	PIL_SKILL_DATE datetime NOT NULL,
	EMP_NUM char(3) NOT NULL FOREIGN KEY REFERENCES Employee (EMP_NUM)
);

CREATE TABLE Charter
(
	CHAR_NUM char(5) PRIMARY KEY,
	CHAR_DATE datetime NOT NULL,
	CHAR_DESTINATION char(3) NOT NULL,
	CHAR_DISTANCE int NOT NULL,
	CHAR_HOURS numeric(6,2) NOT NULL,
	CHAR_HOURS_WAIT numeric(6,2) NOT NULL,
	CHAR_FUEL numeric(6,2) NOT NULL,
	CUS_CODE char(5) NOT NULL FOREIGN KEY REFERENCES Customer (CUS_CODE),
	AC_NUM char(5) NOT NULL FOREIGN KEY REFERENCES Aircraft (AC_NUM),
	PIL_NUM char(3) NOT NULL FOREIGN KEY REFERENCES Pilot (PIL_NUM),
	CO_PIL_NUM char(3) REFERENCES Pilot (PIL_NUM)
);

-- กิจกรรม 4.2

-- ข้อ 2.1
ALTER TABLE Customer
ADD CUS_ADDR char(20);

-- ข้อ 2.2
ALTER TABLE Customer
ALTER COLUMN CUS_ADDR char(40);

--ข้อ 2.3
EXEC sp_rename 'dbo.customer.CUS_ADDR', 'CUS_ADDRESS', 'COLUMN';

-- ข้อ 2.4
ALTER TABLE Customer
DROP COLUMN CUS_ADDRESS;

-- ข้อ 3
INSERT INTO Customer VALUES 
('CS001', 'ชื่อ1', 'นามสกุล1', '001', '02-000-0001', 1000.00),
('CS002', 'ชื่อ2', 'นามสกุล2', '002', '02-000-0002', 2000.00),
('CS003', 'ชื่อ3', 'นามสกุล3', '003', '02-000-0003', 3000.00),
('CS004', 'ชื่อ4', 'นามสกุล4', '004', '02-000-0004', 4000.00),
('CS005', 'ชื่อ5', 'นามสกุล5', '005', '02-000-0005', 50000.00)

INSERT INTO Employee VALUES 
('E01', 'TT1', 'ชื่อ1', 'นามสกุล1', 'อเมริกา', '2020/05/14', '2023/05/14'),
('E02', 'TT2', 'ชื่อ2', 'นามสกุล2', 'รัสเซีย', '2020/05/14', '2023/05/14'),
('E03', 'TT3', 'ชื่อ3', 'นามสกุล3', 'จีน', '2020/05/14', '2023/05/14'),
('E04', 'TT4', 'ชื่อ4', 'นามสกุล4', 'เกาหลีเหนือ', '2020/05/14', '2023/05/14'),
('E05', 'TT5', 'ชื่อ5', 'นามสกุล5', 'เกาหลีใต้', '2020/05/14', '2023/05/14')

INSERT INTO Model VALUES 
('M01', 'RoyceRolls', 'Cullinan', 4, 100.00),
('M02', 'RoyceRolls', 'Ghost', 2, 200.00),
('M03', 'RoyceRolls', 'Phantom', 4, 300.00),
('M04', 'RoyceRolls', 'Dawn', 2, 400.00),
('M05', 'RoyceRolls', 'Wraith', 2, 500.00)

INSERT INTO Aircraft VALUES 
('AC001', 100.00, 100.00, 100.00, 'M01'),
('AC002', 100.00, 100.00, 100.00, 'M02'),
('AC003', 100.00, 100.00, 100.00, 'M03'),
('AC004', 100.00, 100.00, 100.00, 'M04'),
('AC005', 100.00, 100.00, 100.00, 'M05')

INSERT INTO Pilot VALUES 
('P01', 'L001', 'ชั้นนักบิน1', '2', '2022-05-14', '2023-05-14', 'E01'),
('P02', 'L002', 'ชั้นนักบิน2', '3', '2022-05-14', '2023-05-14', 'E02'),
('P03', 'L003', 'ชั้นนักบิน3', '4', '2022-05-14', '2023-05-14', 'E03'),
('P04', 'L004', 'ชั้นนักบิน4', '5', '2022-05-14', '2023-05-14', 'E04'),
('P05', 'L005', 'ชั้นนักบิน5', '6', '2022-05-14', '2023-05-14', 'E05')

INSERT INTO Charter VALUES 
('CH001', '2023-05-14', 'AMS', 1000, 0011.00, 0001.10, 0100.00, 'CS001', 'AC001', 'P01', NULL),
('CH002', '2023-05-14', 'CDG', 1000, 0011.00, 0001.10, 0100.00, 'CS002', 'AC002', 'P02', NULL),
('CH003', '2023-05-14', 'FCO', 1000, 0011.00, 0001.10, 0100.00, 'CS003', 'AC003', 'P03', NULL),
('CH004', '2023-05-14', 'LHR', 1000, 0011.00, 0001.10, 0100.00, 'CS004', 'AC004', 'P04', NULL),
('CH005', '2023-05-14', 'MAN', 1000, 0011.00, 0001.10, 0100.00, 'CS005', 'AC005', 'P05', NULL)

-- ข้อ 4
DELETE FROM Model;

SELECT * FROM Customer;
SELECT * FROM Charter;
SELECT * FROM Employee;
SELECT * FROM Pilot;
SELECT * FROM Aircraft;
SELECT * FROM Model;