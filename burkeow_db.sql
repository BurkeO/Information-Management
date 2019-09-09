-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 25, 2018 at 01:47 PM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.38-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `burkeow_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Car`
--

CREATE TABLE IF NOT EXISTS `Car` (
  `Car_ID` int(11) NOT NULL,
  `Engine_num` int(11) NOT NULL,
  `Driver_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Car`
--

INSERT INTO `Car` (`Car_ID`, `Engine_num`, `Driver_num`) VALUES
(1, 82985, 521),
(2, 24962, 382),
(3, 696325, 904),
(4, 248932, 1283),
(6, 102346, 294),
(8, 149682, 4821),
(9, 111125, 820),
(12, 124683, 1246);

-- --------------------------------------------------------

--
-- Table structure for table `Car_Race`
--

CREATE TABLE IF NOT EXISTS `Car_Race` (
  `Track_name` varchar(255) NOT NULL,
  `Year` int(11) NOT NULL,
  `Car_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Car_Race`
--

INSERT INTO `Car_Race` (`Track_name`, `Year`, `Car_ID`) VALUES
('Anglesey', 2017, 1),
('Mondello', 2017, 2),
('Mondello', 2017, 3),
('Brands Hatch', 2018, 4),
('Donington Park', 2018, 6),
('Brands Hatch', 2018, 12),
('Silverstone', 2017, 12);

-- --------------------------------------------------------

--
-- Table structure for table `Driver`
--

CREATE TABLE IF NOT EXISTS `Driver` (
  `Driver_num` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Blood_type` varchar(3) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Town` varchar(255) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `Team_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Driver`
--

INSERT INTO `Driver` (`Driver_num`, `Name`, `Age`, `Blood_type`, `Street`, `Town`, `Country`, `Team_ID`) VALUES
(294, 'Tim Parker', 28, 'AB+', 'Park Lane', 'New York', 'USA', 310),
(382, 'Oscar Daly', 26, 'A-', 'Main Street', 'Hull', 'England', 201),
(521, 'Frank Hill', 26, 'O-', 'Coast Road', 'Galway', 'Ireland', 298),
(820, 'Matt West', 29, 'B-', 'Green Lane', 'Brisbane', 'Australia', 301),
(904, 'Rick Walker', 26, 'B-', 'Park Lane', 'New York', 'USA', 410),
(1246, 'Tom Masey', 22, 'A+', 'Harcourt Street', 'London', 'England', 124),
(1283, 'Alan Wright', 24, 'O-', 'Seaview Road', 'Glasgow', 'Scotland', 298),
(4821, 'Jean le Pen', 21, 'AB-', 'Rue de Seine', 'Paris', 'France', 310);

--
-- Triggers `Driver`
--
DELIMITER //
CREATE TRIGGER `blood_update_check_driver` BEFORE UPDATE ON `Driver`
 FOR EACH ROW BEGIN
    IF (NEW.Blood_type != OLD.Blood_type) THEN 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: cannot change blood type';
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `Driver_name_and_results`
--
CREATE TABLE IF NOT EXISTS `Driver_name_and_results` (
`Name` varchar(255)
,`Driver_num` int(11)
,`Track_name` varchar(255)
,`Year` int(11)
,`Position` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `Driver_result`
--

CREATE TABLE IF NOT EXISTS `Driver_result` (
  `Track_name` varchar(255) NOT NULL,
  `Year` int(11) NOT NULL,
  `Driver_num` int(11) NOT NULL,
  `Position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Driver_result`
--

INSERT INTO `Driver_result` (`Track_name`, `Year`, `Driver_num`, `Position`) VALUES
('Anglesey', 2017, 521, 1),
('Brands Hatch', 2018, 1246, 1),
('Brands Hatch', 2018, 1283, 2),
('Donington Park', 2018, 294, 3),
('Mondello', 2017, 382, 1),
('Mondello', 2017, 904, 2),
('Silverstone', 2017, 1246, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE IF NOT EXISTS `Event` (
  `Track_name` varchar(255) NOT NULL,
  `Year` int(11) NOT NULL,
  `Country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`Track_name`, `Year`, `Country`) VALUES
('Anglesey', 2017, 'England'),
('Brands Hatch', 2018, 'England'),
('Donington Park', 2018, 'England'),
('Monaco Grand Prix', 2018, 'Monaco'),
('Mondello', 2017, 'Ireland'),
('Silverstone', 2017, 'England');

-- --------------------------------------------------------

--
-- Table structure for table `Mechanic`
--

CREATE TABLE IF NOT EXISTS `Mechanic` (
  `Mechanic_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Team_ID` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `Driver_num` int(11) NOT NULL,
  `Car_ID` int(11) NOT NULL,
  `Blood_type` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Mechanic`
--

INSERT INTO `Mechanic` (`Mechanic_ID`, `Name`, `Team_ID`, `Age`, `Driver_num`, `Car_ID`, `Blood_type`) VALUES
(111, 'Dave Knight', 310, 32, 294, 6, 'A+'),
(129, 'Tom Arnold', 124, 32, 1246, 12, 'AB+'),
(130, 'Sam Hill', 298, 30, 521, 1, 'O+'),
(260, 'Rick Martin', 298, 36, 1283, 4, 'AB-'),
(266, 'Greg Day', 301, 29, 820, 9, 'A-'),
(310, 'Rick Hill', 410, 30, 904, 3, 'AB+'),
(400, 'Jared Graves', 298, 31, 1283, 4, 'O-'),
(410, 'Tom Wright', 310, 29, 4821, 8, 'O-'),
(560, 'Alan Spencer', 201, 31, 382, 2, 'A+'),
(811, 'Curtis Keene', 124, 26, 1246, 12, 'O-'),
(929, 'Richie King', 310, 31, 4821, 8, 'AB+');

--
-- Triggers `Mechanic`
--
DELIMITER //
CREATE TRIGGER `blood_update_check_mechanic` BEFORE UPDATE ON `Mechanic`
 FOR EACH ROW BEGIN
    IF (NEW.Blood_type != OLD.Blood_type) THEN 
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning: cannot change blood type';
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE IF NOT EXISTS `Team` (
  `Team_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Ranking` int(11) NOT NULL,
  `Owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`Team_ID`, `Name`, `Ranking`, `Owner`) VALUES
(124, 'Max Racing', 2, 'Exor'),
(201, 'Aston Martin Racing', 4, 'David Richards'),
(298, 'Red Bull', 1, 'Dietrich Mateschitz'),
(301, 'McLaren', 5, 'Amanda McLaren'),
(310, 'Richard Mille Racing', 3, 'Richard Mille'),
(410, 'Ferrari', 6, 'Exor');

-- --------------------------------------------------------

--
-- Structure for view `Driver_name_and_results`
--
DROP TABLE IF EXISTS `Driver_name_and_results`;

CREATE ALGORITHM=UNDEFINED DEFINER=`burkeow`@`%.scss.tcd.ie` SQL SECURITY DEFINER VIEW `Driver_name_and_results` AS select `Driver`.`Name` AS `Name`,`Driver`.`Driver_num` AS `Driver_num`,`Driver_result`.`Track_name` AS `Track_name`,`Driver_result`.`Year` AS `Year`,`Driver_result`.`Position` AS `Position` from (`Driver` join `Driver_result`) where (`Driver`.`Driver_num` = `Driver_result`.`Driver_num`);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Car`
--
ALTER TABLE `Car`
 ADD PRIMARY KEY (`Car_ID`), ADD UNIQUE KEY `Engine_num` (`Engine_num`), ADD UNIQUE KEY `Driver_num` (`Driver_num`);

--
-- Indexes for table `Car_Race`
--
ALTER TABLE `Car_Race`
 ADD PRIMARY KEY (`Track_name`,`Year`,`Car_ID`), ADD KEY `Car_ID` (`Car_ID`);

--
-- Indexes for table `Driver`
--
ALTER TABLE `Driver`
 ADD PRIMARY KEY (`Driver_num`), ADD KEY `Team_ID` (`Team_ID`);

--
-- Indexes for table `Driver_result`
--
ALTER TABLE `Driver_result`
 ADD PRIMARY KEY (`Track_name`,`Year`,`Driver_num`), ADD KEY `Driver_num` (`Driver_num`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
 ADD PRIMARY KEY (`Track_name`,`Year`);

--
-- Indexes for table `Mechanic`
--
ALTER TABLE `Mechanic`
 ADD PRIMARY KEY (`Mechanic_ID`), ADD KEY `Team_ID` (`Team_ID`), ADD KEY `Driver_num` (`Driver_num`), ADD KEY `Car_ID` (`Car_ID`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
 ADD PRIMARY KEY (`Team_ID`), ADD UNIQUE KEY `Name` (`Name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Car`
--
ALTER TABLE `Car`
ADD CONSTRAINT `Car_ibfk_1` FOREIGN KEY (`Driver_num`) REFERENCES `Driver` (`Driver_num`);

--
-- Constraints for table `Car_Race`
--
ALTER TABLE `Car_Race`
ADD CONSTRAINT `Car_Race_ibfk_1` FOREIGN KEY (`Track_name`, `Year`) REFERENCES `Event` (`Track_name`, `Year`),
ADD CONSTRAINT `Car_Race_ibfk_2` FOREIGN KEY (`Car_ID`) REFERENCES `Car` (`Car_ID`);

--
-- Constraints for table `Driver`
--
ALTER TABLE `Driver`
ADD CONSTRAINT `Driver_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`);

--
-- Constraints for table `Driver_result`
--
ALTER TABLE `Driver_result`
ADD CONSTRAINT `Driver_result_ibfk_1` FOREIGN KEY (`Track_name`, `Year`) REFERENCES `Event` (`Track_name`, `Year`),
ADD CONSTRAINT `Driver_result_ibfk_2` FOREIGN KEY (`Driver_num`) REFERENCES `Driver` (`Driver_num`);

--
-- Constraints for table `Mechanic`
--
ALTER TABLE `Mechanic`
ADD CONSTRAINT `Mechanic_ibfk_1` FOREIGN KEY (`Team_ID`) REFERENCES `Team` (`Team_ID`),
ADD CONSTRAINT `Mechanic_ibfk_2` FOREIGN KEY (`Driver_num`) REFERENCES `Driver` (`Driver_num`),
ADD CONSTRAINT `Mechanic_ibfk_3` FOREIGN KEY (`Car_ID`) REFERENCES `Car` (`Car_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
