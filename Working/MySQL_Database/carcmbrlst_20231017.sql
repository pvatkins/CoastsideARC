-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: noorda.pdx1-mysql-a7-1a.dreamhost.com
-- Generation Time: Jun 07, 2024 at 03:47 PM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carcmbrlst_20231017`
--
DROP DATABASE `carcmbrlst_20231017`;
CREATE DATABASE IF NOT EXISTS `carcmbrlst_20231017` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `carcmbrlst_20231017`;

-- --------------------------------------------------------

--
-- Table structure for table `CARCMBRLST_202310177`
--

CREATE TABLE `CARCMBRLST_202310177` (
  `ID` int NOT NULL,
  `CallSign` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LicenseClass` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CARCOfficer` varchar(21) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FirstName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Address` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Apt_Suite` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `City` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `State` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ZIP` int DEFAULT NULL,
  `HomePhone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CellPhone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CellTxt` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email1` varchar(31) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email2` varchar(23) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CARCMember` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Active` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Inactive` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DuesDue` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DuesPaid` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DatePaid` datetime DEFAULT NULL,
  `LastPaid` datetime DEFAULT NULL,
  `NextDue` datetime DEFAULT NULL,
  `AmountPaid` int DEFAULT NULL,
  `YrsLicensed` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MemberSince` int DEFAULT NULL,
  `DonateTo` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DonationAmt` int DEFAULT NULL,
  `ARRL` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ARES` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RACES` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CERT` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Packet` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CARCMBRLST_202310177`
--

INSERT INTO `CARCMBRLST_202310177` (`ID`, `CallSign`, `LicenseClass`, `CARCOfficer`, `FirstName`, `LastName`, `Address`, `Apt_Suite`, `City`, `State`, `ZIP`, `HomePhone`, `CellPhone`, `CellTxt`, `Email1`, `Email2`, `CARCMember`, `Active`, `Inactive`, `DuesDue`, `DuesPaid`, `DatePaid`, `LastPaid`, `NextDue`, `AmountPaid`, `YrsLicensed`, `MemberSince`, `DonateTo`, `DonationAmt`, `ARRL`, `ARES`, `RACES`, `CERT`, `Packet`) VALUES
(1, 'KM6HYK', 'Tech', NULL, 'William J.', 'Anderson', '381 Half Moon Ln', '103', 'Daly City', 'CA', 94015, '650-296-7060', '650-296-7060', NULL, 'wja3434@yahoo.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '5', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(2, 'KM6UYM', 'Tech', NULL, 'Fernel', 'Andong', '365 88th St', '2', 'Daly City', 'CA', 94015, '650-762-4404', NULL, NULL, 'fernelandong@yahoo.com', NULL, 'True', 'False', 'True', 'False', 'True', '2022-08-10 00:00:00', '2019-01-01 00:00:00', '2024-01-01 00:00:00', 20, '4', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(3, 'AI6BB', 'Extra', 'VP, Website', 'Paul', 'Atkins', '637 Sharp Park Rd', NULL, 'Pacifica', 'CA', 94044, '650-355-6597', '415-810-9152', 'Yes', 'pvatkins@pacbell.net', NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 43, '8', NULL, 'Repeater', 20, 'True', 'False', 'False', 'False', NULL),
(4, 'W6LOG', 'Extra', NULL, 'Robert', 'Barbitta', '28 Camelot Ct', NULL, 'Daly City', 'CA', 94015, '650-878-8716', '650-878-4429', 'Yes', 'bobandcarol@msn.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-19 00:00:00', '2023-01-01 00:00:00', NULL, '15', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(5, 'KI6HIG', 'Extra', NULL, 'Gary', 'Barnes', '75 Perry St', '119', 'Redwood City', 'CA', 94063, '650-368-0485', '650-553-8649', NULL, 'ki6hig@earthlink.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-01 00:00:00', '2025-01-01 00:00:00', 0, '15', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(6, 'N6ZEN', 'Extra', NULL, 'Dan', 'Bernstein', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-867-5273', '650-712-1332', NULL, 'n6zen@arrl.net', 'danberstein@comcast.net', 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '16', NULL, 'Repeater', 21, 'True', 'False', 'False', 'False', NULL),
(7, 'KK6FOI', 'Tech', NULL, 'Emily', 'Bernstein', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-967-5273', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 3, '9', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(8, 'KJ6FHQ', 'General', NULL, 'Anna', 'Bernstein', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-867-5273', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 3, '9', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(9, 'AA6XL', 'Extra', NULL, 'Michael G.', 'Bevington', '612 Montezuma Dr', NULL, 'Pacifica', 'CA', 94044, '650-359-5194', '650-922-6847', NULL, 'mike_bevington@pacbell.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 40, '30+', NULL, 'Repeater', 10, 'False', 'False', 'False', 'False', NULL),
(10, 'AB7ZX', 'Extra', NULL, 'Miles E.', 'Bond', '16303 S/E 3rd St', NULL, 'Vancouver', 'WA', 98684, '360-254-5381', NULL, NULL, 'ab7zx@aol.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-02-02 00:00:00', '2024-01-01 00:00:00', 20, '25+', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(11, 'KE6MNJ', 'General', NULL, 'Roy', 'Brixen', 'P.O.Box 699', NULL, 'Pescadero', 'CA', 94060, '650-879-1978', '650-504-0777', NULL, 'rebrixen@well.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-12-01 00:00:00', NULL, 0, '22+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(12, 'K6ZP', 'Extra', NULL, 'Andy', 'Calman', 'P.O.Box 371203', NULL, 'Montara', 'CA', 94037, '650-270-9683', '650-270-9683', NULL, 'acalmanmd@gmail.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', NULL, 0, '4', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(13, 'KN6FUT', 'General', NULL, 'Ben', 'Calvert', '444 Lewis Ln', NULL, 'Pacifica', 'CA', 94044, '650-346-6848', NULL, NULL, 'ben@flyingwalrus.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '11+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(14, 'AE6DC', 'Extra', NULL, 'David', 'Chamberlin', '2305 Beach Blvd', NULL, 'Pacifica', 'CA', 94044, '650-898-7364', '650-898-7364', 'Yes', 'dc@ae6dc.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '17+', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(15, 'K6NIA', 'Extra', NULL, 'David', 'Conroy', 'P.O.Box 1346', NULL, 'El Granada', 'CA', 94018, '650-728-1424', '650-483-5156', NULL, 'dgcx@icloud.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-31 00:00:00', '2022-01-01 00:00:00', '2024-01-01 00:00:00', 20, '6', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(16, 'KK6JJX', 'General', NULL, 'Don R.', 'Corral', '720 Edgemar Ave', NULL, 'Pacifica', 'CA', 94044, '415-971-8528', '415-971-8528', NULL, 'firelectric.don@gmail.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-10 00:00:00', '2023-01-01 00:00:00', NULL, '8', NULL, 'Repeater', 10, 'False', 'False', 'False', 'False', NULL),
(17, 'AF6BT', 'Extra', NULL, 'Derek', 'Dang', '5838 Pinewood Rd', NULL, 'Oakland', 'CA', 94611, '510-654-3310', '510-773-0942', NULL, 'derekd_94611@sbcglobal.net', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-28 00:00:00', '2023-01-01 00:00:00', NULL, '15+', NULL, 'Repeater', 20, 'False', 'False', 'False', 'False', NULL),
(18, 'KC6LCA', 'Tech', NULL, 'Tricia', 'Dell', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-867-5273', '650-862-5273', NULL, 'N6zen@arrl.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, '15+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(19, 'W6AWD', 'Extra', NULL, 'Alan W.', 'Dye', '183 Bright St', NULL, 'San Francisco', 'CA', 94132, '415-308-7128', '415-308-7128', NULL, 'alandye@gmail.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-12 00:00:00', '2023-01-01 00:00:00', NULL, '24+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(20, 'N6FG', 'Extra', NULL, 'Frank C.', 'Erbacher', '1322 Lerida Way', NULL, 'Pacifica', 'CA', 94044, '650-355-4355', '650-464-3870', 'Yes', 'n6fg@arrl.net', 'ferbache@comcast.net', 'True', 'True', 'False', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '51+', NULL, 'Repeater', 3, 'True', 'False', 'False', 'True', NULL),
(21, 'K6IIP', 'General', NULL, 'Barbara', 'Erbacher', '1322 Lerida Way', NULL, 'Pacifica', 'CA', 94044, '650-355-4355', '650-464-3871', 'Yes', 'barbach@comcast.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 3, '34+', NULL, NULL, NULL, 'False', 'False', 'False', 'True', NULL),
(22, 'N6GYR', 'General', NULL, 'George', 'Fenisey', '399 Holly Ave', NULL, 'S San Francisco', 'CA', 94080, '650-278-2026', NULL, NULL, 'gfenisey@fenisey.com', 'gfenisey@yahoo.com', 'True', 'False', 'True', 'False', 'True', '2022-02-14 00:00:00', NULL, '2027-01-01 00:00:00', 100, '32+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(23, 'KJ6ERS', 'Tech', NULL, 'Carmel', 'Gallagher', '728 Moana Way', NULL, 'Pacifica', 'CA', 94044, '650-670-2322', '650-670-2322', NULL, 'tlcperm@sbcglobal.net', NULL, 'True', 'False', 'True', 'False', 'True', '2022-03-01 00:00:00', NULL, '2023-03-01 00:00:00', 60, '12', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(24, 'K6RYL', 'Extra', NULL, 'Ariel', 'Gallega', '585 Alexis Circle', NULL, 'Daly City', 'CA', 94014, '415-468-1612', '415-297-1724', 'Yes', 'kj6kob@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-02-04 00:00:00', '2024-02-01 00:00:00', 20, '12+', NULL, NULL, NULL, 'True', 'True', 'False', 'True', NULL),
(25, 'N6DOZ', 'General', NULL, 'Rudy', 'Gaoay', 'P.O.Box 5040', NULL, 'S San Francisco', 'CA', 94083, '415-410-1053', '415-410-1053', 'Yes', 'n6doz@arrl.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '4', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(26, 'KN6GQZ', 'Tech', NULL, 'Scott C.', 'Gillette', '280 Olympian Way', NULL, 'Pacifica', 'CA', 94044, '650-219-4058', '650-219-4058', NULL, 'scott@gillette.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '1', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(27, 'KE6KRT', 'Tech', NULL, 'Georgia', 'Grant', '637 Sharp Park Rd', NULL, 'Pacifica', 'CA', 94044, '650-355-6597', NULL, NULL, 'grantg@pacbell.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 3, '26+', NULL, NULL, NULL, 'True', 'False', 'False', 'False', NULL),
(28, 'N1HEL', 'General', NULL, 'Paul', 'Grigorieff', '2101 Winged Foot Rd', NULL, 'Half Moon Bay', 'CA', 94019, '650-727-7759', NULL, NULL, 'n1helradio@gmail.com', 'Pgrig744@gmail.com', 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-14 00:00:00', '2023-01-01 00:00:00', NULL, '33+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(29, 'WB6JKV', 'General', NULL, 'Michael S', 'Herbert', '1368 Crespi Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-6541', '650-333-5088', 'Yes', 'wb6jkv@pacbell.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 20, '53', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(30, 'N6QGZ', 'Tech', NULL, 'Kris', 'Herbert', '1368 Crespi Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-6541', NULL, NULL, 'kmherbert@pacbell.net', NULL, 'False', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(31, 'W6CBH', 'Tech', NULL, 'Breck', 'Hitz', '123 Kent Rd', NULL, 'Pacifica', 'CA', 94044, '650-359-3905', '650-208-2668', 'Emer', 'breck@brechitz.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-19 00:00:00', '2023-01-01 00:00:00', NULL, '45+', 2016, NULL, NULL, 'False', 'False', 'False', 'True', NULL),
(32, 'WB6FEK', 'Extra', NULL, 'David G', 'Hulburt', '19 Malavear Ct', NULL, 'Pacifica', 'CA', 94044, '650-355-8102', '650-892-0351', NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '56+', NULL, NULL, NULL, 'False', 'False', 'False', 'False', NULL),
(33, 'KF6ACH', 'Tech', NULL, 'Jane', 'Hulburt', '19 Malavear Ct', NULL, 'Pacifica', 'CA', 94044, '650-355-8102', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 3, '20', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(34, 'WY7W', 'Extra', NULL, 'Chris', 'Icide', 'P.O.Box 128', NULL, 'Joyce', 'WA', 94038, '350-928-0130', '650-576-2975', NULL, 'chris@netgeeks.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', '2023-01-01 00:00:00', 0, '6+', NULL, NULL, 0, 'False', 'False', 'False', 'False', 'W6EZE-1'),
(35, 'KC6YDH', 'General', NULL, 'Ralph', 'Kugler', 'P.O.Box 2209', NULL, 'Daly City', 'CA', 94017, '650-731-8229', '415-806-0372', 'Yes', 'kc6ydh@arrl.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '29+', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(36, 'N6SJF', 'Extra', 'Treasurer', 'Jonathan', 'Lancelle', '224 Modoc Place', NULL, 'Pacifica', 'CA', 94044, '650-355-2545', '650-270-5823', NULL, 'n6sjf@knosys.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-26 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '34', NULL, 'Repeater', 100, 'True', 'False', 'False', 'False', NULL),
(37, 'KF6TWW', 'General', NULL, 'David L.', 'Lawrence', '508 Cambridge St', NULL, 'Belmont', 'CA', 94002, '650-595-2827', '650-703-9279', 'Emer', 'kf6tww@gmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-03-13 00:00:00', '2022-02-14 00:00:00', '2024-01-01 00:00:00', 20, '17+', NULL, NULL, 7, 'False', 'False', 'False', 'False', NULL),
(38, 'N6BCT', 'Extra', NULL, 'William A.', 'Lillie', '3600 Higgins Canyon Rd', NULL, 'Half Moon Bay', 'CA', 94019, '650-726-3630', NULL, NULL, 'billn6bct@gmail.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '58+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(39, 'KK6PCC', 'Tech', NULL, 'Richard T.', 'Lira', '196 42nd Ave', NULL, 'San Mateo', 'CA', 94403, '650-570-6779', '650-520-4838', 'Yes', 'richlira@myastound.net', NULL, 'False', 'False', 'True', 'True', 'False', '2023-02-28 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 20, '59+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(40, 'KG6EDY  SK', 'General', NULL, 'Walt    SK', 'Long', '326 Sierra Point Rd', NULL, 'Brisbane', 'CA', 94005, '650-922-9491', '650-467-6990', 'Yes', 'kg6edy@arrl.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '21+', NULL, NULL, 0, 'True', 'False', 'False', 'True', NULL),
(41, 'KB6VT', 'Extra', NULL, 'Richard D.', 'Markel', '24 Twin Oaks Ave', NULL, 'San Rafael', 'CA', 94901, '415-258-8258', NULL, NULL, 'richard@batnet.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', '2023-01-01 00:00:00', 20, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(42, 'KB6LGZ', 'General', NULL, 'Victor M.', 'Munoz', '830 Skyline Dr', NULL, 'Daly Ci8ty', 'CA', 94015, '650-278-7626', '650-278-7626', NULL, 'sfu_victor@yahoo.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '39+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(43, 'W6SY', 'Extra', NULL, 'Ted', 'Niemira', '2490 Princeton Dr', NULL, 'San Bruno', 'CA', 94066, '650-615-9201', '415-378-9201', NULL, 'w6sy.ted@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-10 00:00:00', '2026-01-01 00:00:00', 60, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(44, 'KJ6OGL', 'Tech', 'Secretary, Newsletter', 'Tom', 'Oliver', '72 Lighthouse Lane', NULL, 'Daly City', 'CA', 94014, '650-488-0704', '650-303-6980', 'Emer', 'toliver0557@gmail.com', 'kj6ogl@arrl.net', 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-04-13 00:00:00', '2024-01-01 00:00:00', 30, '11', 2013, 'Repeater', 10, 'True', 'False', 'False', 'True', NULL),
(45, 'K6YUA', 'General', NULL, 'Steve', 'Paganelli', '2370 Rosewood Rd', NULL, 'San Bruno', 'CA', 94066, '650-766-2156', NULL, NULL, 'spagnel@prodigy.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-03-13 00:00:00', '2022-01-19 00:00:00', '2025-01-01 00:00:00', 40, '7', NULL, NULL, 30, 'False', 'False', 'False', 'False', NULL),
(46, 'W6VJJ', 'Advanced', NULL, 'Vernon', 'Patterson', '905 Bancroft Ave', NULL, 'Half Moon Bay', 'CA', 94019, '650-726-4282', NULL, NULL, 'donpatterson@sbcglobal.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-03-13 00:00:00', '2020-01-01 00:00:00', '2024-01-01 00:00:00', 20, '76', NULL, NULL, 10, 'False', 'False', 'False', 'False', NULL),
(47, 'WB9EGG', 'Advanced', NULL, 'Ron', 'Purser', '311 Loma Vista Terrace', NULL, 'Pacifica', 'CA', 94044, '650-283-5007', '650-283-5007', NULL, 'rpurser@sfsu.edu', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 40, '52+', NULL, 'Repeater', 20, 'False', 'False', 'False', 'False', NULL),
(48, 'KM6HZR', 'Tech', NULL, 'Michael S.', 'Ransom', '223 Clifton Rd', NULL, 'Pacifica', 'CA', 94044, '415-342-4736', NULL, NULL, 'kayak6@gmail.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2021-01-01 00:00:00', '2023-01-01 00:00:00', 0, '5', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(49, 'N6DBR', 'General', NULL, 'Dan', 'Reid', 'P.O.Box 371537', NULL, 'Montara', 'CA', 94037, '650-776-3445', NULL, NULL, 'n6dbr@dbr.fastmail.fm', NULL, 'True', 'False', 'True', 'True', 'False', '2023-03-13 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '9', NULL, NULL, 20, 'False', 'False', 'False', 'False', NULL),
(50, 'K6DMR', 'Exrea', NULL, 'David M.', 'Rinck', '220 Manor Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-1778', '650-464-1352', 'Yes', 'k6dmr@arrl.com', 'k6dmr@pacbell.net', 'True', 'False', 'True', 'False', 'True', '2023-01-16 00:00:00', '2022-01-10 00:00:00', '2024-01-01 00:00:00', 20, '21', NULL, NULL, 0, 'True', 'False', 'False', 'True', NULL),
(51, 'KJ6TSX', 'General', NULL, 'George', 'Salet', '215 Sunshine Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-4006', '415-756-5074', NULL, 'gsalet@plumbingpro.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '10', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(52, 'KB6OIZ', 'Novice', NULL, 'Linda C.', 'Sanders', '295 Casitas Ave', NULL, 'San Francisco', 'CA', 94127, '415-587-8948', NULL, NULL, 'lin@jaslin.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '46+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(53, 'AJ6J', 'Extra', NULL, 'Mary Ellen', 'Scherer', '1105 Brittany Lane', NULL, 'Daly City', 'CA', 94014, '415-239-4513', '415-377-6584', 'Yes', 'mescherer@comcast.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2021-01-01 00:00:00', '2023-01-01 00:00:00', 0, '12', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(54, 'KM6SCD', 'General', NULL, 'R. Scott', 'Sutor', '1415 Crespi Dr.', NULL, 'Pacifica', 'CA', 94044, '650359-8275', NULL, NULL, 'rscott@sutor.org', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '6', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(55, 'KC6CTT', 'General', NULL, 'Charles', 'Tillman', '446 Oak Lake Ave', NULL, 'Santa Rosa', 'CA', 95409, '707-235-7787', '650-271-2544', 'Yes', 'kc6ctt@yahoo.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', '2023-01-01 00:00:00', 0, '20', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(56, 'KI6DRM', 'Tech', NULL, 'Zoe', 'Kersteen-Tucker', '776 Buena Vista St', NULL, 'Moss Beach', 'CA', 94038, '650-728-2823', NULL, NULL, 'kersteentucker@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 0, '16', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(57, 'W6HAF', 'General', NULL, 'George H.', 'Tucker', '776 Buena Vista St', NULL, 'Moss Beach', 'CA', 94038, '650-728-2823', '650-766-2628', 'Yes', 'zsyzgy@yahoo.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2020-01-01 00:00:00', '2024-01-01 00:00:00', 20, '17', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(58, 'WB6AAJ', 'Extra', NULL, 'Kelly', 'Tuttle', '1825 Walnut Grove Ave', NULL, 'San Jose', 'CA', 95126, NULL, NULL, NULL, 'wb6aaj626@gmail.com', NULL, 'False', 'False', 'False', 'False', 'False', NULL, NULL, NULL, 0, '49', NULL, 'Repeater', 50, 'False', 'False', 'False', 'False', NULL),
(59, 'N6TZE', 'Extra', NULL, 'Casey', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-438-2826', NULL, NULL, 'n6tze@arrl.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-09-14 00:00:00', NULL, '2024-01-01 00:00:00', 20, '30+', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(60, 'WA2KPS', 'Tech', NULL, 'Audrey J.', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-359-3069', '650-766-1193', 'Yes', 'audreyv1!srtickerbur.net', NULL, 'True', 'False', 'True', 'False', 'True', '2022-09-14 00:00:00', '2021-12-01 00:00:00', '2024-01-01 00:00:00', 3, '25+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(61, 'KI6VRA', 'General', NULL, 'Nikki', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-359-3069', NULL, NULL, 'waffle451@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2022-09-14 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, '10+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(62, 'N6TZF', 'Extra', NULL, 'Joshua', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-359-3069', '650-438-2825', NULL, 'n6tzf@arrl.net', NULL, 'True', 'False', 'True', 'False', 'True', '2022-09-14 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, '14+', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(63, 'WA6ECH', 'Extra', NULL, 'Pete', 'Wanger', '1604 Mcdonald Way', NULL, 'Burlingame', 'CA', 94010, '650-697-7997', NULL, NULL, 'wa6ech@arrl.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '63', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(64, 'N6BHS', 'Extra', NULL, 'Harry', 'Ysselstein', '256 Highland Ave', NULL, 'Half Moon Bay', 'CA', 94019, '415-706-6216', NULL, NULL, 'hphmb@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-16 00:00:00', '2022-01-04 00:00:00', '2024-01-01 00:00:00', 20, '15+', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(65, 'KN6ORM', 'General', 'President', 'Steve', 'Austin', '446 Old County Rd', '100-212', 'Pacifica', 'CA', 94044, NULL, NULL, NULL, 'steve.austin.pacifica@gmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2021-09-01 00:00:00', '2024-01-01 00:00:00', 23, '2', 2020, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(66, 'KN6PIV', 'Tech', NULL, 'Jillian', 'Aldersen', '446 Old County Rd', '100-211', 'Pacifica', 'CA', 94044, NULL, NULL, NULL, 'kn6piv@gmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2021-09-01 00:00:00', '2024-01-01 00:00:00', 3, '2', 2020, NULL, 3, 'False', 'False', 'False', 'False', NULL),
(67, 'KN6QER', 'General', NULL, 'Dennis', 'Kafka', '1311 Redwood Way', NULL, 'Pacifica', 'CA', 94044, '650-355-7852', '650-898-2847', NULL, 'kjjkafka@sbcglobal.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-10 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '2', NULL, NULL, NULL, 'True', 'False', 'False', 'False', NULL),
(68, NULL, NULL, NULL, 'Jacqui', 'Lawrence', '508 Cambridge St', NULL, 'Belmont', 'CA', 94002, '650-595-2827', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-03-13 00:00:00', '2022-02-14 00:00:00', '2024-01-01 00:00:00', 3, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(69, 'NN6U', 'Extra', NULL, 'John R.', 'Owens', 'P.O.Box 370639', NULL, 'Montara', 'CA', 94037, NULL, NULL, NULL, 'john@lorien.org', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '2', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(70, 'KN6UNF', 'Tech', NULL, 'Ellen', 'Price', '541 Monterey Rd', '5', 'Pacifica', 'CA', 94044, '415-702-5444', NULL, NULL, 'EllenPriceCPA@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2022-06-03 00:00:00', NULL, '2024-01-01 00:00:00', 20, '<1', 2022, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(71, 'W2OKB', 'Tech', NULL, 'Bharat', 'Bailur', '6 Disbrow Court', NULL, 'East Brunswick', 'NJ', 8816, NULL, '551-444-8015', NULL, 'bharatbailur@hotmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-04-12 00:00:00', NULL, '2024-01-01 00:00:00', 20, '4', 2023, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(72, NULL, NULL, NULL, 'Julie', 'Lancelle', '224 Modoc Place', NULL, 'Pacifica', 'CA', 94044, NULL, NULL, NULL, NULL, NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-26 00:00:00', NULL, NULL, 3, NULL, 2023, NULL, 0, 'False', 'False', 'False', 'False', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carctb`
--

CREATE TABLE `carctb` (
  `ID` int NOT NULL,
  `CallSign` varchar(10) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `LicenseClass` varchar(8) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `CARCOfficer` varchar(21) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(10) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `LastName` varchar(15) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Address` varchar(22) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Apt_Suite` varchar(7) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `City` varchar(15) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `State` varchar(2) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `ZIP` int DEFAULT NULL,
  `HomePhone` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `CellPhone` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `CellTxt` varchar(4) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Email1` varchar(31) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Email2` varchar(23) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `CARCMember` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Active` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Inactive` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `DuesDue` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `DuesPaid` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `DatePaid` datetime DEFAULT NULL,
  `LastPaid` datetime DEFAULT NULL,
  `NextDue` datetime DEFAULT NULL,
  `AmountPaid` int DEFAULT NULL,
  `YrsLicensed` varchar(3) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `MemberSince` int DEFAULT NULL,
  `DonateTo` varchar(8) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `DonationAmt` int DEFAULT NULL,
  `ARRL` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `ARES` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `RACES` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `CERT` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Packet` varchar(7) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=uca1400_as_ci;

--
-- Dumping data for table `carctb`
--

INSERT INTO `carctb` (`ID`, `CallSign`, `LicenseClass`, `CARCOfficer`, `FullName`, `FirstName`, `LastName`, `Address`, `Apt_Suite`, `City`, `State`, `ZIP`, `HomePhone`, `CellPhone`, `CellTxt`, `Email1`, `Email2`, `CARCMember`, `Active`, `Inactive`, `DuesDue`, `DuesPaid`, `DatePaid`, `LastPaid`, `NextDue`, `AmountPaid`, `YrsLicensed`, `MemberSince`, `DonateTo`, `DonationAmt`, `ARRL`, `ARES`, `RACES`, `CERT`, `Packet`) VALUES
(1, 'KM6HYK', 'Tech', NULL, 'William J. Anderson', 'William J.', 'Anderson', '381 Half Moon Ln', '103', 'Daly City', 'CA', 94015, '650-296-7060', '650-296-7060', NULL, 'wja3434@yahoo.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '5', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(2, 'KM6UYM', 'Tech', NULL, 'Fernel Andong', 'Fernel', 'Andong', '365 88th St', '2', 'Daly City', 'CA', 94015, '650-762-4404', NULL, NULL, 'fernelandong@yahoo.com', NULL, 'True', 'False', 'True', 'False', 'True', '2022-08-10 00:00:00', '2019-01-01 00:00:00', '2024-01-01 00:00:00', 20, '4', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(3, 'AI6BB', 'Extra', 'VP, Website', 'Paul Atkins', 'Paul', 'Atkins', '637 Sharp Park Rd', NULL, 'Pacifica', 'CA', 94044, '650-355-6597', '415-810-9152', 'Yes', 'pvatkins@pacbell.net', NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 43, '8', NULL, 'Repeater', 20, 'True', 'False', 'False', 'False', NULL),
(4, 'W6LOG', 'Extra', NULL, 'Robert Barbitta', 'Robert', 'Barbitta', '28 Camelot Ct', NULL, 'Daly City', 'CA', 94015, '650-878-8716', '650-878-4429', 'Yes', 'bobandcarol@msn.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-19 00:00:00', '2023-01-01 00:00:00', NULL, '15', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(5, 'KI6HIG', 'Extra', NULL, 'Gary Barnes', 'Gary', 'Barnes', '75 Perry St', '119', 'Redwood City', 'CA', 94063, '650-368-0485', '650-553-8649', NULL, 'ki6hig@earthlink.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-01 00:00:00', '2025-01-01 00:00:00', 0, '15', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(6, 'N6ZEN', 'Extra', NULL, 'Dan Bernstein', 'Dan', 'Bernstein', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-867-5273', '650-712-1332', NULL, 'n6zen@arrl.net', 'danberstein@comcast.net', 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '16', NULL, 'Repeater', 21, 'True', 'False', 'False', 'False', NULL),
(7, 'KK6FOI', 'Tech', NULL, 'Emily Bernstein', 'Emily', 'Bernstein', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-967-5273', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 3, '9', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(8, 'KJ6FHQ', 'General', NULL, 'Anna Bernstein', 'Anna', 'Bernstein', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-867-5273', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 3, '9', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(9, 'AA6XL', 'Extra', NULL, 'Michael G. Bevington', 'Michael G.', 'Bevington', '612 Montezuma Dr', NULL, 'Pacifica', 'CA', 94044, '650-359-5194', '650-922-6847', NULL, 'mike_bevington@pacbell.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 40, '30+', NULL, 'Repeater', 10, 'False', 'False', 'False', 'False', NULL),
(10, 'AB7ZX', 'Extra', NULL, 'Miles E. Bond', 'Miles E.', 'Bond', '16303 S/E 3rd St', NULL, 'Vancouver', 'WA', 98684, '360-254-5381', NULL, NULL, 'ab7zx@aol.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2022-02-02 00:00:00', '2024-01-01 00:00:00', 20, '25+', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(11, 'KE6MNJ', 'General', NULL, 'Roy Brixen', 'Roy', 'Brixen', 'P.O.Box 699', NULL, 'Pescadero', 'CA', 94060, '650-879-1978', '650-504-0777', NULL, 'rebrixen@well.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-12-01 00:00:00', NULL, 0, '22+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(12, 'K6ZP', 'Extra', NULL, 'Andy Calman', 'Andy', 'Calman', 'P.O.Box 371203', NULL, 'Montara', 'CA', 94037, '650-270-9683', '650-270-9683', NULL, 'acalmanmd@gmail.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', NULL, 0, '4', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(13, 'KN6FUT', 'General', NULL, 'Ben Calvert', 'Ben', 'Calvert', '444 Lewis Ln', NULL, 'Pacifica', 'CA', 94044, '650-346-6848', NULL, NULL, 'ben@flyingwalrus.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '11+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(14, 'AE6DC', 'Extra', NULL, 'David Chamberlin', 'David', 'Chamberlin', '2305 Beach Blvd', NULL, 'Pacifica', 'CA', 94044, '650-898-7364', '650-898-7364', 'Yes', 'dc@ae6dc.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '17+', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(15, 'K6NIA', 'Extra', NULL, 'David Conroy', 'David', 'Conroy', 'P.O.Box 1346', NULL, 'El Granada', 'CA', 94018, '650-728-1424', '650-483-5156', NULL, 'dgcx@icloud.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-31 00:00:00', '2022-01-01 00:00:00', '2024-01-01 00:00:00', 20, '6', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(16, 'KK6JJX', 'General', NULL, 'Don R. Corral', 'Don R.', 'Corral', '720 Edgemar Ave', NULL, 'Pacifica', 'CA', 94044, '415-971-8528', '415-971-8528', NULL, 'firelectric.don@gmail.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-10 00:00:00', '2023-01-01 00:00:00', NULL, '8', NULL, 'Repeater', 10, 'False', 'False', 'False', 'False', NULL),
(17, 'AF6BT', 'Extra', NULL, 'Derek Dang', 'Derek', 'Dang', '5838 Pinewood Rd', NULL, 'Oakland', 'CA', 94611, '510-654-3310', '510-773-0942', NULL, 'derekd_94611@sbcglobal.net', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-28 00:00:00', '2023-01-01 00:00:00', NULL, '15+', NULL, 'Repeater', 20, 'False', 'False', 'False', 'False', NULL),
(18, 'KC6LCA', 'Tech', NULL, 'Tricia Dell', 'Tricia', 'Dell', 'P.O.Box 1236', NULL, 'El Granada', 'CA', 94018, '650-867-5273', '650-862-5273', NULL, 'N6zen@arrl.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-23 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, '15+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(19, 'W6AWD', 'Extra', NULL, 'Alan W. Dye', 'Alan W.', 'Dye', '183 Bright St', NULL, 'San Francisco', 'CA', 94132, '415-308-7128', '415-308-7128', NULL, 'alandye@gmail.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-12 00:00:00', '2023-01-01 00:00:00', NULL, '24+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(20, 'N6FG', 'Extra', NULL, 'Frank C. Erbacher', 'Frank C.', 'Erbacher', '1322 Lerida Way', NULL, 'Pacifica', 'CA', 94044, '650-355-4355', '650-464-3870', 'Yes', 'n6fg@arrl.net', 'ferbache@comcast.net', 'True', 'True', 'False', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '51+', NULL, 'Repeater', 3, 'True', 'False', 'False', 'True', NULL),
(21, 'K6IIP', 'General', NULL, 'Barbara Erbacher', 'Barbara', 'Erbacher', '1322 Lerida Way', NULL, 'Pacifica', 'CA', 94044, '650-355-4355', '650-464-3871', 'Yes', 'barbach@comcast.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 3, '34+', NULL, NULL, NULL, 'False', 'False', 'False', 'True', NULL),
(22, 'N6GYR', 'General', NULL, 'George Fenisey', 'George', 'Fenisey', '399 Holly Ave', NULL, 'S San Francisco', 'CA', 94080, '650-278-2026', NULL, NULL, 'gfenisey@fenisey.com', 'gfenisey@yahoo.com', 'True', 'False', 'True', 'False', 'True', '2022-02-14 00:00:00', NULL, '2027-01-01 00:00:00', 100, '32+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(23, 'KJ6ERS', 'Tech', NULL, 'Carmel Gallagher', 'Carmel', 'Gallagher', '728 Moana Way', NULL, 'Pacifica', 'CA', 94044, '650-670-2322', '650-670-2322', NULL, 'tlcperm@sbcglobal.net', NULL, 'True', 'False', 'True', 'False', 'True', '2022-03-01 00:00:00', NULL, '2023-03-01 00:00:00', 60, '12', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(24, 'K6RYL', 'Extra', NULL, 'Ariel Gallega', 'Ariel', 'Gallega', '585 Alexis Circle', NULL, 'Daly City', 'CA', 94014, '415-468-1612', '415-297-1724', 'Yes', 'kj6kob@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-02-04 00:00:00', '2024-02-01 00:00:00', 20, '12+', NULL, NULL, NULL, 'True', 'True', 'False', 'True', NULL),
(25, 'N6DOZ', 'General', NULL, 'Rudy Gaoay', 'Rudy', 'Gaoay', 'P.O.Box 5040', NULL, 'S San Francisco', 'CA', 94083, '415-410-1053', '415-410-1053', 'Yes', 'n6doz@arrl.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '4', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(26, 'KN6GQZ', 'Tech', NULL, 'Scott C. Gillette', 'Scott C.', 'Gillette', '280 Olympian Way', NULL, 'Pacifica', 'CA', 94044, '650-219-4058', '650-219-4058', NULL, 'scott@gillette.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '1', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(27, 'KE6KRT', 'Tech', NULL, 'Georgia Grant', 'Georgia', 'Grant', '637 Sharp Park Rd', NULL, 'Pacifica', 'CA', 94044, '650-355-6597', NULL, NULL, 'grantg@pacbell.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 3, '26+', NULL, NULL, NULL, 'True', 'False', 'False', 'False', NULL),
(28, 'N1HEL', 'General', NULL, 'Paul Grigorieff', 'Paul', 'Grigorieff', '2101 Winged Foot Rd', NULL, 'Half Moon Bay', 'CA', 94019, '650-727-7759', NULL, NULL, 'n1helradio@gmail.com', 'Pgrig744@gmail.com', 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-14 00:00:00', '2023-01-01 00:00:00', NULL, '33+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(29, 'WB6JKV', 'General', NULL, 'Michael S. Herbert', 'Michael S.', 'Herbert', '1368 Crespi Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-6541', '650-333-5088', 'Yes', 'wb6jkv@pacbell.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 20, '53', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(30, 'N6QGZ', 'Tech', NULL, 'Kris Herbert', 'Kris', 'Herbert', '1368 Crespi Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-6541', NULL, NULL, 'kmherbert@pacbell.net', NULL, 'False', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(31, 'W6CBH', 'Tech', NULL, 'Breck Hitz', 'Breck', 'Hitz', '123 Kent Rd', NULL, 'Pacifica', 'CA', 94044, '650-359-3905', '650-208-2668', 'Emer', 'breck@brechitz.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2022-01-19 00:00:00', '2023-01-01 00:00:00', NULL, '45+', 2016, NULL, NULL, 'False', 'False', 'False', 'True', NULL),
(32, 'WB6FEK', 'Extra', NULL, 'David G. Hurlburt', 'David G.', 'Hurlburt', '19 Malavear Ct', NULL, 'Pacifica', 'CA', 94044, '650-355-8102', '650-892-0351', NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '56+', NULL, NULL, NULL, 'False', 'False', 'False', 'False', NULL),
(33, 'KF6ACH', 'Tech', NULL, 'Jane Hurlburt', 'Jane', 'Hurlburt', '19 Malavear Ct', NULL, 'Pacifica', 'CA', 94044, '650-355-8102', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-02-28 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 3, '20', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(34, 'WY7W', 'Extra', NULL, 'Chris Icide', 'Chris', 'Icide', 'P.O.Box 128', NULL, 'Joyce', 'WA', 94038, '350-928-0130', '650-576-2975', NULL, 'chris@netgeeks.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', '2023-01-01 00:00:00', 0, '6+', NULL, NULL, 0, 'False', 'False', 'False', 'False', 'W6EZE-1'),
(35, 'KC6YDH', 'General', NULL, 'Ralph Kugler', 'Ralph', 'Kugler', 'P.O.Box 2209', NULL, 'Daly City', 'CA', 94017, '650-731-8229', '415-806-0372', 'Yes', 'kc6ydh@arrl.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '29+', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(36, 'N6SJF', 'Extra', 'Treasurer', 'Jonathan Lancelle', 'Jonathan', 'Lancelle', '224 Modoc Place', NULL, 'Pacifica', 'CA', 94044, '650-355-2545', '650-270-5823', NULL, 'n6sjf@knosys.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-26 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '34', NULL, 'Repeater', 100, 'True', 'False', 'False', 'False', NULL),
(37, 'KF6TWW', 'General', NULL, 'David L. Lawrence', 'David L.', 'Lawrence', '508 Cambridge St', NULL, 'Belmont', 'CA', 94002, '650-595-2827', '650-703-9279', 'Emer', 'kf6tww@gmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-03-13 00:00:00', '2022-02-14 00:00:00', '2024-01-01 00:00:00', 20, '17+', NULL, NULL, 7, 'False', 'False', 'False', 'False', NULL),
(38, 'N6BCT', 'Extra', NULL, 'William A. Lillie', 'William A.', 'Lillie', '3600 Higgins Canyon Rd', NULL, 'Half Moon Bay', 'CA', 94019, '650-726-3630', NULL, NULL, 'billn6bct@gmail.com', NULL, 'True', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', NULL, 0, '58+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(39, 'KK6PCC', 'Tech', NULL, 'Richard T. Lira', 'Richard T.', 'Lira', '196 42nd Ave', NULL, 'San Mateo', 'CA', 94403, '650-570-6779', '650-520-4838', 'Yes', 'richlira@myastound.net', NULL, 'False', 'False', 'True', 'True', 'False', '2023-02-28 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 20, '59+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(40, 'KG6EDY  SK', 'General', NULL, 'Walt Long', 'Walt', 'Long', '326 Sierra Point Rd', NULL, 'Brisbane', 'CA', 94005, '650-922-9491', '650-467-6990', 'Yes', 'kg6edy@arrl.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '21+', NULL, NULL, 0, 'True', 'False', 'False', 'True', NULL),
(41, 'KB6VT', 'Extra', NULL, 'Richard D. Markel', 'Richard D.', 'Markel', '24 Twin Oaks Ave', NULL, 'San Rafael', 'CA', 94901, '415-258-8258', NULL, NULL, 'richard@batnet.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', '2023-01-01 00:00:00', 20, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(42, 'KB6LGZ', 'General', NULL, 'Victor M. Munoz', 'Victor M.', 'Munoz', '830 Skyline Dr', NULL, 'Daly Ci8ty', 'CA', 94015, '650-278-7626', '650-278-7626', NULL, 'sfu_victor@yahoo.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '39+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(43, 'W6SY', 'Extra', NULL, 'Ted Niemira', 'Ted', 'Niemira', '2490 Princeton Dr', NULL, 'San Bruno', 'CA', 94066, '650-615-9201', '415-378-9201', NULL, 'w6sy.ted@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-10 00:00:00', '2026-01-01 00:00:00', 60, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(44, 'KJ6OGL', 'Tech', 'Secretary, Newsletter', 'Tom Oliver', 'Tom', 'Oliver', '72 Lighthouse Lane', NULL, 'Daly City', 'CA', 94014, '650-488-0704', '650-303-6980', 'Emer', 'toliver0557@gmail.com', 'kj6ogl@arrl.net', 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2022-04-13 00:00:00', '2024-01-01 00:00:00', 30, '11', 2013, 'Repeater', 10, 'True', 'False', 'False', 'True', NULL),
(45, 'K6YUA', 'General', NULL, 'Steve Paganelli', 'Steve', 'Paganelli', '2370 Rosewood Rd', NULL, 'San Bruno', 'CA', 94066, '650-766-2156', NULL, NULL, 'spagnel@prodigy.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-03-13 00:00:00', '2022-01-19 00:00:00', '2025-01-01 00:00:00', 40, '7', NULL, NULL, 30, 'False', 'False', 'False', 'False', NULL),
(46, 'W6VJJ', 'Advanced', NULL, 'Vernon Patterson', 'Vernon', 'Patterson', '905 Bancroft Ave', NULL, 'Half Moon Bay', 'CA', 94019, '650-726-4282', NULL, NULL, 'donpatterson@sbcglobal.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-03-13 00:00:00', '2020-01-01 00:00:00', '2024-01-01 00:00:00', 20, '76', NULL, NULL, 10, 'False', 'False', 'False', 'False', NULL),
(47, 'WB9EGG', 'Advanced', NULL, 'Ron Purser', 'Ron', 'Purser', '311 Loma Vista Terrace', NULL, 'Pacifica', 'CA', 94044, '650-283-5007', '650-283-5007', NULL, 'rpurser@sfsu.edu', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 40, '52+', NULL, 'Repeater', 20, 'False', 'False', 'False', 'False', NULL),
(48, 'KM6HZR', 'Tech', NULL, 'Michael S. Ransom', 'Michael S.', 'Ransom', '223 Clifton Rd', NULL, 'Pacifica', 'CA', 94044, '415-342-4736', NULL, NULL, 'kayak6@gmail.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2021-01-01 00:00:00', '2023-01-01 00:00:00', 0, '5', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(49, 'N6DBR', 'General', NULL, 'Dan Reid', 'Dan', 'Reid', 'P.O.Box 371537', NULL, 'Montara', 'CA', 94037, '650-776-3445', NULL, NULL, 'n6dbr@dbr.fastmail.fm', NULL, 'True', 'False', 'True', 'True', 'False', '2023-03-13 00:00:00', '2022-01-19 00:00:00', '2024-01-01 00:00:00', 20, '9', NULL, NULL, 20, 'False', 'False', 'False', 'False', NULL),
(50, 'K6DMR', 'Exrea', NULL, 'David M. Rinck', 'David M.', 'Rinck', '220 Manor Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-1778', '650-464-1352', 'Yes', 'k6dmr@arrl.com', 'k6dmr@pacbell.net', 'True', 'False', 'True', 'False', 'True', '2023-01-16 00:00:00', '2022-01-10 00:00:00', '2024-01-01 00:00:00', 20, '21', NULL, NULL, 0, 'True', 'False', 'False', 'True', NULL),
(51, 'KJ6TSX', 'General', NULL, 'George Salet', 'George', 'Salet', '215 Sunshine Dr', NULL, 'Pacifica', 'CA', 94044, '650-355-4006', '415-756-5074', NULL, 'gsalet@plumbingpro.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '10', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(52, 'KB6OIZ', 'Novice', NULL, 'Linda C. Sanders', 'Linda C.', 'Sanders', '295 Casitas Ave', NULL, 'San Francisco', 'CA', 94127, '415-587-8948', NULL, NULL, 'lin@jaslin.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '46+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(53, 'AJ6J', 'Extra', NULL, 'Mary Ellen Scherer', 'Mary Ellen', 'Scherer', '1105 Brittany Lane', NULL, 'Daly City', 'CA', 94014, '415-239-4513', '415-377-6584', 'Yes', 'mescherer@comcast.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2021-01-01 00:00:00', '2023-01-01 00:00:00', 0, '12', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(54, 'KM6SCD', 'General', NULL, 'R. Scott Sutor', 'R. Scott', 'Sutor', '1415 Crespi Dr.', NULL, 'Pacifica', 'CA', 94044, '650359-8275', NULL, NULL, 'rscott@sutor.org', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '6', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(55, 'KC6CTT', 'General', NULL, 'Charles Tillman', 'Charles', 'Tillman', '446 Oak Lake Ave', NULL, 'Santa Rosa', 'CA', 95409, '707-235-7787', '650-271-2544', 'Yes', 'kc6ctt@yahoo.com', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2019-01-01 00:00:00', '2023-01-01 00:00:00', 0, '20', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(56, 'KI6DRM', 'Tech', NULL, 'Zoe Kersteen-Tucker', 'Zoe', 'Kersteen-Tucker', '776 Buena Vista St', NULL, 'Moss Beach', 'CA', 94038, '650-728-2823', NULL, NULL, 'kersteentucker@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 0, '16', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(57, 'W6HAF', 'General', NULL, 'George H. Tucker', 'George H.', 'Tucker', '776 Buena Vista St', NULL, 'Moss Beach', 'CA', 94038, '650-728-2823', '650-766-2628', 'Yes', 'zsyzgy@yahoo.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2020-01-01 00:00:00', '2024-01-01 00:00:00', 20, '17', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(58, 'WB6AAJ', 'Extra', NULL, 'Kelly Tuttle', 'Kelly', 'Tuttle', '1825 Walnut Grove Ave', NULL, 'San Jose', 'CA', 95126, NULL, NULL, NULL, 'wb6aaj626@gmail.com', NULL, 'False', 'False', 'False', 'False', 'False', NULL, NULL, NULL, 0, '49', NULL, 'Repeater', 50, 'False', 'False', 'False', 'False', NULL),
(59, 'N6TZE', 'Extra', NULL, 'Casey Villyard', 'Casey', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-438-2826', NULL, NULL, 'n6tze@arrl.net', NULL, 'True', 'True', 'False', 'False', 'True', '2022-09-14 00:00:00', NULL, '2024-01-01 00:00:00', 20, '30+', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(60, 'WA2KPS', 'Tech', NULL, 'Audrey J. Villyard', 'Audrey J.', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-359-3069', '650-766-1193', 'Yes', 'audreyv1!srtickerbur.net', NULL, 'True', 'False', 'True', 'False', 'True', '2022-09-14 00:00:00', '2021-12-01 00:00:00', '2024-01-01 00:00:00', 3, '25+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(61, 'KI6VRA', 'General', NULL, 'Nikki Villyard', 'Nikki', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-359-3069', NULL, NULL, 'waffle451@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2022-09-14 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, '10+', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(62, 'N6TZF', 'Extra', NULL, 'Joshua Villyard', 'Joshua', 'Villyard', '1356 Castro Ct', NULL, 'Pacifica', 'CA', 94044, '650-359-3069', '650-438-2825', NULL, 'n6tzf@arrl.net', NULL, 'True', 'False', 'True', 'False', 'True', '2022-09-14 00:00:00', '2021-01-01 00:00:00', '2024-01-01 00:00:00', 3, '14+', NULL, NULL, 0, 'False', 'False', 'False', 'True', NULL),
(63, 'WA6ECH', 'Extra', NULL, 'Pete Wanger', 'Pete', 'Wanger', '1604 Mcdonald Way', NULL, 'Burlingame', 'CA', 94010, '650-697-7997', NULL, NULL, 'wa6ech@arrl.net', NULL, 'False', 'False', 'True', 'True', 'False', NULL, '2020-01-01 00:00:00', '2023-01-01 00:00:00', 0, '63', NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(64, 'N6BHS', 'Extra', NULL, 'Harry Ysselstein', 'Harry', 'Ysselstein', '256 Highland Ave', NULL, 'Half Moon Bay', 'CA', 94019, '415-706-6216', NULL, NULL, 'hphmb@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-16 00:00:00', '2022-01-04 00:00:00', '2024-01-01 00:00:00', 20, '15+', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(65, 'KN6ORM', 'General', 'President', 'Steve Austin', 'Steve', 'Austin', '446 Old County Rd', '100-212', 'Pacifica', 'CA', 94044, NULL, NULL, NULL, 'steve.austin.pacifica@gmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2021-09-01 00:00:00', '2024-01-01 00:00:00', 23, '2', 2020, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(66, 'KN6PIV', 'Tech', NULL, 'Jillian Aldersen', 'Jillian', 'Aldersen', '446 Old County Rd', '100-211', 'Pacifica', 'CA', 94044, NULL, NULL, NULL, 'kn6piv@gmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2022-12-14 00:00:00', '2021-09-01 00:00:00', '2024-01-01 00:00:00', 3, '2', 2020, NULL, 3, 'False', 'False', 'False', 'False', NULL),
(67, 'KN6QER', 'General', NULL, 'Dennis Kafka', 'Dennis', 'Kafka', '1311 Redwood Way', NULL, 'Pacifica', 'CA', 94044, '650-355-7852', '650-898-2847', NULL, 'kjjkafka@sbcglobal.net', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-10 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '2', NULL, NULL, NULL, 'True', 'False', 'False', 'False', NULL),
(68, NULL, NULL, NULL, 'Jacquie Lawrence', 'Jacquie', 'Lawrence', '508 Cambridge St', NULL, 'Belmont', 'CA', 94002, '650-595-2827', NULL, NULL, NULL, NULL, 'True', 'False', 'True', 'False', 'True', '2023-03-13 00:00:00', '2022-02-14 00:00:00', '2024-01-01 00:00:00', 3, NULL, NULL, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(69, 'NN6U', 'Extra', NULL, 'John R. Owens', 'John R.', 'Owens', 'P.O.Box 370639', NULL, 'Montara', 'CA', 94037, NULL, NULL, NULL, 'john@lorien.org', NULL, 'True', 'False', 'True', 'False', 'True', '2023-01-31 00:00:00', '2022-01-14 00:00:00', '2024-01-01 00:00:00', 20, '2', NULL, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(70, 'KN6UNF', 'Tech', NULL, 'Ellen Price', 'Ellen', 'Price', '541 Monterey Rd', '5', 'Pacifica', 'CA', 94044, '415-702-5444', NULL, NULL, 'EllenPriceCPA@gmail.com', NULL, 'True', 'False', 'True', 'False', 'True', '2022-06-03 00:00:00', NULL, '2024-01-01 00:00:00', 20, '<1', 2022, NULL, 0, 'True', 'False', 'False', 'False', NULL),
(71, 'W2OKB', 'Tech', NULL, 'Bharat Bailur', 'Bharat', 'Bailur', '6 Disbrow Court', NULL, 'East Brunswick', 'NJ', 8816, NULL, '551-444-8015', NULL, 'bharatbailur@hotmail.com', NULL, 'True', 'True', 'False', 'False', 'True', '2023-04-12 00:00:00', NULL, '2024-01-01 00:00:00', 20, '4', 2023, NULL, 0, 'False', 'False', 'False', 'False', NULL),
(72, NULL, NULL, NULL, 'Julie Lancelle', 'Julie', 'Lancelle', '224 Modoc Place', NULL, 'Pacifica', 'CA', 94044, NULL, NULL, NULL, NULL, NULL, 'True', 'True', 'False', 'False', 'True', '2023-01-26 00:00:00', NULL, NULL, 3, NULL, 2023, NULL, 0, 'False', 'False', 'False', 'False', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Emails`
--

CREATE TABLE `Emails` (
  `Callsign` varchar(12) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FullName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Emails`
--

INSERT INTO `Emails` (`Callsign`, `Email`, `FullName`) VALUES
('KN6UNF', 'EllenPriceCPA@gmail.com', 'Ellen Price'),
('ZZ1', '', 'Henry Lancelle'),
('K6VIZ', 'vzarich@me.com', 'Victor Zarich'),
('KN6MKA', 'ahujadishaan@gmail.com', 'Dishaan Ahuja'),
('', 'chrisbell1222@me.com', 'Chris Bell'),
('AG6NY', 'missionpurisima@gmail.com', 'Stephen Martin'),
('K6BV', 'dxer@k6bv.net', 'Anthony Dowler'),
('KW6L', '', 'James Sanders'),
('WS6JEN', 'jenni@jwlms.com', 'Jenni Williams'),
('AJ6J', 'mescherer@comcast.net', 'Mary Ellen Scherer'),
('W6CBH', 'breck@leoma.com', 'Breck Hitz'),
('N6FG', 'n6fg@arrl.net', 'Frank C. Erbacher'),
('K6IIP', 'berbach@comcast.net', 'Barbara Erbacher'),
('N6TZE', 'n6tze@arrl.net', 'Casey Villyard'),
('WA2KPS', 'audreyv1@stickerburr.net', 'Audrey J. Villyard'),
('KI6VRA', 'waffle451@gmail.com', 'Nikki Villyard'),
('N6TZF', 'n6tzf@arrl.net', 'Joshua Villyard'),
('WB6JKV', 'wb6jkv@pacbell.net', 'Michael S. Herbert'),
('N6QGZ', 'kmherbert@pacbell.net', 'Kris Herbert'),
('KN6ORM', 'kn6orm@gmail.com', 'Steve Austin'),
('KN6PIV', 'kn6piv@gmail.com', 'Jillian Aldersen'),
('KM6SCD', 'rscott@sutor.org', 'R. Scott Sutor'),
('WA6ECH', 'wa6ech@arrl.net', 'Pete Wanger'),
('AB7ZX', 'ab7zx@arrl.net', 'Miles E. Bond'),
('WB6AAJ', 'wb6aaj626@gmail.com', 'Kelly Tuttle'),
('W6AWD', 'alandye@gmail.com', 'Alan W. Dye'),
('WB6FEK', 'dghurlb@pacbell.net', 'David G. Hurlburt'),
('KF6ACH', '', 'Jane Hurlburt'),
('KK6PCC', 'richlira@myastound.net', 'Richard T. Lira'),
('N1HEL', 'n1helradio@gmail.com', 'Paul Grigorieff'),
('KJ6TSX', 'gsalet@plumbingpro.com', 'George Salet'),
('K6DMR', 'k6dmr@pacbell.net', 'David M. Rinck'),
('KM6HRZ', 'kayak6@gmail.com', 'Michael S. Ransom'),
('', 'julie.a.lancelle@gmail.com', 'Julie Lancelle'),
('N6SJF', 'n6sjf@knosys.com', 'Jonathan Lancelle'),
('AE6DC', 'dc@ae6dc.com', 'David Chamberlin'),
('K6YUA', 'spagnel@prodigy.net', 'Steve Paganelli'),
('KB6VT', 'richard@batnet.com', 'Richard D. Markel'),
('W6SY', 'w6sy.ted@gmail.com', 'Ted Niemira'),
('W6LOG', 'bobandcarole@msn.com', 'Robert Barbitta'),
('KN6GQZ', 'scott@sgillette.com', 'Scott C. Gillette'),
('KB6OIZ', 'lin@jaslin.com', 'Linda C. Sanders'),
('WB9EGG', 'rpurser@sfsu.edu', 'Ron Purser'),
('KG6EDY', 'wlong3@sbcglobal.net', 'Walt Long'),
('N6BCT', 'billn6bct@gmail.com', 'William A. Lillie'),
('KM6UYM', 'fernelandong@yahoo.com', 'Fernel Andong'),
('KM6HYK', 'wja3434@yahoo.com', 'William J. Anderson'),
('N6GYR', 'gfenisey@fenisey.com', 'George Fenisey'),
('W6AER', 'lucas@w6aer.com', 'Lucas Ford'),
('KN6FUT', 'ben@flyingwalrus.net', 'Ben Calvert'),
('KC6CTT', 'KC6CTT@yahoo.com', 'Charles Tillman'),
('', '', 'Jacquie Lawrence'),
('KF6TWW', 'kf6tww@gmail.com', 'David L. Lawrence'),
('N6BHS', 'hpyhmb@gmail.com', 'Harry Ysselstein'),
('AF6BT', 'derekd_94611@sbcglobal.net', 'Derek Dang'),
('K6RYL', 'kj6kob@gmail.com', 'Ariel Gallega'),
('AA6XL', 'mike_bevington@pacbell.net', 'Michael G. Bevington'),
('AI6BB', 'pvatkins@pacbell.net', 'Paul Atkins'),
('KE6KRT', 'grantg@pacbell.net', 'Georgia Grant'),
('KJ6OGL', 'toliver0557@gmail.com', 'Tom Oliver'),
('KK6JJX', 'firelectric.don@gmail.com', 'Don R. Corral'),
('KJ6ERS', 'tlcperrn@sbcglobal.net', 'Carmel Gallagher'),
('KI6HIG', 'ki6hig@earthlink.net', 'Gary Barnes'),
('KI6DRM', 'kersteentucker@gmail.com', 'Zoe Kersteen-Tucker'),
('W6HAF', 'george.e.tucker@att.net', 'George H. Tucker'),
('KB6LGZ', 'sifu_victor@yahoo.com', 'Victor M. Munoz'),
('W6VJJ', 'donpatterson@sbcglobal.net', 'Vernon Patterson'),
('N6ZEN', 'n6zen@arrl.net', 'Dan Bernstein'),
('KK6FOI', '', 'Emily Bernstein'),
('KJ6FHQ', '', 'Anna Bernstein'),
('KC6LCA', '', 'Tricia Dell'),
('KC6YDH', 'kc6ydh@arrl.net', 'Ralph Kugler'),
('KE6MNJ', 'rebrixen@well.com', 'Roy Brixen'),
('WY7W', 'chris@netgeeks.net', 'Chris Icide'),
('K6NIA', 'dgcx@icloud.com', 'David Conroy'),
('NN6U', 'john@nn6u.net', 'John R. Owens'),
('K6ZP', 'acalmanmd@gmail.com', 'Andy Calman'),
('N6DBR', 'n6dbr@dbr.fastmail.fm', 'Dan Reid'),
('N6DOZ', 'n6doz@arrl.net', 'Rudy Gaoay'),
('KN6QER', 'kjjkafka@sbcglobal.net', 'Dennis Kafka'),
('W2OKB', 'bharatbailur@hotmail.com', 'Bharat Bailur');

-- --------------------------------------------------------

--
-- Table structure for table `in_vuppl_not_carctb`
--

CREATE TABLE `in_vuppl_not_carctb` (
  `member_fullName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `member_firstName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `member_lastName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `in_vuppl_not_carctb`
--

INSERT INTO `in_vuppl_not_carctb` (`member_fullName`, `member_firstName`, `member_lastName`) VALUES
('Dishaan Ahuja', 'Dishaan', 'Ahuja'),
('Chris Bell', 'Chris', 'Bell'),
('Anthony Dowler', 'Anthony', 'Dowler'),
('Lucas Ford', 'Lucas', 'Ford'),
('Henry Lancelle', 'Henry', 'Lancelle'),
('Stephen Martin', 'Stephen', 'Martin'),
('James Sanders', 'James', 'Sanders'),
('Jenni Williams', 'Jenni', 'Williams'),
('Victor Zarich', 'Victor', 'Zarich');

-- --------------------------------------------------------

--
-- Table structure for table `merged`
--

CREATE TABLE `merged` (
  `ID` int NOT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `FirstName` varchar(10) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `LastName` varchar(15) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `Membership` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Callsign` varchar(10) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `CARCMember` varchar(5) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `as_of_date` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `dues_cy` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `DatePaid` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `merged`
--

INSERT INTO `merged` (`ID`, `FullName`, `FirstName`, `LastName`, `Membership`, `Callsign`, `CARCMember`, `as_of_date`, `dues_cy`, `DatePaid`) VALUES
(66, 'Jillian Aldersen', 'Jillian', 'Aldersen', 'Full', 'KN6PIV', 'True', '2023-10-20 04:45:27', '2023', '2022-12-14 00:00:00'),
(1, 'William J. Anderson', 'William J.', 'Anderson', 'Inactive', 'KM6HYK', 'False', '2023-10-20 04:45:27', '', NULL),
(2, 'Fernel Andong', 'Fernel', 'Andong', 'Full', 'KM6UYM', 'True', '2023-10-20 04:45:27', '2023', '2022-08-10 00:00:00'),
(3, 'Paul Atkins', 'Paul', 'Atkins', 'Full', 'AI6BB', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(65, 'Steve Austin', 'Steve', 'Austin', 'Full', 'KN6ORM', 'True', '2023-10-20 04:45:27', '2023', '2022-12-14 00:00:00'),
(71, 'Bharat Bailur', 'Bharat', 'Bailur', 'Full', 'W2OKB', 'True', '2023-10-20 04:45:27', '2023', '2023-04-12 00:00:00'),
(4, 'Robert Barbitta', 'Robert', 'Barbitta', 'Inactive', 'W6LOG', 'True', '2023-10-20 04:45:27', '', NULL),
(5, 'Gary Barnes', 'Gary', 'Barnes', 'Full', 'KI6HIG', 'True', '2023-10-20 04:45:27', '2023:2024:2025', '2022-12-14 00:00:00'),
(8, 'Anna Bernstein', 'Anna', 'Bernstein', 'Full', 'KJ6FHQ', 'True', '2023-10-20 04:45:27', '2023', '2023-01-23 00:00:00'),
(6, 'Dan Bernstein', 'Dan', 'Bernstein', 'Full', 'N6ZEN', 'True', '2023-10-20 04:45:27', '2023', '2023-01-23 00:00:00'),
(7, 'Emily Bernstein', 'Emily', 'Bernstein', 'Full', 'KK6FOI', 'True', '2023-10-20 04:45:27', '2023', '2023-01-23 00:00:00'),
(9, 'Michael G. Bevington', 'Michael G.', 'Bevington', 'Full', 'AA6XL', 'True', '2023-10-20 04:45:27', '2023', '2022-12-14 00:00:00'),
(10, 'Miles E. Bond', 'Miles E.', 'Bond', 'Full', 'AB7ZX', 'True', '2023-10-20 04:45:27', '2023', '2023-01-23 00:00:00'),
(11, 'Roy Brixen', 'Roy', 'Brixen', 'Inactive', 'KE6MNJ', 'False', '2023-10-20 04:45:27', '', NULL),
(12, 'Andy Calman', 'Andy', 'Calman', 'Inactive', 'K6ZP', 'False', '2023-10-20 04:45:27', '', NULL),
(13, 'Ben Calvert', 'Ben', 'Calvert', 'Inactive', 'KN6FUT', 'False', '2023-10-20 04:45:27', '', NULL),
(14, 'David Chamberlin', 'David', 'Chamberlin', 'Inactive', 'AE6DC', 'False', '2023-10-20 04:45:27', '', NULL),
(15, 'David Conroy', 'David', 'Conroy', 'Full', 'K6NIA', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(16, 'Don R. Corral', 'Don R.', 'Corral', 'Inactive', 'KK6JJX', 'True', '2023-10-20 04:45:27', '', NULL),
(17, 'Derek Dang', 'Derek', 'Dang', 'Inactive', 'AF6BT', 'True', '2023-10-20 04:45:27', '', NULL),
(18, 'Tricia Dell', 'Tricia', 'Dell', 'Full', 'KC6LCA', 'True', '2023-10-20 04:45:27', '2023', '2023-01-23 00:00:00'),
(19, 'Alan W. Dye', 'Alan W.', 'Dye', 'Inactive', 'W6AWD', 'True', '2023-10-20 04:45:27', '', NULL),
(21, 'Barbara Erbacher', 'Barbara', 'Erbacher', 'Full', 'K6IIP', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(20, 'Frank C. Erbacher', 'Frank C.', 'Erbacher', 'Lifetime', 'N6FG', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(22, 'George Fenisey', 'George', 'Fenisey', 'Full', 'N6GYR', 'True', '2023-10-20 04:45:27', '2022:2023:2024:2025:2026', '2022-02-14 00:00:00'),
(23, 'Carmel Gallagher', 'Carmel', 'Gallagher', 'Inactive', 'KJ6ERS', 'True', '2023-10-20 04:45:27', '', '2022-03-01 00:00:00'),
(24, 'Ariel Gallega', 'Ariel', 'Gallega', 'Full', 'K6RYL', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(25, 'Rudy Gaoay', 'Rudy', 'Gaoay', 'Inactive', 'N6DOZ', 'False', '2023-10-20 04:45:27', '', NULL),
(26, 'Scott C. Gillette', 'Scott C.', 'Gillette', 'Inactive', 'KN6GQZ', 'False', '2023-10-20 04:45:27', '', NULL),
(27, 'Georgia Grant', 'Georgia', 'Grant', 'Full', 'KE6KRT', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(28, 'Paul Grigorieff', 'Paul', 'Grigorieff', 'Inactive', 'N1HEL', 'True', '2023-10-20 04:45:27', '', NULL),
(30, 'Kris Herbert', 'Kris', 'Herbert', 'Full', 'N6QGZ', 'False', '2023-10-20 04:45:27', '2023', '2023-02-28 00:00:00'),
(29, 'Michael S. Herbert', 'Michael S.', 'Herbert', 'Full', 'WB6JKV', 'True', '2023-10-20 04:45:27', '2023', '2023-02-28 00:00:00'),
(31, 'Breck Hitz', 'Breck', 'Hitz', 'Full', 'W6CBH', 'True', '2023-10-20 04:45:27', '2023', NULL),
(32, 'David G. Hurlburt', 'David G.', 'Hurlburt', 'Full', 'WB6FEK', 'True', '2023-10-20 04:45:27', '2023', '2023-02-28 00:00:00'),
(33, 'Jane Hurlburt', 'Jane', 'Hurlburt', 'Full', 'KF6ACH', 'True', '2023-10-20 04:45:27', '2023', '2023-02-28 00:00:00'),
(34, 'Chris Icide', 'Chris', 'Icide', 'Inactive', 'WY7W', 'False', '2023-10-20 04:45:27', '', NULL),
(67, 'Dennis Kafka', 'Dennis', 'Kafka', 'Full', 'KN6QER', 'True', '2023-10-20 04:45:27', '2023', '2023-01-10 00:00:00'),
(56, 'Zoe Kersteen-Tucker', 'Zoe', 'Kersteen-Tucker', 'Full', 'KI6DRM', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(35, 'Ralph Kugler', 'Ralph', 'Kugler', 'Full', 'KC6YDH', 'True', '2023-10-20 04:45:27', '2023', '2022-12-14 00:00:00'),
(36, 'Jonathan Lancelle', 'Jonathan', 'Lancelle', 'Full', 'N6SJF', 'True', '2023-10-20 04:45:27', '2023', '2023-01-26 00:00:00'),
(72, 'Julie Lancelle', 'Julie', 'Lancelle', 'Associate', NULL, 'True', '2023-10-20 04:45:27', '2023', '2023-01-26 00:00:00'),
(37, 'David L. Lawrence', 'David L.', 'Lawrence', 'Full', 'KF6TWW', 'True', '2023-10-20 04:45:27', '2023', '2023-03-13 00:00:00'),
(68, 'Jacquie Lawrence', 'Jacquie', 'Lawrence', 'Associate', NULL, 'True', '2023-10-20 04:45:27', '2023', '2023-03-13 00:00:00'),
(38, 'William A. Lillie', 'William A.', 'Lillie', 'Inactive', 'N6BCT', 'True', '2023-10-20 04:45:27', '', NULL),
(39, 'Richard T. Lira', 'Richard T.', 'Lira', 'Full', 'KK6PCC', 'False', '2023-10-20 04:45:27', '2023', '2023-02-28 00:00:00'),
(40, 'Walt Long', 'Walt', 'Long', 'Silent Key', 'KG6EDY  SK', 'True', '2023-10-20 04:45:27', '2023', '2022-12-14 00:00:00'),
(41, 'Richard D. Markel', 'Richard D.', 'Markel', 'Full', 'KB6VT', 'False', '2023-10-20 04:45:27', '2023', NULL),
(42, 'Victor M. Munoz', 'Victor M.', 'Munoz', 'Inactive', 'KB6LGZ', 'False', '2023-10-20 04:45:27', '', NULL),
(43, 'Ted Niemira', 'Ted', 'Niemira', 'Full', 'W6SY', 'True', '2023-10-20 04:45:27', '2023:2024:2025', '2023-01-31 00:00:00'),
(44, 'Tom Oliver', 'Tom', 'Oliver', 'Full', 'KJ6OGL', 'True', '2023-10-20 04:45:27', '2023', '2022-12-14 00:00:00'),
(69, 'John R. Owens', 'John R.', 'Owens', 'Full', 'NN6U', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(45, 'Steve Paganelli', 'Steve', 'Paganelli', 'Full', 'K6YUA', 'True', '2023-10-20 04:45:27', '2023:2024', '2023-03-13 00:00:00'),
(46, 'Vernon Patterson', 'Vernon', 'Patterson', 'Full', 'W6VJJ', 'True', '2023-10-20 04:45:27', '2023', '2023-03-13 00:00:00'),
(70, 'Ellen Price', 'Ellen', 'Price', 'Full', 'KN6UNF', 'True', '2023-10-20 04:45:27', '2023', '2022-06-03 00:00:00'),
(47, 'Ron Purser', 'Ron', 'Purser', 'Full', 'WB9EGG', 'True', '2023-10-20 04:45:27', '2023', '2022-12-14 00:00:00'),
(48, 'Michael S. Ransom', 'Michael S.', 'Ransom', 'Inactive', 'KM6HZR', 'False', '2023-10-20 04:45:27', '', NULL),
(49, 'Dan Reid', 'Dan', 'Reid', 'Full', 'N6DBR', 'True', '2023-10-20 04:45:27', '2023', '2023-03-13 00:00:00'),
(50, 'David M. Rinck', 'David M.', 'Rinck', 'Full', 'K6DMR', 'True', '2023-10-20 04:45:27', '2023', '2023-01-16 00:00:00'),
(51, 'George Salet', 'George', 'Salet', 'Full', 'KJ6TSX', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(52, 'Linda C. Sanders', 'Linda C.', 'Sanders', 'Inactive', 'KB6OIZ', 'False', '2023-10-20 04:45:27', '', NULL),
(53, 'Mary Ellen Scherer', 'Mary Ellen', 'Scherer', 'Inactive', 'AJ6J', 'False', '2023-10-20 04:45:27', '', NULL),
(54, 'R. Scott Sutor', 'R. Scott', 'Sutor', 'Inactive', 'KM6SCD', 'False', '2023-10-20 04:45:27', '', NULL),
(55, 'Charles Tillman', 'Charles', 'Tillman', 'Inactive', 'KC6CTT', 'False', '2023-10-20 04:45:27', '', NULL),
(57, 'George H. Tucker', 'George H.', 'Tucker', 'Full', 'W6HAF', 'True', '2023-10-20 04:45:27', '2023', '2023-01-31 00:00:00'),
(58, 'Kelly Tuttle', 'Kelly', 'Tuttle', 'Friend of Club', 'WB6AAJ', 'False', '2023-10-20 04:45:27', '', NULL),
(60, 'Audrey J. Villyard', 'Audrey J.', 'Villyard', 'Full', 'WA2KPS', 'True', '2023-10-20 04:45:27', '2023', '2022-09-14 00:00:00'),
(59, 'Casey Villyard', 'Casey', 'Villyard', 'Full', 'N6TZE', 'True', '2023-10-20 04:45:27', '2023', '2022-09-14 00:00:00'),
(62, 'Joshua Villyard', 'Joshua', 'Villyard', 'Full', 'N6TZF', 'True', '2023-10-20 04:45:27', '2023', '2022-09-14 00:00:00'),
(61, 'Nikki Villyard', 'Nikki', 'Villyard', 'Full', 'KI6VRA', 'True', '2023-10-20 04:45:27', '2023', '2022-09-14 00:00:00'),
(63, 'Pete Wanger', 'Pete', 'Wanger', 'Inactive', 'WA6ECH', 'False', '2023-10-20 04:45:27', '', NULL),
(64, 'Harry Ysselstein', 'Harry', 'Ysselstein', 'Full', 'N6BHS', 'True', '2023-10-20 04:45:27', '2023', '2023-01-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pay12`
--

CREATE TABLE `pay12` (
  `myindex` int NOT NULL,
  `mydate` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `years` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `callsigns` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `primary` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `family` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `repeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `digipeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `subtotal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `paypalfee` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `clubreceives` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `total` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `pay_paypal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `new` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `transaction_status` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=uca1400_as_ci COMMENT='Record of Payments';

--
-- Dumping data for table `pay12`
--

INSERT INTO `pay12` (`myindex`, `mydate`, `years`, `callsigns`, `primary`, `family`, `repeater`, `digipeater`, `subtotal`, `paypalfee`, `clubreceives`, `total`, `FullName`, `pay_paypal`, `new`, `transaction_status`) VALUES
(66, '2023-11-14 15:19:16', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(67, '2023-11-14 21:18:53', '2024 2025', 'N6FG K6IIP', '$  20.00', '$  3.00', '$  20.00', '$  0.00', '$ 43.00', '$ 2.12', '$  43.00', '$ 102.12', NULL, NULL, NULL, NULL),
(68, '2023-11-14 21:19:01', '2024', 'N6GYR', '$  20.00', '$ 0.00', '$ 5.00', '$  0.00', '$  25.00', '$   1.00', '$  24.00', '$ 100.00', NULL, NULL, NULL, NULL),
(69, '2023-11-14 21:19:07', '2024 2025', 'KN6ORM', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(70, '2023-11-14 21:40:53', '2024 2025 2026 2027', 'KM6UYM AI6BB KE6KRT W1AW WA6TOW', '$  80.00', '$  18.00', '$  40.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(71, '2023-11-14 21:48:21', '2024 2025', 'WA6TOW AI6BB KE6KRT W1AW ', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(72, '2023-11-14 21:48:35', '2024 2025', 'W1AW WA6TOW AI6BB KE6KRT ', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(73, '2023-11-14 21:49:38', '2024 2025', 'KM6HYK KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(74, '2023-11-14 21:49:45', '2024 2025', 'KN6PIV KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(75, '2023-11-14 21:54:53', '2024 2025', 'N6SJF KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(85, '2023-11-22 04:15:07', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(86, '2023-11-24 20:37:56', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(87, '2023-11-26 07:03:35', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(88, '2023-11-27 05:29:44', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(89, '2023-12-01 00:48:54', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(90, '2023-12-02 06:47:17', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(91, '2023-12-02 06:47:30', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(92, '2023-12-02 06:47:31', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(93, '2023-12-02 06:47:33', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(94, '2023-12-02 06:47:48', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
(95, '2023-12-03 03:50:23', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(96, '2023-12-04 18:22:44', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(97, '2023-12-04 18:22:53', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(98, '2023-12-06 04:18:14', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(99, '2023-12-08 15:29:55', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(100, '2023-12-08 20:50:46', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(101, '2023-12-09 02:26:17', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(102, '2023-12-10 14:42:54', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(103, '2023-12-15 17:50:20', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(104, '2023-12-16 04:49:12', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(105, '2023-12-18 04:09:41', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(106, '2023-12-20 04:37:15', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(107, '2023-12-23 05:50:48', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(108, '2023-12-27 07:15:54', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(109, '2023-12-27 14:22:54', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(110, '2024-01-03 02:03:06', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(111, '2024-01-03 05:21:30', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(112, '2024-01-03 07:05:14', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(113, '2024-01-06 05:43:56', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(114, '2024-01-06 11:10:48', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(115, '2024-01-08 23:02:10', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(116, '2024-01-09 17:08:39', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(117, '2024-01-11 05:23:34', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(118, '2024-01-11 20:30:16', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(119, '2024-01-13 05:48:42', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(120, '2024-01-23 07:58:52', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(121, '2024-01-25 06:52:47', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(122, '2024-01-26 17:49:16', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(123, '2024-02-17 05:01:59', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(124, '2024-02-23 14:20:08', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(125, '2024-02-25 17:50:17', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(126, '2024-03-26 14:03:16', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(127, '2024-04-10 22:59:15', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(128, '2024-04-12 01:40:22', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(129, '2024-04-18 04:37:41', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(130, '2024-04-26 04:01:12', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(131, '2024-05-01 08:54:18', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(132, '2024-05-02 20:51:21', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(133, '2024-05-11 02:44:35', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(134, '2024-05-25 05:34:55', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL),
(135, '2024-05-26 21:57:14', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `pp_id` varchar(36) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `seq` int DEFAULT NULL,
  `mydate` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `years` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `callsigns` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `primary` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `family` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `repeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `digipeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `subtotal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `paypalfee` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `clubreceives` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `total` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `pay_paypal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `new` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `transaction_status` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`pp_id`, `seq`, `mydate`, `years`, `callsigns`, `primary`, `family`, `repeater`, `digipeater`, `subtotal`, `paypalfee`, `clubreceives`, `total`, `FullName`, `pay_paypal`, `new`, `transaction_status`) VALUES
('0d0419f4-5a10-4d26-a1df-70b694fa59ab', 3, '2023-11-19 23:57:40', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('0f6cf04e-be8d-4e10-9c04-5c04865a9395', 6, '2023-11-20 00:00:42', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('17633ef2-0ff0-48af-ada7-7e16067f8f34', 10, '2023-11-20 11:45:44', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('1c79e388-c382-4d25-be80-dee4e933c075', 5, '2023-11-19 23:59:10', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('242853ab-f484-49dd-b9c4-635d75539a35', 8, '2023-11-20 11:45:06', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('40a72eb9-4f17-4046-9fea-184f68808c56', 11, '2023-11-20 11:46:20', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('594ab57d-22a4-4afd-8cdf-9c7df05bea68', 7, '2023-11-20 11:43:14', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('82224dcd-e09b-44fc-850c-43e5207b58f0', 4, '2023-11-19 23:58:52', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('95edd74a-d18e-4d66-a7e8-8b5bed3192f8', 2, '2023-11-19 23:57:37', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('9d743f04-4830-4e31-98e6-3a46768cfc98', 1, '2023-11-19 23:57:30', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('b521eb00-0d69-4a83-ac30-f3f8970e9073', 12, '2023-11-20 11:53:40', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL),
('ebc63e0e-7099-4aaf-b5f2-36449431c686', 9, '2023-11-20 11:45:26', '2024 2025', 'AI6BB KE6KRT W1AW WA6TOW', '$  40.00', '$  18.00', '$  20.00', '$  18.02', '$  96.02', '$   3.98', '$  96.02', '$ 100.00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments1`
--

CREATE TABLE `payments1` (
  `pp_id` varchar(36) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `seq` int NOT NULL,
  `mydate` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `years` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `callsigns` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `primary` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `family` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `repeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `digipeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `subtotal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `paypalfee` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `clubreceives` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `total` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `pay_paypal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `new` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `transaction_status` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pp_tnx`
--

CREATE TABLE `pp_tnx` (
  `myindex` int NOT NULL,
  `mydate` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `years` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `callsigns` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `primary` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `family` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `repeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `digipeater` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `subtotal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `paypalfee` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `clubreceives` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `total` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `pay_paypal` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `new` varchar(12) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `transaction_status` set('pending','posted','cancelled') CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `pp_id` varchar(36) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci NOT NULL,
  `pp_total` float NOT NULL,
  `pp_orderID` varchar(30) CHARACTER SET utf8mb4 COLLATE uca1400_as_ci DEFAULT NULL,
  `pp_response` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=uca1400_as_ci COMMENT='Record of Payments - SJF version';

--
-- Dumping data for table `pp_tnx`
--

INSERT INTO `pp_tnx` (`myindex`, `mydate`, `years`, `callsigns`, `primary`, `family`, `repeater`, `digipeater`, `subtotal`, `paypalfee`, `clubreceives`, `total`, `FullName`, `pay_paypal`, `new`, `transaction_status`, `pp_id`, `pp_total`, `pp_orderID`, `pp_response`) VALUES
(385, '2024-01-10 22:47:01', '2024', 'N6SJF J_LANCELLE', '$  20.00', '$   3.00', '$  50.00', '$   0.00', '$  73.00', '$   3.04', '$  69.96', '$  73.00', 'Jonathan Lancelle', 'no', 'no', 'posted', 'cda177b9-1a74-43d0-bfb5-203cfc12daee', 73, '9T751080JJ0268410', '{\"orderID\": \"9T751080JJ0268410\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"38N763463W476053Y\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/38N763463W476053Y\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/38N763463W476053Y/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/9T751080JJ0268410\", \"method\": \"GET\"}], \"amount\": {\"value\": \"73.00\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"cda177b9-1a74-43d0-bfb5-203cfc12daee\", \"create_time\": \"2024-01-11T06:48:42Z\", \"update_time\": \"2024-01-11T06:48:42Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"69.96\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"3.04\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"73.00\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Jon Lancelle\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"224 Modoc Place\"}}, \"reference_id\": \"default\"}]}'),
(386, '2024-01-10 23:54:39', '2024', 'AI6BB KE6KRT', '$  20.00', '$   3.00', '$  50.00', '$   0.00', '$  73.00', '$   3.15', '$  73.00', '$  76.15', 'Paul Atkins', 'yes', 'no', 'posted', 'b0ca9738-974d-4398-807b-9802c19ecb6a', 76.15, '2RP96817NY425671F', '{\"orderID\": \"2RP96817NY425671F\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"8GU65171F1154792Y\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/8GU65171F1154792Y\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/8GU65171F1154792Y/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/2RP96817NY425671F\", \"method\": \"GET\"}], \"amount\": {\"value\": \"76.15\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"b0ca9738-974d-4398-807b-9802c19ecb6a\", \"create_time\": \"2024-01-11T07:56:13Z\", \"update_time\": \"2024-01-11T07:56:13Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"73.38\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"2.77\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"76.15\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Paul Atkins\"}, \"address\": {\"postal_code\": \"94044-2459\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"637 Sharp Park Rd\"}}, \"reference_id\": \"default\"}]}'),
(387, '2024-01-11 10:03:51', '2024  2025', 'KN6ORM KN6PIV', '$  40.00', '$   6.00', '$  20.00', '$   0.00', '$  66.00', '$   2.89', '$  66.00', '$  68.89', 'Steve Austin', 'yes', 'no', 'posted', '819f391a-0c41-4fd1-aa19-3ccb13f7bf8b', 68.89, '4R901496SS529044A', '{\"orderID\": \"4R901496SS529044A\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"1WT50185R7192910V\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/1WT50185R7192910V\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/1WT50185R7192910V/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/4R901496SS529044A\", \"method\": \"GET\"}], \"amount\": {\"value\": \"68.89\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"819f391a-0c41-4fd1-aa19-3ccb13f7bf8b\", \"create_time\": \"2024-01-11T18:04:10Z\", \"update_time\": \"2024-01-11T18:04:10Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"66.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"2.89\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"68.89\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Steve Austin\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"140 San Jose Avenue\"}}, \"reference_id\": \"default\"}]}'),
(388, '2024-01-12 16:44:46', '2024', 'KJ6TSX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'George Salet', 'yes', 'no', 'posted', 'df026a29-dff2-46b5-91bf-b465a3e6883a', 21.23, '4M588538N0412770E', '{\"orderID\": \"4M588538N0412770E\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"5DM72447AE353451Y\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/5DM72447AE353451Y\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/5DM72447AE353451Y/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/4M588538N0412770E\", \"method\": \"GET\"}], \"amount\": {\"value\": \"21.23\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"df026a29-dff2-46b5-91bf-b465a3e6883a\", \"create_time\": \"2024-01-13T00:45:19Z\", \"update_time\": \"2024-01-13T00:45:19Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"20.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"1.23\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"21.23\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"George v Salet\"}, \"address\": {\"postal_code\": \"94005-1273\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"BRISBANE\", \"country_code\": \"US\", \"address_line_1\": \"200 VALLEY DR STE 51\"}}, \"reference_id\": \"default\"}]}'),
(389, '2024-01-12 17:14:13', '2024', 'NN6U', '$  20.00', '$   0.00', '$  20.00', '$   0.00', '$  40.00', '$   1.95', '$  40.00', '$  41.95', 'John R. Owens', 'yes', 'no', 'posted', '3980c455-8091-4434-a9e9-b3720d1910b9', 41.95, '48127354390301835', '{\"orderID\": \"48127354390301835\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"7F886961PD949812Y\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/7F886961PD949812Y\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/7F886961PD949812Y/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/48127354390301835\", \"method\": \"GET\"}], \"amount\": {\"value\": \"41.95\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"3980c455-8091-4434-a9e9-b3720d1910b9\", \"create_time\": \"2024-01-13T01:14:28Z\", \"update_time\": \"2024-01-13T01:14:28Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"40.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"1.95\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"41.95\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"John Owens\"}, \"address\": {\"postal_code\": \"94037\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Montara\", \"country_code\": \"US\", \"address_line_1\": \"PO Box 370639\"}}, \"reference_id\": \"default\"}]}'),
(390, '2024-01-12 17:20:04', '2024', 'WB9EGG', '$  20.00', '$   0.00', '$  10.00', '$   0.00', '$  30.00', '$   1.54', '$  28.46', '$  30.00', 'Ron Purser', 'no', 'no', 'pending', '2239e6cc-2b1a-4dbe-9d3a-e244ec818b39', 30, NULL, NULL),
(391, '2024-01-12 17:20:37', '2024', 'WB9EGG', '$  20.00', '$   0.00', '$  10.00', '$   0.00', '$  30.00', '$   1.59', '$  30.00', '$  31.59', 'Ron Purser', 'yes', 'no', 'posted', '1b52f2bc-4dda-43e7-8c69-062fb48cdeff', 31.59, '61157492XP2061405', '{\"orderID\": \"61157492XP2061405\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"2U2119506A214694W\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/2U2119506A214694W\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/2U2119506A214694W/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/61157492XP2061405\", \"method\": \"GET\"}], \"amount\": {\"value\": \"31.59\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"1b52f2bc-4dda-43e7-8c69-062fb48cdeff\", \"create_time\": \"2024-01-13T01:20:48Z\", \"update_time\": \"2024-01-13T01:20:48Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"30.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"1.59\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"31.59\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Ronald Purser\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"311 Loma Vista Terrace\"}}, \"reference_id\": \"default\"}]}'),
(392, '2024-01-12 17:22:14', '2024   2025   2026', 'KJ6ERS', '$  60.00', '$   0.00', '$   0.00', '$   0.00', '$  60.00', '$   2.68', '$  60.00', '$  62.68', 'Carmel Gallagher', 'yes', 'no', 'posted', 'eccd6fdc-9466-4f50-b9e0-0b4b4cd51b2e', 62.68, '8B122399LY3536029', '{\"orderID\": \"8B122399LY3536029\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"4UN38169BA603974E\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/4UN38169BA603974E\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/4UN38169BA603974E/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/8B122399LY3536029\", \"method\": \"GET\"}], \"amount\": {\"value\": \"62.68\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"eccd6fdc-9466-4f50-b9e0-0b4b4cd51b2e\", \"create_time\": \"2024-01-13T01:24:22Z\", \"update_time\": \"2024-01-13T01:24:22Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"60.32\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"2.36\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"62.68\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Carmel Gallagher\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"728 Moana Way,\"}}, \"reference_id\": \"default\"}]}'),
(393, '2024-01-12 18:39:02', '2024', 'AJ6J', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Mary Ellen Scherer', 'yes', 'no', 'posted', '8f1b12b5-9229-4502-9e8b-9d63dbe35a65', 21.23, '39F04511944729830', '{\"orderID\": \"39F04511944729830\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"0VN10181W70120541\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/0VN10181W70120541\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/0VN10181W70120541/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/39F04511944729830\", \"method\": \"GET\"}], \"amount\": {\"value\": \"21.23\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"8f1b12b5-9229-4502-9e8b-9d63dbe35a65\", \"create_time\": \"2024-01-13T02:39:44Z\", \"update_time\": \"2024-01-13T02:39:44Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"20.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"1.23\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"21.23\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Mary Ellen Scherer\"}, \"address\": {\"postal_code\": \"94014\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Daly City\", \"country_code\": \"US\", \"address_line_1\": \"1105 Brittany Lane\"}}, \"reference_id\": \"default\"}]}'),
(394, '2024-01-12 20:22:38', '2024  2025  2026  2027', 'W6AWD', '$  80.00', '$   0.00', '$   0.00', '$   0.00', '$  80.00', '$   3.40', '$  80.00', '$  83.40', 'Alan W. Dye', 'yes', 'no', 'posted', '3ed1be6c-303f-47ea-985a-e910a738b669', 83.4, '33G1929775667940L', '{\"orderID\": \"33G1929775667940L\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"64292579HJ5248546\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/64292579HJ5248546\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/64292579HJ5248546/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/33G1929775667940L\", \"method\": \"GET\"}], \"amount\": {\"value\": \"83.40\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"3ed1be6c-303f-47ea-985a-e910a738b669\", \"create_time\": \"2024-01-13T04:23:54Z\", \"update_time\": \"2024-01-13T04:23:54Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"80.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"3.40\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"83.40\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Alan Dye\"}, \"address\": {\"postal_code\": \"94132\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"San Francisco\", \"country_code\": \"US\", \"address_line_1\": \"183 Bright Street\"}}, \"reference_id\": \"default\"}]}'),
(395, '2024-01-13 08:02:15', '2024', 'WB6JKV N6QGZ', '$  20.00', '$   3.00', '$   0.00', '$   0.00', '$  23.00', '$   1.34', '$  23.00', '$  24.34', 'Michael S. Herbert', 'yes', 'no', 'posted', '7b1337eb-2709-467d-81de-fbe93e8cf7d8', 24.34, '3CX46652EW445640M', '{\"orderID\": \"3CX46652EW445640M\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"77E55920D4026443B\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/77E55920D4026443B\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/77E55920D4026443B/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/3CX46652EW445640M\", \"method\": \"GET\"}], \"amount\": {\"value\": \"24.34\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"7b1337eb-2709-467d-81de-fbe93e8cf7d8\", \"create_time\": \"2024-01-13T16:02:30Z\", \"update_time\": \"2024-01-13T16:02:30Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"23.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"1.34\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"24.34\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Kris Herbert\"}, \"address\": {\"postal_code\": \"94044-3604\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"1368 Crespi Dr\"}}, \"reference_id\": \"default\"}]}'),
(396, '2024-01-15 13:30:28', '', '', '$   0.00', '$   0.00', '$  50.00', '$   0.00', '$  50.00', '$   2.24', '$  47.76', '$  50.00', 'U N D E F I N E D', 'no', 'no', 'cancelled', '1bc18590-308f-4eec-9a3c-3007d2fabc3f', 50, NULL, NULL),
(397, '2024-01-22 12:36:48', '', 'T_EST', '$   0.00', '$   0.00', '$  50.00', '$   0.00', '$  50.00', '$   2.24', '$  47.76', '$  50.00', 'U N D E F I N E D', 'no', 'no', 'cancelled', '571fe6b0-131f-43f9-b8ba-a30cf8908cbb', 50, NULL, NULL),
(398, '2024-02-06 22:57:58', '2024', 'N6SJF', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'Jonathan Lancelle', 'no', 'no', 'cancelled', 'e21f7644-7586-4391-a27c-16d430f3e533', 20, NULL, NULL),
(399, '2024-02-10 21:19:07', '2024', 'TEST', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'U N D E F I N E D', 'no', 'no', 'pending', 'a8579933-c570-4874-baf0-b9cdd15741a8', 20, NULL, NULL),
(400, '2024-02-10 21:19:09', '2024', 'TEST', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'U N D E F I N E D', 'no', 'no', 'pending', '52cebc57-a753-4350-8b5e-361d3d3a14c8', 20, NULL, NULL),
(401, '2024-02-10 21:19:35', '2024', 'TEST', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'U N D E F I N E D', 'no', 'no', 'pending', '4b5ebd6b-a178-455b-87c6-eea425643861', 20, NULL, NULL),
(402, '2024-02-10 21:19:37', '2024', 'TEST', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'U N D E F I N E D', 'no', 'no', 'pending', 'c6b79047-8d8c-49dd-9452-2b10b1299036', 20, NULL, NULL),
(403, '2024-02-11 00:01:11', '2024', 'TEST', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'U N D E F I N E D', 'no', 'no', 'cancelled', 'dba04aef-2cb0-48a5-adff-7603c6616aa0', 20, NULL, NULL),
(404, '2024-02-13 11:57:09', '2024', 'N6BCT', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'William A. Lillie', 'no', 'no', 'pending', 'bc27b812-c0f8-4a4c-91f0-1d8c751e668e', 20, NULL, NULL),
(405, '2024-02-25 15:53:23', '', 'AI6BB', '$   0.00', '$   0.00', '$   0.00', '$   1.00', '$   1.00', '$   0.52', '$   0.48', '$   1.00', 'Paul Atkins', 'no', 'no', 'posted', 'd297ca29-cde3-493f-bb4a-804f84b41dff', 1, '3BC32826M4835473Y', '{\"orderID\": \"3BC32826M4835473Y\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"2L79224816315344T\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/2L79224816315344T\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/2L79224816315344T/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/3BC32826M4835473Y\", \"method\": \"GET\"}], \"amount\": {\"value\": \"1.00\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"d297ca29-cde3-493f-bb4a-804f84b41dff\", \"create_time\": \"2024-02-25T23:54:55Z\", \"update_time\": \"2024-02-25T23:54:55Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"0.48\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"0.52\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"1.00\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Paul Atkins\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"637 Sharp Park Rd\"}}, \"reference_id\": \"default\"}]}'),
(406, '2024-03-10 14:26:21', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'Miles E. Bond', 'no', 'no', 'pending', 'a4572015-e9eb-4943-a4ef-75e08c297a67', 20, NULL, NULL),
(407, '2024-03-10 14:26:29', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'Miles E. Bond', 'no', 'no', 'pending', 'cbc50cc8-ae89-40c7-bfbe-3b445b576b1f', 20, NULL, NULL),
(408, '2024-03-10 14:27:52', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'Miles E. Bond', 'no', 'no', 'pending', 'c43a84e4-9986-4299-ba3d-1d532001acf8', 20, NULL, NULL),
(409, '2024-03-10 14:27:52', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'Miles E. Bond', 'no', 'no', 'pending', 'b00fa1df-cc7e-4e8f-a041-c157147ada88', 20, NULL, NULL),
(410, '2024-03-10 14:28:10', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '079959ea-416c-4bf9-bb0a-bbe67a76aa56', 21.23, NULL, NULL),
(411, '2024-03-10 14:30:10', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '0ab7178f-98f7-4e41-a766-4481e8b4ba9a', 21.23, NULL, NULL),
(412, '2024-03-10 14:30:11', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'f892ee5b-a060-4a4f-b074-78f578b3c44f', 21.23, NULL, NULL),
(413, '2024-03-10 14:30:17', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '9fc4e3be-542e-425d-b674-175a521cc1bf', 21.23, NULL, NULL),
(414, '2024-03-10 14:30:18', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '39e1a01d-b896-4d52-bc3b-3ac5222bd636', 21.23, NULL, NULL),
(415, '2024-03-10 14:30:18', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'df8c5a3a-8ed8-4428-9a9d-cd9768b0256e', 21.23, NULL, NULL),
(416, '2024-03-10 14:30:25', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'bb6f0e0e-74c7-41d1-8e5f-0cfdde7a25c6', 21.23, NULL, NULL),
(417, '2024-03-10 14:30:26', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'e0e7469a-4468-4501-945f-2226cfe93971', 21.23, NULL, NULL),
(418, '2024-03-10 14:30:28', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '3ceca650-bc06-425c-825b-24bbba794ac5', 21.23, NULL, NULL),
(419, '2024-03-10 14:30:29', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'e3d18902-1f0c-4327-85c7-eff0257de3d4', 21.23, NULL, NULL),
(420, '2024-03-10 14:30:31', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'b465949c-f236-4636-a9cd-fc4412b97ba4', 21.23, NULL, NULL),
(421, '2024-03-10 14:30:32', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '4bdd9e73-73e2-4a1d-913f-2c8ccb514009', 21.23, NULL, NULL),
(422, '2024-03-10 14:30:32', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '5e8aee66-b4cb-4bb8-86ae-34a6a53aed29', 21.23, NULL, NULL),
(423, '2024-03-10 14:30:33', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'c87f7294-80f0-475a-9e30-2bc9bf6ef3ba', 21.23, NULL, NULL),
(424, '2024-03-10 14:30:34', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '1e702d9d-7f75-4187-85cf-779e479ccc5c', 21.23, NULL, NULL),
(425, '2024-03-10 14:30:34', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'c68245e9-3a21-484f-9481-545c01e51225', 21.23, NULL, NULL),
(426, '2024-03-10 14:30:34', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'e9b73208-7a60-4206-a0f3-620adc254c2a', 21.23, NULL, NULL),
(427, '2024-03-10 14:30:35', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'ba070fc1-6946-45a1-99a2-9545b1add72f', 21.23, NULL, NULL),
(428, '2024-03-10 14:31:13', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '9722e33a-728d-471e-908c-8f5c47d224a4', 21.23, NULL, NULL),
(429, '2024-03-10 14:31:14', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'b1d1f77a-e835-4ec4-a58f-494826bd9cbe', 21.23, NULL, NULL),
(430, '2024-03-10 14:31:14', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', '03435d44-1297-489f-bbb7-5ee667dbfda8', 21.23, NULL, NULL),
(431, '2024-03-10 14:31:15', '2024', 'AB7ZX', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.23', '$  20.00', '$  21.23', 'Miles E. Bond', 'yes', 'no', 'pending', 'f684d519-e185-4143-ba05-4f5ed431e67a', 21.23, NULL, NULL),
(432, '2024-03-13 12:05:32', '2024  2025', 'K6YUA', '$  40.00', '$   0.00', '$   0.00', '$   0.00', '$  40.00', '$   1.89', '$  38.11', '$  40.00', 'Steve Paganelli', 'no', 'no', 'pending', 'fa8294de-9c04-4511-bff3-8b903c5629b0', 40, NULL, NULL),
(433, '2024-03-13 12:06:48', '2024  2025', 'K6YUA', '$  40.00', '$   0.00', '$   0.00', '$   0.00', '$  40.00', '$   1.89', '$  38.11', '$  40.00', 'Steve Paganelli', 'no', 'no', 'pending', '98e81519-3834-4559-82b5-d48fe017dae6', 40, NULL, NULL),
(434, '2024-04-15 20:14:53', '2024  2025  2026  2027', 'K6XXX', '$  75.00', '$   0.00', '$   0.00', '$   0.00', '$  75.00', '$   3.22', '$  75.00', '$  78.22', 'U N D E F I N E D', 'yes', 'yes', 'pending', '0bdc053d-a20f-401f-bad9-ef52e15856a5', 78.22, NULL, NULL),
(435, '2024-04-29 10:33:53', '', 'AI6BB', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Paul Atkins', 'yes', 'no', 'pending', '5b92aa21-1c15-441c-8d8c-ab84c1997975', 5.69, NULL, NULL),
(436, '2024-04-29 10:37:17', '', '', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'U N D E F I N E D', 'yes', 'no', 'pending', '816a90c2-e91a-4bdb-b85b-d827bcf708d2', 5.69, NULL, NULL),
(437, '2024-04-29 10:39:17', '', '', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'U N D E F I N E D', 'yes', 'no', 'pending', 'ccfe18ef-f9ed-4353-ba99-cf39fa2d2078', 5.69, NULL, NULL),
(438, '2024-04-29 10:41:39', '', '', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'U N D E F I N E D', 'yes', 'no', 'pending', 'c41282f2-d73b-438f-b676-84e4ccbfa32f', 5.69, NULL, NULL),
(439, '2024-04-29 10:49:13', '', 'AI6BB', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Paul Atkins', 'yes', 'no', 'cancelled', '17612a61-1c99-4c5f-a10f-d663a2eae00d', 5.69, NULL, NULL),
(440, '2024-04-29 20:59:02', '', 'N6SJF', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Jonathan Lancelle', 'yes', 'no', 'posted', '50880950-0fee-46f6-a1d0-cdaac1dba412', 5.69, '69P10980F1374232C', '{\"orderID\": \"69P10980F1374232C\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"39B995714V559230B\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/39B995714V559230B\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/39B995714V559230B/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/69P10980F1374232C\", \"method\": \"GET\"}], \"amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"50880950-0fee-46f6-a1d0-cdaac1dba412\", \"create_time\": \"2024-04-30T03:59:21Z\", \"update_time\": \"2024-04-30T03:59:21Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"5.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"0.69\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Jon Lancelle\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"224 Modoc Place\"}}, \"reference_id\": \"default\"}]}'),
(441, '2024-04-29 23:01:08', '', 'AI6BB', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Paul Atkins', 'yes', 'no', 'cancelled', 'fe326872-eb39-4241-bde8-abcd33696db6', 5.69, NULL, NULL),
(442, '2024-04-29 23:06:53', '', 'AI6BB', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Paul Atkins', 'yes', 'no', 'posted', 'a01f7824-2918-40ce-9ba5-370a75e09fb5', 5.69, '7DJ45617AE3480233', '{\"orderID\": \"7DJ45617AE3480233\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"3VT74402C9461130T\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/3VT74402C9461130T\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/3VT74402C9461130T/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/7DJ45617AE3480233\", \"method\": \"GET\"}], \"amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"a01f7824-2918-40ce-9ba5-370a75e09fb5\", \"create_time\": \"2024-04-30T06:08:14Z\", \"update_time\": \"2024-04-30T06:08:14Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"5.03\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"0.66\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"PAUL Atkins\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"637 Sharp Park Road\"}}, \"reference_id\": \"default\"}]}'),
(443, '2024-05-04 11:26:43', '', 'AI6BB', '$   0.00', '$   0.00', '$   4.00', '$   0.00', '$   4.00', '$   0.65', '$   4.00', '$   4.65', 'Paul Atkins', 'yes', 'no', 'pending', 'fd45efe9-cfa4-4c74-bfeb-dd474cff300c', 4.65, NULL, NULL),
(444, '2024-05-04 11:49:32', '', 'AI6BB', '$   0.00', '$   0.00', '$   3.45', '$   0.00', '$   3.45', '$   0.63', '$   3.45', '$   4.08', 'Paul Atkins', 'yes', 'no', 'pending', 'bd2fab4e-a0de-4876-aa0f-19a6e3e0d0f0', 4.08, NULL, NULL),
(445, '2024-05-04 23:41:38', '2025', '', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'U N D E F I N E D', 'no', 'no', 'pending', '40ba3071-c53d-452e-a874-614d8d98aed8', 20, NULL, NULL),
(446, '2024-05-05 00:05:12', '2025', '', '$  20.00', '$   0.00', '$   0.00', '$   0.00', '$  20.00', '$   1.19', '$  18.81', '$  20.00', 'U N D E F I N E D', 'no', 'no', 'pending', 'fde1bfcf-966b-41bd-9805-84deb735b63c', 20, NULL, NULL),
(447, '2024-05-11 22:11:55', '', 'N6SJF', '$   0.00', '$   0.00', '$   0.00', '$   5.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Jonathan Lancelle', 'yes', 'no', 'cancelled', 'fadb3e99-7a89-4d3e-94c2-512827d85d27', 5.69, '59J186331S726853N', '{\"orderID\": \"59J186331S726853N\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"86C44822FP023770E\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/86C44822FP023770E\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/86C44822FP023770E/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/59J186331S726853N\", \"method\": \"GET\"}], \"amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"fadb3e99-7a89-4d3e-94c2-512827d85d27\", \"create_time\": \"2024-05-12T05:12:22Z\", \"update_time\": \"2024-05-12T05:12:22Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"5.00\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"0.69\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"Jon Lancelle\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"224 Modoc Place\"}}, \"reference_id\": \"default\"}]}'),
(448, '2024-05-11 22:35:11', '2024', '', '$  20.00', '$   0.00', '$   5.00', '$   0.00', '$  25.00', '$   1.36', '$  23.64', '$  25.00', 'U N D E F I N E D', 'no', 'no', 'cancelled', '5331da46-71e2-4c69-9414-0662e0939b93', 25, NULL, NULL),
(449, '2024-05-11 22:37:29', '', '', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.66', '$   4.34', '$   5.00', 'U N D E F I N E D', 'no', 'no', 'cancelled', 'cec48333-b007-400d-9486-f76ac16172f8', 5, NULL, NULL),
(450, '2024-05-11 22:39:24', '', 'N6SJF-TEST', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.66', '$   4.34', '$   5.00', 'U N D E F I N E D', 'no', 'no', 'cancelled', '933dca12-fe87-448d-b102-39b5e23bb2f0', 5, NULL, NULL),
(451, '2024-05-13 11:17:54', '', 'AI6BB', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Paul Atkins', 'yes', 'no', 'posted', '49422ca7-feca-4a65-afbc-ae663f4690c1', 5.69, '7B298955VA921601U', '{\"orderID\": \"7B298955VA921601U\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"8X264606C3007162M\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/8X264606C3007162M\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/8X264606C3007162M/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/7B298955VA921601U\", \"method\": \"GET\"}], \"amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"49422ca7-feca-4a65-afbc-ae663f4690c1\", \"create_time\": \"2024-05-13T18:23:45Z\", \"update_time\": \"2024-05-13T18:23:45Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"5.03\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"0.66\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"PAUL Atkins\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"637 Sharp Park Road\"}}, \"reference_id\": \"default\"}]}'),
(452, '2024-05-21 12:18:50', '', 'N6SJF_TEST', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.66', '$   4.34', '$   5.00', 'U N D E F I N E D', 'no', 'no', 'cancelled', '548884ac-12dc-43e0-b2be-61733842a32c', 5, NULL, NULL),
(453, '2024-05-27 08:52:15', '', 'AI6BB', '$   0.00', '$   0.00', '$   5.00', '$   0.00', '$   5.00', '$   0.69', '$   5.00', '$   5.69', 'Paul Atkins', 'yes', 'no', 'posted', 'e70c1ebd-f4c1-4bd2-bc37-a3bd3130e5ee', 5.69, '23N531724Y9316715', '{\"orderID\": \"23N531724Y9316715\", \"purchase_units\": [{\"payments\": {\"captures\": [{\"id\": \"1BM023123U661572J\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.paypal.com/v2/payments/captures/1BM023123U661572J\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.paypal.com/v2/payments/captures/1BM023123U661572J/refund\", \"method\": \"POST\"}, {\"rel\": \"up\", \"href\": \"https://api.paypal.com/v2/checkout/orders/23N531724Y9316715\", \"method\": \"GET\"}], \"amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}, \"status\": \"COMPLETED\", \"custom_id\": \"e70c1ebd-f4c1-4bd2-bc37-a3bd3130e5ee\", \"create_time\": \"2024-05-27T15:53:59Z\", \"update_time\": \"2024-05-27T15:53:59Z\", \"final_capture\": true, \"seller_protection\": {\"status\": \"ELIGIBLE\", \"dispute_categories\": [\"ITEM_NOT_RECEIVED\", \"UNAUTHORIZED_TRANSACTION\"]}, \"seller_receivable_breakdown\": {\"net_amount\": {\"value\": \"5.03\", \"currency_code\": \"USD\"}, \"paypal_fee\": {\"value\": \"0.66\", \"currency_code\": \"USD\"}, \"gross_amount\": {\"value\": \"5.69\", \"currency_code\": \"USD\"}}}]}, \"shipping\": {\"name\": {\"full_name\": \"PAUL Atkins\"}, \"address\": {\"postal_code\": \"94044\", \"admin_area_1\": \"CA\", \"admin_area_2\": \"Pacifica\", \"country_code\": \"US\", \"address_line_1\": \"637 Sharp Park Road\"}}, \"reference_id\": \"default\"}]}'),
(454, '2024-05-29 12:13:08', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, '3f3fd11e-e6ec-4dc1-b5d3-cc4d961175b4', 0, NULL, NULL),
(455, '2024-05-30 12:07:51', '', 'AI6BB', '$   0.00', '$   0.00', '$   0.00', '$   0.00', '$   0.00', '$   0.49', '$  -0.49', '$   0.00', 'Paul Atkins', 'no', 'no', 'cancelled', '31ee1949-35c4-4aab-97e1-8345cc10aa68', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

CREATE TABLE `testing` (
  `ID` int DEFAULT NULL,
  `MyStatus` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `anInt` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `testing`
--

INSERT INTO `testing` (`ID`, `MyStatus`, `anInt`) VALUES
(1, 'Full', 1),
(2, 'Wonderful', 2),
(3, 'Half', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vuppl`
--

CREATE TABLE `vuppl` (
  `as_of_date` varchar(50) DEFAULT NULL,
  `dues_cy` varchar(50) DEFAULT NULL,
  `member_fullName` varchar(50) DEFAULT NULL,
  `member_firstName` varchar(50) DEFAULT NULL,
  `member_lastName` varchar(50) DEFAULT NULL,
  `member_nickname` varchar(50) DEFAULT NULL,
  `member_primary_email` varchar(50) DEFAULT NULL,
  `member_cell_telephone` varchar(50) DEFAULT NULL,
  `member_detail_officer` varchar(50) DEFAULT NULL,
  `member_detail_chairs` varchar(50) DEFAULT NULL,
  `member_detail_prefix` varchar(50) DEFAULT NULL,
  `member_detail_suffix` varchar(50) DEFAULT NULL,
  `member_detail_newsletter` varchar(50) DEFAULT NULL,
  `member_detail_arrl` varchar(50) DEFAULT NULL,
  `member_detail_license` varchar(50) DEFAULT NULL,
  `member_detail_yrs_lic` int DEFAULT NULL,
  `member_detail_cert` varchar(50) DEFAULT NULL,
  `id_uu` varchar(50) DEFAULT NULL,
  `address_id_uu` varchar(50) DEFAULT NULL,
  `address_street_1` varchar(50) DEFAULT NULL,
  `address_street_2` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_state` varchar(50) DEFAULT NULL,
  `address_zip` varchar(50) DEFAULT NULL,
  `address_home_telephone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=uca1400_as_ci;

--
-- Dumping data for table `vuppl`
--

INSERT INTO `vuppl` (`as_of_date`, `dues_cy`, `member_fullName`, `member_firstName`, `member_lastName`, `member_nickname`, `member_primary_email`, `member_cell_telephone`, `member_detail_officer`, `member_detail_chairs`, `member_detail_prefix`, `member_detail_suffix`, `member_detail_newsletter`, `member_detail_arrl`, `member_detail_license`, `member_detail_yrs_lic`, `member_detail_cert`, `id_uu`, `address_id_uu`, `address_street_1`, `address_street_2`, `address_city`, `address_state`, `address_zip`, `address_home_telephone`) VALUES
('2023-10-20 04:45:27', '2023', 'Ellen Price', 'Ellen', 'Price', 'Ellen', 'EllenPriceCPA@gmail.com', '', '', '', 'KN6', 'UNF', 'None', 'N', 'None', 0, 'N', 'c72df92a-8f1f-11ed-b98d-a8a159046a1f', 'c5bac709-9b96-11ed-bea2-a8a159046a1f', '80 Eureka Sq, Suite 136', '', 'Pacifica', 'CA', '94044', ''),
('2023-10-20 04:45:27', '', 'Henry Lancelle', 'Henry', 'Lancelle', '', '', '', '', '', 'ZZ1', '', 'Email', '', '', NULL, '', '1e37e8e3-a281-11ed-8c60-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Victor Zarich', 'Victor', 'Zarich', 'Victor', 'vzarich@me.com', '', '', '', 'K6', 'VIZ', 'Email', 'N', 'None', 0, 'N', 'c7267636-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Dishaan Ahuja', 'Dishaan', 'Ahuja', 'Dishaan', 'ahujadishaan@gmail.com', '', '', '', 'KN6', 'MKA', 'Email', 'N', 'None', 0, 'N', 'c72850d2-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Chris Bell', 'Chris', 'Bell', 'Chris', 'chrisbell1222@me.com', '', '', '', '', '', 'Email', 'N', 'None', 0, 'N', 'c7294576-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Stephen Martin', 'Stephen', 'Martin', 'Stephen', 'missionpurisima@gmail.com', '', '', '', 'AG6', 'NY', 'Email', 'N', 'Extra', 0, 'N', 'c72a4171-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Anthony Dowler', 'Anthony', 'Dowler', 'Anthony', 'dxer@k6bv.net', '', '', '', 'K6', 'BV', 'Email', 'N', 'None', 0, 'N', 'c72b0eff-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'James Sanders', 'James', 'Sanders', 'James', '', '', '', '', 'KW6', 'L', 'Email', 'N', 'None', 0, 'N', 'c72bc695-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Jenni Williams', 'Jenni', 'Williams', 'Jen', 'jenni@jwlms.com', '', '', '', 'WS6', 'JEN', 'Email', 'N', 'None', 0, 'N', 'c72d415f-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Mary Ellen Scherer', 'Mary Ellen', 'Scherer', 'Mary Ellen', 'mescherer@comcast.net', '415-377-6584', '', '', 'AJ6', 'J', 'Email', 'Y', 'Extra', 10, 'Y', 'c72f1a71-8f1f-11ed-b98d-a8a159046a1f', 'c72eb0b6-8f1f-11ed-b98d-a8a159046a1f', '1105 Brittany Lane', '', 'Daly City', 'CA', '94014', '415-239-4513'),
('2023-10-20 04:45:27', '2023', 'Breck Hitz', 'Breck', 'Hitz', 'Breck', 'breck@leoma.com', '650-208-2668', '', '', 'W6', 'CBH', 'Email', 'N', 'Tech', 8, 'Y', 'c7302fd4-8f1f-11ed-b98d-a8a159046a1f', 'c72fd086-8f1f-11ed-b98d-a8a159046a1f', '123 Kent Rd', '', 'Pacifica', 'CA', '94044', '650-359-3905'),
('2023-10-20 04:45:27', '2023', 'Frank C. Erbacher', 'Frank C.', 'Erbacher', 'Frank', 'n6fg@arrl.net', '650-464-3870', '', '', 'N6', 'FG', 'Email', 'Y', 'Extra', 51, 'Y', 'c731449c-8f1f-11ed-b98d-a8a159046a1f', 'c730e4ff-8f1f-11ed-b98d-a8a159046a1f', '1322 Lerida Way', '', 'Pacifica', 'CA', '94044', '650 355-4355'),
('2023-10-20 04:45:27', '2023', 'Barbara Erbacher', 'Barbara', 'Erbacher', 'Barbara', 'berbach@comcast.net', '650-464-3871', '', '', 'K6', 'IIP', 'Email', 'N', 'General', 34, 'N', 'c731f919-8f1f-11ed-b98d-a8a159046a1f', 'c730e4ff-8f1f-11ed-b98d-a8a159046a1f', '1322 Lerida Way', '', 'Pacifica', 'CA', '94044', '650 355-4355'),
('2023-10-20 04:45:27', '2023', 'Casey Villyard', 'Casey', 'Villyard', 'Casey', 'n6tze@arrl.net', '650-438-2826', '', '', 'N6', 'TZE', 'Email', 'Y', 'Extra', 35, 'Y', 'c7330e5b-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Audrey J. Villyard', 'Audrey J.', 'Villyard', 'Audrey', 'audreyv1@stickerburr.net', '650-766-1193', '', '', 'WA2', 'KPS', 'Email', 'N', 'Tech', 25, 'N', 'c733cb5b-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Nikki Villyard', 'Nikki', 'Villyard', 'Nikki', 'waffle451@gmail.com', '', '', '', 'KI6', 'VRA', 'Email', 'Y', 'General', 10, 'N', 'c7348546-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Joshua Villyard', 'Joshua', 'Villyard', 'Joshua', 'n6tzf@arrl.net', '', '', '', 'N6', 'TZF', 'Email', 'Y', 'Extra', 10, 'Y', 'c73543e9-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Michael S. Herbert', 'Michael S.', 'Herbert', 'Michael', 'wb6jkv@pacbell.net', '650-333-5088', '', '', 'WB6', 'JKV', 'Email', 'N', 'General', 51, 'N', 'c7366c13-8f1f-11ed-b98d-a8a159046a1f', 'c735fb39-8f1f-11ed-b98d-a8a159046a1f', '1368 Crespi Dr.', '', 'Pacifica', 'CA', '94044', '650 355-6541'),
('2023-10-20 04:45:27', '2023', 'Kris Herbert', 'Kris', 'Herbert', 'Kris', 'kmherbert@pacbell.net', '', '', '', 'N6', 'QGZ', 'Email', 'N', 'Tech', 35, 'N', 'c7371e66-8f1f-11ed-b98d-a8a159046a1f', 'c735fb39-8f1f-11ed-b98d-a8a159046a1f', '1368 Crespi Dr.', '', 'Pacifica', 'CA', '94044', '650 355-6541'),
('2023-10-20 04:45:27', '2023', 'Steve Austin', 'Steve', 'Austin', 'Steve', 'kn6orm@gmail.com', '415-420-1199', '', '', 'KN6', 'ORM', 'Email', 'Y', 'None', 0, 'N', 'c73830de-8f1f-11ed-b98d-a8a159046a1f', 'c737cfdb-8f1f-11ed-b98d-a8a159046a1f', '140 San Jose Ave', '', 'Pacifica', 'CA', '94044', '415-420-1199'),
('2023-10-20 04:45:27', '2023', 'Jillian Aldersen', 'Jillian', 'Aldersen', 'Jillian', 'kn6piv@gmail.com', '415-518-9748', '', '', 'KN6', 'PIV', 'Email', 'N', 'None', 0, 'N', 'c738f0e1-8f1f-11ed-b98d-a8a159046a1f', 'c737cfdb-8f1f-11ed-b98d-a8a159046a1f', '140 San Jose Ave', '', 'Pacifica', 'CA', '94044', '415-420-1199'),
('2023-10-20 04:45:27', '', 'R. Scott Sutor', 'R. Scott', 'Sutor', 'Scott', 'rscott@sutor.org', '', '', '', 'KM6', 'SCD', 'Email', 'N', 'General', 4, 'Y', 'c73a096a-8f1f-11ed-b98d-a8a159046a1f', 'c739a6a4-8f1f-11ed-b98d-a8a159046a1f', '1415 Crespi Dr.', '', 'Pacifica', 'CA', '94044', '650-359-8275'),
('2023-10-20 04:45:27', '', 'Pete Wanger', 'Pete', 'Wanger', 'Pete', 'wa6ech@arrl.net', '', '', '', 'WA6', 'ECH', 'Email', 'Y', 'Extra', 60, 'N', 'c73b285a-8f1f-11ed-b98d-a8a159046a1f', 'c73ac6fc-8f1f-11ed-b98d-a8a159046a1f', '1604 Mcdonald Way', '', 'Burlingame', 'CA', '94010', '650-697-7997'),
('2023-10-20 04:45:27', '2023', 'Miles E. Bond', 'Miles E.', 'Bond', 'Miles', 'ab7zx@arrl.net', '', '', '', 'AB7', 'ZX', 'Email', 'Y', 'Extra', 28, 'N', 'c73c5aa0-8f1f-11ed-b98d-a8a159046a1f', 'c73beb08-8f1f-11ed-b98d-a8a159046a1f', '16303 S/E 3rd Street', '', 'Vancouver', 'WA', '98684', '360-254-5381'),
('2023-10-20 04:45:27', '', 'Kelly Tuttle', 'Kelly', 'Tuttle', 'Kelly', 'wb6aaj626@gmail.com', '408-480-7533', '', '', 'WB6', 'AAJ', 'Email', 'N', 'Extra', 50, 'N', 'c73d8332-8f1f-11ed-b98d-a8a159046a1f', 'c73d18bb-8f1f-11ed-b98d-a8a159046a1f', '1825 Walnut Grove Av', '', 'San Jose', 'CA', '95126', '408-480-7533'),
('2023-10-20 04:45:27', '', 'Alan W. Dye', 'Alan W.', 'Dye', 'Alan', 'alandye@gmail.com', '415-308-7128', '', '', 'W6', 'AWD', 'Email', 'Y', 'Extra', 24, 'N', 'c73f1d7a-8f1f-11ed-b98d-a8a159046a1f', 'c73e4435-8f1f-11ed-b98d-a8a159046a1f', '183 Bright Street', '', 'San Francisco', 'CA', '94132', '415-308-7128'),
('2023-10-20 04:45:27', '2023', 'David G. Hurlburt', 'David G.', 'Hurlburt', 'David', 'dghurlb@pacbell.net', '650-892-0351', '', '', 'WB6', 'FEK', 'Email', 'Y', 'Extra', 59, 'N', 'c740b395-8f1f-11ed-b98d-a8a159046a1f', 'c7404b07-8f1f-11ed-b98d-a8a159046a1f', '19 Malavear Ct.', '', 'Pacifica', 'CA', '94044', '650 355-8102'),
('2023-10-20 04:45:27', '2023', 'Jane Hurlburt', 'Jane', 'Hurlburt', 'Jane', '', '', '', '', 'KF6', 'ACH', 'Email', 'Y', 'Tech', 33, 'N', 'c741f782-8f1f-11ed-b98d-a8a159046a1f', 'c7404b07-8f1f-11ed-b98d-a8a159046a1f', '19 Malavear Ct.', '', 'Pacifica', 'CA', '94044', '650 355-8102'),
('2023-10-20 04:45:27', '2023', 'Richard T. Lira', 'Richard T.', 'Lira', 'Richard', 'richlira@myastound.net', '650-520-4838', '', '', 'KK6', 'PCC', 'Email', 'Y', 'Tech', 9, 'N', 'c7456ba4-8f1f-11ed-b98d-a8a159046a1f', 'c744906f-8f1f-11ed-b98d-a8a159046a1f', '196 42nd Ave.', '', 'San Mateo', 'CA', '94403', '650-570-6779'),
('2023-10-20 04:45:27', '', 'Paul Grigorieff', 'Paul', 'Grigorieff', 'Paul', 'n1helradio@gmail.com', '', '', '', 'N1', 'HEL', 'Email', 'N', 'General', 33, 'N', 'c7469f4e-8f1f-11ed-b98d-a8a159046a1f', 'c74631a0-8f1f-11ed-b98d-a8a159046a1f', '2101 Winged Foot Rd.', '', 'Half Moon Bay', 'CA', '94019', '650-727-7759'),
('2023-10-20 04:45:27', '2023', 'George Salet', 'George', 'Salet', 'George', 'gsalet@plumbingpro.com', '415-756-5074', '', '', 'KJ6', 'TSX', 'Email', 'Y', 'General', 11, 'N', 'c747cdd8-8f1f-11ed-b98d-a8a159046a1f', 'c74761cb-8f1f-11ed-b98d-a8a159046a1f', '215 Sunshine Dr.', '', 'Pacifica', 'CA', '94044', '650-355-4006'),
('2023-10-20 04:45:27', '2023', 'David M. Rinck', 'David M.', 'Rinck', 'David', 'k6dmr@pacbell.net', '650-464-1353', '', '', 'K6', 'DMR', 'Email', 'N', 'Extra', 21, 'Y', 'c748e37b-8f1f-11ed-b98d-a8a159046a1f', 'c748874e-8f1f-11ed-b98d-a8a159046a1f', '220 Manor Dr.', '', 'Pacifica', 'CA', '94044', '650 355-1778'),
('2023-10-20 04:45:27', '', 'Michael S. Ransom', 'Michael S.', 'Ransom', 'Michael', 'kayak6@gmail.com', '', '', '', 'KM6', 'HRZ', 'Email', 'N', 'Tech', 3, 'N', 'c749ffda-8f1f-11ed-b98d-a8a159046a1f', 'c7499552-8f1f-11ed-b98d-a8a159046a1f', '223 Clifton Rd.', '', 'Pacifica', 'CA', '94044', '415-342-4736'),
('2023-10-20 04:45:27', '2023', 'Julie Lancelle', 'Julie', 'Lancelle', 'Julie', 'julie.a.lancelle@gmail.com', '650-455-0346', '', '', '', '', 'Email', '', 'None', NULL, '', '3948f2fb-c165-11ed-b3ad-0242ac110002', 'c74ab65f-8f1f-11ed-b98d-a8a159046a1f', '224 Modoc Place', '', 'Pacifica', 'CA', '94044', '650-355-2545'),
('2023-10-20 04:45:27', '2023', 'Jonathan Lancelle', 'Jonathan', 'Lancelle', 'Jonathan', 'n6sjf@knosys.com', '650-270-5823', '', '', 'N6', 'SJF', 'Email', 'Y', 'Extra', 31, 'N', 'c74b21e0-8f1f-11ed-b98d-a8a159046a1f', 'c74ab65f-8f1f-11ed-b98d-a8a159046a1f', '224 Modoc Place', '', 'Pacifica', 'CA', '94044', '650-355-2545'),
('2023-10-20 04:45:27', '', 'David Chamberlin', 'David', 'Chamberlin', 'David', 'dc@ae6dc.com', '650-898-7364', '', '', 'AE6', 'DC', 'Email', 'Y', 'Extra', 17, 'Y', 'c74c2e51-8f1f-11ed-b98d-a8a159046a1f', 'c74bd4e4-8f1f-11ed-b98d-a8a159046a1f', '2305 Beach Blvd.', '', 'Pacifica', 'CA', '94044', '650-898-7364'),
('2023-10-20 04:45:27', '2023:2024', 'Steve Paganelli', 'Steve', 'Paganelli', 'Steve', 'spagnel@prodigy.net', '', '', '', 'K6', 'YUA', 'Email', 'Y', 'General', 8, 'N', 'c74d48c7-8f1f-11ed-b98d-a8a159046a1f', 'c74ceacc-8f1f-11ed-b98d-a8a159046a1f', '2370 Rosewood Rd', '', 'San Bruno', 'CA', '94066', '650-766-2156'),
('2023-10-20 04:45:27', '2023', 'Richard D. Markel', 'Richard D.', 'Markel', 'Richard', 'richard@batnet.com', '', '', '', 'KB6', 'VT', 'Email', 'N', 'Extra', 35, 'N', 'c74e7840-8f1f-11ed-b98d-a8a159046a1f', 'c74e0327-8f1f-11ed-b98d-a8a159046a1f', '24 Twin Oaks Ave.', '', 'San Rafael', 'CA', '94901', '415 258-8258'),
('2023-10-20 04:45:27', '2023:2024:2025', 'Ted Niemira', 'Ted', 'Niemira', 'Ted', 'w6sy.ted@gmail.com', ' ', '', '', 'W6', 'SY', 'Email', 'N', 'None', 0, 'N', 'c74f88f5-8f1f-11ed-b98d-a8a159046a1f', 'c74f2ba6-8f1f-11ed-b98d-a8a159046a1f', '2490 Princeton Dr.', '', 'San Bruno', 'CA', '94066-3847', '650-615-9201'),
('2023-10-20 04:45:27', '', 'Robert Barbitta', 'Robert', 'Barbitta', 'Bob', 'bobandcarole@msn.com', '650-878-4429', '', '', 'W6', 'LOG', 'Email', 'Y', 'Extra', 13, 'N', 'c750a6f2-8f1f-11ed-b98d-a8a159046a1f', 'c7503a5d-8f1f-11ed-b98d-a8a159046a1f', '28 Camelot Court', '', 'Daly City', 'CA', '94015', '650 878-8716'),
('2023-10-20 04:45:27', '', 'Scott C. Gillette', 'Scott C.', 'Gillette', 'Scott', 'scott@sgillette.com', '650-219-4058', '', '', 'KN6', 'GQZ', 'Email', 'N', 'Tech', 0, 'N', 'c751e5ad-8f1f-11ed-b98d-a8a159046a1f', 'c75162ec-8f1f-11ed-b98d-a8a159046a1f', '280 Olympian Way', '', 'Pacifica', 'CA', '94044', '650-219-4058'),
('2023-10-20 04:45:27', '', 'Linda C. Sanders', 'Linda C.', 'Sanders', 'Linda', 'lin@jaslin.com', '', '', '', 'KB6', 'OIZ', 'Email', 'N', 'Novice', 46, 'N', 'c752fc14-8f1f-11ed-b98d-a8a159046a1f', 'c752a23b-8f1f-11ed-b98d-a8a159046a1f', '295 Casitas Avenue', '', 'San Francisco', 'CA', '94127', '415-587-8948'),
('2023-10-20 04:45:27', '2023', 'Ron Purser', 'Ron', 'Purser', 'Ron', 'rpurser@sfsu.edu', '650-283-5007', '', '', 'WB9', 'EGG', 'Email', 'N', 'Advanced', 52, 'N', 'c7541e21-8f1f-11ed-b98d-a8a159046a1f', 'c753a888-8f1f-11ed-b98d-a8a159046a1f', '311 Loma Vista Tr', '', 'Pacifica', 'CA', '94044', '650-283-5007'),
('2023-10-20 04:45:27', '2023', 'Walt Long', 'Walt', 'Long', 'Walt', 'wlong3@sbcglobal.net', '650-922-9491', '', '', 'KG6', 'EDY', 'None', 'Y', 'General', 21, 'Y', 'c75523b4-8f1f-11ed-b98d-a8a159046a1f', 'c754c960-8f1f-11ed-b98d-a8a159046a1f', '326 Sierra Point Rd.', '', 'Brisbane', 'CA', '94005', '650-922-9491'),
('2023-10-20 04:45:27', '', 'William A. Lillie', 'William A.', 'Lillie', 'William', 'billn6bct@gmail.com', '', '', '', 'N6', 'BCT', 'Email', 'Y', 'Extra', 55, 'N', 'c756474b-8f1f-11ed-b98d-a8a159046a1f', 'c755eb27-8f1f-11ed-b98d-a8a159046a1f', '3600 Higgins Canyon Rd.', '', 'Half Moon Bay', 'CA', '94019', '650-726-3630'),
('2023-10-20 04:45:27', '2023', 'Fernel Andong', 'Fernel', 'Andong', 'Fernel', 'fernelandong@yahoo.com', '', '', '', 'KM6', 'UYM', 'Email', 'Y', 'Tech', 0, 'Y', 'c757750a-8f1f-11ed-b98d-a8a159046a1f', 'c756ff28-8f1f-11ed-b98d-a8a159046a1f', '365 88th St #2', '', 'Daly City', 'CA', '94015', '650-762-4404'),
('2023-10-20 04:45:27', '', 'William J. Anderson', 'William J.', 'Anderson', 'William', 'wja3434@yahoo.com', '650-296-7060', '', '', 'KM6', 'HYK', 'Email', 'Y', 'Tech', 2, 'N', 'c75888e2-8f1f-11ed-b98d-a8a159046a1f', 'c75822d6-8f1f-11ed-b98d-a8a159046a1f', '381 Half Moon Ln #103', '', 'Daly City', 'CA', '94015', '650-296-7060'),
('2023-10-20 04:45:27', '2022:2023:2024:2025:2026', 'George Fenisey', 'George', 'Fenisey', 'George', 'gfenisey@fenisey.com', '', '', '', 'N6', 'GYR', 'Email', 'Y', 'General', 32, 'N', 'c7599a70-8f1f-11ed-b98d-a8a159046a1f', 'c7593f8b-8f1f-11ed-b98d-a8a159046a1f', '399 Holly Ave.', '', 'So. San Francisco', 'CA', '94080', '650-278-2026'),
('2023-10-20 04:45:27', '', 'Lucas Ford', 'Lucas', 'Ford', 'Lucas', 'lucas@w6aer.com', '', '', '', 'W6', 'AER', 'Email', 'N', 'None', 0, 'N', 'c75ad968-8f1f-11ed-b98d-a8a159046a1f', 'c75a5f07-8f1f-11ed-b98d-a8a159046a1f', '435 Heathcliff Dr', '', 'Pacifica', 'CA', '94044', ''),
('2023-10-20 04:45:27', '', 'Ben Calvert', 'Ben', 'Calvert', 'Ben', 'ben@flyingwalrus.net', '', '', '', 'KN6', 'FUT', 'Email', 'N', 'General', 0, 'N', 'c75c02b7-8f1f-11ed-b98d-a8a159046a1f', 'c75b89ca-8f1f-11ed-b98d-a8a159046a1f', '444 Lewis Ln', '', 'Pacifica', 'CA', '94044', '650-346-6848'),
('2023-10-20 04:45:27', '', 'Charles Tillman', 'Charles', 'Tillman', 'Charles', 'KC6CTT@yahoo.com', '', '', '', 'KC6', 'CTT', 'Email', 'N', 'General', 15, 'N', 'c75d159b-8f1f-11ed-b98d-a8a159046a1f', 'c75cadfa-8f1f-11ed-b98d-a8a159046a1f', '446 Oak Lake Ave.', '', 'Santa Rosa', 'CA', '95409', '707-235-7787'),
('2023-10-20 04:45:27', '2023', 'Jacquie Lawrence', 'Jacquie', 'Lawrence', 'Jackie', '', '', '', '', '', '', 'Email', '', '', NULL, '', '6e5e9a6f-909f-11ed-8f40-a8a159046a1f', 'c75dd8b0-8f1f-11ed-b98d-a8a159046a1f', '508 Cambridge St.', '', 'Belmont', 'CA', '94002', '650 595-2827'),
('2023-10-20 04:45:27', '2023', 'David L. Lawrence', 'David L.', 'Lawrence', 'Dave', 'kf6tww@gmail.com', '650-703-9279', '', '', 'KF6', 'TWW', 'Email', 'Y', 'General', 23, 'N', 'c75e3dd8-8f1f-11ed-b98d-a8a159046a1f', 'c75dd8b0-8f1f-11ed-b98d-a8a159046a1f', '508 Cambridge St.', '', 'Belmont', 'CA', '94002', '650 595-2827'),
('2023-10-20 04:45:27', '2023', 'Harry Ysselstein', 'Harry', 'Ysselstein', 'Harry', 'hpyhmb@gmail.com', '', '', '', 'N6', 'BHS', 'Email', 'Y', 'Extra', 15, 'Y', 'c75f4e9d-8f1f-11ed-b98d-a8a159046a1f', 'c75ef678-8f1f-11ed-b98d-a8a159046a1f', '526 Highland Ave', '', 'Half Moon Bay', 'CA', '94019', '415-706-6216'),
('2023-10-20 04:45:27', '', 'Derek Dang', 'Derek', 'Dang', 'Derek', 'derekd_94611@sbcglobal.net', '', '', '', 'AF6', 'BT', 'Email', 'N', 'Extra', 10, 'N', 'c760573f-8f1f-11ed-b98d-a8a159046a1f', 'c75ffd4a-8f1f-11ed-b98d-a8a159046a1f', '5838 Pinewood Rd', '', 'Oakland', 'CA', '94611', '510-654-3310'),
('2023-10-20 04:45:27', '2023', 'Ariel Gallega', 'Ariel', 'Gallega', 'Ariel', 'kj6kob@gmail.com', '415-297-1734', '', '', 'K6', 'RYL', 'Email', 'Y', 'Extra', 23, 'Y', 'c7617077-8f1f-11ed-b98d-a8a159046a1f', 'c76112f0-8f1f-11ed-b98d-a8a159046a1f', '585 Alexis Circle', '', 'Daly City', 'CA', '94014', '415-468-1612'),
('2023-10-20 04:45:27', '2023', 'Michael G. Bevington', 'Michael G.', 'Bevington', 'Michael', 'mike_bevington@pacbell.net', '650-922-6847', '', '', 'AA6', 'XL', 'Email', 'N', 'Extra', 30, 'N', 'c7628bbe-8f1f-11ed-b98d-a8a159046a1f', 'c7622dfe-8f1f-11ed-b98d-a8a159046a1f', '612 Montezuma Dr.', '', 'Pacifica', 'CA', '94044', '650 359-5194'),
('2023-10-20 04:45:27', '2023', 'Paul Atkins', 'Paul', 'Atkins', 'Paul', 'pvatkins@pacbell.net', '415-810-9152', '', '', 'AI6', 'BB', 'Email', 'Y', 'Extra', 5, 'N', 'c763a90e-8f1f-11ed-b98d-a8a159046a1f', 'c7634dd4-8f1f-11ed-b98d-a8a159046a1f', '637 Sharp Park Rd.', '', 'Pacifica', 'CA', '94044', '650 355-6597'),
('2023-10-20 04:45:27', '2023', 'Georgia Grant', 'Georgia', 'Grant', 'Georgia', 'grantg@pacbell.net', '', '', '', 'KE6', 'KRT', 'Email', 'Y', 'Tech', 26, 'N', 'c76453c1-8f1f-11ed-b98d-a8a159046a1f', 'c7634dd4-8f1f-11ed-b98d-a8a159046a1f', '637 Sharp Park Rd.', '', 'Pacifica', 'CA', '94044', '650 355-6597'),
('2023-10-20 04:45:27', '2023', 'Tom Oliver', 'Tom', 'Oliver', 'Tom', 'toliver0557@gmail.com', '650-303-6980', '', '', 'KJ6', 'OGL', 'Email', 'Y', 'Tech', 8, 'Y', 'c76576d8-8f1f-11ed-b98d-a8a159046a1f', 'c76507d7-8f1f-11ed-b98d-a8a159046a1f', '72 Lighthouse Lane', '', 'Daly City', 'CA', '94014', '650-303-6980'),
('2023-10-20 04:45:27', '', 'Don R. Corral', 'Don R.', 'Corral', 'Don', 'firelectric.don@gmail.com', '', '', '', 'KK6', 'JJX', 'Email', 'Y', 'None', 0, 'N', 'c7668dc5-8f1f-11ed-b98d-a8a159046a1f', 'c766339d-8f1f-11ed-b98d-a8a159046a1f', '720 Edgemar Ave', '', 'Pacifica', 'CA', '94044', '415-971-8528'),
('2023-10-20 04:45:27', '', 'Carmel Gallagher', 'Carmel', 'Gallagher', 'Carmel', 'tlcperrn@sbcglobal.net', '650-670-2322', '', '', 'KJ6', 'ERS', 'Email', 'N', 'Tech', 6, 'Y', 'c767ad2f-8f1f-11ed-b98d-a8a159046a1f', 'c7674f8f-8f1f-11ed-b98d-a8a159046a1f', '728 Moana Way', '', 'Pacifica', 'CA', '94044', '650-670-2322'),
('2023-10-20 04:45:27', '2023:2024:2025', 'Gary Barnes', 'Gary', 'Barnes', 'Gary', 'ki6hig@earthlink.net', '650-553-8649', '', '', 'KI6', 'HIG', 'Email', 'Y', 'Extra', 15, 'N', 'c768c29f-8f1f-11ed-b98d-a8a159046a1f', 'c7685e10-8f1f-11ed-b98d-a8a159046a1f', '75 Perry St. Apt. 119', '', 'Redwood City', 'CA', '94063', '650-368-0485'),
('2023-10-20 04:45:27', '2023', 'Zoe Kersteen-Tucker', 'Zoe', 'Kersteen-Tucker', 'Zoe', 'kersteentucker@gmail.com', '', '', '', 'KI6', 'DRM', 'Email', 'Y', 'Tech', 12, 'N', 'c769dfc9-8f1f-11ed-b98d-a8a159046a1f', 'c76981d0-8f1f-11ed-b98d-a8a159046a1f', '776 Buena Vista St.', '', 'Moss Beach', 'CA', '94038-9717', '650-728-2823'),
('2023-10-20 04:45:27', '2023', 'George H. Tucker', 'George H.', 'Tucker', 'George', 'george.e.tucker@att.net', '650-766-2628', '', '', 'W6', 'HAF', 'Email', 'Y', 'General', 13, 'N', 'c76a9954-8f1f-11ed-b98d-a8a159046a1f', 'c76981d0-8f1f-11ed-b98d-a8a159046a1f', '776 Buena Vista St.', '', 'Moss Beach', 'CA', '94038-9717', '650-728-2823'),
('2023-10-20 04:45:27', '', 'Victor M. Munoz', 'Victor M.', 'Munoz', 'Victor', 'sifu_victor@yahoo.com', '650-278-7626', '', '', 'KB6', 'LGZ', 'Email', 'N', 'General', 39, 'N', 'c76bd6c7-8f1f-11ed-b98d-a8a159046a1f', 'c76b6ae5-8f1f-11ed-b98d-a8a159046a1f', '830 Skyline Dr.', '', 'Daly City', 'CA', '95015', '650-278-7626'),
('2023-10-20 04:45:27', '2023', 'Vernon Patterson', 'Vernon', 'Patterson', 'Vernon', 'donpatterson@sbcglobal.net', '', '', '', 'W6', 'VJJ', 'Email', 'N', 'Advanced', 73, 'N', 'c76cf339-8f1f-11ed-b98d-a8a159046a1f', 'c76c8128-8f1f-11ed-b98d-a8a159046a1f', '905 Bancroft Ave.', '', 'Half Moon Bay', 'CA', '94019', '650 726-4282'),
('2023-10-20 04:45:27', '2023', 'Dan Bernstein', 'Dan', 'Bernstein', 'Dan', 'n6zen@arrl.net', '', '', '', 'N6', 'ZEN', 'Email', 'Y', 'Extra', 12, 'N', 'c76e0dd2-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Emily Bernstein', 'Emily', 'Bernstein', 'Emily', '', '', '', '', 'KK6', 'FOI', 'Email', 'N', 'Tech', 8, 'N', 'c76f918d-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Anna Bernstein', 'Anna', 'Bernstein', 'Anna', '', '', '', '', 'KJ6', 'FHQ', 'Email', 'N', 'Tech', 6, 'N', 'c7705694-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Tricia Dell', 'Tricia', 'Dell', 'Tricia', '', '', '', '', 'KC6', 'LCA', 'Email', 'N', 'Tech', 10, 'N', 'c77108bf-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Ralph Kugler', 'Ralph', 'Kugler', 'Ralph', 'kc6ydh@arrl.net', '415-806-0372', '', '', 'KC6', 'YDH', 'Email', 'Y', 'General', 29, 'N', 'c7722181-8f1f-11ed-b98d-a8a159046a1f', 'c771b24a-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 2209', '', 'Daly City', 'CA', '94017', '650-731-8229'),
('2023-10-20 04:45:27', '', 'Roy Brixen', 'Roy', 'Brixen', 'Roy', 'rebrixen@well.com', '650-504-0777', '', '', 'KE6', 'MNJ', 'Email', 'Y', 'General', 20, 'N', 'c7735df0-8f1f-11ed-b98d-a8a159046a1f', 'c772ec0a-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 699', '', 'Pescadero', 'CA', '94060', '650 879-1978'),
('2023-10-20 04:45:27', '', 'Chris Icide', 'Chris', 'Icide', 'Chris', 'chris@netgeeks.net', '650-576-2975', '', '', 'WY7', 'W', 'Email', 'Y', 'Extra', 2, 'N', 'c7749204-8f1f-11ed-b98d-a8a159046a1f', 'c7743496-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 128', '', 'Joyce', 'WA', '94038', '360-928-0130'),
('2023-10-20 04:45:27', '2023', 'David Conroy', 'David', 'Conroy', 'Dave', 'dgcx@icloud.com', '650-483-5156', '', '', 'K6', 'NIA', 'Email', 'Y', 'Extra', 5, 'N', 'c775ae43-8f1f-11ed-b98d-a8a159046a1f', 'c775564c-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 1346', '', 'El Granada', 'CA', '94018', '650-728-1424'),
('2023-10-20 04:45:27', '2023', 'John R. Owens', 'John R.', 'Owens', 'John', 'john@nn6u.net', '415-250-5634', '', '', 'NN6', 'U', 'Email', 'Y', 'Extra', 3, 'N', 'c776c5d7-8f1f-11ed-b98d-a8a159046a1f', 'c7765c1b-8f1f-11ed-b98d-a8a159046a1f', 'PO Box 370639', '', 'Montara', 'CA', '94037', '415-250-5634'),
('2023-10-20 04:45:27', '', 'Andy Calman', 'Andy', 'Calman', 'Andy', 'acalmanmd@gmail.com', '650-270-9683', '', '', 'K6', 'ZP', 'Email', 'Y', 'Extra', 1, 'N', 'c777da5c-8f1f-11ed-b98d-a8a159046a1f', 'c7777f8f-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 371203', '', 'Montara', 'CA', '94037', '650-270-9683'),
('2023-10-20 04:45:27', '2023', 'Dan Reid', 'Dan', 'Reid', 'Dan', 'n6dbr@dbr.fastmail.fm', '', '', '', 'N6', 'DBR', 'Email', 'N', 'General', 9, 'Y', 'c779016f-8f1f-11ed-b98d-a8a159046a1f', 'c77893fb-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 371537', '', 'Montara', 'CA', '94037', '650-776-3445'),
('2023-10-20 04:45:27', '', 'Rudy Gaoay', 'Rudy', 'Gaoay', 'Rudy', 'n6doz@arrl.net', '415-410-1053', '', '', 'N6', 'DOZ', 'Email', 'Y', 'General', 2, 'N', 'c77a301f-8f1f-11ed-b98d-a8a159046a1f', 'c779c43b-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 5040', '', 'So. San Francisco', 'CA', '94083', '415-410-1053'),
('2023-10-20 04:45:27', '2023', 'Dennis Kafka', 'Dennis', 'Kafka', 'Dennis', 'kjjkafka@sbcglobal.net', '650-898-2847', '', '', 'KN6', 'QER', 'Email', 'Y', 'General', 0, 'N', 'c72c7747-8f1f-11ed-b98d-a8a159046a1f', 'ce88b915-9b56-11ed-9cb3-a8a159046a1f', '1311 Redwood Way', '', 'Pacifica', 'CA', '94044', '650-355-7852'),
('2023-10-20 04:45:27', '2023', 'Bharat Bailur', 'Bharat', 'Bailur', 'Bharat', 'bharatbailur@hotmail.com', '551-444-8015', '', '', 'W2', 'OKB', 'Email', 'N', 'Tech', 4, 'N', 'e1703f7e-d981-11ed-b8e5-0242ac110002', 'e1705a08-d981-11ed-b8e5-0242ac110002', '6 Disbrow Ct', '', 'East Brunswick', 'NJ', '08816', '');

-- --------------------------------------------------------

--
-- Table structure for table `vu_people_detail`
--

CREATE TABLE `vu_people_detail` (
  `as_of_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dues_cy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_firstName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_lastName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_nickname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_primary_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_cell_telephone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_officer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_chairs` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_prefix` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_suffix` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_newsletter` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_arrl` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_license` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_detail_yrs_lic` int DEFAULT NULL,
  `member_detail_cert` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_uu` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_id_uu` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_zip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_home_telephone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vu_people_detail`
--

INSERT INTO `vu_people_detail` (`as_of_date`, `dues_cy`, `member_firstName`, `member_lastName`, `member_nickname`, `member_primary_email`, `member_cell_telephone`, `member_detail_officer`, `member_detail_chairs`, `member_detail_prefix`, `member_detail_suffix`, `member_detail_newsletter`, `member_detail_arrl`, `member_detail_license`, `member_detail_yrs_lic`, `member_detail_cert`, `id_uu`, `address_id_uu`, `address_street_1`, `address_street_2`, `address_city`, `address_state`, `address_zip`, `address_home_telephone`) VALUES
('2023-10-20 04:45:27', '2023', 'Ellen', 'Price', 'Ellen', 'EllenPriceCPA@gmail.com', '', '', '', 'KN6', 'UNF', 'None', 'N', 'None', 0, 'N', 'c72df92a-8f1f-11ed-b98d-a8a159046a1f', 'c5bac709-9b96-11ed-bea2-a8a159046a1f', '80 Eureka Sq, Suite 136', '', 'Pacifica', 'CA', '94044', ''),
('2023-10-20 04:45:27', '', 'Henry', 'Lancelle', '', '', '', '', '', 'ZZ1', '', 'Email', '', '', NULL, '', '1e37e8e3-a281-11ed-8c60-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Victor', 'Zarich', 'Victor', 'vzarich@me.com', '', '', '', 'K6', 'VIZ', 'Email', 'N', 'None', 0, 'N', 'c7267636-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Dishaan', 'Ahuja', 'Dishaan', 'ahujadishaan@gmail.com', '', '', '', 'KN6', 'MKA', 'Email', 'N', 'None', 0, 'N', 'c72850d2-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Chris', 'Bell', 'Chris', 'chrisbell1222@me.com', '', '', '', '', '', 'Email', 'N', 'None', 0, 'N', 'c7294576-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Stephen', 'Martin', 'Stephen', 'missionpurisima@gmail.com', '', '', '', 'AG6', 'NY', 'Email', 'N', 'Extra', 0, 'N', 'c72a4171-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Anthony', 'Dowler', 'Anthony', 'dxer@k6bv.net', '', '', '', 'K6', 'BV', 'Email', 'N', 'None', 0, 'N', 'c72b0eff-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'James', 'Sanders', 'James', '', '', '', '', 'KW6', 'L', 'Email', 'N', 'None', 0, 'N', 'c72bc695-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Jenni', 'Williams', 'Jen', 'jenni@jwlms.com', '', '', '', 'WS6', 'JEN', 'Email', 'N', 'None', 0, 'N', 'c72d415f-8f1f-11ed-b98d-a8a159046a1f', 'c725b975-8f1f-11ed-b98d-a8a159046a1f', 'uk', 'unkwn', 'unkwn', 'uk', 'unkwn', 'unkwn'),
('2023-10-20 04:45:27', '', 'Mary Ellen', 'Scherer', 'Mary Ellen', 'mescherer@comcast.net', '415-377-6584', '', '', 'AJ6', 'J', 'Email', 'Y', 'Extra', 10, 'Y', 'c72f1a71-8f1f-11ed-b98d-a8a159046a1f', 'c72eb0b6-8f1f-11ed-b98d-a8a159046a1f', '1105 Brittany Lane', '', 'Daly City', 'CA', '94014', '415-239-4513'),
('2023-10-20 04:45:27', '2023', 'Breck', 'Hitz', 'Breck', 'breck@leoma.com', '650-208-2668', '', '', 'W6', 'CBH', 'Email', 'N', 'Tech', 8, 'Y', 'c7302fd4-8f1f-11ed-b98d-a8a159046a1f', 'c72fd086-8f1f-11ed-b98d-a8a159046a1f', '123 Kent Rd', '', 'Pacifica', 'CA', '94044', '650-359-3905'),
('2023-10-20 04:45:27', '2023', 'Frank C.', 'Erbacher', 'Frank', 'n6fg@arrl.net', '650-464-3870', '', '', 'N6', 'FG', 'Email', 'Y', 'Extra', 51, 'Y', 'c731449c-8f1f-11ed-b98d-a8a159046a1f', 'c730e4ff-8f1f-11ed-b98d-a8a159046a1f', '1322 Lerida Way', '', 'Pacifica', 'CA', '94044', '650 355-4355'),
('2023-10-20 04:45:27', '2023', 'Barbara', 'Erbacher', 'Barbara', 'berbach@comcast.net', '650-464-3871', '', '', 'K6', 'IIP', 'Email', 'N', 'General', 34, 'N', 'c731f919-8f1f-11ed-b98d-a8a159046a1f', 'c730e4ff-8f1f-11ed-b98d-a8a159046a1f', '1322 Lerida Way', '', 'Pacifica', 'CA', '94044', '650 355-4355'),
('2023-10-20 04:45:27', '2023', 'Casey', 'Villyard', 'Casey', 'n6tze@arrl.net', '650-438-2826', '', '', 'N6', 'TZE', 'Email', 'Y', 'Extra', 35, 'Y', 'c7330e5b-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Audrey J.', 'Villyard', 'Audrey', 'audreyv1@stickerburr.net', '650-766-1193', '', '', 'WA2', 'KPS', 'Email', 'N', 'Tech', 25, 'N', 'c733cb5b-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Nikki', 'Villyard', 'Nikki', 'waffle451@gmail.com', '', '', '', 'KI6', 'VRA', 'Email', 'Y', 'General', 10, 'N', 'c7348546-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Joshua', 'Villyard', 'Joshua', 'n6tzf@arrl.net', '', '', '', 'N6', 'TZF', 'Email', 'Y', 'Extra', 10, 'Y', 'c73543e9-8f1f-11ed-b98d-a8a159046a1f', 'c732a6cc-8f1f-11ed-b98d-a8a159046a1f', '1356 Castro Court', '', 'Pacifica', 'CA', '94044', '650-359-3069'),
('2023-10-20 04:45:27', '2023', 'Michael S.', 'Herbert', 'Michael', 'wb6jkv@pacbell.net', '650-333-5088', '', '', 'WB6', 'JKV', 'Email', 'N', 'General', 51, 'N', 'c7366c13-8f1f-11ed-b98d-a8a159046a1f', 'c735fb39-8f1f-11ed-b98d-a8a159046a1f', '1368 Crespi Dr.', '', 'Pacifica', 'CA', '94044', '650 355-6541'),
('2023-10-20 04:45:27', '2023', 'Kris', 'Herbert', 'Kris', 'kmherbert@pacbell.net', '', '', '', 'N6', 'QGZ', 'Email', 'N', 'Tech', 35, 'N', 'c7371e66-8f1f-11ed-b98d-a8a159046a1f', 'c735fb39-8f1f-11ed-b98d-a8a159046a1f', '1368 Crespi Dr.', '', 'Pacifica', 'CA', '94044', '650 355-6541'),
('2023-10-20 04:45:27', '2023', 'Steve', 'Austin', 'Steve', 'kn6orm@gmail.com', '415-420-1199', '', '', 'KN6', 'ORM', 'Email', 'Y', 'None', 0, 'N', 'c73830de-8f1f-11ed-b98d-a8a159046a1f', 'c737cfdb-8f1f-11ed-b98d-a8a159046a1f', '140 San Jose Ave', '', 'Pacifica', 'CA', '94044', '415-420-1199'),
('2023-10-20 04:45:27', '2023', 'Jillian', 'Aldersen', 'Jillian', 'kn6piv@gmail.com', '415-518-9748', '', '', 'KN6', 'PIV', 'Email', 'N', 'None', 0, 'N', 'c738f0e1-8f1f-11ed-b98d-a8a159046a1f', 'c737cfdb-8f1f-11ed-b98d-a8a159046a1f', '140 San Jose Ave', '', 'Pacifica', 'CA', '94044', '415-420-1199'),
('2023-10-20 04:45:27', '', 'R. Scott', 'Sutor', 'Scott', 'rscott@sutor.org', '', '', '', 'KM6', 'SCD', 'Email', 'N', 'General', 4, 'Y', 'c73a096a-8f1f-11ed-b98d-a8a159046a1f', 'c739a6a4-8f1f-11ed-b98d-a8a159046a1f', '1415 Crespi Dr.', '', 'Pacifica', 'CA', '94044', '650-359-8275'),
('2023-10-20 04:45:27', '', 'Pete', 'Wanger', 'Pete', 'wa6ech@arrl.net', '', '', '', 'WA6', 'ECH', 'Email', 'Y', 'Extra', 60, 'N', 'c73b285a-8f1f-11ed-b98d-a8a159046a1f', 'c73ac6fc-8f1f-11ed-b98d-a8a159046a1f', '1604 Mcdonald Way', '', 'Burlingame', 'CA', '94010', '650-697-7997'),
('2023-10-20 04:45:27', '2023', 'Miles E.', 'Bond', 'Miles', 'ab7zx@arrl.net', '', '', '', 'AB7', 'ZX', 'Email', 'Y', 'Extra', 28, 'N', 'c73c5aa0-8f1f-11ed-b98d-a8a159046a1f', 'c73beb08-8f1f-11ed-b98d-a8a159046a1f', '16303 S/E 3rd Street', '', 'Vancouver', 'WA', '98684', '360-254-5381'),
('2023-10-20 04:45:27', '', 'Kelly', 'Tuttle', 'Kelly', 'wb6aaj626@gmail.com', '408-480-7533', '', '', 'WB6', 'AAJ', 'Email', 'N', 'Extra', 50, 'N', 'c73d8332-8f1f-11ed-b98d-a8a159046a1f', 'c73d18bb-8f1f-11ed-b98d-a8a159046a1f', '1825 Walnut Grove Av', '', 'San Jose', 'CA', '95126', '408-480-7533'),
('2023-10-20 04:45:27', '', 'Alan W.', 'Dye', 'Alan', 'alandye@gmail.com', '415-308-7128', '', '', 'W6', 'AWD', 'Email', 'Y', 'Extra', 24, 'N', 'c73f1d7a-8f1f-11ed-b98d-a8a159046a1f', 'c73e4435-8f1f-11ed-b98d-a8a159046a1f', '183 Bright Street', '', 'San Francisco', 'CA', '94132', '415-308-7128'),
('2023-10-20 04:45:27', '2023', 'David G.', 'Hurlburt', 'David', 'dghurlb@pacbell.net', '650-892-0351', '', '', 'WB6', 'FEK', 'Email', 'Y', 'Extra', 59, 'N', 'c740b395-8f1f-11ed-b98d-a8a159046a1f', 'c7404b07-8f1f-11ed-b98d-a8a159046a1f', '19 Malavear Ct.', '', 'Pacifica', 'CA', '94044', '650 355-8102'),
('2023-10-20 04:45:27', '2023', 'Jane', 'Hurlburt', 'Jane', '', '', '', '', 'KF6', 'ACH', 'Email', 'Y', 'Tech', 33, 'N', 'c741f782-8f1f-11ed-b98d-a8a159046a1f', 'c7404b07-8f1f-11ed-b98d-a8a159046a1f', '19 Malavear Ct.', '', 'Pacifica', 'CA', '94044', '650 355-8102'),
('2023-10-20 04:45:27', '2023', 'Richard T.', 'Lira', 'Richard', 'richlira@myastound.net', '650-520-4838', '', '', 'KK6', 'PCC', 'Email', 'Y', 'Tech', 9, 'N', 'c7456ba4-8f1f-11ed-b98d-a8a159046a1f', 'c744906f-8f1f-11ed-b98d-a8a159046a1f', '196 42nd Ave.', '', 'San Mateo', 'CA', '94403', '650-570-6779'),
('2023-10-20 04:45:27', '', 'Paul', 'Grigorieff', 'Paul', 'n1helradio@gmail.com', '', '', '', 'N1', 'HEL', 'Email', 'N', 'General', 33, 'N', 'c7469f4e-8f1f-11ed-b98d-a8a159046a1f', 'c74631a0-8f1f-11ed-b98d-a8a159046a1f', '2101 Winged Foot Rd.', '', 'Half Moon Bay', 'CA', '94019', '650-727-7759'),
('2023-10-20 04:45:27', '2023', 'George', 'Salet', 'George', 'gsalet@plumbingpro.com', '415-756-5074', '', '', 'KJ6', 'TSX', 'Email', 'Y', 'General', 11, 'N', 'c747cdd8-8f1f-11ed-b98d-a8a159046a1f', 'c74761cb-8f1f-11ed-b98d-a8a159046a1f', '215 Sunshine Dr.', '', 'Pacifica', 'CA', '94044', '650-355-4006'),
('2023-10-20 04:45:27', '2023', 'David M.', 'Rinck', 'David', 'k6dmr@pacbell.net', '650-464-1353', '', '', 'K6', 'DMR', 'Email', 'N', 'Extra', 21, 'Y', 'c748e37b-8f1f-11ed-b98d-a8a159046a1f', 'c748874e-8f1f-11ed-b98d-a8a159046a1f', '220 Manor Dr.', '', 'Pacifica', 'CA', '94044', '650 355-1778'),
('2023-10-20 04:45:27', '', 'Michael S', 'Ransom', 'Michael', 'kayak6@gmail.com', '', '', '', 'KM6', 'HRZ', 'Email', 'N', 'Tech', 3, 'N', 'c749ffda-8f1f-11ed-b98d-a8a159046a1f', 'c7499552-8f1f-11ed-b98d-a8a159046a1f', '223 Clifton Rd.', '', 'Pacifica', 'CA', '94044', '415-342-4736'),
('2023-10-20 04:45:27', '2023', 'Julie', 'Lancelle', 'Julie', 'julie.a.lancelle@gmail.com', '650-455-0346', '', '', '', '', 'Email', '', 'None', NULL, '', '3948f2fb-c165-11ed-b3ad-0242ac110002', 'c74ab65f-8f1f-11ed-b98d-a8a159046a1f', '224 Modoc Place', '', 'Pacifica', 'CA', '94044', '650-355-2545'),
('2023-10-20 04:45:27', '2023', 'Jonathan', 'Lancelle', 'Jonathan', 'n6sjf@knosys.com', '650-270-5823', '', '', 'N6', 'SJF', 'Email', 'Y', 'Extra', 31, 'N', 'c74b21e0-8f1f-11ed-b98d-a8a159046a1f', 'c74ab65f-8f1f-11ed-b98d-a8a159046a1f', '224 Modoc Place', '', 'Pacifica', 'CA', '94044', '650-355-2545'),
('2023-10-20 04:45:27', '', 'David', 'Chamberlin', 'David', 'dc@ae6dc.com', '650-898-7364', '', '', 'AE6', 'DC', 'Email', 'Y', 'Extra', 17, 'Y', 'c74c2e51-8f1f-11ed-b98d-a8a159046a1f', 'c74bd4e4-8f1f-11ed-b98d-a8a159046a1f', '2305 Beach Blvd.', '', 'Pacifica', 'CA', '94044', '650-898-7364'),
('2023-10-20 04:45:27', '2023:2024', 'Steve', 'Paganelli', 'Steve', 'spagnel@prodigy.net', '', '', '', 'K6', 'YUA', 'Email', 'Y', 'General', 8, 'N', 'c74d48c7-8f1f-11ed-b98d-a8a159046a1f', 'c74ceacc-8f1f-11ed-b98d-a8a159046a1f', '2370 Rosewood Rd', '', 'San Bruno', 'CA', '94066', '650-766-2156'),
('2023-10-20 04:45:27', '2023', 'Richard D.', 'Markel', 'Richard', 'richard@batnet.com', '', '', '', 'KB6', 'VT', 'Email', 'N', 'Extra', 35, 'N', 'c74e7840-8f1f-11ed-b98d-a8a159046a1f', 'c74e0327-8f1f-11ed-b98d-a8a159046a1f', '24 Twin Oaks Ave.', '', 'San Rafael', 'CA', '94901', '415 258-8258'),
('2023-10-20 04:45:27', '2023:2024:2025', 'Ted', 'Niemira', 'Ted', 'w6sy.ted@gmail.com', ' ', '', '', 'W6', 'SY', 'Email', 'N', 'None', 0, 'N', 'c74f88f5-8f1f-11ed-b98d-a8a159046a1f', 'c74f2ba6-8f1f-11ed-b98d-a8a159046a1f', '2490 Princeton Dr.', '', 'San Bruno', 'CA', '94066-3847', '650-615-9201'),
('2023-10-20 04:45:27', '', 'Robert', 'Barbitta', 'Bob', 'bobandcarole@msn.com', '650-878-4429', '', '', 'W6', 'LOG', 'Email', 'Y', 'Extra', 13, 'N', 'c750a6f2-8f1f-11ed-b98d-a8a159046a1f', 'c7503a5d-8f1f-11ed-b98d-a8a159046a1f', '28 Camelot Court', '', 'Daly City', 'CA', '94015', '650 878-8716'),
('2023-10-20 04:45:27', '', 'Scott C.', 'Gillette', 'Scott', 'scott@sgillette.com', '650-219-4058', '', '', 'KN6', 'GQZ', 'Email', 'N', 'Tech', 0, 'N', 'c751e5ad-8f1f-11ed-b98d-a8a159046a1f', 'c75162ec-8f1f-11ed-b98d-a8a159046a1f', '280 Olympian Way', '', 'Pacifica', 'CA', '94044', '650-219-4058'),
('2023-10-20 04:45:27', '', 'Linda C.', 'Sanders', 'Linda', 'lin@jaslin.com', '', '', '', 'KB6', 'OIZ', 'Email', 'N', 'Novice', 46, 'N', 'c752fc14-8f1f-11ed-b98d-a8a159046a1f', 'c752a23b-8f1f-11ed-b98d-a8a159046a1f', '295 Casitas Avenue', '', 'San Francisco', 'CA', '94127', '415-587-8948'),
('2023-10-20 04:45:27', '2023', 'Ron', 'Purser', 'Ron', 'rpurser@sfsu.edu', '650-283-5007', '', '', 'WB9', 'EGG', 'Email', 'N', 'Advanced', 52, 'N', 'c7541e21-8f1f-11ed-b98d-a8a159046a1f', 'c753a888-8f1f-11ed-b98d-a8a159046a1f', '311 Loma Vista Tr', '', 'Pacifica', 'CA', '94044', '650-283-5007'),
('2023-10-20 04:45:27', '2023', 'Walt', 'Long', 'Walt', 'wlong3@sbcglobal.net', '650-922-9491', '', '', 'KG6', 'EDY', 'None', 'Y', 'General', 21, 'Y', 'c75523b4-8f1f-11ed-b98d-a8a159046a1f', 'c754c960-8f1f-11ed-b98d-a8a159046a1f', '326 Sierra Point Rd.', '', 'Brisbane', 'CA', '94005', '650-922-9491'),
('2023-10-20 04:45:27', '', 'William A.', 'Lillie', 'William', 'billn6bct@gmail.com', '', '', '', 'N6', 'BCT', 'Email', 'Y', 'Extra', 55, 'N', 'c756474b-8f1f-11ed-b98d-a8a159046a1f', 'c755eb27-8f1f-11ed-b98d-a8a159046a1f', '3600 Higgins Canyon Rd.', '', 'Half Moon Bay', 'CA', '94019', '650-726-3630'),
('2023-10-20 04:45:27', '2023', 'Fernel', 'Andong', 'Fernel', 'fernelandong@yahoo.com', '', '', '', 'KM6', 'UYM', 'Email', 'Y', 'Tech', 0, 'Y', 'c757750a-8f1f-11ed-b98d-a8a159046a1f', 'c756ff28-8f1f-11ed-b98d-a8a159046a1f', '365 88th St #2', '', 'Daly City', 'CA', '94015', '650-762-4404'),
('2023-10-20 04:45:27', '', 'William J.', 'Anderson', 'William', 'wja3434@yahoo.com', '650-296-7060', '', '', 'KM6', 'HYK', 'Email', 'Y', 'Tech', 2, 'N', 'c75888e2-8f1f-11ed-b98d-a8a159046a1f', 'c75822d6-8f1f-11ed-b98d-a8a159046a1f', '381 Half Moon Ln #103', '', 'Daly City', 'CA', '94015', '650-296-7060'),
('2023-10-20 04:45:27', '2022:2023:2024:2025:2026', 'George', 'Fenisey', 'George', 'gfenisey@fenisey.com', '', '', '', 'N6', 'GYR', 'Email', 'Y', 'General', 32, 'N', 'c7599a70-8f1f-11ed-b98d-a8a159046a1f', 'c7593f8b-8f1f-11ed-b98d-a8a159046a1f', '399 Holly Ave.', '', 'So. San Francisco', 'CA', '94080', '650-278-2026'),
('2023-10-20 04:45:27', '', 'Lucas', 'Ford', 'Lucas', 'lucas@w6aer.com', '', '', '', 'W6', 'AER', 'Email', 'N', 'None', 0, 'N', 'c75ad968-8f1f-11ed-b98d-a8a159046a1f', 'c75a5f07-8f1f-11ed-b98d-a8a159046a1f', '435 Heathcliff Dr', '', 'Pacifica', 'CA', '94044', ''),
('2023-10-20 04:45:27', '', 'Ben', 'Calvert', 'Ben', 'ben@flyingwalrus.net', '', '', '', 'KN6', 'FUT', 'Email', 'N', 'General', 0, 'N', 'c75c02b7-8f1f-11ed-b98d-a8a159046a1f', 'c75b89ca-8f1f-11ed-b98d-a8a159046a1f', '444 Lewis Ln', '', 'Pacifica', 'CA', '94044', '650-346-6848'),
('2023-10-20 04:45:27', '', 'Charles', 'Tillman', 'Charles', 'KC6CTT@yahoo.com', '', '', '', 'KC6', 'CTT', 'Email', 'N', 'General', 15, 'N', 'c75d159b-8f1f-11ed-b98d-a8a159046a1f', 'c75cadfa-8f1f-11ed-b98d-a8a159046a1f', '446 Oak Lake Ave.', '', 'Santa Rosa', 'CA', '95409', '707-235-7787'),
('2023-10-20 04:45:27', '2023', 'Jackie', 'Lawrence', 'Jackie', '', '', '', '', '', '', 'Email', '', '', NULL, '', '6e5e9a6f-909f-11ed-8f40-a8a159046a1f', 'c75dd8b0-8f1f-11ed-b98d-a8a159046a1f', '508 Cambridge St.', '', 'Belmont', 'CA', '94002', '650 595-2827'),
('2023-10-20 04:45:27', '2023', 'David L.', 'Lawrence', 'Dave', 'kf6tww@gmail.com', '650-703-9279', '', '', 'KF6', 'TWW', 'Email', 'Y', 'General', 23, 'N', 'c75e3dd8-8f1f-11ed-b98d-a8a159046a1f', 'c75dd8b0-8f1f-11ed-b98d-a8a159046a1f', '508 Cambridge St.', '', 'Belmont', 'CA', '94002', '650 595-2827'),
('2023-10-20 04:45:27', '2023', 'Harry', 'Ysselstein', 'Harry', 'hpyhmb@gmail.com', '', '', '', 'N6', 'BHS', 'Email', 'Y', 'Extra', 15, 'Y', 'c75f4e9d-8f1f-11ed-b98d-a8a159046a1f', 'c75ef678-8f1f-11ed-b98d-a8a159046a1f', '526 Highland Ave', '', 'Half Moon Bay', 'CA', '94019', '415-706-6216'),
('2023-10-20 04:45:27', '', 'Derek', 'Dang', 'Derek', 'derekd_94611@sbcglobal.net', '', '', '', 'AF6', 'BT', 'Email', 'N', 'Extra', 10, 'N', 'c760573f-8f1f-11ed-b98d-a8a159046a1f', 'c75ffd4a-8f1f-11ed-b98d-a8a159046a1f', '5838 Pinewood Rd', '', 'Oakland', 'CA', '94611', '510-654-3310'),
('2023-10-20 04:45:27', '2023', 'Ariel', 'Gallega', 'Ariel', 'kj6kob@gmail.com', '415-297-1734', '', '', 'K6', 'RYL', 'Email', 'Y', 'Extra', 23, 'Y', 'c7617077-8f1f-11ed-b98d-a8a159046a1f', 'c76112f0-8f1f-11ed-b98d-a8a159046a1f', '585 Alexis Circle', '', 'Daly City', 'CA', '94014', '415-468-1612'),
('2023-10-20 04:45:27', '2023', 'Michael G.', 'Bevington', 'Michael', 'mike_bevington@pacbell.net', '650-922-6847', '', '', 'AA6', 'XL', 'Email', 'N', 'Extra', 30, 'N', 'c7628bbe-8f1f-11ed-b98d-a8a159046a1f', 'c7622dfe-8f1f-11ed-b98d-a8a159046a1f', '612 Montezuma Dr.', '', 'Pacifica', 'CA', '94044', '650 359-5194'),
('2023-10-20 04:45:27', '2023', 'Paul', 'Atkins', 'Paul', 'pvatkins@pacbell.net', '415-810-9152', '', '', 'AI6', 'BB', 'Email', 'Y', 'Extra', 5, 'N', 'c763a90e-8f1f-11ed-b98d-a8a159046a1f', 'c7634dd4-8f1f-11ed-b98d-a8a159046a1f', '637 Sharp Park Rd.', '', 'Pacifica', 'CA', '94044', '650 355-6597'),
('2023-10-20 04:45:27', '2023', 'Georgia', 'Grant', 'Georgia', 'grantg@pacbell.net', '', '', '', 'KE6', 'KRT', 'Email', 'Y', 'Tech', 26, 'N', 'c76453c1-8f1f-11ed-b98d-a8a159046a1f', 'c7634dd4-8f1f-11ed-b98d-a8a159046a1f', '637 Sharp Park Rd.', '', 'Pacifica', 'CA', '94044', '650 355-6597'),
('2023-10-20 04:45:27', '2023', 'Tom', 'Oliver', 'Tom', 'toliver0557@gmail.com', '650-303-6980', '', '', 'KJ6', 'OGL', 'Email', 'Y', 'Tech', 8, 'Y', 'c76576d8-8f1f-11ed-b98d-a8a159046a1f', 'c76507d7-8f1f-11ed-b98d-a8a159046a1f', '72 Lighthouse Lane', '', 'Daly City', 'CA', '94014', '650-303-6980'),
('2023-10-20 04:45:27', '', 'Don R.', 'Corral', 'Don', 'firelectric.don@gmail.com', '', '', '', 'KK6', 'JJX', 'Email', 'Y', 'None', 0, 'N', 'c7668dc5-8f1f-11ed-b98d-a8a159046a1f', 'c766339d-8f1f-11ed-b98d-a8a159046a1f', '720 Edgemar Ave', '', 'Pacifica', 'CA', '94044', '415-971-8528'),
('2023-10-20 04:45:27', '', 'Carmel', 'Gallagher', 'Carmel', 'tlcperrn@sbcglobal.net', '650-670-2322', '', '', 'KJ6', 'ERS', 'Email', 'N', 'Tech', 6, 'Y', 'c767ad2f-8f1f-11ed-b98d-a8a159046a1f', 'c7674f8f-8f1f-11ed-b98d-a8a159046a1f', '728 Moana Way', '', 'Pacifica', 'CA', '94044', '650-670-2322'),
('2023-10-20 04:45:27', '2023:2024:2025', 'Gary', 'Barnes', 'Gary', 'ki6hig@earthlink.net', '650-553-8649', '', '', 'KI6', 'HIG', 'Email', 'Y', 'Extra', 15, 'N', 'c768c29f-8f1f-11ed-b98d-a8a159046a1f', 'c7685e10-8f1f-11ed-b98d-a8a159046a1f', '75 Perry St. Apt. 119', '', 'Redwood City', 'CA', '94063', '650-368-0485'),
('2023-10-20 04:45:27', '2023', 'Zoe', 'Kersteen-Tucker', 'Zoe', 'kersteentucker@gmail.com', '', '', '', 'KI6', 'DRM', 'Email', 'Y', 'Tech', 12, 'N', 'c769dfc9-8f1f-11ed-b98d-a8a159046a1f', 'c76981d0-8f1f-11ed-b98d-a8a159046a1f', '776 Buena Vista St.', '', 'Moss Beach', 'CA', '94038-9717', '650-728-2823'),
('2023-10-20 04:45:27', '2023', 'George H.', 'Tucker', 'George', 'george.e.tucker@att.net', '650-766-2628', '', '', 'W6', 'HAF', 'Email', 'Y', 'General', 13, 'N', 'c76a9954-8f1f-11ed-b98d-a8a159046a1f', 'c76981d0-8f1f-11ed-b98d-a8a159046a1f', '776 Buena Vista St.', '', 'Moss Beach', 'CA', '94038-9717', '650-728-2823'),
('2023-10-20 04:45:27', '', 'Victor M.', 'Munoz', 'Victor', 'sifu_victor@yahoo.com', '650-278-7626', '', '', 'KB6', 'LGZ', 'Email', 'N', 'General', 39, 'N', 'c76bd6c7-8f1f-11ed-b98d-a8a159046a1f', 'c76b6ae5-8f1f-11ed-b98d-a8a159046a1f', '830 Skyline Dr.', '', 'Daly City', 'CA', '95015', '650-278-7626'),
('2023-10-20 04:45:27', '2023', 'Vernon', 'Patterson', 'Vernon', 'donpatterson@sbcglobal.net', '', '', '', 'W6', 'VJJ', 'Email', 'N', 'Advanced', 73, 'N', 'c76cf339-8f1f-11ed-b98d-a8a159046a1f', 'c76c8128-8f1f-11ed-b98d-a8a159046a1f', '905 Bancroft Ave.', '', 'Half Moon Bay', 'CA', '94019', '650 726-4282'),
('2023-10-20 04:45:27', '2023', 'Dan', 'Bernstein', 'Dan', 'n6zen@arrl.net', '', '', '', 'N6', 'ZEN', 'Email', 'Y', 'Extra', 12, 'N', 'c76e0dd2-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Emily', 'Bernstein', 'Emily', '', '', '', '', 'KK6', 'FOI', 'Email', 'N', 'Tech', 8, 'N', 'c76f918d-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Anna', 'Bernstein', 'Anna', '', '', '', '', 'KJ6', 'FHQ', 'Email', 'N', 'Tech', 6, 'N', 'c7705694-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Tricia', 'Dell', 'Tricia', '', '', '', '', 'KC6', 'LCA', 'Email', 'N', 'Tech', 10, 'N', 'c77108bf-8f1f-11ed-b98d-a8a159046a1f', 'c76db140-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 1236', '', 'El Granada', 'CA', '94018', '650-867-5273'),
('2023-10-20 04:45:27', '2023', 'Ralph', 'Kugler', 'Ralph', 'kc6ydh@arrl.net', '415-806-0372', '', '', 'KC6', 'YDH', 'Email', 'Y', 'General', 29, 'N', 'c7722181-8f1f-11ed-b98d-a8a159046a1f', 'c771b24a-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 2209', '', 'Daly City', 'CA', '94017', '650-731-8229'),
('2023-10-20 04:45:27', '', 'Roy', 'Brixen', 'Roy', 'rebrixen@well.com', '650-504-0777', '', '', 'KE6', 'MNJ', 'Email', 'Y', 'General', 20, 'N', 'c7735df0-8f1f-11ed-b98d-a8a159046a1f', 'c772ec0a-8f1f-11ed-b98d-a8a159046a1f', 'P.O. Box 699', '', 'Pescadero', 'CA', '94060', '650 879-1978'),
('2023-10-20 04:45:27', '', 'Chris(Eze)', 'Icide', 'Chris', 'chris@netgeeks.net', '650-576-2975', '', '', 'WY7', 'W', 'Email', 'Y', 'Extra', 2, 'N', 'c7749204-8f1f-11ed-b98d-a8a159046a1f', 'c7743496-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 128', '', 'Joyce', 'WA', '94038', '360-928-0130'),
('2023-10-20 04:45:27', '2023', 'David', 'Conroy', 'Dave', 'dgcx@icloud.com', '650-483-5156', '', '', 'K6', 'NIA', 'Email', 'Y', 'Extra', 5, 'N', 'c775ae43-8f1f-11ed-b98d-a8a159046a1f', 'c775564c-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 1346', '', 'El Granada', 'CA', '94018', '650-728-1424'),
('2023-10-20 04:45:27', '2023', 'John', 'Owens', 'John', 'john@nn6u.net', '415-250-5634', '', '', 'NN6', 'U', 'Email', 'Y', 'Extra', 3, 'N', 'c776c5d7-8f1f-11ed-b98d-a8a159046a1f', 'c7765c1b-8f1f-11ed-b98d-a8a159046a1f', 'PO Box 370639', '', 'Montara', 'CA', '94037', '415-250-5634'),
('2023-10-20 04:45:27', '', 'Andy', 'Calman', 'Andy', 'acalmanmd@gmail.com', '650-270-9683', '', '', 'K6', 'ZP', 'Email', 'Y', 'Extra', 1, 'N', 'c777da5c-8f1f-11ed-b98d-a8a159046a1f', 'c7777f8f-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 371203', '', 'Montara', 'CA', '94037', '650-270-9683'),
('2023-10-20 04:45:27', '2023', 'Dan', 'Reid', 'Dan', 'n6dbr@dbr.fastmail.fm', '', '', '', 'N6', 'DBR', 'Email', 'N', 'General', 9, 'Y', 'c779016f-8f1f-11ed-b98d-a8a159046a1f', 'c77893fb-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 371537', '', 'Montara', 'CA', '94037', '650-776-3445'),
('2023-10-20 04:45:27', '', 'Rudy', 'Gaoay', 'Rudy', 'n6doz@arrl.net', '415-410-1053', '', '', 'N6', 'DOZ', 'Email', 'Y', 'General', 2, 'N', 'c77a301f-8f1f-11ed-b98d-a8a159046a1f', 'c779c43b-8f1f-11ed-b98d-a8a159046a1f', 'Po Box 5040', '', 'So. San Francisco', 'CA', '94083', '415-410-1053'),
('2023-10-20 04:45:27', '2023', 'Dennis', 'Kafka', 'Dennis', 'kjjkafka@sbcglobal.net', '650-898-2847', '', '', 'KN6', 'QER', 'Email', 'Y', 'General', 0, 'N', 'c72c7747-8f1f-11ed-b98d-a8a159046a1f', 'ce88b915-9b56-11ed-9cb3-a8a159046a1f', '1311 Redwood Way', '', 'Pacifica', 'CA', '94044', '650-355-7852'),
('2023-10-20 04:45:27', '2023', 'Bharat', 'Bailur', 'Bharat', 'bharatbailur@hotmail.com', '551-444-8015', '', '', 'W2', 'OKB', 'Email', 'N', 'Tech', 4, 'N', 'e1703f7e-d981-11ed-b8e5-0242ac110002', 'e1705a08-d981-11ed-b8e5-0242ac110002', '6 Disbrow Ct', '', 'East Brunswick', 'NJ', '08816', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CARCMBRLST_202310177`
--
ALTER TABLE `CARCMBRLST_202310177`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `carctb`
--
ALTER TABLE `carctb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pay12`
--
ALTER TABLE `pay12`
  ADD UNIQUE KEY `myindex` (`myindex`);

--
-- Indexes for table `payments1`
--
ALTER TABLE `payments1`
  ADD PRIMARY KEY (`seq`);

--
-- Indexes for table `pp_tnx`
--
ALTER TABLE `pp_tnx`
  ADD PRIMARY KEY (`myindex`),
  ADD UNIQUE KEY `myindex` (`myindex`),
  ADD UNIQUE KEY `pp_id` (`pp_id`),
  ADD UNIQUE KEY `pp_id_2` (`pp_id`),
  ADD UNIQUE KEY `pp_orderID` (`pp_orderID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pay12`
--
ALTER TABLE `pay12`
  MODIFY `myindex` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `payments1`
--
ALTER TABLE `payments1`
  MODIFY `seq` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pp_tnx`
--
ALTER TABLE `pp_tnx`
  MODIFY `myindex` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=456;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
