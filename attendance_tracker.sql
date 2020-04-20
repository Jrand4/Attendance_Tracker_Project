-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 08:20 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(3) NOT NULL,
  `userID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `userID`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `availablenumbers`
--

CREATE TABLE `availablenumbers` (
  `numbersID` int(8) NOT NULL,
  `numbers` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseID` int(3) NOT NULL,
  `CourseTerm` varchar(25) NOT NULL,
  `courseName` varchar(50) NOT NULL,
  `courseCategory` varchar(10) NOT NULL,
  `courseNumber` varchar(10) NOT NULL,
  `courseSection` varchar(10) NOT NULL,
  `courseDays` varchar(10) NOT NULL,
  `courseStartTime` varchar(15) NOT NULL,
  `courseEndTime` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `CourseTerm`, `courseName`, `courseCategory`, `courseNumber`, `courseSection`, `courseDays`, `courseStartTime`, `courseEndTime`) VALUES
(1, 'SP20', 'LinearAlgebra', 'MATH-2600', '30104', '01', 'MW', '12:30PM', '1:45PM'),
(2, 'SP20', 'Microprocessors', 'CSC-3600', '30112', '01', 'MF', '9:30AM', '10:45AM'),
(3, 'SP20', 'MobileApplicationDevelopment', 'CSC-3560', '30457', '01', 'TR', '3:30PM', '4:45PM'),
(4, 'SP20', 'SoftwareEngineering', 'CSC-4400', '30190', '01', 'MW', '11:00AM', '12:15PM'),
(5, 'SP20', 'CalculusII', 'MATH-2400', '33109', '01', 'TR', '2:00PM', '3:15PM');

-- --------------------------------------------------------

--
-- Table structure for table `coursestudentabsence`
--

CREATE TABLE `coursestudentabsence` (
  `courseStudentAbsenceID` int(5) NOT NULL,
  `courseID` int(3) NOT NULL,
  `studentID` int(3) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `facultyID` int(3) NOT NULL,
  `userID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyID`, `userID`) VALUES
(1, 1),
(2, 7),
(3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `facultycourse`
--

CREATE TABLE `facultycourse` (
  `facultyCourseID` int(3) NOT NULL,
  `facultyID` int(3) NOT NULL,
  `courseID` int(3) NOT NULL,
  `takesAttendance` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facultycourse`
--

INSERT INTO `facultycourse` (`facultyCourseID`, `facultyID`, `courseID`, `takesAttendance`) VALUES
(10, 2, 4, 'No'),
(13, 1, 2, 'No'),
(18, 2, 5, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(3) NOT NULL,
  `totalAbsence` int(3) NOT NULL,
  `userID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `totalAbsence`, `userID`) VALUES
(1, 0, 3),
(3, 0, 4),
(4, 0, 5),
(5, 0, 6),
(6, 0, 9),
(7, 0, 10),
(8, 0, 11),
(9, 0, 12),
(10, 0, 13),
(11, 0, 14);

-- --------------------------------------------------------

--
-- Table structure for table `studentcourse`
--

CREATE TABLE `studentcourse` (
  `studentCourseID` int(3) NOT NULL,
  `studentID` int(3) NOT NULL,
  `courseID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studentcourse`
--

INSERT INTO `studentcourse` (`studentCourseID`, `studentID`, `courseID`) VALUES
(1, 6, 4),
(2, 7, 4),
(3, 4, 5),
(4, 9, 5),
(5, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(3) NOT NULL,
  `userNumber` varchar(15) NOT NULL,
  `userFirstName` varchar(25) NOT NULL,
  `userLastName` varchar(25) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userEmailBackup` varchar(50) NOT NULL,
  `userType` varchar(15) NOT NULL,
  `userUserName` varchar(50) NOT NULL,
  `userPassword` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userNumber`, `userFirstName`, `userLastName`, `userEmail`, `userEmailBackup`, `userType`, `userUserName`, `userPassword`) VALUES
(1, '01395019', 'faculty', 'faculty', 'faculty@faculty.edu', 'xaletor@yahoo.com', 'faculty', 'faculty', 'faculty'),
(2, '01395020', 'admin', 'admin', 'admin@admin.edu', 'josephrandtx@gmail.com', 'admin', 'admin', 'admin'),
(3, '01395021', 'student', 'student', 'student@student.edu', 'jrand4@student.fitchburgstate.edu', 'student', 'student', 'student'),
(4, '01395022', 'Alex', 'Albertson', 'AAlbertson1@student.edu', 'AAbert@gmail.com', 'student', 'AAlbertson1', 'FS-5022'),
(5, '01395023', 'Freddy', 'Fredderson', 'FFredderson1@student.edu', 'FFredd@gmail.com', 'student', 'FFredderson1', 'FS-5023'),
(6, '01395024', 'George', 'Albertson', 'GAlbertson2@student.edu', 'GAlbert@gmail.com', 'student', 'GAlbertson2', 'FS-5024'),
(7, '01395025', 'Nancy', 'Mancy', 'NMancy1@faculty.edu', 'Nannymancy@gmail.com', 'faculty', 'NMancy1', 'FS-5025'),
(8, '01395026', 'Pickles', 'Mickles', 'PMickles1@faculty.edu', 'PickMick@gmail.com', 'faculty', 'PMickles1', 'FS-5026'),
(9, '01395027', 'John', 'King', 'JKing1@student.edu', 'jk@king.com', 'student', 'JKing1', 'FS-5027'),
(10, '01395028', 'Karen', 'McClendon', 'KMcClendon1@student.edu', 'MC@student.com', 'student', 'KMcClendon1', 'FS-5028'),
(11, '01395029', 'Frank', 'Frankson', 'FFrankson1@student.edu', 'FF@student.com', 'student', 'FFrankson1', 'FS-5029'),
(12, '01395030', 'George', 'Georgeson', 'GGeorgeson1@student.edu', 'GG@student.com', 'student', 'GGeorgeson1', 'FS-5030'),
(13, '01395031', 'Micheal', 'Brown', 'MBrown1@student.edu', 'MB@student.com', 'student', 'MBrown1', 'FS-5031'),
(14, '01395032', 'Ames', 'Archer', 'AArcher1@student.edu', 'Aarch@student.com', 'student', 'AArcher1', 'FS-5032');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `availablenumbers`
--
ALTER TABLE `availablenumbers`
  ADD PRIMARY KEY (`numbersID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `coursestudentabsence`
--
ALTER TABLE `coursestudentabsence`
  ADD PRIMARY KEY (`courseStudentAbsenceID`),
  ADD KEY `courseID` (`courseID`),
  ADD KEY `studentID` (`studentID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`facultyID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `facultycourse`
--
ALTER TABLE `facultycourse`
  ADD PRIMARY KEY (`facultyCourseID`),
  ADD KEY `facultyID` (`facultyID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `studentcourse`
--
ALTER TABLE `studentcourse`
  ADD PRIMARY KEY (`studentCourseID`),
  ADD KEY `studentID` (`studentID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userNumber` (`userNumber`,`userEmail`,`userEmailBackup`,`userUserName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `availablenumbers`
--
ALTER TABLE `availablenumbers`
  MODIFY `numbersID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coursestudentabsence`
--
ALTER TABLE `coursestudentabsence`
  MODIFY `courseStudentAbsenceID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `facultyID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `facultycourse`
--
ALTER TABLE `facultycourse`
  MODIFY `facultyCourseID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `studentcourse`
--
ALTER TABLE `studentcourse`
  MODIFY `studentCourseID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `coursestudentabsence`
--
ALTER TABLE `coursestudentabsence`
  ADD CONSTRAINT `coursestudentabsence_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  ADD CONSTRAINT `coursestudentabsence_ibfk_3` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);

--
-- Constraints for table `faculty`
--
ALTER TABLE `faculty`
  ADD CONSTRAINT `faculty_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `facultycourse`
--
ALTER TABLE `facultycourse`
  ADD CONSTRAINT `facultycourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  ADD CONSTRAINT `facultycourse_ibfk_2` FOREIGN KEY (`facultyID`) REFERENCES `faculty` (`facultyID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `studentcourse`
--
ALTER TABLE `studentcourse`
  ADD CONSTRAINT `studentcourse_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  ADD CONSTRAINT `studentcourse_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
