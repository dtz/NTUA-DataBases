-- phpMyAdmin SQL Dump
-- version 3.5.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 11, 2013 at 10:54 PM
-- Server version: 5.5.29-0ubuntu0.12.04.2
-- PHP Version: 5.3.10-1ubuntu3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `GREX AE`
--

-- --------------------------------------------------------

--
-- Table structure for table `AGGREGATED_FINANCIAL_DATA`
--

CREATE TABLE IF NOT EXISTS `AGGREGATED_FINANCIAL_DATA` (
  `SSN` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `gross_year_earnings` float NOT NULL,
  `total_year_holdings` float NOT NULL,
  PRIMARY KEY (`SSN`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `AGGREGATED_FINANCIAL_DATA`
--

INSERT INTO `AGGREGATED_FINANCIAL_DATA` (`SSN`, `year`, `gross_year_earnings`, `total_year_holdings`) VALUES
(112195308, 2012, 64000, 1088),
(123447888, 2012, 26400, 5280),
(147211083, 2011, 12000, 2880),
(147211083, 2012, 48000, 11520),
(160632653, 2012, 1200, 180),
(216884651, 2012, 24000, 4800),
(245970376, 2012, 19200, 3264),
(410137028, 2012, 1600, 360),
(412000473, 2011, 16800, 3360),
(412000473, 2012, 28800, 5760),
(423303823, 2010, 8000, 1920),
(423303823, 2011, 12000, 2880),
(521482180, 2011, 6000, 900),
(521482180, 2012, 14400, 2160),
(555745786, 2012, 176000, 2992),
(558154549, 2012, 18000, 3600),
(609889939, 2011, 12000, 2400),
(609889939, 2012, 36000, 7200),
(623458440, 2012, 60000, 13920),
(667116787, 2012, 36000, 8640),
(736744932, 2011, 79200, 18480),
(736744932, 2012, 86400, 20160),
(746903220, 2012, 7200, 1440),
(804947712, 2012, 4800, 960),
(836340801, 2011, 16800, 3360),
(836340801, 2012, 28800, 5760),
(884687823, 2011, 36000, 8640),
(884687823, 2012, 48000, 11520),
(894767286, 2011, 12000, 2400),
(894767286, 2012, 28800, 5760),
(896031727, 2012, 16200, 3240),
(901096944, 2011, 9600, 1440),
(901096944, 2012, 14400, 2160),
(933989790, 2011, 60000, 13920),
(933989790, 2012, 72000, 16704),
(940079876, 2012, 32000, 7680),
(978028012, 2011, 12600, 2520),
(978028012, 2012, 21600, 4320);

-- --------------------------------------------------------

--
-- Table structure for table `BENEFITS`
--

CREATE TABLE IF NOT EXISTS `BENEFITS` (
  `ben_id` int(11) NOT NULL,
  `fund_benefits` varchar(20) NOT NULL,
  `health_contribution` float NOT NULL,
  `pension_contribution` float NOT NULL,
  `lump_sum_contribution` float NOT NULL,
  `health_tax` float NOT NULL,
  `pension_tax` float NOT NULL,
  PRIMARY KEY (`ben_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BENEFITS`
--

INSERT INTO `BENEFITS` (`ben_id`, `fund_benefits`, `health_contribution`, `pension_contribution`, `lump_sum_contribution`, `health_tax`, `pension_tax`) VALUES
(1, 'EOPPY', 300, 150, 100, 200, 100),
(2, 'EOPPY', 280, 145, 97.5, 170, 96),
(3, 'EOPPY', 260, 135, 95, 157.5, 90),
(4, 'EOPPY', 200, 100, 75, 120, 80),
(5, 'EOPPY', 180, 90, 70, 110, 70),
(6, 'EOPPY', 150, 80, 50, 95, 60),
(7, 'EOPPY', 120, 70, 48, 80, 40),
(8, 'EOPPY', 60, 40, 40, 40, 30);

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE IF NOT EXISTS `EMPLOYEE` (
  `SSN` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `number` varchar(5) NOT NULL,
  `PC` int(11) NOT NULL,
  `specialization` varchar(20) NOT NULL,
  `education_level` varchar(20) NOT NULL,
  `marital_status` varchar(20) NOT NULL,
  `children_no` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`SSN`, `name`, `surname`, `street`, `number`, `PC`, `specialization`, `education_level`, `marital_status`, `children_no`, `pid`, `from_date`, `to_date`) VALUES
(112195308, 'Vaso', 'Mpoura', 'Mykonou', '119', 18956, 'Secretary', 'IEK', 'Single', 0, 3, '2012-09-14', NULL),
(123447888, 'Nikos', 'Bikakis', 'Hrwwn Polytexneiou', '19', 17564, 'Web Design', 'M.Sc.', 'Married', 2, 12, '2012-02-13', NULL),
(147211083, 'Giannis', 'Soulis', 'Lambrou Katsoni', '1', 17564, 'Management', 'MBA', 'Married', 3, 7, '2011-10-06', NULL),
(160632653, 'Despoina', 'Chatzigeorgiou', 'Flekas', '14', 16785, 'Secretary', 'High School', 'Single', 0, 8, '2012-06-12', NULL),
(216884651, 'Gerasimos', 'Belegrinos', 'Aristomenous', '88', 16222, 'Web Design', 'M.Sc.', 'Married', 1, 12, '2012-03-01', NULL),
(245970376, 'Tzortzina', 'Chouliara', 'Rhnou', '12', 12794, 'Secretary', 'IEK', 'Married', 5, 3, '2012-01-09', NULL),
(281846518, 'Eleni', 'Menegaki', 'Ekalhs', '5', 13888, 'Secretary', 'High School', 'Divorced', 3, 15, '2013-02-11', NULL),
(410137028, 'Chrysa', 'Stathakopoulou', 'Trith', '30', 16777, 'Marketing', 'MBA', 'Single', 0, 9, '2012-12-07', NULL),
(412000473, 'Katerina', 'Petraki', 'Zografou', '67', 16221, 'Psychology', 'Ph.D.', 'Single', 0, 6, '2011-05-23', NULL),
(423303823, 'Mathew', 'Xasapakis', 'Ellhnikou', '60', 17321, 'Management', 'MBA', 'Single', 0, 4, '2010-11-04', '2011-03-14'),
(521482180, 'Anastasia', 'Prodromidou', 'Timotheou', '13', 16231, 'Secretary', 'High School', 'Single', 0, 8, '2011-07-20', NULL),
(555745786, 'Katerina', 'Kainouriou', 'Tresas', '14', 16773, 'Secretary', 'High School', 'Single', 0, 3, '2012-01-31', NULL),
(558154549, 'Xarisis', 'Papaxarisis', 'Akalyptou', '100', 15783, 'Marketing', 'MBA', 'Single', 0, 10, '2012-03-14', NULL),
(609889939, 'Panagiotis', 'Katsikis', 'Formionos', '145', 16231, 'Finance', 'Finance', 'Married', 2, 17, '2011-09-08', NULL),
(623458440, 'Alexandros', 'Filios', 'Ysterias', '1', 17877, 'Management', 'MBA', 'Married', 2, 2, '2012-03-06', NULL),
(667116787, 'Dimitris', 'Tzannetos', 'Kizikou', '8', 17123, 'Programmer', 'M.Sc.', 'Married', 1, 13, '2012-04-10', NULL),
(736744932, 'Giorgos', 'Polyxronis', 'Thisea', '65', 16778, 'Management', 'MBA', 'Single', 0, 1, '2011-02-04', NULL),
(746903220, 'Hlektra', 'Apostolopoulou', 'Lysimaxou', '48', 19456, 'Marketing', 'MBA', 'Married', 1, 9, '2012-09-26', NULL),
(804947712, 'Dimitris', 'Sarlis', 'Eptalofou', '5', 16232, 'Programmer', 'M.Sc.', 'Married', 2, 11, '2012-11-14', NULL),
(836340801, 'Stavros', 'Niafas', 'Trallewn', '52', 16231, 'Programmer', 'M.Sc.', 'Single', 0, 11, '2011-06-17', NULL),
(884687823, 'Theodora', 'Galani', 'Hrwwn Polytexneiou', '34', 16823, 'Management', 'MBA', 'Single', 0, 4, '2011-04-19', NULL),
(894767286, 'Dimitris', 'Baxevanakis', 'Iereias', '93', 18999, 'Web Design', 'M.Sc.', 'Married', 2, 12, '2011-08-08', NULL),
(896031727, 'Christos', 'Sakaridis', 'Kotzia', '32', 15893, 'Logistics', 'Finance', 'Married', 2, 16, '2012-04-29', NULL),
(901096944, 'Maria', 'Tseliou', 'Nikaias', '28', 16221, 'Secretary', 'IEK', 'Married', 2, 5, '2011-10-05', NULL),
(933989790, 'Manolis', 'Moutsakis', 'Timotheou', '81', 16231, 'Management', 'MBA', 'Married', 4, 2, '2011-03-08', NULL),
(940079876, 'Gogo', 'Gkioka', 'Trelas', '24', 19658, 'PR', 'Bachelor', 'Single', 0, 14, '2012-05-25', NULL),
(970442972, 'Marianna', 'Charidou', 'Elpidas', '47', 18432, 'Secretary', 'High School', 'Single', 0, 15, '2013-01-21', NULL),
(978028012, 'Ianos', 'Papatheodorou', 'Iakxou', '6', 18455, 'Logistics', 'Finance', 'Single', 0, 16, '2011-06-16', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employees_2012`
--
CREATE TABLE IF NOT EXISTS `employees_2012` (
`name` varchar(20)
,`surname` varchar(20)
,`street` varchar(50)
,`number` varchar(5)
,`PC` int(11)
,`specialization` varchar(20)
,`education_level` varchar(20)
,`marital_status` varchar(20)
,`children_no` int(11)
,`pid` int(11)
,`from_date` date
);
-- --------------------------------------------------------

--
-- Table structure for table `EVALUATION`
--

CREATE TABLE IF NOT EXISTS `EVALUATION` (
  `SSN` int(11) NOT NULL,
  `date` date NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`SSN`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `EVALUATION`
--

INSERT INTO `EVALUATION` (`SSN`, `date`, `score`) VALUES
(147211083, '2011-09-01', 200),
(147211083, '2012-02-01', 300),
(216884651, '2012-07-02', 200),
(410137028, '2013-03-01', 100),
(412000473, '2012-12-03', 300),
(521482180, '2013-02-01', 200),
(609889939, '2012-04-02', 200),
(609889939, '2013-03-01', 100),
(623458440, '2012-10-01', 200),
(623458440, '2013-02-01', 100),
(736744932, '2012-01-08', 300),
(746903220, '2013-03-01', 200),
(804947712, '2013-02-01', 200),
(884687823, '2012-11-01', 200),
(901096944, '2012-07-02', 200),
(940079876, '2013-03-01', 300),
(978028012, '2012-05-02', 200);

-- --------------------------------------------------------

--
-- Table structure for table `MEDIA`
--

CREATE TABLE IF NOT EXISTS `MEDIA` (
  `media_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `kind` varchar(20) NOT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MEDIA`
--

INSERT INTO `MEDIA` (`media_id`, `name`, `kind`) VALUES
(1, 'Nautemporiki', 'Newspaper'),
(2, 'Xrysi Eukairia', 'Newspaper'),
(3, 'Economist', 'Magazine'),
(4, 'www.grex.gr/applications', 'Web site'),
(5, 'www.jobfinder.gr', 'Web site'),
(6, 'www.karieraforyou.gr', 'Web site');

-- --------------------------------------------------------

--
-- Table structure for table `POSITION`
--

CREATE TABLE IF NOT EXISTS `POSITION` (
  `pid` int(11) NOT NULL,
  `department` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `is_empty` int(11) NOT NULL,
  `sal_id` int(11) NOT NULL,
  `ben_id` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `sal_id` (`sal_id`),
  KEY `ben_id` (`ben_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `POSITION`
--

INSERT INTO `POSITION` (`pid`, `department`, `role`, `number`, `is_empty`, `sal_id`, `ben_id`) VALUES
(1, 'General Management', 'Executive Manager', 1, 0, 1, 1),
(2, 'General Management', 'Assistant Manager', 2, 0, 2, 2),
(3, 'General Management', 'Secretary', 3, 0, 7, 7),
(4, 'Personnel', 'Manager', 1, 0, 3, 3),
(5, 'Personnel', 'Secretary', 2, 1, 8, 8),
(6, 'Personnel', 'Psychologist', 1, 0, 5, 5),
(7, 'Sales', 'Manager', 1, 0, 3, 3),
(8, 'Sales', 'Secretary', 2, 0, 8, 8),
(9, 'Sales', 'Advertiser', 2, 0, 6, 6),
(10, 'Sales', 'Salesman', 3, 1, 6, 6),
(11, 'Technical', 'Programmer', 3, 1, 5, 5),
(12, 'Technical', 'Web Developer', 3, 0, 5, 5),
(13, 'Technical', 'Project Manager', 1, 0, 3, 3),
(14, 'PR', 'Manager', 1, 0, 3, 3),
(15, 'PR', 'Secretary', 2, 0, 8, 8),
(16, 'Finance', 'Accountant', 2, 0, 6, 6),
(17, 'Finance', 'Analyst', 1, 0, 4, 4);

--
-- Triggers `POSITION`
--
DROP TRIGGER IF EXISTS `advert_delete`;
DELIMITER //
CREATE TRIGGER `advert_delete` AFTER UPDATE ON `POSITION`
 FOR EACH ROW delete from RECRUITMENT_AD
where RECRUITMENT_AD.pid = NEW.pid and NEW.is_empty = 0
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `PROMOTION`
--

CREATE TABLE IF NOT EXISTS `PROMOTION` (
  `date` date NOT NULL,
  `SSN` int(11) NOT NULL,
  `new_pos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`date`,`SSN`),
  KEY `SSN` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PROMOTION`
--

INSERT INTO `PROMOTION` (`date`, `SSN`, `new_pos`) VALUES
('2011-03-15', 736744932, 1),
('2012-05-02', 147211083, 7),
('2012-12-13', 667116787, 13),
('2013-02-14', 978028012, 16);

--
-- Triggers `PROMOTION`
--
DROP TRIGGER IF EXISTS `promo_update`;
DELIMITER //
CREATE TRIGGER `promo_update` AFTER UPDATE ON `PROMOTION`
 FOR EACH ROW begin
	update EMPLOYEE
	set EMPLOYEE.pid = NEW.new_pos
	where EMPLOYEE.SSN = NEW.SSN and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	update POSITION
	set POSITION.is_empty = POSITION.is_empty+1
	where POSITION.pid = OLD.new_pos and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	update POSITION
	set POSITION.number = POSITION.number+1
	where POSITION.pid = NEW.new_pos and POSITION.is_empty = 0 and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	update POSITION
	set POSITION.is_empty = POSITION.is_empty-1 
	where POSITION.pid = NEW.new_pos and POSITION.is_empty > 0 and NEW.new_pos > 0 and NEW.new_pos <> OLD.new_pos;
	
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `RECRUITMENT_AD`
--

CREATE TABLE IF NOT EXISTS `RECRUITMENT_AD` (
  `pid` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `publication_date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`pid`,`media_id`,`publication_date`),
  KEY `media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `RECRUITMENT_AD`
--

INSERT INTO `RECRUITMENT_AD` (`pid`, `media_id`, `publication_date`, `duration`) VALUES
(5, 4, '2013-01-16 00:00:00', 2),
(10, 1, '2012-12-04 00:00:00', 4),
(11, 5, '2013-01-22 00:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `SALARY`
--

CREATE TABLE IF NOT EXISTS `SALARY` (
  `sal_id` int(11) NOT NULL,
  `wage` float NOT NULL,
  `work_days` int(11) NOT NULL,
  `tax` float NOT NULL,
  `stamp` float NOT NULL,
  PRIMARY KEY (`sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SALARY`
--

INSERT INTO `SALARY` (`sal_id`, `wage`, `work_days`, `tax`, `stamp`) VALUES
(1, 300, 24, 1200, 480),
(2, 250, 24, 960, 432),
(3, 200, 20, 660, 300),
(4, 150, 20, 450, 150),
(5, 120, 20, 360, 120),
(6, 90, 20, 270, 90),
(7, 80, 20, 192, 80),
(8, 60, 20, 120, 60);

-- --------------------------------------------------------

--
-- Stand-in structure for view `wage_stats`
--
CREATE TABLE IF NOT EXISTS `wage_stats` (
`department` varchar(20)
,`avg(wage)` double
);
-- --------------------------------------------------------

--
-- Structure for view `employees_2012`
--
DROP TABLE IF EXISTS `employees_2012`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `employees_2012` AS select `EMPLOYEE`.`name` AS `name`,`EMPLOYEE`.`surname` AS `surname`,`EMPLOYEE`.`street` AS `street`,`EMPLOYEE`.`number` AS `number`,`EMPLOYEE`.`PC` AS `PC`,`EMPLOYEE`.`specialization` AS `specialization`,`EMPLOYEE`.`education_level` AS `education_level`,`EMPLOYEE`.`marital_status` AS `marital_status`,`EMPLOYEE`.`children_no` AS `children_no`,`EMPLOYEE`.`pid` AS `pid`,`EMPLOYEE`.`from_date` AS `from_date` from `EMPLOYEE` where (`EMPLOYEE`.`from_date` between '2012-01-01' and '2012-12-31');

-- --------------------------------------------------------

--
-- Structure for view `wage_stats`
--
DROP TABLE IF EXISTS `wage_stats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `wage_stats` AS select `p`.`department` AS `department`,avg(`s`.`wage`) AS `avg(wage)` from (`SALARY` `s` join `POSITION` `p`) where (`s`.`sal_id` = `p`.`sal_id`) group by `p`.`department`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AGGREGATED_FINANCIAL_DATA`
--
ALTER TABLE `AGGREGATED_FINANCIAL_DATA`
  ADD CONSTRAINT `AFD1` FOREIGN KEY (`SSN`) REFERENCES `EMPLOYEE` (`SSN`) ON UPDATE NO ACTION;

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `Emp1` FOREIGN KEY (`pid`) REFERENCES `POSITION` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `EVALUATION`
--
ALTER TABLE `EVALUATION`
  ADD CONSTRAINT `Eval1` FOREIGN KEY (`SSN`) REFERENCES `EMPLOYEE` (`SSN`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `POSITION`
--
ALTER TABLE `POSITION`
  ADD CONSTRAINT `Pos1` FOREIGN KEY (`sal_id`) REFERENCES `SALARY` (`sal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Pos2` FOREIGN KEY (`ben_id`) REFERENCES `BENEFITS` (`ben_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PROMOTION`
--
ALTER TABLE `PROMOTION`
  ADD CONSTRAINT `Pro1` FOREIGN KEY (`SSN`) REFERENCES `EMPLOYEE` (`SSN`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `RECRUITMENT_AD`
--
ALTER TABLE `RECRUITMENT_AD`
  ADD CONSTRAINT `Rec1` FOREIGN KEY (`pid`) REFERENCES `POSITION` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Rec2` FOREIGN KEY (`media_id`) REFERENCES `MEDIA` (`media_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
