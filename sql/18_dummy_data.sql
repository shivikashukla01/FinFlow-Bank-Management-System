USE finflow;

-- ---------------- BRANCH ----------------
INSERT INTO Branch (ifsc_code, branch_name, contact_no, email_id, opening_date, manager_id)
VALUES
('SBIN0002001', 'Bhopal MP Nagar Branch', '9876500001', 'mpnagar.bhopal@sbi.com', '2006-05-12', NULL),
('SBIN0002002', 'Indore Rajwada Branch', '9876500002', 'rajwada.indore@sbi.com', '2011-07-18', NULL);

-- ---------------- ROLE ----------------
INSERT INTO Role (role_name) VALUES
('Branch Manager'),
('Assistant Manager'),
('Cashier'),
('Customer Service Executive'),
('Loan Officer'),
('Clerk'),
('Security Officer'),
('Auditor');

-- ---------------- EMPLOYEE -----------------
INSERT INTO Employee(first_name, middle_name, last_name, dob, gender, email, phone_number, role_id, branch_id, reporting_manager_id)
VALUES
('Rahul',NULL,'Sharma','1980-05-10','Male','rahul.b1@sbi.com','9000000001',1,1,NULL),
('Priya',NULL,'Verma','1985-07-12','Female','priya.b1@sbi.com','9000000002',2,1,1),
('Amit',NULL,'Gupta','1990-03-22','Male','amit.b1@sbi.com','9000000003',3,1,1),
('Neha',NULL,'Singh','1992-11-30','Female','neha.b1@sbi.com','9000000004',4,1,1),
('Raj',NULL,'Mishra','1988-01-18','Male','raj.b1@sbi.com','9000000005',5,1,1),
('Ankit',NULL,'Jain','1993-06-25','Male','ankit.b1@sbi.com','9000000006',6,1,1),
('Aman',NULL,'Yadav','1994-08-19','Male','aman.b1@sbi.com','9000000007',7,1,1),
('Riya',NULL,'Shah','1995-09-27','Female','riya.b1@sbi.com','9000000008',8,1,1),

('Vikas',NULL,'Patel','1981-04-15','Male','vikas.b2@sbi.com','9000000009',1,2,NULL),
('Sneha',NULL,'Agarwal','1986-02-20','Female','sneha.b2@sbi.com','9000000010',2,2,9),
('Karan',NULL,'Sharma','1991-08-14','Male','karan.b2@sbi.com','9000000011',3,2,9),
('Pooja',NULL,'Gupta','1993-03-29','Female','pooja.b2@sbi.com','9000000012',4,2,9),
('Deepak',NULL,'Singh','1989-07-07','Male','deepak.b2@sbi.com','9000000013',5,2,9),
('Tanya',NULL,'Jain','1994-06-18','Female','tanya.b2@sbi.com','9000000014',6,2,9),
('Aman',NULL,'Verma','1992-05-30','Male','aman.b2@sbi.com','9000000015',7,2,9),
('Rohit',NULL,'Yadav','1995-12-01','Male','rohit.b2@sbi.com','9000000016',8,2,9);

UPDATE Branch SET manager_id = 1 WHERE branch_id = 1;
UPDATE Branch SET manager_id = 9 WHERE branch_id = 2;

INSERT INTO Permission (permission_name, description) VALUES
('CREATE_ACCOUNT', 'Open new customer accounts'),
('VIEW_ACCOUNT', 'View account details'),
('UPDATE_ACCOUNT', 'Modify account details'),
('DELETE_ACCOUNT', 'Close customer accounts'),
('DEPOSIT_MONEY', 'Deposit money into account'),
('WITHDRAW_MONEY', 'Withdraw money from account'),
('TRANSFER_MONEY', 'Transfer funds between accounts'),
('APPROVE_LOAN', 'Approve customer loan'),
('VIEW_LOAN', 'View loan details'),
('AUDIT_TRANSACTIONS', 'Audit financial transactions'),
('MANAGE_EMPLOYEES', 'Add/update/remove employees'),
('VIEW_REPORTS', 'Access financial and operational reports');

INSERT INTO RolePermission(role_id,permission_id) 
VALUES
(1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),
(2,1),(2,2),(2,3),(2,5),(2,6),(2,7),(2,9),(2,12),
(3,2),(3,5),(3,6),(3,7),
(4,1),(4,2),(4,3),(4,9),
(5,2),(5,8),(5,9),(5,12),
(6,1),(6,2),(6,3),
(7,2),(7,10),
(8,10),(8,12);

INSERT INTO Customer(first_name, middle_name, last_name, dob, gender, email, phone_number)
VALUES
('Rahul','Kumar','Sharma','1988-11-23','Male','rahul.sharma1@mail.com','8200000001'),
('Priya','Singh','Verma','1993-02-14','Female','priya.verma2@mail.com','8200000002'),
('Amit',NULL,'Gupta','1985-07-09','Male','amit.gupta3@mail.com','8200000003'),
('Neha','Rani','Yadav','1999-01-30','Female','neha.yadav4@mail.com','8200000004'),
('Raj','Kumar','Patel','1978-06-17','Male','raj.patel5@mail.com','8200000005'),

('Ankit','Verma','Sharma','1991-09-28','Male','ankit.sharma6@mail.com','8200000006'),
('Sneha',NULL,'Agarwal','1987-12-05','Female','sneha.agarwal7@mail.com','8200000007'),
('Vikas','Singh','Chauhan','1975-03-11','Male','vikas.chauhan8@mail.com','8200000008'),
('Pooja','Devi','Mishra','2000-08-19','Female','pooja.mishra9@mail.com','8200000009'),
('Karan','Mehta','Jain','1984-04-02','Male','karan.jain10@mail.com','8200000010'),

('Rohit','Kumar','Yadav','1996-10-07','Male','rohit.yadav11@mail.com','8200000011'),
('Simran','Kaur','Gill','2001-05-25','Female','simran.gill12@mail.com','8200000012'),
('Arjun',NULL,'Reddy','1982-02-18','Male','arjun.reddy13@mail.com','8200000013'),
('Meena','Kumari','Pandey','1979-09-03','Female','meena.pandey14@mail.com','8200000014'),
('Suresh','Prasad','Tiwari','1968-01-12','Male','suresh.tiwari15@mail.com','8200000015'),

('Divya','Sharma','Gupta','1997-07-21','Female','divya.gupta16@mail.com','8200000016'),
('Nikhil','Raj','Singh','1986-03-30','Male','nikhil.singh17@mail.com','8200000017'),
('Kavita',NULL,'Joshi','1974-11-08','Female','kavita.joshi18@mail.com','8200000018'),
('Manish','Kumar','Agarwal','1990-06-16','Male','manish.agarwal19@mail.com','8200000019'),
('Rekha','Devi','Yadav','1983-08-27','Female','rekha.yadav20@mail.com','8200000020'),

('Deepak','Singh','Choudhary','1995-01-04','Male','deepak.choudhary21@mail.com','8200000021'),
('Shreya','Gupta','Shah','2002-09-12','Female','shreya.shah22@mail.com','8200000022'),
('Ajay','Kumar','Nair','1977-04-29','Male','ajay.nair23@mail.com','8200000023'),
('Ritu','Verma','Kapoor','1998-12-18','Female','ritu.kapoor24@mail.com','8200000024'),
('Harish','Chandra','Tripathi','1969-06-05','Male','harish.tripathi25@mail.com','8200000025'),

('Sunita','Rani','Saxena','1981-02-22','Female','sunita.saxena26@mail.com','8200000026'),
('Varun','Singh','Bansal','1994-05-09','Male','varun.bansal27@mail.com','8200000027'),
('Payal','Kumari','Soni','2003-03-14','Female','payal.soni28@mail.com','8200000028'),
('Gaurav','Kumar','Malhotra','1987-10-26','Male','gaurav.malhotra29@mail.com','8200000029'),
('Alka',NULL,'Bajaj','1976-07-01','Female','alka.bajaj30@mail.com','8200000030'),

('Yash','Raj',NULL,'1999-11-11','Male','yash.khanna31@mail.com','8200000031'),
('Komal','Sharma','Dixit','2001-08-03','Female','komal.dixit32@mail.com','8200000032'),
('Ramesh','Prasad','Dubey','1967-02-07','Male','ramesh.dubey33@mail.com','8200000033'),
('Anjali','Verma','Mathur','1992-09-20','Female','anjali.mathur34@mail.com','8200000034'),
('Sanjay','Kumar','Chatterjee','1973-01-15','Male','sanjay.chatterjee35@mail.com','8200000035'),

('Tina','Kaur','Arora','2000-04-24','Female','tina.arora36@mail.com','8200000036'),
('Mohit','Singh','Rathore','1985-12-09','Male','mohit.rathore37@mail.com','8200000037'),
('Preeti','Devi','Thakur','1996-06-30','Female','preeti.thakur38@mail.com','8200000038'),
('Vijay','Kumar','Shetty','1978-08-13','Male','vijay.shetty39@mail.com','8200000039'),
('Rashmi','Gupta','Kulkarni','1993-03-27','Female','rashmi.kulkarni40@mail.com','8200000040'),

('Akash','Raj','Pillai','2002-10-05','Male','akash.pillai41@mail.com','8200000041'),
('Nisha','Kumari','Naidu','1991-11-19','Female','nisha.naidu42@mail.com','8200000042'),
('Hemant','Singh','Solanki','1984-07-07','Male','hemant.solanki43@mail.com','8200000043'),
('Seema','Rani','Chopra','1979-05-28','Female','seema.chopra44@mail.com','8200000044'),
('Lokesh','Kumar','Goyal','1997-02-02','Male','lokesh.goyal45@mail.com','8200000045'),

('Isha','Verma','Bhatia','2003-01-01','Female','isha.bhatia46@mail.com','8200000046'),
('Tarun','Prasad',NULL,'1986-09-09','Male','tarun.jha47@mail.com','8200000047'),
('Monika','Singh','Kohli','1995-04-12','Female','monika.kohli48@mail.com','8200000048'),
('Dinesh',NULL,'Lal','1972-06-21','Male','dinesh.lal49@mail.com','8200000049'),
('Pallavi','Gupta','Bose','1998-08-08','Female','pallavi.bose50@mail.com','8200000050'),

('Siddharth','Raj','Menon','1990-12-12','Male','siddharth.menon51@mail.com','8200000051'),
('Kritika','Sharma','Iyer','2001-06-06','Female','kritika.iyer52@mail.com','8200000052'),
('Ravi',NULL,NULL,'1977-03-03','Male','ravi.deshmukh53@mail.com','8200000053'),
('Anu','Singh','Sawant','1994-10-10','Female','anu.sawant54@mail.com','8200000054'),
('Mahesh','Prasad','Rao','1965-11-11','Male','mahesh.rao55@mail.com','8200000055'),

('Geeta','Devi','Nanda','1982-01-26','Female','geeta.nanda56@mail.com','8200000056'),
('Kunal','Kumar','Kapoor','1996-07-15','Male','kunal.kapoor57@mail.com','8200000057'),
('Aarti','Singh','Joshi','2000-02-02','Female','aarti.joshi58@mail.com','8200000058'),
('Prakash','Chandra','Bhardwaj','1971-09-09','Male','prakash.bhardwaj59@mail.com','8200000059'),
('Saloni','Verma','Shukla','2003-05-18','Female','saloni.shukla60@mail.com','8200000060');


INSERT INTO Guarantor (first_name, middle_name, last_name, dob, financial_stability, credit_score, income)
VALUES
('Neha', 'Rani', 'Singh', '1992-11-05', 'MEDIUM', 680, 450000),
('Vikas', NULL, 'Patel', '1983-09-12', 'HIGH', 770, 720000),
('Ramesh', NULL, 'Sharma', '1972-05-14', 'HIGH', 780, 850000),
('Sunita', 'Devi', 'Verma', '1976-08-22', 'MEDIUM', 690, 420000),
('Amit', NULL, 'Gupta', '1989-03-10', 'HIGH', 750, 600000),
('Pooja', NULL, 'Jain', '1995-07-30', 'MEDIUM', 670, 380000),
('Rajesh', 'Kumar', 'Mishra', '1968-01-19', 'HIGH', 800, 900000),
('Kavita', NULL, 'Joshi', '1974-04-25', 'HIGH', 790, 650000);

INSERT INTO Address (house_building_no, street_locality, city, state, pincode) 
VALUES
('12A', 'MP Nagar Zone 1', 'Bhopal', 'Madhya Pradesh', '462011'),
('210', 'Rajwada Market', 'Indore', 'Madhya Pradesh', '452002'),
('45B', 'Indrapuri', 'Bhopal', 'Madhya Pradesh', '462021'),
('88', 'Vijay Nagar', 'Indore', 'Madhya Pradesh', '452010'),
('78C', 'Arera Colony', 'Bhopal', 'Madhya Pradesh', '462016'),
('15', 'Palasia', 'Indore', 'Madhya Pradesh', '452001'),
('22D', 'Kolar Road', 'Bhopal', 'Madhya Pradesh', '462042'),
('300', 'Sudama Nagar', 'Indore', 'Madhya Pradesh', '452009'),
('9E', 'Shahpura', 'Bhopal', 'Madhya Pradesh', '462039'),
('72', 'Annapurna Road', 'Indore', 'Madhya Pradesh', '452009'),
('101', 'Govindpura', 'Bhopal', 'Madhya Pradesh', '462023'),
('44', 'Bhawarkua', 'Indore', 'Madhya Pradesh', '452001'),
('55', 'TT Nagar', 'Bhopal', 'Madhya Pradesh', '462003'),
('19', 'Tilak Nagar', 'Indore', 'Madhya Pradesh', '452018'),
('33', 'Habibganj', 'Bhopal', 'Madhya Pradesh', '462024'),
('500', 'Scheme No 54', 'Indore', 'Madhya Pradesh', '452010'),
('11A', 'Ashoka Garden', 'Bhopal', 'Madhya Pradesh', '462023'),
('601', 'MG Road', 'Indore', 'Madhya Pradesh', '452001'),
('66B', 'Karond', 'Bhopal', 'Madhya Pradesh', '462038'),
('702', 'Geeta Bhawan', 'Indore', 'Madhya Pradesh', '452001'),
('77C', 'Lalghati', 'Bhopal', 'Madhya Pradesh', '462032'),
('803', 'Sapna Sangeeta', 'Indore', 'Madhya Pradesh', '452001'),
('88D', 'Kohefiza', 'Bhopal', 'Madhya Pradesh', '462001'),
('904', 'Bengali Square', 'Indore', 'Madhya Pradesh', '452016'),
('99E', 'Bairagarh', 'Bhopal', 'Madhya Pradesh', '462030'),
('211', 'Rajendra Nagar', 'Indore', 'Madhya Pradesh', '452012'),
('121F', 'Ayodhya Bypass', 'Bhopal', 'Madhya Pradesh', '462041'),
('212', 'Sudama Nagar', 'Indore', 'Madhya Pradesh', '452009'),
('13A', 'MP Nagar Zone 2', 'Bhopal', 'Madhya Pradesh', '462011'),
('213', 'Annapurna Road', 'Indore', 'Madhya Pradesh', '452009'),
('24B', 'New Market', 'Bhopal', 'Madhya Pradesh', '462003'),
('214', 'Palda', 'Indore', 'Madhya Pradesh', '452020'),
('35C', 'Arera Hills', 'Bhopal', 'Madhya Pradesh', '462011'),
('215', 'Super Corridor', 'Indore', 'Madhya Pradesh', '452005'),
('46D', 'Bittan Market', 'Bhopal', 'Madhya Pradesh', '462016'),
('216', 'MR 10', 'Indore', 'Madhya Pradesh', '452010'),
('57E', 'Kotra Sultanabad', 'Bhopal', 'Madhya Pradesh', '462003'),
('217', 'AB Road', 'Indore', 'Madhya Pradesh', '452001'),
('68F', 'Piplani', 'Bhopal', 'Madhya Pradesh', '462022'),
('218', 'Rajendra Nagar', 'Indore', 'Madhya Pradesh', '452012'),
('79G', 'Govindpura Industrial Area', 'Bhopal', 'Madhya Pradesh', '462023'),
('219', 'Sudama Nagar', 'Indore', 'Madhya Pradesh', '452009'),
('14A', 'Shivaji Nagar', 'Bhopal', 'Madhya Pradesh', '462016'),
('220', 'Annapurna Road', 'Indore', 'Madhya Pradesh', '452009'),
('15B', 'Tulsi Nagar', 'Bhopal', 'Madhya Pradesh', '462003'),
('221', 'Palasia', 'Indore', 'Madhya Pradesh', '452001'),
('16C', 'Roshanpura', 'Bhopal', 'Madhya Pradesh', '462003'),
('222', 'Vijay Nagar', 'Indore', 'Madhya Pradesh', '452010'),
('17D', 'Peer Gate', 'Bhopal', 'Madhya Pradesh', '462001'),
('223', 'Bhawarkua', 'Indore', 'Madhya Pradesh', '452001'),
('18E', 'Jahangirabad', 'Bhopal', 'Madhya Pradesh', '462008'),
('224', 'Tilak Nagar', 'Indore', 'Madhya Pradesh', '452018'),
('19F', 'Chhola Road', 'Bhopal', 'Madhya Pradesh', '462001'),
('225', 'MR 10', 'Indore', 'Madhya Pradesh', '452010'),
('20G', 'Nehru Nagar', 'Bhopal', 'Madhya Pradesh', '462003'),
('226', 'Super Corridor', 'Indore', 'Madhya Pradesh', '452005'),
('21H', 'Berasia Road', 'Bhopal', 'Madhya Pradesh', '462001'),
('227', 'AB Road', 'Indore', 'Madhya Pradesh', '452001'),
('22I', 'Karond', 'Bhopal', 'Madhya Pradesh', '462038'),
('228', 'Scheme No 78', 'Indore', 'Madhya Pradesh', '452010'),
('23J', 'Kotra', 'Bhopal', 'Madhya Pradesh', '462003'),
('229', 'Rau', 'Indore', 'Madhya Pradesh', '453331'),
('24K', 'Bagh Sewania', 'Bhopal', 'Madhya Pradesh', '462026'),
('230', 'Pithampur', 'Indore', 'Madhya Pradesh', '454775'),
('25L', 'Misrod', 'Bhopal', 'Madhya Pradesh', '462047'),
('231', 'Bengali Square', 'Indore', 'Madhya Pradesh', '452016'),
('26M', 'Hoshangabad Road', 'Bhopal', 'Madhya Pradesh', '462026'),
('232', 'Geeta Bhawan', 'Indore', 'Madhya Pradesh', '452001'),
('27N', 'Ayodhya Nagar', 'Bhopal', 'Madhya Pradesh', '462041'),
('233', 'Sapna Sangeeta', 'Indore', 'Madhya Pradesh', '452001'),
('28O', 'Chuna Bhatti', 'Bhopal', 'Madhya Pradesh', '462016'),
('234', 'Airport Road', 'Indore', 'Madhya Pradesh', '452005'),
('29P', 'MP Nagar Zone 2', 'Bhopal', 'Madhya Pradesh', '462011'),
('235', 'MG Road', 'Indore', 'Madhya Pradesh', '452001'),
('30Q', 'Arera Colony', 'Bhopal', 'Madhya Pradesh', '462016'),
('236', 'Rajwada', 'Indore', 'Madhya Pradesh', '452002'),
('31R', 'Kolar Road', 'Bhopal', 'Madhya Pradesh', '462042'),
('32S', 'Bairagarh', 'Bhopal', 'Madhya Pradesh', '462030'),
('33T', 'Govindpura', 'Bhopal', 'Madhya Pradesh', '462023'),
('34U', 'Katara Hills', 'Bhopal', 'Madhya Pradesh', '462043'),
('237', 'LIG Colony', 'Indore', 'Madhya Pradesh', '452008'),
('35V', 'Danish Nagar', 'Bhopal', 'Madhya Pradesh', '462026'),
('238', 'Navlakha', 'Indore', 'Madhya Pradesh', '452001'),
('36W', 'Bawadiya Kalan', 'Bhopal', 'Madhya Pradesh', '462026'),
('239', 'Tower Square', 'Indore', 'Madhya Pradesh', '452001'),
('37X', 'Hoshangabad Road', 'Bhopal', 'Madhya Pradesh', '462026');

INSERT INTO BranchAddress (address_id,branch_id)
VALUES 
(1,1),(2,2);

INSERT INTO EmployeeAddress (address_id, employee_id) 
VALUES
(3,1),(4,2),(5,3),(6,4),
(7,5),(8,6),(9,7),(10,8),
(11,9),(12,10),(13,11),(14,12),
(15,13),(16,14),(17,15),(18,16);

INSERT INTO GuarantorAddress (address_id, guarantor_id) 
VALUES
(19,1),(20,2),(21,3),(22,4),
(23,5),(24,6),(25,7),(26,8);

INSERT INTO CustomerAddress (address_id, customer_id) 
VALUES
(27,1),(28,2),(29,3),(30,4),(31,5),
(32,6),(33,7),(34,8),(35,9),(36,10),
(37,11),(38,12),(39,13),(40,14),(41,15),
(42,16),(43,17),(44,18),(45,19),(46,20),
(47,21),(48,22),(49,23),(50,24),(51,25),
(52,26),(53,27),(54,28),(55,29),(56,30),
(57,31),(58,32),(59,33),(60,34),(61,35),
(62,36),(63,37),(64,38),(65,39),(66,40),
(67,41),(68,42),(69,43),(70,44),(71,45),
(72,46),(73,47),(74,48),(75,49),(76,50),
(77,51),(78,52),(79,53),(80,54),(81,55),
(82,56),(83,57),(84,58),(85,59),(86,60);


INSERT INTO Loan (customer_id, amount, tenure, tenure_unit, loan_type, interest_rate, status, value_date, disbursement_date, maturity_date, credit_score, collateral_security_type, collateral_security_value)
VALUES
-- Rahul: Active Home Loan with Real Estate collateral
(1, 2000000.00, 10, 'YEAR', 'HOME', 8.50, 'ACTIVE', '2023-01-10', '2023-01-15', '2033-01-15', 780, 'REAL_ESTATE', 6000000.00),
-- Priya: Closed Car Loan
(2, 800000.00, 5, 'YEAR', 'CAR', 9.25, 'CLOSED', '2018-05-20', '2018-05-25', '2023-05-25', 810, 'VEHICLE', 1100000.00),
-- Amit: Active Personal Loan (No collateral)
(3, 200000.00, 8, 'MONTH', 'PERSONAL', 12.00, 'ACTIVE', '2023-11-01', '2023-11-05', '2025-11-05', 720, NULL, NULL),
 -- Neha: Sanctioned Educational Loan
(4, 1500000.00, 7, 'YEAR', 'EDUCATIONAL', 7.50, 'SANCTIONED', '2024-03-10', NULL, NULL, 740, 'FIXED_DEPOSITS', 500000.00),
-- Raj: Active Business Loan with Inventory collateral
(5, 2500000.00, 6, 'MONTH', 'BUSINESS', 11.50, 'ACTIVE', '2023-08-15', '2023-08-20', '2026-08-20', 690, 'INVENTORY', 3500000.00),
-- Ankit: Pending Two Wheeler Loan
(6, 95000.00, 12, 'MONTH', 'TWO_WHEELER', 10.00, 'PENDING', '2024-04-01', NULL, NULL, 650, 'VEHICLE', 120000.00),
-- Sneha: Rejected Loan (Low credit score scenario)
(7, 500000.00, 3, 'YEAR', 'PERSONAL', 14.00, 'REJECTED', '2024-01-15', NULL, NULL, 450, NULL, NULL),
-- Vikas: Commercial Vehicle Loan
(8, 1800000.00, 4, 'YEAR', 'COMMERCIAL_VEHICLE', 10.75, 'ACTIVE', '2022-12-01', '2022-12-10', '2026-12-10', 710, 'VEHICLE', 2200000.00),
-- Pooja: Small Personal Loan
(9, 50000.00, 6, 'MONTH', 'PERSONAL', 13.50, 'ACTIVE', '2024-02-10', '2024-02-12', '2024-08-12', 680, NULL, NULL),
-- Karan: Large Business Loan backed by Gold
(10, 5000000.00, 10, 'MONTH', 'BUSINESS', 9.00, 'ACTIVE', '2023-05-20', '2023-05-25', '2028-05-25', 825, 'GOLD', 7000000.00);


INSERT INTO Document (document_type, document_no, secure_file_reference) VALUES
-- -------- PAN & AADHAAR (86 entries) --------
('PAN_CARD','ABCPD1234A','/secure/docs/pan_1.pdf'),
('AADHAAR','234567890123','/secure/docs/aadhaar_2.pdf'),
('PAN_CARD','PQRPX5678L','/secure/docs/pan_3.pdf'),
('AADHAAR','345678901234','/secure/docs/aadhaar_4.pdf'),
('PAN_CARD','LMNPP4321Z','/secure/docs/pan_5.pdf'),
('AADHAAR','456789012345','/secure/docs/aadhaar_6.pdf'),
('PAN_CARD','ZXCVP8765Q','/secure/docs/pan_7.pdf'),
('AADHAAR','567890123456','/secure/docs/aadhaar_8.pdf'),
('PAN_CARD','ASDPP2345H','/secure/docs/pan_9.pdf'),
('AADHAAR','678901234567','/secure/docs/aadhaar_10.pdf'),

('PAN_CARD','QWERP6789K','/secure/docs/pan_11.pdf'),
('AADHAAR','789012345678','/secure/docs/aadhaar_12.pdf'),
('PAN_CARD','YUIOP3456N','/secure/docs/pan_13.pdf'),
('AADHAAR','890123456789','/secure/docs/aadhaar_14.pdf'),
('PAN_CARD','HJKLP9876T','/secure/docs/pan_15.pdf'),
('AADHAAR','901234567890','/secure/docs/aadhaar_16.pdf'),
('PAN_CARD','BNMCP5432X','/secure/docs/pan_17.pdf'),
('AADHAAR','112233445566','/secure/docs/aadhaar_18.pdf'),
('PAN_CARD','GHJPP1111P','/secure/docs/pan_19.pdf'),
('AADHAAR','223344556677','/secure/docs/aadhaar_20.pdf'),

('PAN_CARD','TREPP2222M','/secure/docs/pan_21.pdf'),
('AADHAAR','334455667788','/secure/docs/aadhaar_22.pdf'),
('PAN_CARD','POIUP3333R','/secure/docs/pan_23.pdf'),
('AADHAAR','445566778899','/secure/docs/aadhaar_24.pdf'),
('PAN_CARD','LKJHP4444S','/secure/docs/pan_25.pdf'),
('AADHAAR','556677889900','/secure/docs/aadhaar_26.pdf'),
('PAN_CARD','MNBPP5555D','/secure/docs/pan_27.pdf'),
('AADHAAR','667788990011','/secure/docs/aadhaar_28.pdf'),
('PAN_CARD','ZXCPP6666F','/secure/docs/pan_29.pdf'),
('AADHAAR','778899001122','/secure/docs/aadhaar_30.pdf'),

('PAN_CARD','QAZPP7777G','/secure/docs/pan_31.pdf'),
('AADHAAR','889900112233','/secure/docs/aadhaar_32.pdf'),
('PAN_CARD','EDCPP8888H','/secure/docs/pan_33.pdf'),
('AADHAAR','990011223344','/secure/docs/aadhaar_34.pdf'),
('PAN_CARD','TGBPP9999J','/secure/docs/pan_35.pdf'),
('AADHAAR','101010101010','/secure/docs/aadhaar_36.pdf'),
('PAN_CARD','YHNPP1212K','/secure/docs/pan_37.pdf'),
('AADHAAR','202020202020','/secure/docs/aadhaar_38.pdf'),
('PAN_CARD','UJMPP3434L','/secure/docs/pan_39.pdf'),
('AADHAAR','303030303030','/secure/docs/aadhaar_40.pdf'),

('PAN_CARD','IKOPP5656M','/secure/docs/pan_41.pdf'),
('AADHAAR','404040404040','/secure/docs/aadhaar_42.pdf'),
('PAN_CARD','OLPPP7878N','/secure/docs/pan_43.pdf'),
('AADHAAR','505050505050','/secure/docs/aadhaar_44.pdf'),
('PAN_CARD','PLMPP9090P','/secure/docs/pan_45.pdf'),
('AADHAAR','606060606060','/secure/docs/aadhaar_46.pdf'),
('PAN_CARD','NBCPP1212Q','/secure/docs/pan_47.pdf'),
('AADHAAR','707070707070','/secure/docs/aadhaar_48.pdf'),
('PAN_CARD','CXZPP3434R','/secure/docs/pan_49.pdf'),
('AADHAAR','808080808080','/secure/docs/aadhaar_50.pdf'),

('PAN_CARD','ASDPP5656S','/secure/docs/pan_51.pdf'),
('AADHAAR','909090909090','/secure/docs/aadhaar_52.pdf'),
('PAN_CARD','ZXCPP7878T','/secure/docs/pan_53.pdf'),
('AADHAAR','111122223333','/secure/docs/aadhaar_54.pdf'),
('PAN_CARD','QWEPP9090U','/secure/docs/pan_55.pdf'),
('AADHAAR','222233334444','/secure/docs/aadhaar_56.pdf'),
('PAN_CARD','RTYPP1212V','/secure/docs/pan_57.pdf'),
('AADHAAR','333344445555','/secure/docs/aadhaar_58.pdf'),
('PAN_CARD','UIOPP3434W','/secure/docs/pan_59.pdf'),
('AADHAAR','444455556666','/secure/docs/aadhaar_60.pdf'),

('PAN_CARD','PASPP5656X','/secure/docs/pan_61.pdf'),
('AADHAAR','555566667777','/secure/docs/aadhaar_62.pdf'),
('PAN_CARD','LKJPP7878Y','/secure/docs/pan_63.pdf'),
('AADHAAR','666677778888','/secure/docs/aadhaar_64.pdf'),
('PAN_CARD','MNBPP9090Z','/secure/docs/pan_65.pdf'),
('AADHAAR','777788889999','/secure/docs/aadhaar_66.pdf'),
('PAN_CARD','QAZPP1111A','/secure/docs/pan_67.pdf'),
('AADHAAR','888899990000','/secure/docs/aadhaar_68.pdf'),
('PAN_CARD','EDCPP2222B','/secure/docs/pan_69.pdf'),
('AADHAAR','999900001111','/secure/docs/aadhaar_70.pdf'),

('PAN_CARD','TGBPP3333C','/secure/docs/pan_71.pdf'),
('AADHAAR','121212121212','/secure/docs/aadhaar_72.pdf'),
('PAN_CARD','YHNPP4444D','/secure/docs/pan_73.pdf'),
('AADHAAR','232323232323','/secure/docs/aadhaar_74.pdf'),
('PAN_CARD','UJMPP5555E','/secure/docs/pan_75.pdf'),
('AADHAAR','343434343434','/secure/docs/aadhaar_76.pdf'),
('PAN_CARD','IKOPP6666F','/secure/docs/pan_77.pdf'),
('AADHAAR','454545454545','/secure/docs/aadhaar_78.pdf'),
('PAN_CARD','OLPPP7777G','/secure/docs/pan_79.pdf'),
('AADHAAR','565656565656','/secure/docs/aadhaar_80.pdf'),

('PAN_CARD','PLMPP8888H','/secure/docs/pan_81.pdf'),
('AADHAAR','676767676767','/secure/docs/aadhaar_82.pdf'),
('PAN_CARD','NBCPP9999I','/secure/docs/pan_83.pdf'),
('AADHAAR','787878787878','/secure/docs/aadhaar_84.pdf'),
('PAN_CARD','CXZPP0001J','/secure/docs/pan_85.pdf'),
('AADHAAR','898989898989','/secure/docs/aadhaar_86.pdf'),

-- -------- INCOME CERTIFICATE (UNCHANGED) --------
('INCOME_CERTIFICATE','INC20240001','/secure/docs/income_1.pdf'),
('INCOME_CERTIFICATE','INC20240002','/secure/docs/income_2.pdf'),
('INCOME_CERTIFICATE','INC20240003','/secure/docs/income_3.pdf'),
('INCOME_CERTIFICATE','INC20240004','/secure/docs/income_4.pdf'),
('INCOME_CERTIFICATE','INC20240005','/secure/docs/income_5.pdf'),
('INCOME_CERTIFICATE','INC20240006','/secure/docs/income_6.pdf'),
('INCOME_CERTIFICATE','INC20240007','/secure/docs/income_7.pdf'),
('INCOME_CERTIFICATE','INC20240008','/secure/docs/income_8.pdf'),
('INCOME_CERTIFICATE','INC20240009','/secure/docs/income_9.pdf'),
('INCOME_CERTIFICATE','INC20240010','/secure/docs/income_10.pdf'),

('INCOME_CERTIFICATE','INC20240011','/secure/docs/income_11.pdf'),
('INCOME_CERTIFICATE','INC20240012','/secure/docs/income_12.pdf'),
('INCOME_CERTIFICATE','INC20240013','/secure/docs/income_13.pdf'),
('INCOME_CERTIFICATE','INC20240014','/secure/docs/income_14.pdf'),
('INCOME_CERTIFICATE','INC20240015','/secure/docs/income_15.pdf'),
('INCOME_CERTIFICATE','INC20240016','/secure/docs/income_16.pdf'),
('INCOME_CERTIFICATE','INC20240017','/secure/docs/income_17.pdf'),
('INCOME_CERTIFICATE','INC20240018','/secure/docs/income_18.pdf'),
('INCOME_CERTIFICATE','INC20240019','/secure/docs/income_19.pdf'),
('INCOME_CERTIFICATE','INC20240020','/secure/docs/income_20.pdf');

INSERT INTO CustomerDocument (document_id, customer_id)
VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20),
(21,21),(22,22),(23,23),(24,24),(25,25),
(26,26),(27,27),(28,28),(29,29),(30,30),
(31,31),(32,32),(33,33),(34,34),(35,35),
(36,36),(37,37),(38,38),(39,39),(40,40),
(41,41),(42,42),(43,43),(44,44),(45,45),
(46,46),(47,47),(48,48),(49,49),(50,50),
(51,51),(52,52),(53,53),(54,54),(55,55),
(56,56),(57,57),(58,58),(59,59),(60,60);

INSERT INTO EmployeeDocument (document_id, employee_id)
VALUES
(61,1),(62,2),(63,3),(64,4),
(65,5),(66,6),(67,7),(68,8),
(69,9),(70,10),(71,11),(72,12),
(73,13),(74,14),(75,15),(76,16);

INSERT INTO GuarantorDocument (document_id, guarantor_id)
VALUES
(77,1),(78,2),(79,3),(80,4),
(81,5),(82,6),(83,7),(84,8);

INSERT INTO LoanDocument (document_id, loan_id)
VALUES
(87,1),(88,2),(89,3),(90,4),(91,5),
(92,6),(93,7),(94,8),(95,9),(96,10);

INSERT INTO KYC (customer_id, verification_status, verified_by, verification_date)
VALUES
(1,'VERIFIED',1,'2024-01-10'),
(2,'VERIFIED',2,'2024-01-12'),
(3,'VERIFIED',3,'2024-01-15'),
(4,'VERIFIED',4,'2024-01-18'),
(5,'VERIFIED',5,'2024-01-20'),
(6,'VERIFIED',6,'2024-01-22'),
(7,'VERIFIED',7,'2024-01-25'),
(8,'VERIFIED',8,'2024-01-28'),
(9,'VERIFIED',9,'2024-02-01'),
(10,'VERIFIED',10,'2024-02-03'),

(11,'VERIFIED',11,'2024-02-05'),
(12,'VERIFIED',12,'2024-02-07'),
(13,'VERIFIED',13,'2024-02-10'),
(14,'VERIFIED',14,'2024-02-12'),
(15,'VERIFIED',15,'2024-02-15'),
(16,'VERIFIED',16,'2024-02-18'),
(17,'VERIFIED',1,'2024-02-20'),
(18,'VERIFIED',2,'2024-02-22'),
(19,'VERIFIED',3,'2024-02-25'),
(20,'VERIFIED',4,'2024-02-28'),

(21,'VERIFIED',5,'2024-03-01'),
(22,'VERIFIED',6,'2024-03-03'),
(23,'VERIFIED',7,'2024-03-05'),
(24,'VERIFIED',8,'2024-03-08'),
(25,'VERIFIED',9,'2024-03-10'),
(26,'VERIFIED',10,'2024-03-12'),
(27,'VERIFIED',11,'2024-03-15'),
(28,'VERIFIED',12,'2024-03-18'),
(29,'VERIFIED',13,'2024-03-20'),
(30,'VERIFIED',14,'2024-03-22'),

(31,'VERIFIED',15,'2024-03-25'),
(32,'VERIFIED',16,'2024-03-28'),
(33,'VERIFIED',1,'2024-04-01'),
(34,'VERIFIED',2,'2024-04-03'),
(35,'VERIFIED',3,'2024-04-05'),
(36,'VERIFIED',4,'2024-04-08'),
(37,'VERIFIED',5,'2024-04-10'),
(38,'VERIFIED',6,'2024-04-12'),
(39,'VERIFIED',7,'2024-04-15'),
(40,'VERIFIED',8,'2024-04-18'),

(41,'ON_HOLD',9,'2024-04-20'),
(42,'ON_HOLD',10,'2024-04-22'),
(43,'ON_HOLD',11,'2024-04-25'),
(44,'ON_HOLD',12,'2024-04-28'),
(45,'ON_HOLD',13,'2024-05-01'),
(46,'ON_HOLD',14,'2024-05-03'),
(47,'ON_HOLD',15,'2024-05-05'),
(48,'ON_HOLD',16,'2024-05-08'),

(49,'REJECTED',1,'2024-05-10'),
(50,'REJECTED',2,'2024-05-12'),
(51,'REJECTED',3,'2024-05-15'),
(52,'REJECTED',4,'2024-05-18'),

(53,'REGISTERED',NULL,NULL),
(54,'REGISTERED',NULL,NULL),
(55,'REGISTERED',NULL,NULL),
(56,'REGISTERED',NULL,NULL),
(57,'REGISTERED',NULL,NULL),
(58,'REGISTERED',NULL,NULL),
(59,'REGISTERED',NULL,NULL),
(60,'REGISTERED',NULL,NULL);


INSERT INTO Account (account_no, account_type, interest_rate, branch_id, balance, current_status)
VALUES
('SB10000001','SAVINGS',3.50,1,15000.00,'ACTIVE'),
('SB10000002','SAVINGS',3.50,1,22000.00,'ACTIVE'),
('SB10000003','SAVINGS',3.75,2,18000.00,'ACTIVE'),
('SB10000004','SAVINGS',3.50,2,12500.00,'ACTIVE'),
('SB10000005','SAVINGS',3.25,1,30500.00,'ACTIVE'),
('SB10000006','SAVINGS',3.50,2,9800.00,'ACTIVE'),
('SB10000007','SAVINGS',3.75,1,45000.00,'ACTIVE'),
('SB10000008','SAVINGS',3.50,2,8700.00,'ACTIVE'),
('SB10000009','SAVINGS',3.25,1,13200.00,'ACTIVE'),
('SB10000010','SAVINGS',3.50,2,21000.00,'ACTIVE'),

('CA10000011','CURRENT',0.00,1,50000.00,'ACTIVE'),
('CA10000012','CURRENT',0.00,2,120000.00,'ACTIVE'),
('CA10000013','CURRENT',0.00,1,75000.00,'SUSPENDED'),
('CA10000014','CURRENT',0.00,2,64000.00,'ACTIVE'),
('CA10000015','CURRENT',0.00,1,83000.00,'ACTIVE'),

('SA10000016','SALARY',3.00,2,18000.00,'ACTIVE'),
('SA10000017','SALARY',3.00,1,25000.00,'ACTIVE'),
('SA10000018','SALARY',3.25,2,32000.00,'ACTIVE'),
('SA10000019','SALARY',3.00,1,27000.00,'ACTIVE'),
('SA10000020','SALARY',3.00,2,15000.00,'ACTIVE'),

('FD10000021','FIXED_DEPOSIT',6.75,1,200000.00,'ACTIVE'),
('FD10000022','FIXED_DEPOSIT',7.00,2,500000.00,'ACTIVE'),
('FD10000023','FIXED_DEPOSIT',6.50,1,300000.00,'ACTIVE'),
('FD10000024','FIXED_DEPOSIT',7.25,2,450000.00,'ACTIVE'),
('FD10000025','FIXED_DEPOSIT',6.80,1,250000.00,'CLOSED'),

('RD10000026','RECURRING_DEPOSIT',6.00,2,80000.00,'ACTIVE'),
('RD10000027','RECURRING_DEPOSIT',5.75,1,60000.00,'ACTIVE'),
('RD10000028','RECURRING_DEPOSIT',6.25,2,95000.00,'ACTIVE'),
('RD10000029','RECURRING_DEPOSIT',6.00,1,70000.00,'ACTIVE'),
('RD10000030','RECURRING_DEPOSIT',5.90,2,85000.00,'ACTIVE'),

('SB10000031','SAVINGS',3.50,1,14000.00,'ACTIVE'),
('SB10000032','SAVINGS',3.75,2,22000.00,'ACTIVE'),
('CA10000033','CURRENT',0.00,1,91000.00,'ACTIVE'),
('SA10000034','SALARY',3.00,2,19500.00,'ACTIVE'),
('FD10000035','FIXED_DEPOSIT',7.10,1,600000.00,'ACTIVE'),
('RD10000036','RECURRING_DEPOSIT',6.10,2,78000.00,'ACTIVE'),
('SB10000037','SAVINGS',3.50,1,16500.00,'ACTIVE'),
('CA10000038','CURRENT',0.00,2,110000.00,'ACTIVE'),
('SA10000039','SALARY',3.00,1,21000.00,'ACTIVE'),
('FD10000040','FIXED_DEPOSIT',6.90,2,350000.00,'ACTIVE');

INSERT INTO AccountHolder (account_id, customer_id, role, ownership_percentage)
VALUES
(5,5,'PRIMARY',60.00),
(5,6,'SECONDARY',40.00),

(10,10,'PRIMARY',70.00),
(10,11,'SECONDARY',30.00),

(15,15,'PRIMARY',50.00),
(15,16,'SECONDARY',30.00),
(15,17,'SECONDARY',20.00),

(20,20,'PRIMARY',65.00),
(20,21,'SECONDARY',35.00),

(25,25,'PRIMARY',80.00),
(25,26,'SECONDARY',20.00),

(1,1,'PRIMARY',100.00),
(2,2,'PRIMARY',100.00),
(3,3,'PRIMARY',100.00),
(4,4,'PRIMARY',100.00),

(6,6,'PRIMARY',100.00),
(7,7,'PRIMARY',100.00),
(8,8,'PRIMARY',100.00),
(9,9,'PRIMARY',100.00),

(11,11,'PRIMARY',100.00),
(12,12,'PRIMARY',100.00),
(13,13,'PRIMARY',100.00),
(14,14,'PRIMARY',100.00),

(16,16,'PRIMARY',100.00),
(17,17,'PRIMARY',100.00),
(18,18,'PRIMARY',100.00),
(19,19,'PRIMARY',100.00),

(21,21,'PRIMARY',100.00),
(22,22,'PRIMARY',100.00),
(23,23,'PRIMARY',100.00),
(24,24,'PRIMARY',100.00),

(26,26,'PRIMARY',100.00),
(27,27,'PRIMARY',100.00),
(28,28,'PRIMARY',100.00),
(29,29,'PRIMARY',100.00),
(30,30,'PRIMARY',100.00),

(31,31,'PRIMARY',100.00),
(32,32,'PRIMARY',100.00),
(33,33,'PRIMARY',100.00),
(34,34,'PRIMARY',100.00),
(35,35,'PRIMARY',100.00),
(36,36,'PRIMARY',100.00),
(37,37,'PRIMARY',100.00),
(38,38,'PRIMARY',100.00),
(39,39,'PRIMARY',100.00),
(40,40,'PRIMARY',100.00);

INSERT INTO Transaction(txn_type, amount, currency, sender_account_id, receiver_account_id, status)
VALUES
('DEPOSIT',5000.00,'INR',NULL,1,'PENDING'),
('DEPOSIT',8000.00,'INR',NULL,2,'PENDING'),
('DEPOSIT',6000.00,'INR',NULL,3,'PENDING'),
('DEPOSIT',10000.00,'INR',NULL,4,'PENDING'),
('DEPOSIT',7000.00,'INR',NULL,5,'PENDING'),
('DEPOSIT',4000.00,'INR',NULL,6,'PENDING'),
('DEPOSIT',9000.00,'INR',NULL,8,'PENDING'),
('DEPOSIT',5000.00,'INR',NULL,9,'PENDING'),
('DEPOSIT',12000.00,'INR',NULL,10,'PENDING'),

('WITHDRAW',2000.00,'INR',1,NULL,'PENDING'),
('WITHDRAW',3000.00,'INR',2,NULL,'PENDING'),
('WITHDRAW',2000.00,'INR',3,NULL,'PENDING'),
('WITHDRAW',4000.00,'INR',4,NULL,'PENDING'),
('WITHDRAW',5000.00,'INR',5,NULL,'PENDING'),
('WITHDRAW',1000.00,'INR',6,NULL,'PENDING'),
('WITHDRAW',3000.00,'INR',8,NULL,'PENDING'),
('WITHDRAW',2000.00,'INR',9,NULL,'PENDING'),
('WITHDRAW',4000.00,'INR',10,NULL,'PENDING'),

('TRANSFER',3000.00,'INR',1,2,'PENDING'),
('TRANSFER',4000.00,'INR',2,3,'PENDING'),
('TRANSFER',3000.00,'INR',3,4,'PENDING'),
('TRANSFER',5000.00,'INR',4,5,'PENDING'),
('TRANSFER',2000.00,'INR',5,6,'PENDING'),
('TRANSFER',1500.00,'INR',6,7,'PENDING'),
('TRANSFER',3000.00,'INR',8,9,'PENDING'),
('TRANSFER',2000.00,'INR',9,10,'PENDING'),
('TRANSFER',4000.00,'INR',10,1,'PENDING'),
('TRANSFER',20000.00,'INR',11,12,'PENDING'),
('TRANSFER',15000.00,'INR',12,13,'PENDING'),

('WITHDRAW',5000.00,'INR',13,NULL,'PENDING'),
('TRANSFER',10000.00,'INR',14,15,'PENDING'),
('TRANSFER',20000.00,'INR',16,17,'PENDING'),
('WITHDRAW',5000.00,'INR',17,NULL,'PENDING'),
('TRANSFER',8000.00,'INR',18,19,'PENDING'),
('TRANSFER',4000.00,'INR',19,20,'PENDING'),
('WITHDRAW',10000.00,'INR',21,NULL,'PENDING'),
('TRANSFER',15000.00,'INR',22,23,'PENDING'),
('TRANSFER',10000.00,'INR',23,24,'PENDING'),
('WITHDRAW',2000.00,'INR',26,NULL,'PENDING'),
('TRANSFER',5000.00,'INR',27,28,'PENDING'),
('TRANSFER',4000.00,'INR',28,29,'PENDING'),
('TRANSFER',6000.00,'INR',29,30,'PENDING'),
('TRANSFER',10000.00,'INR',31,32,'PENDING'),
('WITHDRAW',5000.00,'INR',32,NULL,'PENDING'),
('TRANSFER',7000.00,'INR',33,34,'PENDING'),
('TRANSFER',8000.00,'INR',34,35,'PENDING'),
('WITHDRAW',5000.00,'INR',35,NULL,'PENDING'),
('TRANSFER',6000.00,'INR',38,39,'PENDING'),
('TRANSFER',5000.00,'INR',39,40,'PENDING');


INSERT INTO LoanGuarantor (loan_id, guarantor_id, relationship)
VALUES
-- Loan 1 (HOME): High-value asset usually requires a family guarantor
(1, 3, 'FATHER'), 
-- Loan 2 (CAR): Often guaranteed by a spouse or relative
(2, 2, 'SPOUSE'),
-- Loan 4 (EDUCATIONAL): Almost always requires a parent or sibling
(4, 1, 'SISTER'),
-- Loan 5 (BUSINESS): Business loans often have multiple partners as guarantors
(5, 7, 'BUSINESS_PARTNER'),
(5, 8, 'BUSINESS_PARTNER'),
-- Loan 6 (TWO_WHEELER): Guaranteed by an employer or friend
(6, 4, 'EMPLOYER'),
-- Loan 8 (COMMERCIAL_VEHICLE): Professional or business associate
(8, 8, 'BUSINESS_ASSOCIATE'),
-- Loan 10 (BUSINESS): Large scale business loan with multiple high-stability co-signers
(10, 5, 'CO_SIGNER'),
(10, 7, 'INVESTOR');


INSERT INTO RepaymentSchedule (loan_id, installment_no, due_date, amount_due, principal_component, interest_component, status, paid_date)
VALUES
-- Rahul: Active Home Loan (10 Years → 20 Half-Yearly Installments)
(1,1,'2023-07-15',185000.00,100000.00,85000.00,'PAID','2023-07-12'),
(1,2,'2024-01-15',185000.00,100000.00,85000.00,'PAID','2024-01-15'),
(1,3,'2024-07-15',185000.00,100000.00,85000.00,'PAID','2024-07-14'),
(1,4,'2025-01-15',185000.00,100000.00,85000.00,'PAID','2025-01-15'),
(1,5,'2025-07-15',185000.00,100000.00,85000.00,'OVERDUE',NULL),
(1,6,'2026-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,7,'2026-07-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,8,'2027-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,9,'2027-07-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,10,'2028-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,11,'2028-07-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,12,'2029-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,13,'2029-07-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,14,'2030-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,15,'2030-07-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,16,'2031-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,17,'2031-07-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,18,'2032-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,19,'2032-07-15',185000.00,100000.00,85000.00,'PENDING',NULL),
(1,20,'2033-01-15',185000.00,100000.00,85000.00,'PENDING',NULL),
-- Priya: Closed Car Loan (All Paid)
(2,1,'2018-11-25',114000.00,80000.00,34000.00,'PAID','2018-11-25'),
(2,2,'2019-05-25',114000.00,80000.00,34000.00,'PAID','2019-05-25'),
(2,3,'2019-11-25',114000.00,80000.00,34000.00,'PAID','2019-11-25'),
(2,4,'2020-05-25',114000.00,80000.00,34000.00,'PAID','2020-05-25'),
(2,5,'2020-11-25',114000.00,80000.00,34000.00,'PAID','2020-11-25'),
(2,6,'2021-05-25',114000.00,80000.00,34000.00,'PAID','2021-05-25'),
(2,7,'2021-11-25',114000.00,80000.00,34000.00,'PAID','2021-11-25'),
(2,8,'2022-05-25',114000.00,80000.00,34000.00,'PAID','2022-05-25'),
(2,9,'2022-11-25',114000.00,80000.00,34000.00,'PAID','2022-11-25'),
(2,10,'2023-05-25',114000.00,80000.00,34000.00,'PAID','2023-05-25'),
-- Amit: Active Personal Loan (with overdue case)
(3,1,'2024-02-05',40000.00,25000.00,15000.00,'PAID','2024-02-05'),
(3,2,'2024-05-05',40000.00,25000.00,15000.00,'PAID','2024-05-05'),
(3,3,'2024-08-05',40000.00,25000.00,15000.00,'PAID','2024-08-07'),
(3,4,'2024-11-05',40000.00,25000.00,15000.00,'PAID','2024-11-05'),
(3,5,'2025-02-05',40000.00,25000.00,15000.00,'PAID','2025-02-04'),
(3,6,'2025-05-05',40000.00,25000.00,15000.00,'OVERDUE',NULL),
(3,7,'2025-08-05',40000.00,25000.00,15000.00,'OVERDUE',NULL),
(3,8,'2025-11-05',40000.00,25000.00,15000.00,'OVERDUE',NULL),
-- Raj: Business Loan
(5,1,'2024-02-20',583333.33,416666.67,166666.67,'PAID','2024-02-18'),
(5,2,'2024-08-20',583333.33,416666.67,166666.67,'PAID','2024-08-20'),
(5,3,'2025-02-20',583333.33,416666.67,166666.67,'PAID','2025-02-20'),
(5,4,'2025-08-20',583333.33,416666.67,166666.67,'OVERDUE',NULL),
(5,5,'2026-02-20',583333.33,416666.67,166666.67,'OVERDUE',NULL),
(5,6,'2026-08-20',583333.33,416666.67,166666.67,'PENDING',NULL),
-- Vikas: Commercial Vehicle Loan
(8,1,'2023-06-10',405000.00,225000.00,180000.00,'PAID','2023-06-08'),
(8,2,'2023-12-10',405000.00,225000.00,180000.00,'PAID','2023-12-10'),
(8,3,'2024-06-10',405000.00,225000.00,180000.00,'PAID','2024-06-12'),
(8,4,'2024-12-10',405000.00,225000.00,180000.00,'PAID','2024-12-10'),
(8,5,'2025-06-10',405000.00,225000.00,180000.00,'OVERDUE',NULL),
(8,6,'2025-12-10',405000.00,225000.00,180000.00,'OVERDUE',NULL),
(8,7,'2026-06-10',405000.00,225000.00,180000.00,'PENDING',NULL),
(8,8,'2026-12-10',405000.00,225000.00,180000.00,'PENDING',NULL),
-- Pooja: Small Personal Loan
(9,1,'2024-05-12',29375.00,25000.00,4375.00,'PAID','2024-05-10'),
(9,2,'2024-08-12',29375.00,25000.00,4375.00,'PAID','2024-08-12'),
-- Karan: Large Business Loan
(10,1,'2023-11-25',725000.00,500000.00,225000.00,'PAID','2023-11-24'),
(10,2,'2024-05-25',725000.00,500000.00,225000.00,'PAID','2024-05-25'),
(10,3,'2024-11-25',725000.00,500000.00,225000.00,'PAID','2024-11-22'),
(10,4,'2025-05-25',725000.00,500000.00,225000.00,'OVERDUE',NULL),
(10,5,'2025-11-25',725000.00,500000.00,225000.00,'OVERDUE',NULL),
(10,6,'2026-05-25',725000.00,500000.00,225000.00,'PENDING',NULL),
(10,7,'2026-11-25',725000.00,500000.00,225000.00,'PENDING',NULL),
(10,8,'2027-05-25',725000.00,500000.00,225000.00,'PENDING',NULL),
(10,9,'2027-11-25',725000.00,500000.00,225000.00,'PENDING',NULL),
(10,10,'2028-05-25',725000.00,500000.00,225000.00,'PENDING',NULL);


INSERT INTO LoanRepayment(loan_id, amount_paid, payment_date, schedule_id, payment_mode, payment_type)
VALUES
(1,185000.00,'2023-07-12',1,'UPI','EMI'),
(1,185000.00,'2024-01-15',2,'NET_BANKING','EMI'),
(1,185000.00,'2024-07-14',3,'DEBIT_CARD','EMI'),
(1,185000.00,'2025-01-15',4,'UPI','EMI'),

(2,114000.00,'2018-11-25',21,'CASH','EMI'),
(2,114000.00,'2019-05-25',22,'DEBIT_CARD','EMI'),
(2,114000.00,'2019-11-25',23,'UPI','EMI'),
(2,114000.00,'2020-05-25',24,'NET_BANKING','EMI'),
(2,114000.00,'2020-11-25',25,'UPI','EMI'),
(2,114000.00,'2021-05-25',26,'DEBIT_CARD','EMI'),
(2,114000.00,'2021-11-25',27,'UPI','EMI'),
(2,114000.00,'2022-05-25',28,'NET_BANKING','EMI'),
(2,114000.00,'2022-11-25',29,'UPI','EMI'),
(2,114000.00,'2023-05-25',30,'DEBIT_CARD','EMI'),

(3,40000.00,'2024-02-05',31,'UPI','EMI'),
(3,40000.00,'2024-05-05',32,'UPI','EMI'),
(3,40000.00,'2024-08-07',33,'NET_BANKING','EMI'),
(3,40000.00,'2024-11-05',34,'DEBIT_CARD','EMI'),
(3,40000.00,'2025-02-04',35,'UPI','EMI'),

(3,500.00,'2025-06-10',36,'UPI','LATE_FEE'),

(5,583333.33,'2024-02-18',39,'NET_BANKING','EMI'),
(5,583333.33,'2024-08-20',40,'UPI','EMI'),
(5,583333.33,'2025-02-20',41,'DEBIT_CARD','EMI'),

(8,405000.00,'2023-06-08',45,'UPI','EMI'),
(8,405000.00,'2023-12-10',46,'NET_BANKING','EMI'),
(8,405000.00,'2024-06-12',47,'DEBIT_CARD','EMI'),
(8,405000.00,'2024-12-10',48,'UPI','EMI'),

(9,29375.00,'2024-05-10',53,'UPI','EMI'),
(9,29375.00,'2024-08-12',54,'CASH','EMI'),

(10,725000.00,'2023-11-24',55,'NET_BANKING','EMI'),
(10,725000.00,'2024-05-25',56,'UPI','EMI'),
(10,725000.00,'2024-11-22',57,'DEBIT_CARD','EMI');

INSERT INTO Card (card_number, card_type, card_network, account_id, issue_date, expiry_date, cvv, pin_hash, status, credit_limit, available_credit)
VALUES
('4000000000000001','DEBIT','VISA',1,'2023-01-10','2028-01-10','123','HASH1','ACTIVE',NULL,NULL),
('4000000000000002','DEBIT','RUPAY',2,'2023-02-12','2028-02-12','234','HASH2','ACTIVE',NULL,NULL),
('4000000000000003','DEBIT','MASTERCARD',3,'2023-03-15','2028-03-15','345','HASH3','ACTIVE',NULL,NULL),
('4000000000000004','DEBIT','VISA',4,'2023-04-10','2028-04-10','456','HASH4','ACTIVE',NULL,NULL),
('4000000000000005','DEBIT','RUPAY',5,'2023-05-05','2028-05-05','567','HASH5','ACTIVE',NULL,NULL),
('4000000000000006','DEBIT','VISA',6,'2023-06-01','2028-06-01','678','HASH6','ACTIVE',NULL,NULL),
('4000000000000007','DEBIT','MASTERCARD',7,'2023-07-08','2028-07-08','789','HASH7','ACTIVE',NULL,NULL),
('4000000000000008','DEBIT','RUPAY',8,'2023-08-11','2028-08-11','890','HASH8','ACTIVE',NULL,NULL),
('4000000000000009','DEBIT','VISA',9,'2023-09-14','2028-09-14','901','HASH9','ACTIVE',NULL,NULL),
('4000000000000010','DEBIT','MASTERCARD',10,'2023-10-18','2028-10-18','112','HASH10','ACTIVE',NULL,NULL),
('4000000000000031','DEBIT','RUPAY',31,'2023-03-10','2028-03-10','221','HASH31','ACTIVE',NULL,NULL),
('4000000000000032','DEBIT','VISA',32,'2023-04-12','2028-04-12','332','HASH32','ACTIVE',NULL,NULL),
('4000000000000037','DEBIT','MASTERCARD',37,'2023-05-14','2028-05-14','443','HASH37','ACTIVE',NULL,NULL),
('5000000000000011','DEBIT','VISA',11,'2023-01-15','2028-01-15','555','HASH11','ACTIVE',NULL,NULL),
('5000000000000012','DEBIT','MASTERCARD',12,'2023-02-18','2028-02-18','666','HASH12','ACTIVE',NULL,NULL),
('5000000000000013','DEBIT','RUPAY',13,'2023-03-20','2028-03-20','777','HASH13','ACTIVE',NULL,NULL),
('5000000000000014','DEBIT','VISA',14,'2023-04-22','2028-04-22','888','HASH14','ACTIVE',NULL,NULL),
('5000000000000015','DEBIT','MASTERCARD',15,'2023-05-25','2028-05-25','999','HASH15','ACTIVE',NULL,NULL),
('5000000000000033','DEBIT','RUPAY',33,'2023-06-10','2028-06-10','111','HASH33','ACTIVE',NULL,NULL),
('5000000000000038','DEBIT','VISA',38,'2023-07-12','2028-07-12','222','HASH38','ACTIVE',NULL,NULL),
('6000000000000016','DEBIT','VISA',16,'2023-01-05','2028-01-05','333','HASH16','ACTIVE',NULL,NULL),
('6000000000000017','DEBIT','RUPAY',17,'2023-02-06','2028-02-06','444','HASH17','ACTIVE',NULL,NULL),
('6000000000000018','DEBIT','MASTERCARD',18,'2023-03-07','2028-03-07','555','HASH18','ACTIVE',NULL,NULL),
('6000000000000019','DEBIT','VISA',19,'2023-04-08','2028-04-08','666','HASH19','ACTIVE',NULL,NULL),
('6000000000000020','DEBIT','RUPAY',20,'2023-05-09','2028-05-09','777','HASH20','ACTIVE',NULL,NULL),
('6000000000000034','DEBIT','MASTERCARD',34,'2023-06-11','2028-06-11','888','HASH34','ACTIVE',NULL,NULL),
('6000000000000039','DEBIT','VISA',39,'2023-07-13','2028-07-13','999','HASH39','ACTIVE',NULL,NULL),
('7000000000000011','CREDIT','VISA',11,'2023-01-01','2028-01-01','321','CHASH11','ACTIVE',200000,150000),
('7000000000000012','CREDIT','MASTERCARD',12,'2023-02-01','2028-02-01','432','CHASH12','ACTIVE',300000,280000),
('7000000000000014','CREDIT','VISA',14,'2023-03-01','2028-03-01','543','CHASH14','ACTIVE',250000,200000),
('7000000000000015','CREDIT','RUPAY',15,'2023-04-01','2028-04-01','654','CHASH15','ACTIVE',180000,150000),
('7100000000000001','CREDIT','VISA',1,'2023-05-01','2028-05-01','765','CHASH1','ACTIVE',100000,80000),
('7100000000000002','CREDIT','MASTERCARD',2,'2023-06-01','2028-06-01','876','CHASH2','ACTIVE',120000,90000),
('7100000000000003','CREDIT','RUPAY',3,'2023-07-01','2028-07-01','987','CHASH3','ACTIVE',90000,70000),
('7200000000000016','CREDIT','VISA',16,'2023-08-01','2028-08-01','159','CHASH16','ACTIVE',150000,120000),
('7200000000000017','CREDIT','MASTERCARD',17,'2023-09-01','2028-09-01','258','CHASH17','ACTIVE',130000,100000),
('7200000000000018','CREDIT','RUPAY',18,'2023-10-01','2028-10-01','369','CHASH18','ACTIVE',140000,110000);


INSERT INTO Admin (employee_id, admin_level, access_scope, granted_by)
VALUES
(1, 'SUPER_ADMIN', 'GLOBAL', NULL);


INSERT INTO AuditLog (actor_type, actor_id, action, entity_type, entity_id, old_value, new_value, ip_address, device_info)
VALUES
-- ===== AUTH =====
('CUSTOMER',1,'LOGIN','CUSTOMER',1,NULL,NULL,'49.37.120.11','Android App'),
('CUSTOMER',2,'LOGOUT','CUSTOMER',2,NULL,NULL,'49.37.120.22','iOS App'),
('ADMIN',1,'LOGIN','ADMIN',1,NULL,NULL,'10.0.0.1','Admin Dashboard'),
('ADMIN',1,'LOGOUT','ADMIN',1,NULL,NULL,'10.0.0.1','Admin Dashboard'),
-- ===== ACCOUNT =====
('EMPLOYEE',1,'INSERT','ACCOUNT',1,NULL,'Account created with balance 15000','192.168.1.10','CBS'),
('CUSTOMER',1,'UPDATE','ACCOUNT',1,'balance=15000','balance=20000','49.37.120.11','Mobile App'),
('EMPLOYEE',4,'UPDATE','ACCOUNT',3,'status=ACTIVE','status=SUSPENDED','192.168.1.14','CBS'),
('ADMIN',1,'UPDATE','ACCOUNT',3,'status=SUSPENDED','status=ACTIVE','10.0.0.1','Admin Panel'),
('ADMIN',1,'DELETE','ACCOUNT',13,'Suspended account removed',NULL,'10.0.0.1','Admin Panel'),
-- ===== LOAN =====
('CUSTOMER',5,'INSERT','LOAN',5,NULL,'Applied Business Loan 25L','49.37.120.33','Web'),
('EMPLOYEE',2,'UPDATE','LOAN',4,'status=PENDING','status=SANCTIONED','192.168.1.11','Loan System'),
('EMPLOYEE',5,'APPROVE','LOAN',1,'status=PENDING','status=ACTIVE','192.168.1.12','Loan System'),
('EMPLOYEE',5,'REJECT','LOAN',7,'status=PENDING','status=REJECTED','192.168.1.15','Loan Portal'),
('EMPLOYEE',5,'UPDATE','LOAN',5,'interest_rate=11.50','interest_rate=10.75','192.168.1.15','Loan Portal'),
('ADMIN',1,'UPDATE','LOAN',4,'status=SANCTIONED','status=ACTIVE','10.0.0.1','Admin Override'),
-- ===== TRANSACTION =====
('CUSTOMER',3,'INSERT','TRANSACTION',21,NULL,'Transfer 5000','49.37.120.77','Android'),
('EMPLOYEE',3,'UPDATE','TRANSACTION',23,'status=PENDING','status=FAILED','192.168.1.13','CBS'),
('EMPLOYEE',3,'DELETE','TRANSACTION',7,'Failed txn removed',NULL,'192.168.1.13','CBS'),
-- ===== CARD ====
('CUSTOMER',1,'UPDATE','CARD',1,'status=ACTIVE','status=BLOCKED','49.37.120.11','Mobile'),
('EMPLOYEE',2,'UPDATE','CARD',1,'status=BLOCKED','status=ACTIVE','192.168.1.11','Branch System'),
-- ===== CUSTOMER PROFILE =====
('CUSTOMER',10,'LOGIN','CUSTOMER',10,NULL,NULL,'103.25.110.5','Chrome Mobile'),
('CUSTOMER',10,'LOGIN','CUSTOMER',10,NULL,NULL,'185.23.44.2','Unknown Device'),
('CUSTOMER',10,'UPDATE','CUSTOMER',10,'phone=8200000010','phone=9999999999','103.25.110.5','Mobile'),
-- ===== EMPLOYEE =====
('ADMIN',1,'UPDATE','EMPLOYEE',3,'role=Cashier','role=Senior Cashier','10.0.0.1','Admin Panel');


INSERT INTO SystemLog(record_type, actor_type, actor_id, component_name, action, entity_type, entity_id, metric_name, metric_value, description, ip_address)
VALUES
-- ===== CORE EVENTS =====
('EVENT','SYSTEM',NULL,'TRANSACTION_ENGINE','INSERT','TRANSACTION',1,NULL,NULL,'Transaction success',NULL),
('EVENT','SYSTEM',NULL,'LOAN_SERVICE','UPDATE','LOAN',1,NULL,NULL,'Loan activated',NULL),
('EVENT','SYSTEM',NULL,'AUTH_SERVICE','LOGIN','CUSTOMER',1,NULL,NULL,'Login success','49.37.120.11'),
-- ===== ERRORS =====
('EVENT','SYSTEM',NULL,'AUTH_SERVICE','ERROR','CUSTOMER',7,NULL,NULL,'Invalid login','49.37.120.99'),
('EVENT','SYSTEM',NULL,'PAYMENT_GATEWAY','ERROR','TRANSACTION',23,NULL,NULL,'Gateway timeout',NULL),
('EVENT','SYSTEM',NULL,'DATABASE','ERROR',NULL,NULL,NULL,NULL,'Deadlock detected',NULL),
-- ===== WARNINGS =====
('EVENT','SYSTEM',NULL,'PAYMENT_GATEWAY','WARNING','TRANSACTION',23,NULL,NULL,'Delayed response',NULL),
('EVENT','SYSTEM',NULL,'FRAUD_DETECTION','WARNING','CUSTOMER',10,NULL,NULL,'Multiple IP login','185.23.44.2'),
-- ===== INFO / RETRY =====
('EVENT','SYSTEM',NULL,'PAYMENT_GATEWAY','INFO','TRANSACTION',23,NULL,NULL,'Retry successful',NULL),
('EVENT','EMPLOYEE',2,'ACCOUNT_SERVICE','UPDATE','ACCOUNT',2,NULL,NULL,'Account updated','192.168.1.11'),
('EVENT','EMPLOYEE',5,'LOAN_SERVICE','UPDATE','LOAN',5,NULL,NULL,'Loan approved','192.168.1.12'),
-- ===== METRICS =====
('METRIC','SYSTEM',NULL,'TRANSACTION_ENGINE',NULL,NULL,NULL,'TXN_SUCCESS_RATE',98.7500,'Success rate',NULL),
('METRIC','SYSTEM',NULL,'TRANSACTION_ENGINE',NULL,NULL,NULL,'TXN_FAILURE_RATE',1.2500,'Failure rate',NULL),
('METRIC','SYSTEM',NULL,'LOAN_SERVICE',NULL,NULL,NULL,'ACTIVE_LOANS',6.0000,'Active loans',NULL),
('METRIC','SYSTEM',NULL,'AUTH_SERVICE',NULL,NULL,NULL,'LOGIN_ATTEMPTS',120.0000,'Daily logins',NULL),
('METRIC','SYSTEM',NULL,'AUTH_SERVICE',NULL,NULL,NULL,'FAILED_LOGINS',8.0000,'Failed logins',NULL),
('METRIC','SYSTEM',NULL,'DATABASE',NULL,NULL,NULL,'DB_CONNECTIONS',120.0000,'Active connections',NULL),
('METRIC','SYSTEM',NULL,'PAYMENT_GATEWAY',NULL,NULL,NULL,'API_LATENCY_MS',350.2500,'Latency',NULL),
('METRIC','SYSTEM',NULL,'CARD_SERVICE',NULL,NULL,NULL,'CARDS_BLOCKED',2.0000,'Blocked cards',NULL),
('METRIC','SYSTEM',NULL,'NOTIFICATION_SERVICE',NULL,NULL,NULL,'DELIVERY_SUCCESS_RATE',96.5000,'Delivery rate',NULL);


INSERT INTO Notification(user_type, user_id, title, message, notification_type, priority, channel, status, is_read, reference_type, reference_id, error_log, sent_at)
VALUES
-- ===== TRANSACTIONS =====
('CUSTOMER',1,'Money Deposited','₹5000 credited','TRANSACTION','LOW','SMS','DELIVERED',TRUE,'TRANSACTION',1,NULL,NOW()),
('CUSTOMER',2,'Withdrawal Alert','₹5000 debited','TRANSACTION','MEDIUM','SMS','DELIVERED',TRUE,'TRANSACTION',12,NULL,NOW()),
('CUSTOMER',3,'Transfer Failed','₹7000 failed','TRANSACTION','HIGH','EMAIL','FAILED',FALSE,'TRANSACTION',23,'Insufficient balance',NOW()),
('CUSTOMER',5,'Transfer Success','₹3000 transferred','TRANSACTION','LOW','IN_APP','DELIVERED',TRUE,'TRANSACTION',25,NULL,NOW()),
('CUSTOMER',7,'Transaction Pending','Txn pending','TRANSACTION','MEDIUM','SMS','SENT',FALSE,'TRANSACTION',27,NULL,NOW()),
-- ===== LOAN =====
('CUSTOMER',1,'Loan Approved','Home loan approved','LOAN','HIGH','EMAIL','DELIVERED',TRUE,'LOAN',1,NULL,NOW()),
('CUSTOMER',4,'Loan Sanctioned','Education loan sanctioneds','LOAN','HIGH','IN_APP','SENT',FALSE,'LOAN',4,NULL,NOW()),
('CUSTOMER',7,'Loan Rejected','Loan rejected','LOAN','HIGH','EMAIL','DELIVERED',TRUE,'LOAN',7,'Low score',NOW()),
('CUSTOMER',1,'EMI Overdue','EMI overdue','LOAN','HIGH','SMS','DELIVERED',FALSE,'LOAN',1,NULL,NOW()),
-- ===== SECURITY =====
('CUSTOMER',1,'Login Alert','New login detected','SECURITY','HIGH','PUSH','DELIVERED',FALSE,'CUSTOMER',1,NULL,NOW()),
('CUSTOMER',10,'Suspicious Login','Unknown device login','SECURITY','HIGH','PUSH','DELIVERED',FALSE,'CUSTOMER',10,NULL,NOW()),
('CUSTOMER',1,'Card Blocked','Card blocked','SECURITY','HIGH','SMS','DELIVERED',FALSE,'CARD',1,NULL,NOW()),
('CUSTOMER',1,'Card Reactivated','Card active','SECURITY','MEDIUM','EMAIL','DELIVERED',TRUE,'CARD',1,NULL,NOW()),
('EMPLOYEE',2,'Password Changed','Password updated','SECURITY','MEDIUM','EMAIL','DELIVERED',TRUE,'EMPLOYEE',2,NULL,NOW()),
-- ===== SYSTEM =====
('EMPLOYEE',3,'Txn Review','Review failed txn','SYSTEM','MEDIUM','IN_APP','SENT',FALSE,'TRANSACTION',23,NULL,NOW()),
('EMPLOYEE',5,'Maintenance Alert','System maintenance','SYSTEM','LOW','IN_APP','SENT',FALSE,NULL,NULL,NULL,NOW()),
('ADMIN',1,'Audit Completed','Monthly audit done','SYSTEM','MEDIUM','EMAIL','DELIVERED',TRUE,NULL,NULL,NULL,NOW()),
('ADMIN',1,'Fraud Alert','Suspicious activity detected','SECURITY','HIGH','EMAIL','DELIVERED',TRUE,NULL,NULL,NULL,NOW()),
('CUSTOMER',8,'Notification Failed','Delivery failed','SYSTEM','LOW','SMS','FAILED',FALSE,NULL,NULL,'Invalid number',NOW());