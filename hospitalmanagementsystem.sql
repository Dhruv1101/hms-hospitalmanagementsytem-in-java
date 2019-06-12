-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2018 at 10:38 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitalmanagementsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `active`
--

DROP TABLE IF EXISTS `active`;
CREATE TABLE IF NOT EXISTS `active` (
  `EMPLOYEE ID` int(11) NOT NULL,
  `DEPARTMENT ID` int(11) NOT NULL,
  `SINCE` date NOT NULL,
  FOREIGN KEY `EMPLOYEE ID` (`EMPLOYEE ID`),
  FOREIGN KEY `DEPARTMENT ID` (`DEPARTMENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `user name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user name`, `password`) VALUES
('dhruv', 'gandhi'),
('dhruv', 'surani');

-- --------------------------------------------------------

--
-- Table structure for table `appointement`
--

DROP TABLE IF EXISTS `appointement`;
CREATE TABLE IF NOT EXISTS `appointement` (
  `DOCTOR ID` int(11) NOT NULL,
  `PATIENT ID` int(11) NOT NULL,
  `APPOINTEMENT NUMBER` int(11) NOT NULL,
  `APPOINTEMENT TYPE` varchar(50) NOT NULL,
  PRIMARY KEY (`APPOINTEMENT NUMBER`),
  FOREIGN KEY `DOCTOR ID` (`DOCTOR ID`),
  FOREIGN KEY `PATIENT ID` (`PATIENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attandence`
--

DROP TABLE IF EXISTS `attandence`;
CREATE TABLE IF NOT EXISTS `attandence` (
  `EMPLOYEE ID` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `STATUS` varchar(8) NOT NULL,
  FOREIGN KEY `EMPLOYEE ID` (`EMPLOYEE ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `PATIENT ID` int(11) NOT NULL,
  `BILL NO` int(11) NOT NULL,
  `BILL DATE` date NOT NULL,
  `ROOM COST` int(11) NOT NULL,
  `MEDICINE COST` int(11) NOT NULL,
  `TEST COST` int(11) NOT NULL,
  `OTHER CHAREGES` int(11) NOT NULL,
  PRIMARY KEY (`BILL NO`),
  FOREIGN KEY `PATIENT ID` (`PATIENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DEPARTMENT ID` int(11) NOT NULL,
  `DEPARTMENT NAME` varchar(20) NOT NULL,
  `DEPARTMENT HEAD` varchar(20) NOT NULL,
  PRIMARY KEY (`DEPARTMENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `DOCTOR ID` int(11) NOT NULL,
  `EMPLOYEE ID` int(11) NOT NULL,
  `QULIFICATION` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`DOCTOR ID`),
  FOREIGN KEY `EMPLOYEE ID` (`EMPLOYEE ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `EMPLOYEE ID` int(11) NOT NULL,
  `EMPLOYEE TYPE` varchar(20) NOT NULL,
  `EMPLOYEE NAME` varchar(30) NOT NULL,
  `DATE OF BIRTH` date NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `PHONE NUMBER` int(11) NOT NULL,
  `ADDRESS` varchar(50) NOT NULL,
  `JOINING DATE` date NOT NULL,
  `SALARY` int(11) NOT NULL,
  PRIMARY KEY (`EMPLOYEE ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EMPLOYEE ID`, `EMPLOYEE TYPE`, `EMPLOYEE NAME`, `DATE OF BIRTH`, `EMAIL`, `PHONE NUMBER`, `ADDRESS`, `JOINING DATE`, `SALARY`) VALUES
(1, 'DOCTOR', 'DHRUV', '1999-04-09', 'D@G.COM', 756751110, 'ADAJAN SURAT', '2018-11-25', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `in patient`
--

DROP TABLE IF EXISTS `in patient`;
CREATE TABLE IF NOT EXISTS `in patient` (
  `PATIENT ID` int(11) NOT NULL,
  `ROOM ID` int(11) NOT NULL,
  `DISCHAREGE DATE` date NOT NULL,
  `DISEASE` varchar(50) NOT NULL,
  `ARRIVAL DATE` date NOT NULL,
  PRIMARY KEY (`ROOM ID`),
  FOREIGN KEY `PATIENT ID` (`PATIENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `PATIENT ID` int(11) NOT NULL,
  `MEDICINE ID` int(11) NOT NULL,
  `MEDICINE NAME` varchar(20) NOT NULL,
  `MEDICINE COST` int(11) NOT NULL,
  PRIMARY KEY (`MEDICINE ID`),
  FOREIGN KEY `PATIENT ID` (`PATIENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
CREATE TABLE IF NOT EXISTS `nurse` (
  `NURSE ID` int(11) NOT NULL,
  `EMPLOYEE ID` int(11) NOT NULL,
  `ARRIVAL DATE` date NOT NULL,
  `COUNTPATIENT` int(11) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  PRIMARY KEY (`NURSE ID`),
  FOREIGN KEY `EMPLOYEE ID` (`EMPLOYEE ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `out patient`
--

DROP TABLE IF EXISTS `out patient`;
CREATE TABLE IF NOT EXISTS `out patient` (
  `PATIENT ID` int(11) NOT NULL,
  `ARRIVAL DATE` date NOT NULL,
  `DISEASE` varchar(50) NOT NULL,
  FOREIGN KEY `PATIENT ID` (`PATIENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passive`
--

DROP TABLE IF EXISTS `passive`;
CREATE TABLE IF NOT EXISTS `passive` (
  `EMPLOYEE ID` int(11) NOT NULL,
  `DEPARTMENT ID` int(11) NOT NULL,
  `DATE OF LEVING` date NOT NULL,
  FOREIGN KEY `EMPLOYEE ID` (`EMPLOYEE ID`),
  FOREIGN KEY `DEPARTMENT ID` (`DEPARTMENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `PATIENT ID` int(11) NOT NULL,
  `DOCTOR ID` int(11) NOT NULL,
  `NURSE ID` int(11) NOT NULL,
  `NAME` varchar(10) NOT NULL,
  `DATE OF BIRTH` date NOT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `GENDER` varchar(5) NOT NULL,
  `PHONE NUMBER` int(11) NOT NULL,
  `ADDRESS` varchar(25) NOT NULL,
  `BLOOD GROUP` varchar(10) NOT NULL,
  PRIMARY KEY (`PATIENT ID`),
  FOREIGN KEY `DOCTOR ID` (`DOCTOR ID`),
  FOREIGN KEY `NURSE ID` (`NURSE ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

DROP TABLE IF EXISTS `receptionist`;
CREATE TABLE IF NOT EXISTS `receptionist` (
  `EMPLOYEE ID` int(11) NOT NULL,
  `RECEPTIONIST ID` int(11) NOT NULL,
  `PASSWORD` varchar(25) NOT NULL,
  PRIMARY KEY (`RECEPTIONIST ID`),
  FOREIGN KEY `EMPLOYEE ID` (`EMPLOYEE ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `REORT ID` int(11) NOT NULL,
  `PATIENT ID` int(11) NOT NULL,
  `TEST ID` int(11) NOT NULL,
  `MEDICINE ID` int(11) NOT NULL,
  `BILL NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`REORT ID`),
  FOREIGN KEY `PATIENT ID` (`PATIENT ID`),
  FOREIGN KEY `TEST ID` (`TEST ID`),
  FOREIGN KEY `MEDICINE ID` (`MEDICINE ID`),
  FOREIGN KEY `BILL NUMBER` (`BILL NUMBER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `ROOM ID` int(11) NOT NULL,
  `ROOM TYPE` varchar(10) NOT NULL,
  `ROOM COST` int(11) NOT NULL,
  `ARRIVAL DATE` date NOT NULL,
  FOREIGN KEY `ROOM ID` (`ROOM ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `PATIENT ID` int(11) NOT NULL,
  `TEST ID` int(11) NOT NULL,
  `TEST COST` int(11) NOT NULL,
  `TEST DATE` date NOT NULL,
  PRIMARY KEY (`TEST ID`),
  FOREIGN KEY `PATIENT ID` (`PATIENT ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
