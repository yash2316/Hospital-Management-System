create database HMS_project;

use HMS_project;

CREATE TABLE `admintb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
);

INSERT INTO `admintb` (`username`, `password`) VALUES
('root', '1234');


-- Table structure for table `doctb`

CREATE TABLE `doctb` (
  `username` varchar(50) NOT NULL primary key,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int NOT NULL
)  ;

-- Inserting into doctb
INSERT INTO doctb (username, password, email, spec, docFees) 
VALUES 
('dr_gupta', 'pass123', 'dr.gupta@example.com', 'General Health', 500),
('dr_khan', 'pass456', 'dr.khan@example.com', 'Pediatrics', 600),
('dr_sharma', 'pass789', 'dr.sharma@example.com', 'Cardiology', 550);
-- --------------------------------------------------------

--
-- Table structure for table `patreg`
--

CREATE TABLE `patreg` (
  `pid` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL
) ;

-- Inserting into patreg
INSERT INTO patreg (pid, fname, lname, gender, email, contact, password) 
VALUES 
(201, 'Aryan', 'Gupta', 'Male', 'aryan.gupta@example.com', '9876543210', 'pass123'),
(202, 'Diya', 'Patel', 'Female', 'diya.patel@example.com', '8765432109', 'pass456'),
(203, 'Arjun', 'Singh', 'Male', 'arjun.singh@example.com', '7654321098', 'pass789'),
(204, 'Aisha', 'Joshi', 'Female', 'aisha.joshi@example.com', '6543210987', 'passabc'),
(205, 'Ravi', 'Verma', 'Male', 'ravi.verma@example.com', '5432109876', 'pass1234'),
(206, 'Maya', 'Shah', 'Female', 'maya.shah@example.com', '4321098765', 'pass567'),
(207, 'Neeraj', 'Kumar', 'Male', 'neeraj.kumar@example.com', '3210987654', 'pass890'),
(208, 'Nisha', 'Reddy', 'Female', 'nisha.reddy@example.com', '2109876543', 'passabc1'),
(209, 'Ishaan', 'Chatterjee', 'Male', 'ishaan.chatterjee@example.com', '1098765432', 'pass234'),
(210, 'Kirti', 'Sharma', 'Female', 'kirti.sharma@example.com', '0987654321', 'pass5678');

-- --------------------------------------------------------


CREATE TABLE `appointmenttb` (
  `pid` int NOT NULL  ,
  `ID` int NOT NULL PRIMARY KEY auto_increment,
  `doctor` varchar(30) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `userStatus` int NOT NULL,
  `doctorStatus` int NOT NULL,
  FOREIGN KEY (pid) REFERENCES patreg(pid),
  FOREIGN KEY (doctor) REFERENCES doctb(username)
);

-- Inserting into appointmenttb
INSERT INTO appointmenttb (pid, doctor, appdate, apptime, userStatus, doctorStatus) 
VALUES 
(201,  'dr_gupta', '2024-04-11', '10:00', 1, 1),
(202,  'dr_gupta','2024-04-12', '11:30', 1, 1),
(203,  'dr_gupta',  '2024-04-13', '14:00', 1, 1),
(204,  'dr_khan', '2024-04-14', '15:30', 1, 1),
(205,  'dr_khan',  '2024-04-15', '16:30', 1, 1),
(206,  'dr_khan',  '2024-04-16', '17:30', 1, 1),
(207,  'dr_sharma',  '2024-04-17', '18:30', 1, 1),
(208,  'dr_sharma',  '2024-04-18', '19:30', 1, 1),
(209,  'dr_sharma',  '2024-04-19', '20:30', 1, 1),
(210,  'dr_sharma',  '2024-04-20', '21:30', 1, 1);


--
-- Table structure for table `prestb`
--

CREATE TABLE `prestb` (
  `doctor` varchar(50) NOT NULL,
  `pid` int NOT NULL,
  `ID` int NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL,
  FOREIGN KEY (pid) REFERENCES patreg(pid),
  FOREIGN KEY (doctor) REFERENCES doctb(username),
  FOREIGN KEY (ID) REFERENCES appointmenttb(ID)
) ;

-- Inserting into prestb
INSERT INTO prestb (doctor, pid, ID, disease, allergy, prescription) 
VALUES 
('dr_gupta', 201, 21,   'Fever', 'Penicillin', 'Paracetamol'),
('dr_gupta', 202, 22,   'Cold', 'Dust', 'Antihistamines'),
('dr_gupta', 203, 23,   'Hypertension', 'Shellfish', 'Amlodipine'),
('dr_khan', 204, 24,   'Acne', 'Salicylic Acid', 'Retin');
