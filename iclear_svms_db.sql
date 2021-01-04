-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 04, 2021 at 03:36 AM
-- Server version: 8.0.17
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iclear_svms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `acad_year`
--

DROP TABLE IF EXISTS `acad_year`;
CREATE TABLE IF NOT EXISTS `acad_year` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_year` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('1','0') NOT NULL DEFAULT '0',
  `is_deleted` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_year_UNIQUE` (`base_year`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acad_year`
--

INSERT INTO `acad_year` (`id`, `base_year`, `name`, `state`, `is_deleted`) VALUES
(1, 2019, '2019-2020', '1', '0'),
(251, 2020, '2020-2021', '0', '0'),
(252, 2021, '2021-2022', '0', '0'),
(253, 2022, '2022-2023', '0', '0'),
(254, 2023, '2023-2024', '0', '0'),
(255, 2024, '2024-2025', '0', '0'),
(256, 2025, '2025-2026', '0', '0'),
(257, 2026, '2026-2027', '0', '0'),
(258, 2027, '2027-2028', '0', '0'),
(259, 2028, '2028-2029', '0', '0'),
(260, 2029, '2029-2030', '0', '0'),
(261, 2030, '2030-2031', '0', '0'),
(262, 2031, '2031-2032', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` varchar(20) NOT NULL,
  `username` varchar(35) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `lastname` varchar(65) NOT NULL,
  `firstname` varchar(65) NOT NULL,
  `middlename` varchar(65) NOT NULL,
  `state` enum('1','0') NOT NULL DEFAULT '1',
  `is_locked` int(1) NOT NULL DEFAULT '0',
  `contact_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `acc_fk_user_type_id_idx` (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `user_type_id`, `username`, `password`, `fullname`, `lastname`, `firstname`, `middlename`, `state`, `is_locked`, `contact_number`) VALUES
(131, 'ADMIN', 'eunilleUSER', '$2y$14$CkZi32N6zcBl.W.JMfCUfeUQDZAstG88c1Wa7LdxhCynqd07BioZi', 'Villegas, Eunille', 'villegas', 'eunille', '', '1', 0, '09454558398'),
(132, 'USER', 'pongUSER', '$2a$14$Gyig3Pns2ZsPLwEbcNG0furh0pVMzPM7w9ee5NnV0rui4qicGV0f2', 'Arcilla, John Paul Sarilla', 'Arcilla', 'John Paul', 'Sarilla', '1', 0, '09457893654'),
(133, 'SUBJECT', 'evelynUSER', '$2a$14$koYkfcJvwRk08Ot1BpQKTOvlss4FuEK3yGyJO9mPtG9cwzSQKj6E2', 'Dairith, Evelyn ', 'Dairith', 'Evelyn', '', '1', 0, '04589615486'),
(134, 'SUBJECT', 'roldanUSER', '$2a$14$32JhRB353pgcmE4KN7Fxper0BQjhaJS8jklgu2dstsPUKBQKX4nwm', 'Frias, Roldan Lupig', 'Frias', 'Roldan', 'Lupig', '1', 0, '0923431312'),
(135, 'SUBJECT', 'daveUSER', '$2a$14$y6AWPUyj6P5y6sp6mA34VO86nswHGBDS2dIWIs4wURoUgXX66torK', 'Leoncio, Larwel Dave Filipe', 'Leoncio', 'Larwel Dave', 'Filipe', '1', 0, '093425678912'),
(136, 'SUBJECT', 'jamesUSER', '$2a$14$b6SbPQjs2D.4v2xiR7NcWe3KEu08PiUaQ5ox7KHDGFp6GyweRFPqK', 'Smith, James Lewis', 'Smith', 'James', 'Lewis', '1', 0, '09789234182'),
(137, 'USER', 'neweunilleUSER', '$2a$14$4pgnkLGPEOVew/sOGCQalOVuG85lqfD8lSmDA5PXIDDQGcge2RUtu', 'New User, New User New User', 'New User', 'New User', 'New User', '1', 0, '09452341234');

-- --------------------------------------------------------

--
-- Table structure for table `account_departments`
--

DROP TABLE IF EXISTS `account_departments`;
CREATE TABLE IF NOT EXISTS `account_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `departments_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_account_id_idx` (`account_id`),
  KEY `fkk_departments_id_idx` (`departments_id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `account_departments`
--

INSERT INTO `account_departments` (`id`, `account_id`, `departments_id`) VALUES
(326, 132, 140),
(327, 132, 141),
(328, 132, 142),
(329, 132, 144),
(330, 132, 145),
(331, 132, 139),
(334, 137, 139),
(336, 132, 143),
(337, 132, 146),
(338, 132, 147),
(339, 132, 151);

-- --------------------------------------------------------

--
-- Table structure for table `account_login_logs`
--

DROP TABLE IF EXISTS `account_login_logs`;
CREATE TABLE IF NOT EXISTS `account_login_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `udpated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('1','0') DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_account_log_id_idx` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_login_logs`
--

INSERT INTO `account_login_logs` (`id`, `account_id`, `state`) VALUES
(226, 131, '1');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_event`
--

DROP TABLE IF EXISTS `attendance_event`;
CREATE TABLE IF NOT EXISTS `attendance_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `unique_key` varchar(100) NOT NULL,
  `event_id` int(11) NOT NULL,
  `time_in` timestamp NULL DEFAULT NULL,
  `time_out` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key_UNIQUE` (`unique_key`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance_event`
--

INSERT INTO `attendance_event` (`id`, `student_username`, `unique_key`, `event_id`, `time_in`, `time_out`) VALUES
(111, 'CL1', '12345-76', 76, '2020-02-25 08:58:26', '2020-02-25 01:49:26'),
(112, 'CL2', '12346-76', 76, '2020-11-02 03:51:19', '2020-02-25 01:49:51'),
(113, 'CL4', '12348-76', 76, '2020-02-25 01:53:39', '2020-02-25 08:59:44'),
(114, 'CL5', '12349-76', 76, '2020-02-25 01:53:42', NULL),
(115, 'CL3', '12347-76', 76, '2020-02-25 01:54:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `backtrack_account`
--

DROP TABLE IF EXISTS `backtrack_account`;
CREATE TABLE IF NOT EXISTS `backtrack_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` tinytext NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bac_account_id_idx` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blacklist_token`
--

DROP TABLE IF EXISTS `blacklist_token`;
CREATE TABLE IF NOT EXISTS `blacklist_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` text NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_account_idx` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `teacher_account_id` int(11) NOT NULL,
  `educ_level_id` int(11) NOT NULL,
  `course` varchar(45) NOT NULL DEFAULT 'NONE',
  `yearlevel` varchar(45) NOT NULL,
  `section` varchar(45) NOT NULL DEFAULT 'NONE',
  `acad_year_id` varchar(45) NOT NULL DEFAULT 'NONE',
  `semester_id` varchar(45) NOT NULL DEFAULT 'NONE',
  `state` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `teacher_account_id`, `educ_level_id`, `course`, `yearlevel`, `section`, `acad_year_id`, `semester_id`, `state`) VALUES
(178, 'Sibika JHS 3rd', 129, 2, 'NONE', '3rd', 'MAGLAYO', '1', '4', '1'),
(179, 'English JH5', 129, 2, 'NONE', '1st', 'MAGLAYO', '1', '4', '1'),
(180, 'Math 1', 130, 1, 'NONE', '1st', 'MAGLAYO', '1', '4', '1');

-- --------------------------------------------------------

--
-- Table structure for table `class_issue`
--

DROP TABLE IF EXISTS `class_issue`;
CREATE TABLE IF NOT EXISTS `class_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_username` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `class_id` int(11) NOT NULL,
  `course` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `yearlevel` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `section` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `acad_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `context` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'NONE',
  `status` enum('RESOLVED','PENDING','CONSIDERED') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'PENDING',
  `is_deleted` enum('1','0') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_upload` varchar(45) COLLATE latin1_bin DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `class_issue`
--

INSERT INTO `class_issue` (`id`, `student_username`, `class_id`, `course`, `yearlevel`, `section`, `acad_year_id`, `semester_id`, `context`, `status`, `is_deleted`, `is_upload`) VALUES
(1260, 'JH11', 178, 'NONE', '3rd', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1261, 'JH15', 178, 'NONE', '3rd', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1262, 'JH3', 178, 'NONE', '3rd', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1263, 'JH7', 178, 'NONE', '3rd', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1267, 'JH1', 179, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1268, 'JH13', 179, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1269, 'JH5', 179, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1270, 'JH9', 179, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1271, 'GS1', 180, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1272, 'GS2', 180, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1273, 'GS3', 180, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1274, 'GS4', 180, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0'),
(1275, 'GS5', 180, 'NONE', '1st', 'MAGLAYO', 1, 4, 'sample context', 'PENDING', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `clearance_issue`
--

DROP TABLE IF EXISTS `clearance_issue`;
CREATE TABLE IF NOT EXISTS `clearance_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(255) COLLATE latin1_bin NOT NULL,
  `student_username` varchar(45) COLLATE latin1_bin NOT NULL,
  `departments_id` int(11) NOT NULL,
  `acad_year_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `context` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `status` enum('RESOLVED','PENDING','CONSIDERED') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT 'PENDING',
  `account_id_by` int(11) NOT NULL,
  `account_id_status` int(11) NOT NULL DEFAULT '0',
  `is_deleted` enum('1','0') COLLATE latin1_bin NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course` varchar(45) COLLATE latin1_bin NOT NULL,
  `yearlevel` varchar(45) COLLATE latin1_bin NOT NULL,
  `section` varchar(45) COLLATE latin1_bin NOT NULL,
  `is_upload` enum('1','0') COLLATE latin1_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`status`,`unique_id`),
  UNIQUE KEY `unique_id_UNIQUE` (`unique_id`),
  KEY `fk_departments_id_idx` (`departments_id`),
  KEY `fk_acad_year_id_idx` (`acad_year_id`),
  KEY `fk_sems_idx` (`semester_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1084 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `clearance_issue`
--

INSERT INTO `clearance_issue` (`id`, `unique_id`, `student_username`, `departments_id`, `acad_year_id`, `semester_id`, `context`, `status`, `account_id_by`, `account_id_status`, `is_deleted`, `course`, `yearlevel`, `section`, `is_upload`) VALUES
(1072, 'GS114111Fomr 137', 'GS1', 141, 1, 4, 'Fomr 137', 'CONSIDERED', 132, 132, '0', 'NONE', '1', 'MAGLAYO', '0'),
(1073, 'GS114111Certificate of good moral', 'GS1', 141, 1, 4, 'Certificate of good moral', 'CONSIDERED', 132, 132, '0', 'NONE', '1', 'MAGLAYO', '0'),
(1074, 'GS114111Report Card', 'GS1', 141, 1, 4, 'Report Card', 'PENDING', 132, 132, '0', 'NONE', '1', 'MAGLAYO', '0'),
(1075, 'GS114111Birth Cirtificate', 'GS1', 141, 1, 4, 'Birth Cirtificate', 'PENDING', 132, 132, '0', 'NONE', '1', 'MAGLAYO', '0'),
(1076, 'CL113911Form-137', 'CL1', 139, 1, 1, 'Form-137', 'PENDING', 132, 0, '0', 'BSCPE', '1st', 'B', '0'),
(1077, 'CL113911Senior High School Report Card', 'CL1', 139, 1, 1, 'Senior High School Report Card', 'PENDING', 132, 0, '0', 'BSCPE', '1st', 'B', '0'),
(1078, 'CL113911Certificate of Good Moral', 'CL1', 139, 1, 1, 'Certificate of Good Moral', 'PENDING', 132, 0, '0', 'BSCPE', '1st', 'B', '0'),
(1079, 'GS114111Baptisimal Certificate', 'GS1', 141, 1, 4, 'Baptisimal Certificate', 'PENDING', 132, 132, '0', 'NONE', '1', 'MAGLAYO', '0'),
(1080, 'CL2113911New Requirements', 'CL21', 139, 1, 1, 'New Requirements', 'PENDING', 132, 0, '0', 'BSN', '1st', 'A', '0'),
(1081, 'CL2113911Senior High School Report Card', 'CL21', 139, 1, 1, 'Senior High School Report Card', 'PENDING', 132, 0, '0', 'BSN', '1st', 'A', '0');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `educ_level_id` int(11) NOT NULL,
  `department_type_id` int(11) NOT NULL,
  `course` varchar(45) NOT NULL DEFAULT 'NONE',
  `yearlevel` varchar(45) NOT NULL,
  `head_officer` varchar(100) NOT NULL,
  `state` enum('1','0') NOT NULL DEFAULT '1',
  `section` varchar(45) NOT NULL DEFAULT 'NONE',
  `acad_year_id` varchar(45) NOT NULL DEFAULT 'NONE',
  `semester_id` varchar(45) NOT NULL DEFAULT 'NONE',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_department` varchar(45) NOT NULL DEFAULT 'NONE',
  `is_subdepartment` enum('fin','reg','none') NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `fkk_educ_level_id_idx` (`educ_level_id`)
) ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `educ_level_id`, `department_type_id`, `course`, `yearlevel`, `head_officer`, `state`, `section`, `acad_year_id`, `semester_id`, `student_department`, `is_subdepartment`) VALUES
(139, 'Registrar - College', 4, 2, '-ALL', '-ALL', 'Dr. Fe Faundo', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'reg'),
(140, 'Activty - CCS', 4, 4, 'ALL', '-ALL', 'King Olgado', '1', 'NONE', 'NONE', 'NONE', 'CCS', 'none'),
(141, 'Registrar - GradeSchool', 1, 2, 'NONE', '-ALL', 'Mr. Leo Macarasig', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'reg'),
(142, 'Test CCS SSITE', 4, 4, 'ALL', '-ALL', 'SSITE president', '1', 'NONE', 'NONE', 'NONE', 'CCS', 'none'),
(143, 'Violation Departments', 4, 3, '-ALL', '-ALL', 'Dr. Yange Marquez', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'none'),
(144, 'Registrar - Junior High School', 2, 2, 'NONE', '-ALL', 'Michellle Manahan', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'reg'),
(145, 'Registrar - Senior High School', 3, 2, '-ALL', '-ALL', 'Romyr Gimeno', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'reg'),
(146, 'GradeSchool - Violation Prefect', 1, 3, 'NONE', '-ALL', 'Dr. Samson Maglante', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'none'),
(147, 'Violation Prefect ', 4, 3, '-ALL', '-ALL', 'Dr. Elenaro Martin', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'none'),
(148, 'Finance GS', 1, 2, 'NONE', '-ALL', 'Head Officer of Finance', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'none'),
(149, 'Finance GS1', 1, 2, 'NONE', '-ALL', 'Head one test', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'fin'),
(150, 'test finance ', 1, 2, 'NONE', '-ALL', 'vsd', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'fin'),
(151, 'Finance GS', 4, 2, '-ALL', '-ALL', 'Finance Head name', '1', 'NONE', 'NONE', 'NONE', 'ALL', 'fin'),
(152, 'test 1', 4, 2, 'BSCPE', '1st', 'yolanda martinez', '1', 'NONE', 'NONE', 'NONE', 'CCS', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `departments_requirements`
--

DROP TABLE IF EXISTS `departments_requirements`;
CREATE TABLE IF NOT EXISTS `departments_requirements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departments_id` int(11) NOT NULL,
  `context` varchar(200) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `state` enum('1','0') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `departments_requirements`
--

INSERT INTO `departments_requirements` (`id`, `departments_id`, `context`, `state`) VALUES
(74, 139, 'Form-137', '1'),
(75, 139, 'Senior High School Report Card', '1'),
(76, 139, 'Certificate of Good Moral', '1'),
(77, 141, 'Fomr 137', '1'),
(78, 141, 'Certificate of good moral', '1'),
(79, 141, 'Report Card', '1'),
(80, 141, 'Birth Cirtificate', '1'),
(81, 141, 'Baptisimal Certificate', '1'),
(82, 139, 'New Requirements', '1'),
(83, 144, 'Picture (2x2)', '1');

-- --------------------------------------------------------

--
-- Table structure for table `departments_type`
--

DROP TABLE IF EXISTS `departments_type`;
CREATE TABLE IF NOT EXISTS `departments_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `departments_type`
--

INSERT INTO `departments_type` (`id`, `name`) VALUES
(1, 'SUBJECT'),
(2, 'TRADITIONAL'),
(3, 'VIOLATION'),
(4, 'ACTIVITY');

-- --------------------------------------------------------

--
-- Table structure for table `educ_class`
--

DROP TABLE IF EXISTS `educ_class`;
CREATE TABLE IF NOT EXISTS `educ_class` (
  `id` varchar(20) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_UNIQUE` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educ_class`
--

INSERT INTO `educ_class` (`id`, `level`) VALUES
('PRIMARY', 1),
('SECONDARY', 2),
('TERTIARY', 3);

-- --------------------------------------------------------

--
-- Table structure for table `educ_level`
--

DROP TABLE IF EXISTS `educ_level`;
CREATE TABLE IF NOT EXISTS `educ_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `code` varchar(45) NOT NULL,
  `is_coursed` varchar(45) NOT NULL DEFAULT '0',
  `educ_class_id` varchar(20) NOT NULL,
  `state` varchar(45) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_educ_class_idx` (`educ_class_id`),
  KEY `fb_educ_class_idx` (`educ_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `educ_level`
--

INSERT INTO `educ_level` (`id`, `name`, `code`, `is_coursed`, `educ_class_id`, `state`) VALUES
(1, 'GRADE SCHOOL', 'GS', '0', 'PRIMARY', '1'),
(2, 'JUNIOR HS', 'JH', '0', 'SECONDARY', '1'),
(3, 'SENIOR HS', 'SH', '1', 'SECONDARY', '1'),
(4, 'COLLEGE', 'CL', '1', 'TERTIARY', '1');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departments_id` int(11) NOT NULL,
  `events_type_id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `semester_id` int(11) NOT NULL,
  `acad_year_id` int(11) NOT NULL,
  `course` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `yearlevel` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `student_department` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `creator_account_id` int(11) NOT NULL,
  `state` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `departments_id`, `events_type_id`, `name`, `semester_id`, `acad_year_id`, `course`, `yearlevel`, `student_department`, `creator_account_id`, `state`) VALUES
(76, 140, 1, 'General Assembly 2020', 1, 1, '-ALL', '-ALL', 'CCS', 132, '1');

-- --------------------------------------------------------

--
-- Table structure for table `events_type`
--

DROP TABLE IF EXISTS `events_type`;
CREATE TABLE IF NOT EXISTS `events_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `state` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events_type`
--

INSERT INTO `events_type` (`id`, `name`, `state`) VALUES
(1, 'ORGANIZATION', '1'),
(2, 'INSTITUTIONAL', '1');

-- --------------------------------------------------------

--
-- Table structure for table `guidance_office`
--

DROP TABLE IF EXISTS `guidance_office`;
CREATE TABLE IF NOT EXISTS `guidance_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `educ_level_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `account_id_idx` (`account_id`),
  KEY `educ_level_id_idx` (`educ_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
CREATE TABLE IF NOT EXISTS `semester` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `level` int(11) NOT NULL,
  `dateStart` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `dateEnd` varchar(20) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` enum('1','0') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`id`, `name`, `level`, `dateStart`, `dateEnd`, `state`) VALUES
(1, '1st', 1, 'June', 'October', '1'),
(2, '2nd', 2, 'November', 'March', '0'),
(3, 'Summer', 3, 'April', 'May', '0'),
(4, 'ALL', 0, 'ALL', 'ALL', '0');

-- --------------------------------------------------------

--
-- Table structure for table `student_`
--

DROP TABLE IF EXISTS `student_`;
CREATE TABLE IF NOT EXISTS `student_` (
  `id` int(100) NOT NULL,
  `educ_level_id` int(11) NOT NULL,
  `username` varchar(45) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image_url` varchar(255) CHARACTER SET latin1 NOT NULL,
  `studfname` varchar(100) CHARACTER SET latin1 NOT NULL,
  `studmname` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `studlname` varchar(100) CHARACTER SET latin1 NOT NULL,
  `course` varchar(100) CHARACTER SET latin1 NOT NULL,
  `yearlevel` varchar(100) CHARACTER SET latin1 NOT NULL,
  `section` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'NONE',
  `cpnum` varchar(100) CHARACTER SET latin1 NOT NULL,
  `familyphone` varchar(100) CHARACTER SET latin1 NOT NULL,
  `gender` varchar(100) CHARACTER SET latin1 NOT NULL,
  `activity_card_barcode` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `department` varchar(45) COLLATE latin1_bin DEFAULT NULL,
  `semester_id` int(11) NOT NULL,
  `acad_year_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`),
  KEY `fk_educ_level_id_idx` (`educ_level_id`),
  KEY `fk_sample_idx` (`educ_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `student_`
--

INSERT INTO `student_` (`id`, `educ_level_id`, `username`, `password`, `image_url`, `studfname`, `studmname`, `studlname`, `course`, `yearlevel`, `section`, `cpnum`, `familyphone`, `gender`, `activity_card_barcode`, `department`, `semester_id`, `acad_year_id`) VALUES
(1, 4, 'CL1', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Jason Marc', 'Marinas', 'Del Rosario', 'BSCPE', '1st', 'B', '9453871947', '9157725940', 'MALE', '12345', 'CCS', 1, 1),
(10, 4, 'CL10', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'LEIRA JOYCE', 'MAPA', 'DINGLASAN', 'BSM', '1st', 'A', '9358668041', '9663085638', 'Female', '12354', 'BSMARINE', 1, 1),
(11, 4, 'CL11', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'ERICA CAMIL', 'RODELA', 'RAMOS', 'BSM', '1st', 'B', '9358668042', '9157725940', 'Female', '12355', 'BSMARINE', 1, 1),
(12, 4, 'CL12', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Roma Rita', 'Francisco', 'Uy', 'BSM', '2nd', 'A', '9358668043', '9663085638', 'Female', '12356', 'BSMARINE', 1, 1),
(13, 4, 'CL13', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'quinnielyn', 'alim', 'inot', 'ABPsy', '3rd', 'A', '9358668044', '9157725940', 'Female', '12357', 'CAS', 1, 1),
(14, 4, 'CL14', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Joseph', 'Capalad', 'Pascual', 'BSBA', '4th', 'B', '9358668045', '9663085638', 'Male', '12358', 'CBA', 1, 1),
(15, 4, 'CL15', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Mark Leo', 'Bitao', 'Dela Rama', 'BSME', '1st', 'A', '9358668046', '9157725940', 'Male', '12359', 'SOE', 1, 1),
(16, 4, 'CL16', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Hernan', 'Belgar', 'Salvador', 'BSME', '1st', 'A', '9358668047', '9663085638', 'Male', '12360', 'SOE', 1, 1),
(17, 4, 'CL17', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Jennylyn', 'Jaravata', 'Yanson', 'BSA', '2nd', 'B', '9358668048', '9157725940', 'Female', '12361', 'COA', 1, 1),
(18, 4, 'CL18', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Jeann Patrick', 'Nicolas', 'Dela Cruz', 'BSME', '3rd', 'A', '9358668049', '9663085638', 'Male', '12362', 'SOE', 1, 1),
(19, 4, 'CL19', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Johnpaul', 'Mendoza', 'Jaravata', 'BSIT', '4th', 'B', '9358668050', '9157725940', 'Male', 'NONE', 'NONE', 1, 1),
(2, 4, 'CL2', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Joanna Sweet', 'Bunag', 'Soriao', 'BSCPE', '2nd', 'A', '9359816960', '9663085638', 'FEMALE', '12346', 'CCS', 1, 1),
(20, 4, 'CL20', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'princess lean', 'mariano', 'marte', 'BSN', '1st', 'A', '9358668051', '9663085638', 'Female', 'NONE', 'NONE', 1, 1),
(21, 4, 'CL21', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Sydney Mae', 'Estrella', 'Antonio', 'BSN', '1st', 'A', '9358668052', '9157725940', 'Female', 'NONE', 'NONE', 1, 1),
(22, 4, 'CL22', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Prima Rose', 'Villaflores', 'Cabasisi', 'BSBA-HRDM', '2nd', 'B', '9358668053', '9663085638', 'Female', 'NONE', 'NONE', 1, 1),
(23, 4, 'CL23', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Raymund', 'Basqui????a', 'Dela Cruz', 'BSIT', '3rd', 'B', '9358668054', '9157725940', 'Male', 'NONE', 'NONE', 1, 1),
(24, 4, 'CL24', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Jason Marc', 'Marinas', 'Del Rosario', 'BST', '4th', 'A', '9358668055', '9663085638', 'Male', 'NONE', 'NONE', 1, 1),
(25, 4, 'CL25', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Joanna Sweet', 'Bunag', 'Soriao', 'BSME', '1st', 'B', '9358668056', '9157725940', 'Female', 'NONE', 'NONE', 1, 1),
(26, 4, 'CL26', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Ma. Michelle', 'Bantolio', 'Zapico', 'BSA', '1st', 'A', '9358668057', '9663085638', 'Female', 'NONE', 'NONE', 1, 1),
(27, 4, 'CL27', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Jayvee', 'Ballino', 'Orbiso', 'BSBA', '2nd', 'A', '9358668058', '9157725940', 'Male', 'NONE', 'NONE', 1, 1),
(28, 4, 'CL28', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Joemar', 'Guinto', 'Nicolas', 'BSBA', '3rd', 'B', '9358668059', '9663085638', 'Male', 'NONE', 'NONE', 1, 1),
(29, 4, 'CL29', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Rod Michael', 'Pamatian', 'Voluntad', 'BST', '4th', 'A', '9358668060', '9157725940', 'Male', 'NONE', 'NONE', 1, 1),
(3, 4, 'CL3', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Ma. Michelle', 'Bantolio', 'Zapico', 'BSCPE', '3rd', 'A', '9323099034', '9157725940', 'MALE', '12347', 'CCS', 1, 1),
(30, 4, 'CL30', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Anjelo', 'Gregorio', 'Dela Cruz', 'BSA', '1st', 'B', '9358668061', '9663085638', 'Male', 'NONE', 'NONE', 1, 1),
(31, 4, 'CL31', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'rica', 'victorino', 'garcia', 'BEED', '1st', 'A', '9358668062', '9157725940', 'Female', 'NONE', 'NONE', 1, 1),
(32, 4, 'CL32', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Nicole Ann', 'Mangahas', 'Caraang', 'BST', '2nd', 'A', '9358668063', '9663085638', 'Female', 'NONE', 'NONE', 1, 1),
(33, 4, 'CL33', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Angelo', 'San Pedro', 'Manao', 'BSME', '3rd', 'B', '9358668064', '9157725940', 'Male', 'NONE', 'NONE', 1, 1),
(34, 4, 'CL34', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Erico Jayson', 'Delos Santos', 'Su????ga', 'BSME', '4th', 'A', '9358668065', '9663085638', 'Male', 'NONE', 'NONE', 1, 1),
(35, 4, 'CL35', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Jemger Axl', 'David', 'Derilo', 'BST', '1st', 'B', '9358668066', '9157725940', 'Female', 'NONE', 'NONE', 1, 1),
(36, 4, 'CL36', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Christinejoy', 'Regis', 'Omul', 'BST', '1st', 'A', '9358668067', '9663085638', 'Female', 'NONE', 'NONE', 1, 1),
(37, 4, 'CL37', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Sherryl', 'Estrella', 'Bautista', 'BSCS', '2nd', 'A', '9358668068', '9157725940', 'Female', 'NONE', 'NONE', 1, 1),
(4, 4, 'CL4', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Jayvee', 'Ballino', 'Orbiso', 'BSCPE', '4th', 'A', '9355619355', '9663085638', 'FEMALE', '12348', 'CCS', 1, 1),
(5, 4, 'CL5', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Joemar', 'Guinto', 'Nicolas', 'BSCPE', '1st', 'A', '9358668036', '9157725940', 'MALE', '12349', 'CCS', 1, 1),
(6, 4, 'CL6', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Ma. Ruth C.', 'Ceballos', 'Barredo', 'BEED', '1st', 'B', '9358668037', '9663085638', 'Female', '12350', 'COED', 1, 1),
(7, 4, 'CL7', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'Licel', 'Magdasoc', 'Siongco', 'BSED', '2nd', 'A', '9358668038', '9157725940', 'Female', '12351', 'COED', 1, 1),
(8, 4, 'CL8', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'fe', 'tabago', 'isla', 'BSED', '3rd', 'A', '9358668039', '9663085638', 'Female', '12352', 'COED', 1, 1),
(9, 4, 'CL9', '$2y$14$0KXJgXTja40eZLNTf7oSy.y6buQOKuuCKcSK87Hh3cNjHzaU95fa6', '', 'jm', 'sapilan', 'bacolod', 'BSIT', '4th', 'B', '9358668040', '9157725940', 'Female', '12353', 'CCS', 1, 1),
(987, 4, 'CL987', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe1', 'fname1', 'mname1', 'lname1', 'BSCPE', '1st', 'A', '9112345678', '9157725940', '', '2904-12312-1330', 'CCS', 1, 1),
(988, 4, 'CL988', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe2', 'fname2', 'mname2', 'lname2', 'BSCPE', '1st', 'A', '9112345679', '9663085638', '', '2904-12312-1331', 'CCS', 1, 1),
(989, 4, 'CL989', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe3', 'fname3', 'mname3', 'lname3', 'BSCPE', '1st', 'A', '9112345680', '9157725940', '', '2904-12312-1332', 'CCS', 1, 1),
(990, 4, 'CL990', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe4', 'fname4', 'mname4', 'lname4', 'BSCPE', '1st', 'A', '9112345681', '9663085638', '', '2904-12312-1333', 'CCS', 1, 1),
(991, 4, 'CL991', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe5', 'fname5', 'mname5', 'lname5', 'BSCPE', '1st', 'A', '9112345682', '9157725940', '', '2904-12312-1334', 'CCS', 1, 1),
(992, 4, 'CL992', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe6', 'fname6', 'mname6', 'lname6', 'BSCPE', '1st', 'A', '9112345683', '9663085638', '', '2904-12312-1335', 'CCS', 1, 1),
(993, 4, 'CL993', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe7', 'fname7', 'mname7', 'lname7', 'BSCPE', '1st', 'A', '9112345684', '9157725940', '', '2904-12312-1336', 'CCS', 1, 1),
(994, 4, 'CL994', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe8', 'fname8', 'mname8', 'lname8', 'BSCPE', '1st', 'A', '9112345685', '9663085638', '', '2904-12312-1337', 'CCS', 1, 1),
(995, 4, 'CL995', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', 'qwewqeqe9', 'fname9', 'mname9', 'lname9', 'BSCPE', '1st', 'A', '9112345686', '9157725940', '', '2904-12312-1338', 'CCS', 1, 1),
(1, 1, 'GS1', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'Cesar', 'Dugenia', 'Caluag Jr.', 'NONE', '1', 'MAGLAYO', '9453871947', '9157725940', 'MALE', 'NONE', 'NONE', 4, 1),
(2, 1, 'GS2', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'Janz Frouline', 'Domiquel', 'Mag-isa', 'NONE', '2', 'MAGLAYO', '9359816960', '9663085638', 'FEMALE', 'NONE', 'NONE', 4, 1),
(3, 1, 'GS3', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'Nestle', '', 'Bayabay', 'NONE', '3', 'MAGLAYO', '9323099034', '9157725940', 'MALE', 'NONE', 'NONE', 4, 1),
(4, 1, 'GS4', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'Dan Lloyd', 'Del Rosario', 'Santos', 'NONE', '4', 'MAGLAYO', '9355619355', '9663085638', 'FEMALE', 'NONE', 'NONE', 4, 1),
(5, 1, 'GS5', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'Rhia Joice', 'Valero', 'Macapagal', 'NONE', '5', 'MAGLAYO', '9358668036', '9157725940', 'MALE', 'NONE', 'NONE', 4, 1),
(1, 2, 'JH1', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Novie', 'Francisco', 'Salvador', 'NONE', '1st', 'MAGLAYO', '9453871947', '9157725940', 'MALE', 'NONE', 'NONE', 4, 1),
(10, 2, 'JH10', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Ma. Fe', 'Parcon', 'Tabios', 'NONE', '2nd', 'MAGLAYO', '9358668041', '9663085638', 'Female', 'NONE', 'NONE', 4, 1),
(11, 2, 'JH11', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'John Paulo', 'De Armas', 'Cordero', 'NONE', '3rd', 'MAGLAYO', '9358668042', '9157725940', 'Male', 'NONE', 'NONE', 4, 1),
(12, 2, 'JH12', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Nestle', '', 'Bayabay', 'NONE', '4th', 'MAGLAYO', '9358668043', '9663085638', 'Female', 'NONE', 'NONE', 4, 1),
(13, 2, 'JH13', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Pauleene', 'Cespedes', 'Amatorio', 'NONE', '1st', 'MAGLAYO', '9358668044', '9157725940', 'Female', 'NONE', 'NONE', 4, 1),
(14, 2, 'JH14', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Ma. Sopihia Kyle', 'Mendoza', 'Bravo', 'NONE', '2nd', 'MAGLAYO', '9358668045', '9663085638', 'Female', 'NONE', 'NONE', 4, 1),
(15, 2, 'JH15', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'kirby', 'santiago', 'de guzman', 'NONE', '3rd', 'MAGLAYO', '9358668046', '9157725940', 'Male', 'NONE', 'NONE', 4, 1),
(16, 2, 'JH16', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Jonalyn', 'Florencio', 'Roylan', 'NONE', '4th', 'MAGLAYO', '9358668047', '9663085638', 'Female', 'NONE', 'NONE', 4, 1),
(2, 2, 'JH2', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Rhaeven', 'Balaoro', 'Hipolito', 'NONE', '2nd', 'MAGLAYO', '9359816960', '9663085638', 'FEMALE', 'NONE', 'NONE', 4, 1),
(3, 2, 'JH3', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Angel', 'Nicolas', 'Austria', 'NONE', '3rd', 'MAGLAYO', '9323099034', '9157725940', 'MALE', 'NONE', 'NONE', 4, 1),
(4, 2, 'JH4', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Marenella', 'Morante', 'Sales', 'NONE', '4th', 'MAGLAYO', '9355619355', '9663085638', 'FEMALE', 'NONE', 'NONE', 4, 1),
(5, 2, 'JH5', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Irish Jane', 'Campo', 'Gallo', 'NONE', '1st', 'MAGLAYO', '9358668036', '9157725940', 'MALE', 'NONE', 'NONE', 4, 1),
(6, 2, 'JH6', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Nestle', '', 'Bayabay', 'NONE', '2nd', 'MAGLAYO', '9358668037', '9663085638', 'Female', 'NONE', 'NONE', 4, 1),
(7, 2, 'JH7', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Dan Lloyd', 'Del Rosario', 'Santos', 'NONE', '3rd', 'MAGLAYO', '9358668038', '9157725940', 'Male', 'NONE', 'NONE', 4, 1),
(8, 2, 'JH8', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Rhia Joice', 'Valero', 'Macapagal', 'NONE', '4th', 'MAGLAYO', '9358668039', '9663085638', 'Female', 'NONE', 'NONE', 4, 1),
(9, 2, 'JH9', '$2y$14$eu9e02Fh7svv2tY/XzroBO.c/C3NDLRcdy5PU2x4G8z82Aa6hO8vW', '', 'Joshua', 'Malsada', 'Pineda', 'NONE', '1st', 'MAGLAYO', '9358668040', '9157725940', 'Male', 'NONE', 'NONE', 4, 1),
(1, 3, 'SH1', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'martrusselle', 'del rosario', 'maclang', 'ABM', '1st', 'BEZOS', '9453871947', '9157725940', 'MALE', 'NONE', 'NONE', 1, 1),
(2, 3, 'SH2', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'macario', 'dela cruz', 'nacino jr', 'ABM', '2nd', 'GATES', '9359816960', '9663085638', 'FEMALE', 'NONE', 'NONE', 1, 1),
(3, 3, 'SH3', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'John Carlo', 'Dela Cruz', 'Navarro', 'STEM', '1st', 'TESLA', '9323099034', '9157725940', 'MALE', 'NONE', 'NONE', 1, 1),
(4, 3, 'SH4', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'marcelo', 'riano', 'carlos', 'STEM', '2nd', 'EDISON', '9355619355', '9663085638', 'FEMALE', 'NONE', 'NONE', 1, 1),
(5, 3, 'SH5', '$2y$14$ic5Y36G3r5oZ19kZxaoQ/u/JItjRHSvYyO3x/FCkbzUjmkp7KWbGK', '', 'Reiner Allen', 'Santos', 'Quintos', 'HUMMS', '1st', 'FREUD', '9358668036', '9157725940', 'MALE', 'NONE', 'NONE', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student_violation`
--

DROP TABLE IF EXISTS `student_violation`;
CREATE TABLE IF NOT EXISTS `student_violation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_username` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `violation_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `acad_year_id` int(11) NOT NULL,
  `state` enum('1','0') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '1',
  `is_send_sms` enum('1','0') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '0',
  `yearlevel` varchar(45) COLLATE latin1_bin NOT NULL,
  `course` varchar(45) COLLATE latin1_bin NOT NULL,
  `section` varchar(45) COLLATE latin1_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `existing_record` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_violation_id` (`violation_id`),
  KEY `FKFK_acad_id` (`acad_year_id`),
  KEY `FKF_semester` (`semester_id`),
  KEY `FK_student_username_idx` (`student_username`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `student_violation`
--

INSERT INTO `student_violation` (`id`, `student_username`, `violation_id`, `semester_id`, `acad_year_id`, `state`, `is_send_sms`, `yearlevel`, `course`, `section`, `existing_record`) VALUES
(258, 'GS1', 35, 4, 1, '1', '0', '1', 'NONE', 'MAGLAYO', 1),
(259, 'GS1', 34, 4, 1, '1', '0', '1', 'NONE', 'MAGLAYO', 1),
(260, 'GS1', 35, 4, 1, '1', '0', '1', 'NONE', 'MAGLAYO', 2),
(261, 'GS1', 34, 4, 1, '1', '0', '1', 'NONE', 'MAGLAYO', 2),
(262, 'GS1', 35, 4, 1, '1', '0', '1', 'NONE', 'MAGLAYO', 3),
(263, 'GS1', 34, 4, 1, '1', '0', '1', 'NONE', 'MAGLAYO', 3);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authored_account_id` int(11) NOT NULL,
  `teacher_account_id` int(11) NOT NULL,
  `subject_detail_id` int(11) NOT NULL,
  `section` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `semester_id` int(11) NOT NULL,
  `acad_year_id` int(11) NOT NULL,
  `state` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `authored_account_id`, `teacher_account_id`, `subject_detail_id`, `section`, `semester_id`, `acad_year_id`, `state`) VALUES
(56, 132, 133, 27, 'MAGLAYO', 4, 1, '1'),
(57, 132, 136, 32, 'MAGLAYO', 4, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `subject_detail`
--

DROP TABLE IF EXISTS `subject_detail`;
CREATE TABLE IF NOT EXISTS `subject_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `code` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `educ_level_id` int(11) NOT NULL,
  `author_account_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `yearlevel` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `course` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_detail`
--

INSERT INTO `subject_detail` (`id`, `name`, `code`, `educ_level_id`, `author_account_id`, `yearlevel`, `course`) VALUES
(27, 'Mathematics 1', 'Math 101', 1, 132, '1st', 'NONE'),
(28, 'Subject 1 ', 'subj1', 1, 132, '1st', 'NONE'),
(29, 'Subject name ', 'subj101', 1, 132, '2nd', 'NONE'),
(32, 'MAPEH 1', 'MAPEH101', 1, 132, '1st', 'NONE'),
(33, 'Biology', 'BIO101', 2, 132, '1st', 'NONE');

-- --------------------------------------------------------

--
-- Table structure for table `subject_student_`
--

DROP TABLE IF EXISTS `subject_student_`;
CREATE TABLE IF NOT EXISTS `subject_student_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_identifier` varchar(100) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `student_id` varchar(45) NOT NULL,
  `remarks` enum('PASS','CONSIDER','FAIL') NOT NULL DEFAULT 'PASS',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_identifier_UNIQUE` (`unique_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_student_`
--

INSERT INTO `subject_student_` (`id`, `unique_identifier`, `subject_id`, `student_id`, `remarks`) VALUES
(81, '56-GS1', 56, 'GS1', 'PASS'),
(82, '56-GS2', 56, 'GS2', 'PASS'),
(83, '56-GS3', 56, 'GS3', 'PASS'),
(84, '56-GS4', 56, 'GS4', 'FAIL'),
(85, '56-GS5', 56, 'GS5', 'FAIL'),
(86, '57-GS1', 57, 'GS1', 'PASS'),
(87, '57-GS2', 57, 'GS2', 'PASS'),
(88, '57-GS3', 57, 'GS3', 'PASS'),
(89, '57-GS4', 57, 'GS4', 'PASS'),
(90, '57-GS5', 57, 'GS5', 'PASS');

-- --------------------------------------------------------

--
-- Table structure for table `upload_payment_history`
--

DROP TABLE IF EXISTS `upload_payment_history`;
CREATE TABLE IF NOT EXISTS `upload_payment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `studentUsername` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `amount` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `paymentDate` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uploaded_by` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_sms` int(11) NOT NULL DEFAULT '0',
  `sms_provider_service_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upload_payment_history`
--

INSERT INTO `upload_payment_history` (`id`, `studentUsername`, `amount`, `paymentDate`, `uploaded_by`, `is_sms`, `sms_provider_service_id`) VALUES
(63, 'GS1', '1000.12', 'jun 20 2020', 0, 0, '{\"message_id\":88306572,\"created_at\":\"2020-11-08 17:49:40\"}'),
(64, 'GS2', '1001.21', 'jul 30 2020', 0, 0, '{\"message_id\":88306573,\"created_at\":\"2020-11-08 17:49:45\"}'),
(65, 'GS3', '1002.32', 'aug 30 2020', 0, 0, '{\"message_id\":88306574,\"created_at\":\"2020-11-08 17:49:49\"}'),
(66, 'GS4', '1003.32', 'jun 24 2020', 0, 0, '{\"message_id\":88306575,\"created_at\":\"2020-11-08 17:49:53\"}'),
(67, 'GS5', '1004.89', 'jun 7 2020', 0, 0, '{\"message_id\":88306576,\"created_at\":\"2020-11-08 17:49:56\"}'),
(68, 'GS1', '1000.87', 'jun 20 2020', 0, 0, '{\"message_id\":88306577,\"created_at\":\"2020-11-08 17:50:00\"}'),
(69, 'GS2', '1001.75', 'jul 30 2020', 0, 0, '{\"message_id\":88306579,\"created_at\":\"2020-11-08 17:50:04\"}');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
CREATE TABLE IF NOT EXISTS `user_account` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `pass_word` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`ID`, `pass_word`, `user_name`, `name`) VALUES
(1, 'passNAME', 'userNAME', 'eunille'),
(2, '', '', 'djskjdkljddf'),
(3, 'sdfkjsdfkj', 'sfjskfj', 'dskfjdskfj'),
(4, 'pWORD', 'unameSAMPLE', 'nameSAMPLE'),
(5, '1234', 'usernam1', 'name2'),
(6, '12342', 'usernam2', 'name3'),
(7, '12341', 'usernam3', 'name4'),
(8, '1234t', 'usernam4', 'name5'),
(9, '1234i', 'usernam5', 'name6'),
(10, 'sdfkjsdfkj', 'sfjskfj', 'dskfjdskfj'),
(11, '', '', ''),
(12, '', '', ''),
(13, '', '', ''),
(14, '', '', ''),
(15, '', '', ''),
(16, '', '', ''),
(17, '', '', ''),
(18, '', '', ''),
(19, '', '', ''),
(20, '', '', ''),
(21, '', '', ''),
(22, '', '', ''),
(23, '', '', ''),
(24, '', '', ''),
(25, '', '', ''),
(26, 'skljdsdfkj', 'villegass', 'eunille'),
(27, 'dsjfhsdj', 'dshfsdjf', 'dsasdhsjh'),
(28, 'dsjfhsdj', 'dshfsdjf', 'dsasdhsjh'),
(29, '', '', ''),
(30, '', '', ''),
(31, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`) VALUES
('ADMIN'),
('SUBJECT'),
('USER');

-- --------------------------------------------------------

--
-- Table structure for table `violation`
--

DROP TABLE IF EXISTS `violation`;
CREATE TABLE IF NOT EXISTS `violation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `violation_class_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_violation_class_id_idx` (`violation_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violation`
--

INSERT INTO `violation` (`id`, `name`, `description`, `violation_class_id`, `is_deleted`) VALUES
(30, 'No ID, improper uniform', 'Not waering proper school uniform.', 8, '0'),
(31, 'Vandlism ', 'description for vandalism', 7, '0'),
(32, 'Cheating', 'description of Cheating', 8, '0'),
(34, 'Fighting', 'Creating violence to fellow students, school employee or within the school premises', 2, '0'),
(35, 'Loittering', 'Roaming around in school premises or hall during school hours', 1, '0'),
(36, 'Violation Name', 'FDKJKDJF', 8, '0');

-- --------------------------------------------------------

--
-- Table structure for table `violation_class`
--

DROP TABLE IF EXISTS `violation_class`;
CREATE TABLE IF NOT EXISTS `violation_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `educ_level_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_educ_level_id_idx` (`educ_level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violation_class`
--

INSERT INTO `violation_class` (`id`, `educ_level_id`, `name`) VALUES
(1, 1, 'MINOR'),
(2, 1, 'MAJOR'),
(3, 2, 'MINOR'),
(4, 2, 'MAJOR'),
(5, 3, 'MINOR'),
(6, 3, 'MAJOR'),
(7, 4, 'MINOR'),
(8, 4, 'MAJOR');

-- --------------------------------------------------------

--
-- Table structure for table `violation_sanction`
--

DROP TABLE IF EXISTS `violation_sanction`;
CREATE TABLE IF NOT EXISTS `violation_sanction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `violation_class_id` int(11) NOT NULL,
  `offence_level` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `send_sms` enum('1','0') NOT NULL DEFAULT '0',
  `state` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_violation_class_idx` (`violation_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `violation_sanction`
--

INSERT INTO `violation_sanction` (`id`, `violation_class_id`, `offence_level`, `description`, `send_sms`, `state`) VALUES
(128, 7, 1, 'Warning the student ', '0', '1'),
(129, 7, 2, 'Written reprimand to the parents of student', '0', '1'),
(130, 7, 3, 'Class suspension for school 2 days', '0', '1'),
(131, 8, 1, 'Counseling, for student', '0', '1'),
(132, 8, 2, 'Send reprimand to parent', '0', '1'),
(133, 8, 3, '5 Days suspension', '0', '1'),
(134, 1, 1, 'Warrning 1', '0', '1'),
(135, 1, 2, 'Warning 2', '0', '1'),
(136, 1, 3, 'Warning 3', '0', '1'),
(137, 1, 4, 'Warning 4', '0', '1'),
(138, 2, 1, 'MAJOR 1', '0', '1'),
(139, 2, 2, 'MAJOR 2', '0', '1'),
(140, 2, 3, 'MAJOR 3', '0', '1'),
(141, 2, 4, 'MAJOR 4', '0', '1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_courses`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_courses`;
CREATE TABLE IF NOT EXISTS `v_courses` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_students`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_students`;
CREATE TABLE IF NOT EXISTS `v_students` (
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_yearlevel`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_yearlevel`;
CREATE TABLE IF NOT EXISTS `v_yearlevel` (
);

-- --------------------------------------------------------

--
-- Structure for view `v_courses`
--
DROP TABLE IF EXISTS `v_courses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `v_courses`  AS  select distinct `student`.`course` AS `course` from `student` ;

-- --------------------------------------------------------

--
-- Structure for view `v_students`
--
DROP TABLE IF EXISTS `v_students`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `v_students`  AS  select `student`.`id` AS `id`,`student`.`educ_level_id` AS `educ_level_id`,`student`.`username` AS `username`,`student`.`password` AS `password`,`student`.`image_url` AS `image_url`,`student`.`OR_No` AS `OR_No`,`student`.`amount` AS `amount`,`student`.`Grant_` AS `Grant_`,`student`.`LRN` AS `LRN`,`student`.`studentNo` AS `studentNo`,`student`.`studfname` AS `studfname`,`student`.`studmname` AS `studmname`,`student`.`studlname` AS `studlname`,`student`.`gender` AS `gender`,`student`.`birthday` AS `birthday`,`student`.`course` AS `course`,`student`.`yearlevel` AS `yearlevel`,`student`.`status` AS `status`,`student`.`fatherlname` AS `fatherlname`,`student`.`fatherfname` AS `fatherfname`,`student`.`fathermname` AS `fathermname`,`student`.`motherfname` AS `motherfname`,`student`.`motherlname` AS `motherlname`,`student`.`mothermname` AS `mothermname`,`student`.`cpnum` AS `cpnum`,`student`.`email` AS `email`,`student`.`familyphone` AS `familyphone`,`student`.`created_at` AS `created_at`,`student`.`updated_at` AS `updated_at` from `student` ;

-- --------------------------------------------------------

--
-- Structure for view `v_yearlevel`
--
DROP TABLE IF EXISTS `v_yearlevel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dev`@`localhost` SQL SECURITY DEFINER VIEW `v_yearlevel`  AS  select distinct `student`.`yearlevel` AS `yearlevel` from `student` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `acc_fk_user_type_id` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`);

--
-- Constraints for table `account_departments`
--
ALTER TABLE `account_departments`
  ADD CONSTRAINT `fkk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `fkk_departments_id` FOREIGN KEY (`departments_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `account_login_logs`
--
ALTER TABLE `account_login_logs`
  ADD CONSTRAINT `fk_account_log_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `backtrack_account`
--
ALTER TABLE `backtrack_account`
  ADD CONSTRAINT `bac_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `blacklist_token`
--
ALTER TABLE `blacklist_token`
  ADD CONSTRAINT `fk_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `clearance_issue`
--
ALTER TABLE `clearance_issue`
  ADD CONSTRAINT `FK_semester_id_id` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`),
  ADD CONSTRAINT `fk_acad_year_id` FOREIGN KEY (`acad_year_id`) REFERENCES `acad_year` (`id`),
  ADD CONSTRAINT `fk_departments_id` FOREIGN KEY (`departments_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `educ_level`
--
ALTER TABLE `educ_level`
  ADD CONSTRAINT `fb_educ_class` FOREIGN KEY (`educ_class_id`) REFERENCES `educ_class` (`id`);

--
-- Constraints for table `guidance_office`
--
ALTER TABLE `guidance_office`
  ADD CONSTRAINT `educ_level_id` FOREIGN KEY (`educ_level_id`) REFERENCES `educ_level` (`id`),
  ADD CONSTRAINT `fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `student_`
--
ALTER TABLE `student_`
  ADD CONSTRAINT `fk_sample__` FOREIGN KEY (`educ_level_id`) REFERENCES `educ_level` (`id`);

--
-- Constraints for table `student_violation`
--
ALTER TABLE `student_violation`
  ADD CONSTRAINT `FK_acad_id` FOREIGN KEY (`acad_year_id`) REFERENCES `acad_year` (`id`),
  ADD CONSTRAINT `FK_semester` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`),
  ADD CONSTRAINT `FK_violation_id` FOREIGN KEY (`violation_id`) REFERENCES `violation` (`id`);

--
-- Constraints for table `violation`
--
ALTER TABLE `violation`
  ADD CONSTRAINT `fk_violation_class_id` FOREIGN KEY (`violation_class_id`) REFERENCES `violation_class` (`id`);

--
-- Constraints for table `violation_class`
--
ALTER TABLE `violation_class`
  ADD CONSTRAINT `fk_educ_level_id` FOREIGN KEY (`educ_level_id`) REFERENCES `educ_level` (`id`);

--
-- Constraints for table `violation_sanction`
--
ALTER TABLE `violation_sanction`
  ADD CONSTRAINT `fk_violation_class` FOREIGN KEY (`violation_class_id`) REFERENCES `violation_class` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
