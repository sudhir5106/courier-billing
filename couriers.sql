-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2017 at 03:42 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `couriers`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_master`
--

CREATE TABLE `area_master` (
  `Area_Id` smallint(6) NOT NULL,
  `Area_Code` varchar(20) NOT NULL,
  `Area_Name` varchar(50) NOT NULL,
  `Destination_Id` smallint(6) NOT NULL,
  `Branch_Id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area_master`
--

INSERT INTO `area_master` (`Area_Id`, `Area_Code`, `Area_Name`, `Destination_Id`, `Branch_Id`) VALUES
(1, '1', 'CIVIL LINES', 1053, 4),
(2, '2', 'NEW SHANTI NAGAR', 1053, 4),
(3, '3', 'nahru nagar', 1, 5),
(4, '11', 'bhilai 3', 1, 7),
(5, '3', 'Sunder Nagar', 1053, 4),
(6, '4', 'Devendra Nagar', 1053, 4),
(7, '11', 'abp', 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `branch_master`
--

CREATE TABLE `branch_master` (
  `Branch_Id` smallint(6) NOT NULL,
  `Branch_Code` varchar(20) NOT NULL,
  `Branch_Name` varchar(50) NOT NULL,
  `Branch_Type` tinyint(4) NOT NULL,
  `Within_State` tinyint(4) NOT NULL,
  `Destination_Id` smallint(6) NOT NULL,
  `Hub_Id` tinyint(4) NOT NULL,
  `Contact_Person` varchar(50) NOT NULL,
  `Address1` varchar(50) NOT NULL,
  `Address2` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Pin_Code` varchar(6) NOT NULL,
  `Pan_No` varchar(10) NOT NULL,
  `ServTax_No` varchar(20) NOT NULL,
  `Phone_No` varchar(11) NOT NULL,
  `Mobile_No` varchar(11) NOT NULL,
  `Email` varchar(35) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Insurance` float DEFAULT NULL,
  `Fuel_Ser_Chg` float DEFAULT NULL,
  `Otc_Chg` float DEFAULT NULL,
  `Agent_Del_Chg` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_master`
--

INSERT INTO `branch_master` (`Branch_Id`, `Branch_Code`, `Branch_Name`, `Branch_Type`, `Within_State`, `Destination_Id`, `Hub_Id`, `Contact_Person`, `Address1`, `Address2`, `City`, `Pin_Code`, `Pan_No`, `ServTax_No`, `Phone_No`, `Mobile_No`, `Email`, `Password`, `Insurance`, `Fuel_Ser_Chg`, `Otc_Chg`, `Agent_Del_Chg`) VALUES
(4, 'RAI', 'RAIPUR', 1, 1, 1053, 14, 'Suresh Prasad Keshri', 'GF-1, Ajit Tower, Ramsagar Para,', 'Near Sindhi School', 'RAIPUR', '492001', 'AKOPK4791N', '9302938319', '07714282419', '5657657656', 'keshri_suresh@yahoo.co.in', '123456', 0, 0, 0, 0),
(5, 'BHIL', 'BHILAI', 1, 1, 154, 13, 'Rajeev Prasad', '268 First Floor, Dhillon Complex,', 'Supela', 'BHILAI', '490023', 'AEJPC5121R', '', '07714032615', '9303340016', 'rajeev_odc@rediffmail.com', '123456', 0, 0, 0, 0),
(6, 'ABP', 'AMBIKAPUR', 1, 1, 3, 17, 'dfdg', 'Ambikapur', 'ghjghjgh', 'ghjhg', '123456', '', '', '3543543564', '5657657656', 'fdfdjhg@gmail.com', '123456', 0, 0, 0, 0),
(7, 'BHI', 'BHILAI3', 1, 1, 1, 9, 'dfdg', 'bhilai', '3', 'ghjhg', '123456', '', '', '3543543564', '5657657656', 'fdfdjhg@gmail.com', '123456', 0, 0, 0, 0),
(8, 'BHL', 'BHILWARA', 1, 1, 158, 9, 'dfdg', 'bhilwara', 'ghjghjgh', 'ghjhg', '123456', '', '', '3543543564', '5657657656', 'fdfdjhg@gmail.com', '123456', 0, 0, 0, 0),
(9, 'DEL', 'DELHI', 1, 0, 319, 3, 'dfgdg', 'fdgdg', 'ghfh', 'ghfh', '545646', 'hgfhgf', 'gfhf', '43653673777', '36472423777', 'fsdgg@gmail.com', '123456', 0, 0, 0, 0),
(10, 'Supela', 'Supela', 1, 1, 154, 13, 'sdgfd', 'dfhgfhd', 'fghgf', 'fghf', '354354', 'gfj', 'hjgj', '3425345434', '45346564564', 'gfjfj@gmail.com', '123456', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cons_track`
--

CREATE TABLE `cons_track` (
  `Track_Id` smallint(6) NOT NULL,
  `Consignment_No` varchar(20) NOT NULL,
  `From_Des` smallint(6) DEFAULT NULL,
  `To_Des` smallint(6) NOT NULL,
  `Rec_Date` datetime NOT NULL,
  `Branch_Id` smallint(6) NOT NULL,
  `Status` tinyint(4) DEFAULT '0' COMMENT '1 for outscan and 0 for inscan',
  `Delivery_Id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cons_track`
--

INSERT INTO `cons_track` (`Track_Id`, `Consignment_No`, `From_Des`, `To_Des`, `Rec_Date`, `Branch_Id`, `Status`, `Delivery_Id`) VALUES
(1, '111111', NULL, 154, '2015-04-15 00:00:00', 5, 0, NULL),
(2, '111112', NULL, 154, '2015-04-15 00:00:00', 5, 0, NULL),
(3, '111113', NULL, 154, '2015-04-15 00:00:00', 5, 0, NULL),
(4, '111114', NULL, 154, '2015-04-15 00:00:00', 5, 0, NULL),
(5, '111115', NULL, 154, '2015-04-15 00:00:00', 5, 0, NULL),
(8, '111111', 154, 158, '2015-04-15 00:00:00', 5, 1, NULL),
(9, '111112', 154, 158, '2015-04-15 00:00:00', 5, 1, NULL),
(10, '111113', 154, 158, '2015-04-15 00:00:00', 5, 1, NULL),
(11, '111114', 154, 158, '2015-04-15 00:00:00', 5, 1, NULL),
(12, '111115', 154, 158, '2015-04-15 00:00:00', 5, 1, NULL),
(13, '111111', 154, 158, '2015-04-15 00:00:00', 8, 0, NULL),
(14, '111112', 154, 158, '2015-04-15 00:00:00', 8, 0, NULL),
(15, '111113', 154, 158, '2015-04-15 00:00:00', 8, 0, NULL),
(16, '111114', 154, 158, '2015-04-15 00:00:00', 8, 0, NULL),
(17, '111115', 154, 158, '2015-04-15 00:00:00', 8, 0, NULL),
(20, '111111', 158, 1053, '2015-04-16 00:00:00', 8, 1, NULL),
(21, '111112', 158, 1053, '2015-04-16 00:00:00', 8, 1, NULL),
(22, '111113', 158, 1053, '2015-04-16 00:00:00', 8, 1, NULL),
(23, '111114', 158, 1053, '2015-04-16 00:00:00', 8, 1, NULL),
(24, '111115', 158, 1053, '2015-04-16 00:00:00', 8, 1, NULL),
(41, '111111', 158, 1053, '2015-04-16 00:00:00', 4, 0, NULL),
(42, '111112', 158, 1053, '2015-04-16 00:00:00', 4, 0, NULL),
(43, '111113', 158, 1053, '2015-04-16 00:00:00', 4, 0, NULL),
(44, '111114', 158, 1053, '2015-04-16 00:00:00', 4, 0, NULL),
(45, '111115', 158, 1053, '2015-04-16 00:00:00', 4, 0, NULL),
(46, '111111', 1053, 1, '2015-04-16 17:47:43', 4, 1, NULL),
(47, '111112', 1053, 1, '2015-04-16 17:47:50', 4, 1, NULL),
(48, '111113', 1053, 1, '2015-04-16 17:47:56', 4, 1, NULL),
(49, '111111', 158, 1053, '2015-04-16 13:53:07', 4, 0, NULL),
(50, '111112', 158, 1053, '2015-04-16 13:53:08', 4, 0, NULL),
(51, '111113', 158, 1053, '2015-04-16 13:53:08', 4, 0, NULL),
(52, '111114', 158, 1053, '2015-04-16 13:53:09', 4, 0, NULL),
(53, '111115', 158, 1053, '2015-04-16 13:53:10', 4, 0, NULL),
(56, '100001', NULL, 1053, '2015-05-11 15:41:46', 4, 0, NULL),
(57, '100002', NULL, 1053, '2015-05-11 15:41:58', 4, 0, NULL),
(58, '100003', NULL, 1053, '2015-05-11 15:41:59', 4, 0, NULL),
(59, '100004', NULL, 1053, '2015-05-11 15:42:00', 4, 0, NULL),
(60, '100005', NULL, 1053, '2015-05-11 15:42:04', 4, 0, NULL),
(63, '100001', 1053, 154, '2015-05-11 15:51:43', 4, 1, NULL),
(64, '100002', 1053, 154, '2015-05-11 15:51:50', 4, 1, NULL),
(65, '100003', 1053, 154, '2015-05-11 15:51:56', 4, 1, NULL),
(66, '100004', 1053, 154, '2015-05-11 15:52:09', 4, 1, NULL),
(67, '100005', 1053, 154, '2015-05-11 15:52:18', 4, 1, NULL),
(70, '100001', 1053, 154, '2015-05-11 16:10:08', 5, 0, NULL),
(71, '100002', 1053, 154, '2015-05-11 16:10:13', 5, 0, NULL),
(72, '100003', 1053, 154, '2015-05-11 16:10:17', 5, 0, NULL),
(73, '100004', 1053, 154, '2015-05-11 16:10:21', 5, 0, NULL),
(74, '100005', 1053, 154, '2015-05-11 16:10:25', 5, 0, NULL),
(98, '100001', 154, 3, '2015-05-11 16:33:15', 5, 1, NULL),
(99, '100002', 154, 3, '2015-05-11 16:33:27', 5, 1, NULL),
(100, '100003', 154, 3, '2015-05-11 16:33:43', 5, 1, NULL),
(101, '100004', 154, 3, '2015-05-11 16:33:49', 5, 1, NULL),
(102, '100005', 154, 3, '2015-05-11 16:33:56', 5, 1, NULL),
(105, '100001', 154, 3, '2015-05-11 16:33:15', 6, 0, NULL),
(106, '100002', 154, 3, '2015-05-11 16:33:27', 6, 0, NULL),
(107, '100003', 154, 3, '2015-05-11 16:33:43', 6, 0, NULL),
(108, '100004', 154, 3, '2015-05-11 16:33:49', 6, 0, NULL),
(109, '100005', 154, 3, '2015-05-11 16:33:56', 6, 0, NULL),
(112, '100001', 3, 1, '2015-05-11 17:03:35', 6, 1, NULL),
(113, '100002', 3, 1, '2015-05-11 17:03:45', 6, 1, NULL),
(114, '100003', 3, 1, '2015-05-11 17:03:52', 6, 1, NULL),
(115, '100004', 3, 1, '2015-05-11 17:03:58', 6, 1, NULL),
(116, '100005', 3, 1, '2015-05-11 17:04:06', 6, 1, NULL),
(119, '100001', 3, 1, '2015-05-11 17:03:35', 7, 0, NULL),
(120, '100002', 3, 1, '2015-05-11 17:03:45', 7, 0, NULL),
(121, '100003', 3, 1, '2015-05-11 17:03:52', 7, 0, NULL),
(122, '100004', 3, 1, '2015-05-11 17:03:58', 7, 0, NULL),
(123, '100005', 3, 1, '2015-05-11 17:04:06', 7, 0, NULL),
(140, '100001', 1, 1, '2015-05-14 23:59:20', 7, 2, 122),
(141, '100002', 1, 1, '2015-05-14 23:59:21', 7, 2, 123),
(142, '100003', 1, 1, '2015-05-14 23:59:21', 7, 2, 124),
(143, '100004', 1, 1, '2015-05-14 23:59:22', 7, 2, 125),
(144, '100005', 1, 1, '2015-05-14 23:59:24', 7, 2, 126),
(147, '100001', 1, 1, '2015-05-15 00:01:35', 7, 2, 129),
(148, '100001', 1, 1, '2015-05-15 00:05:14', 7, 2, 130),
(149, '100002', 1, 1, '2015-05-15 18:25:41', 7, 2, 131),
(164, '200001', NULL, 1053, '2015-06-24 17:41:07', 4, 0, NULL),
(165, '200002', NULL, 1053, '2015-06-24 17:41:08', 4, 0, NULL),
(166, '200003', NULL, 1053, '2015-06-24 17:41:09', 4, 0, NULL),
(167, '200004', NULL, 1053, '2015-06-24 17:41:10', 4, 0, NULL),
(168, '200005', NULL, 1053, '2015-06-24 17:41:12', 4, 0, NULL),
(171, '200001', 1053, 1053, '2015-06-24 23:12:04', 4, 2, 132),
(172, '200002', 1053, 1053, '2015-06-24 23:12:06', 4, 2, 133),
(173, '200003', 1053, 1053, '2015-06-24 23:12:07', 4, 2, 134),
(174, '200004', 1053, 1053, '2015-06-24 23:12:09', 4, 2, 135),
(175, '200005', 1053, 1053, '2015-06-24 23:12:10', 4, 2, 136),
(178, '200005', 1053, 1053, '2015-06-24 23:33:36', 4, 2, 139),
(179, '200004', 1053, 1053, '2015-06-24 23:34:14', 4, 2, 140),
(180, '200004', 1053, 154, '2015-06-24 18:05:17', 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE `customer_master` (
  `Customer_Id` mediumint(8) UNSIGNED NOT NULL,
  `Customer_Code` varchar(20) NOT NULL,
  `Branch_Id` smallint(6) NOT NULL,
  `Customer_Type` tinyint(4) NOT NULL,
  `Location` varchar(50) NOT NULL,
  `Applicants_Type` tinyint(4) NOT NULL,
  `Franchisee_Entity_Name` varchar(50) NOT NULL,
  `Business_Address` varchar(300) NOT NULL,
  `Service_Tax` varchar(20) NOT NULL,
  `Customer_Name` varchar(50) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Education` varchar(100) NOT NULL,
  `Qualification` varchar(100) NOT NULL,
  `Residential_Address` varchar(300) NOT NULL,
  `Father_Wife_Name` varchar(50) NOT NULL,
  `Pan_No` varchar(20) NOT NULL,
  `Contact_No` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Person_Name` varchar(50) NOT NULL,
  `Contract_Date` date NOT NULL,
  `Rnewal_Date` date NOT NULL,
  `Remark` varchar(50) NOT NULL,
  `Nature_Of_Present_Business` varchar(50) DEFAULT NULL,
  `Number_Of_Employees_Deployed` varchar(15) NOT NULL,
  `Number_Of_Vehicles_Deployed` varchar(15) NOT NULL,
  `Present_Turnover` varchar(50) NOT NULL,
  `Bank_NAME` varchar(40) NOT NULL,
  `Branch_Name` varchar(30) NOT NULL,
  `Account_No` varchar(20) NOT NULL,
  `IFSC_Code` varchar(20) NOT NULL,
  `Reference_Name_1` varchar(50) DEFAULT NULL,
  `Reference_Address_1` varchar(150) DEFAULT NULL,
  `Reference_Contact_1` varchar(15) DEFAULT NULL,
  `Reference_Name_2` varchar(50) DEFAULT NULL,
  `Reference_Address_2` varchar(150) DEFAULT NULL,
  `Reference_Contact_2` varchar(15) DEFAULT NULL,
  `Pan_Img` varchar(100) DEFAULT NULL,
  `Passport_Copy` varchar(100) DEFAULT NULL,
  `Driving_Licence_Img` varchar(100) DEFAULT NULL,
  `Reg_Certificate` varchar(100) DEFAULT NULL,
  `Aadhaar_Card_Img` varchar(100) DEFAULT NULL,
  `Voter_ID_Img` varchar(100) DEFAULT NULL,
  `Telephone_Bill_img` varchar(100) DEFAULT NULL,
  `Passport_Photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_master`
--

INSERT INTO `customer_master` (`Customer_Id`, `Customer_Code`, `Branch_Id`, `Customer_Type`, `Location`, `Applicants_Type`, `Franchisee_Entity_Name`, `Business_Address`, `Service_Tax`, `Customer_Name`, `Date_Of_Birth`, `Education`, `Qualification`, `Residential_Address`, `Father_Wife_Name`, `Pan_No`, `Contact_No`, `Email`, `Person_Name`, `Contract_Date`, `Rnewal_Date`, `Remark`, `Nature_Of_Present_Business`, `Number_Of_Employees_Deployed`, `Number_Of_Vehicles_Deployed`, `Present_Turnover`, `Bank_NAME`, `Branch_Name`, `Account_No`, `IFSC_Code`, `Reference_Name_1`, `Reference_Address_1`, `Reference_Contact_1`, `Reference_Name_2`, `Reference_Address_2`, `Reference_Contact_2`, `Pan_Img`, `Passport_Copy`, `Driving_Licence_Img`, `Reg_Certificate`, `Aadhaar_Card_Img`, `Voter_ID_Img`, `Telephone_Bill_img`, `Passport_Photo`) VALUES
(1, 'CUST-001', 4, 2, '', 1, 'dfs', '  ', '', 'sdfsd', '2015-04-07', '', '  ', 'dsfs', ' dgfdg', ' ', '5346456455', ' fdhgfdh@gmail.com', 'dfdsf', '2015-04-14', '2016-04-14', '', '', ' ', ' ', ' ', '', ' ', '  ', ' ', '  ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', '', '', ''),
(2, 'CUST-001', 4, 2, '', 1, 'dfs', '  ', '', 'sdfsd', '2015-04-07', '', '  ', 'dsfs', ' dgfdg', ' ', '5346456455', ' fdhgfdh@gmail.com', 'dfdsf', '2015-04-14', '2016-04-14', '', '', ' ', ' ', ' ', '', ' ', '  ', ' ', '  ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', '', '', ''),
(3, 'CUST-101', 4, 2, '', 1, 'dfs', '  ', '', 'sdfsd', '2015-04-07', '', '  ', 'dsfs', ' dgfdg', ' ', '5346456455', ' fdhgfdh@gmail.com', 'dfdsf', '2015-04-14', '2016-04-14', '', '', ' ', ' ', ' ', '', ' ', '  ', ' ', '  ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', '', '', ''),
(5, 'CUST-102', 4, 2, '', 1, 'dfs', '  ', '', 'sdfsd', '2015-04-07', '', '  ', 'dsfs', ' dgfdg', ' ', '5346456455', ' fdhgfdh@gmail.com', 'dfdsf', '2015-04-14', '2016-04-14', '', '', ' ', ' ', ' ', '', ' ', '  ', ' ', '  ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', '', '', ''),
(6, 'CUST-103', 5, 2, '', 1, 'dfs', '  ', '', 'sdfsd', '2015-04-07', '', '  ', 'dsfs', ' dgfdg', ' ', '5346456455', ' fdhgfdh@gmail.com', 'dfdsf', '2015-04-14', '2016-04-14', '', '', ' ', ' ', ' ', '', ' ', '  ', ' ', '  ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', '', '', ''),
(11, 'CUST-104', 4, 2, '', 1, 'dfs', '  ', '', 'sdfsd', '2015-04-07', '', '  ', 'dsfs', ' dgfdg', ' ', '5346456455', ' fdhgfdh@gmail.com', 'dfdsf', '2015-04-14', '2016-04-14', '', '', ' ', ' ', ' ', '', ' ', '  ', ' ', '  ', ' ', ' ', ' ', ' ', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cust_consignment`
--

CREATE TABLE `cust_consignment` (
  `Detail_Id` mediumint(8) UNSIGNED NOT NULL,
  `Customer_Id` mediumint(8) UNSIGNED DEFAULT NULL,
  `Consignment_Id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cust_consignment`
--

INSERT INTO `cust_consignment` (`Detail_Id`, `Customer_Id`, `Consignment_Id`) VALUES
(1, 2, 1216),
(2, 2, 1217),
(3, 2, 1218),
(4, 2, 1219),
(5, 2, 1220),
(116, 1, 1267),
(117, 1, 1268),
(118, 1, 1269),
(119, 1, 1270),
(120, 1, 1271),
(123, 1, 1267),
(124, 1, 1268),
(125, 1, 1269),
(126, 1, 1270),
(127, 1, 1271),
(145, NULL, 1288),
(146, NULL, 1289),
(147, NULL, 1290),
(148, NULL, 1291),
(149, NULL, 1292),
(182, NULL, 1288),
(183, NULL, 1289),
(184, NULL, 1290),
(185, NULL, 1291),
(186, NULL, 1292),
(197, NULL, 1288),
(198, NULL, 1289),
(199, NULL, 1290),
(200, NULL, 1291),
(201, NULL, 1292),
(212, 2, 1321),
(213, 2, 1322),
(214, 2, 1323),
(215, 2, 1324),
(216, 2, 1325),
(217, 2, 1326),
(218, 2, 1327),
(219, 2, 1328),
(220, 2, 1329),
(221, 2, 1330),
(222, 2, 1331),
(228, 2, 1322),
(229, 2, 1323),
(230, 2, 1324),
(231, 2, 1325),
(232, 2, 1326),
(233, 2, 1327),
(234, 2, 1328),
(235, 2, 1329),
(236, 2, 1330),
(237, 2, 1331),
(259, 3, 1362),
(260, 3, 1363),
(261, 3, 1364),
(262, 3, 1365),
(263, 3, 1366),
(264, 3, 1367),
(265, 3, 1368),
(266, 3, 1369),
(267, 3, 1370),
(268, 3, 1371),
(342, NULL, 1392),
(343, NULL, 1393),
(344, NULL, 1394),
(345, NULL, 1395),
(346, NULL, 1396),
(347, NULL, 1397),
(348, NULL, 1398),
(349, NULL, 1399),
(350, NULL, 1400),
(351, NULL, 1401),
(352, NULL, 1402),
(375, 2, 1429),
(376, 2, 1430),
(377, 2, 1431),
(378, 2, 1432),
(379, 2, 1433),
(475, NULL, 1),
(476, NULL, 2),
(477, NULL, 3),
(478, NULL, 4),
(479, NULL, 5),
(480, 5, 1512),
(481, 5, 1513),
(482, 5, 1514),
(483, 5, 1515),
(484, 5, 1516),
(497, 3, 1530),
(498, 3, 1531),
(499, 3, 1532),
(500, 3, 1533),
(501, 3, 1534),
(502, 3, 1535),
(503, 3, 1536),
(504, 3, 1537),
(505, 3, 1538),
(506, 3, 1539),
(507, 3, 1540),
(508, 3, 1541),
(509, 3, 1542),
(510, 3, 1543),
(511, 3, 1544),
(512, 3, 1545),
(513, 3, 1546),
(514, 3, 1547),
(515, 3, 1548),
(516, 3, 1549),
(517, 3, 1550),
(518, 3, 1551),
(519, 3, 1552),
(520, 3, 1553),
(548, 2, 1555),
(549, 2, 1556),
(550, 2, 1557),
(551, 2, 1558),
(552, 2, 1559),
(553, 2, 1560),
(554, 2, 1561),
(555, 2, 1562),
(556, 2, 1563),
(557, 2, 1564),
(558, 2, 1565),
(559, 2, 1566),
(560, 2, 1567),
(561, 2, 1568),
(562, 2, 1569),
(563, 2, 1570),
(564, 2, 1571),
(565, 2, 1572),
(566, 1, 1573),
(567, 1, 1574),
(568, 1, 1575),
(569, 1, 1576),
(570, 1, 1577),
(571, 1, 1578),
(586, 6, 1669),
(587, 6, 1670),
(588, 6, 1671),
(589, 6, 1672),
(590, 6, 1673),
(591, NULL, 1707),
(592, NULL, 1708),
(593, NULL, 1709),
(594, NULL, 1710),
(595, NULL, 1711),
(596, NULL, 1768),
(597, NULL, 1769),
(598, NULL, 1770),
(599, NULL, 1771),
(600, NULL, 1772);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_consignment`
--

CREATE TABLE `delivery_consignment` (
  `Delivery_Id` int(10) UNSIGNED NOT NULL,
  `Sheet_Id` int(10) UNSIGNED NOT NULL,
  `Consignment_No` varchar(20) NOT NULL,
  `Area_Id` smallint(6) NOT NULL,
  `Consignee` varchar(75) NOT NULL,
  `Address` varchar(125) NOT NULL,
  `Delivered` tinyint(4) NOT NULL DEFAULT '0',
  `Rto_Id` tinyint(4) DEFAULT NULL,
  `RTO` tinyint(4) DEFAULT '0' COMMENT '1 for rto',
  `Sheet_Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_consignment`
--

INSERT INTO `delivery_consignment` (`Delivery_Id`, `Sheet_Id`, `Consignment_No`, `Area_Id`, `Consignee`, `Address`, `Delivered`, `Rto_Id`, `RTO`, `Sheet_Date`) VALUES
(1, 14, '1', 2, 'fdgf', 'ghgj', 0, 10, 0, '2015-04-03 13:36:57'),
(2, 14, '2', 2, 'fdgf', 'ghgj', 1, NULL, 0, '2015-04-03 13:36:58'),
(3, 14, '3', 2, 'fdgf', 'ghgj', 0, 11, 0, '2015-04-03 13:36:58'),
(4, 14, '4', 2, 'fdgf', 'ghgj', 0, 10, 0, '2015-04-03 13:36:59'),
(5, 14, '5', 2, 'fdgf', 'ghgj', 1, NULL, 0, '2015-04-03 13:37:00'),
(6, 14, '6', 2, 'fdgf', 'ghgj', 0, NULL, 0, '2015-04-03 13:37:01'),
(8, 15, '7', 2, 'fhgh', 'gfjf', 0, NULL, 0, '2015-04-03 13:39:34'),
(9, 15, '8', 2, 'fhgh', 'gfjf', 0, NULL, 0, '2015-04-03 13:39:35'),
(10, 15, '9', 2, 'fhgh', 'gfjf', 0, NULL, 0, '2015-04-03 13:39:36'),
(11, 15, '10', 2, 'fhgh', 'gfjf', 0, NULL, 0, '2015-04-03 13:39:41'),
(12, 15, '7', 2, 'fhgh', 'gfhjhgkjhkjhkhghhh', 0, 10, 0, '2015-04-03 13:39:56'),
(15, 16, '11', 1, 'erew', 'rtgrytrutyu', 0, NULL, 0, '2015-04-03 13:54:33'),
(16, 16, '12', 1, 'erew', 'ter', 0, NULL, 0, '2015-04-03 13:55:16'),
(17, 16, '13', 1, 'erew', 'ter', 0, NULL, 0, '2015-04-03 13:56:29'),
(18, 16, '14', 1, 'erew', 'ter', 0, NULL, 0, '2015-04-03 13:54:19'),
(19, 16, '15', 1, 'erew', 'ter', 0, NULL, 0, '2015-04-03 13:54:20'),
(22, 17, '21', 1, 'fghfhfhghghgjgj', 'fdgfdg', 0, NULL, 0, '2015-04-03 16:07:40'),
(23, 17, '22', 1, 'fdgfdhgfhfgjhg', 'fdgfdg', 0, NULL, 0, '2015-04-03 13:59:05'),
(24, 17, '23', 1, 'dfrsd', 'fdgfdg', 0, NULL, 0, '2015-04-03 16:03:34'),
(25, 17, '24', 1, 'dfrsd', 'fdgfdg', 0, NULL, 0, '2015-04-03 13:58:44'),
(26, 17, '25', 1, 'dfrsd', 'fdgfdg', 0, NULL, 0, '2015-04-03 13:58:45'),
(34, 15, '10', 2, 'fhgh', 'gfjf', 1, NULL, 0, '2015-04-04 12:36:24'),
(35, 14, '6', 2, 'fdgf', 'ghgj', 1, NULL, 0, '2015-04-04 13:08:22'),
(36, 16, '11', 1, 'erew', 'rtgrytrutyu', 1, NULL, 0, '2015-04-04 13:33:35'),
(37, 18, '7', 2, 'fhgfh', 'hjgjghjg', 0, NULL, 0, '2015-04-07 12:53:57'),
(122, 29, '100001', 4, 'fds', 'dgfdg', 0, NULL, 0, '2015-05-14 23:59:20'),
(123, 29, '100002', 4, 'fds', 'dgfdg', 0, NULL, 0, '2015-05-14 23:59:21'),
(124, 29, '100003', 4, 'fds', 'dgfdg', 0, NULL, 0, '2015-05-14 23:59:21'),
(125, 29, '100004', 4, 'fds', 'dgfdg', 0, NULL, 0, '2015-05-14 23:59:22'),
(126, 29, '100005', 4, 'fds', 'dgfdg', 0, NULL, 0, '2015-05-14 23:59:24'),
(129, 29, '100001', 4, 'fds', 'dgfdg', 0, 9, 0, '2015-05-14 18:31:35'),
(130, 30, '100001', 4, 'dfd', 'fgfg', 0, NULL, 0, '2015-05-15 00:05:14'),
(131, 29, '100002', 4, 'fds', 'dgfdg', 1, NULL, 0, '2015-05-15 18:25:41'),
(132, 31, '200001', 1, 'akanaksha', 'bhilai', 0, NULL, 0, '2015-06-24 23:12:04'),
(133, 31, '200002', 1, 'akanaksha', 'bhilai', 0, NULL, 0, '2015-06-24 23:12:06'),
(134, 31, '200003', 1, 'akanaksha', 'bhilai', 0, NULL, 0, '2015-06-24 23:12:07'),
(135, 31, '200004', 1, 'akanaksha', 'bhilai', 0, NULL, 0, '2015-06-24 23:12:09'),
(136, 31, '200005', 1, 'akanaksha', 'bhilai', 0, NULL, 0, '2015-06-24 23:12:10'),
(139, 31, '200005', 1, 'akanaksha', 'bhilai', 1, NULL, 0, '2015-06-24 23:33:36'),
(140, 31, '200004', 1, 'akanaksha', 'bhilai', 0, NULL, 1, '2015-06-24 18:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_run_sheet`
--

CREATE TABLE `delivery_run_sheet` (
  `Sheet_Id` int(10) UNSIGNED NOT NULL,
  `DRS_No` int(10) UNSIGNED NOT NULL,
  `Sheet_Date` date NOT NULL,
  `Del_Boy_Id` tinyint(4) NOT NULL,
  `Branch_Id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_run_sheet`
--

INSERT INTO `delivery_run_sheet` (`Sheet_Id`, `DRS_No`, `Sheet_Date`, `Del_Boy_Id`, `Branch_Id`) VALUES
(8, 1425298759, '2015-03-02', 6, 7),
(14, 1428048477, '2015-04-03', 2, 4),
(15, 1428048700, '2015-04-03', 2, 4),
(16, 1428049605, '2015-04-03', 2, 4),
(17, 1428049771, '2015-04-03', 2, 4),
(18, 1428391488, '2015-04-07', 1, 4),
(29, 1431608434, '2015-05-14', 6, 7),
(30, 1431608726, '2015-05-14', 7, 7),
(31, 1435147944, '2015-06-24', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `del_boy_master`
--

CREATE TABLE `del_boy_master` (
  `Del_Boy_Id` tinyint(4) NOT NULL,
  `Del_Boy_Code` varchar(20) NOT NULL,
  `Del_Boy_Name` varchar(50) NOT NULL,
  `Del_Boy_Commission` float NOT NULL,
  `Branch_Id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `del_boy_master`
--

INSERT INTO `del_boy_master` (`Del_Boy_Id`, `Del_Boy_Code`, `Del_Boy_Name`, `Del_Boy_Commission`, `Branch_Id`) VALUES
(1, '101', 'SHANKAR', 1, 4),
(2, '100', 'SHIVA', 1, 4),
(3, '3', 'RAJESH SAHU', 0, 4),
(4, '102', 'sumit', 1, 5),
(5, '103', 'Amit', 1, 5),
(6, '11', 'pankaj', 1, 7),
(7, '12', 'pravin', 1, 7),
(8, '13', 'sachi', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `destination_master`
--

CREATE TABLE `destination_master` (
  `Destination_Id` smallint(6) NOT NULL,
  `Destination_Code` varchar(20) NOT NULL,
  `Destination_Name` varchar(50) NOT NULL,
  `State_Id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `destination_master`
--

INSERT INTO `destination_master` (`Destination_Id`, `Destination_Code`, `Destination_Name`, `State_Id`) VALUES
(1, 'BHI', 'BHILAI3', 1),
(2, 'ABH', 'ABOHAR', 23),
(3, 'ABP', 'AMBIKAPUR', 1),
(4, 'ABR', 'AMBUR', 5),
(5, 'ABT', 'AMBEHTA', 27),
(6, 'ADBD', 'ADILABAD', 3),
(7, 'ADNK', 'ADDANKI', 3),
(8, 'ADO', 'ADONI', 3),
(9, 'AGJ', 'ALIGANJ', 27),
(10, 'AGMLY', 'ANGAMALY', 17),
(11, 'AGR', 'AGRA', 27),
(12, 'AGT', 'AGARTALA', 26),
(13, 'AJM', 'AJMER', 24),
(14, 'AJN', 'AJNALA', 23),
(15, 'AJR', 'ANJAR', 7),
(16, 'AJRA', 'AJRA', 2),
(17, 'AKB', 'AKBARPUR', 27),
(18, 'AKKAL', 'AKKALKOT', 2),
(19, 'AKL', 'AKOLA', 2),
(20, 'AKOT', 'AKOT', 2),
(21, 'AKPLI', 'ANAKAPALLI', 3),
(22, 'AKPT', 'ANAKAPUTHUR', 5),
(23, 'ALA', 'AMILA', 27),
(24, 'ALG', 'ALIGARH', 27),
(25, 'ALGM', 'ALANGULAM', 5),
(26, 'ALI', 'ALIBAG', 2),
(27, 'ALNR', 'ALANDUR', 5),
(28, 'ALPRM', 'AMALAPURAM', 3),
(29, 'ALTUR', 'ALTUR', 5),
(30, 'ALVA', 'ALUVA', 17),
(31, 'ALW', 'ALWAR', 24),
(32, 'AMALN', 'AMALNER', 2),
(33, 'AMB', 'AMBALA', 12),
(34, 'AMBAD', 'AMBAD', 2),
(35, 'AMBC', 'AMBALA CITY', 23),
(36, 'AMBCA', 'AMBALA CANTT', 23),
(37, 'AMBEJ', 'AMBEJOGAI', 2),
(38, 'AMBG', 'AMBEGAON', 2),
(39, 'AMBH', 'AMBALA HUB', 23),
(40, 'AMBR', 'AMBEDKAR NAGAR', 27),
(41, 'AMBUR', 'AMBUR', 5),
(42, 'AMD', 'AHMEDABAD', 7),
(43, 'AMER', 'AMRAVATI', 2),
(44, 'AMG', 'AHMEDGARH', 23),
(45, 'AMIN', 'AMINAGAR SARAI', 27),
(46, 'AMJI', 'AMJIKARAI', 5),
(47, 'AML', 'AMLOH', 23),
(48, 'AMLO', 'AMILO', 27),
(49, 'AMN', 'AHEMAD NAGAR', 2),
(50, 'AMOR', 'ARMOOR', 3),
(51, 'AMR', 'AMROHA', 27),
(52, 'AMRAO', 'AMRAOTI', 2),
(53, 'AMRLI', 'AMRELI', 7),
(54, 'AMTI', 'AMETHI', 27),
(55, 'AN', 'ANANTNAG', 14),
(56, 'ANAN', 'ANANDAPUR', 22),
(57, 'AND', 'ANAND', 7),
(58, 'ANDS', 'ANANDPUR SAHIB', 23),
(59, 'ANG', 'ANAPARTHI', 3),
(60, 'ANJAN', 'ANJANGAON', 2),
(61, 'ANK', 'ANKLESHWAR', 7),
(62, 'ANKL', 'ANKOLA', 16),
(63, 'ANL', 'AONLA', 27),
(64, 'ANPS', 'ANUPSHAHR', 27),
(65, 'ANR', 'AHMEDNAGAR', 2),
(66, 'ANTU', 'ANTU', 27),
(67, 'ANU', 'ANUGUL', 22),
(68, 'AP', 'AIRPORT OFFICE 30', 30),
(69, 'APKM', 'ALAPAKKAM', 5),
(70, 'ARA', 'ARRAH', 11),
(71, 'ARDH', 'AMRAUDHA', 27),
(72, 'ARES', 'ARMAPUR ESTATE', 27),
(73, 'ARI', 'ARARIA', 11),
(74, 'ARSK', 'ARSIKERE', 16),
(75, 'ARUPU', 'ARUPUKOTTAI', 5),
(76, 'ARVI', 'ARVI', 2),
(77, 'ARYA', 'AURAIYA', 27),
(78, 'ARYL', 'ARIYALUR', 5),
(79, 'ASAN', 'ASANSOL', 4),
(80, 'ASHTI', 'ASHTI', 2),
(81, 'ASN', 'ASSANDH', 12),
(82, 'ASR', 'AMRITSAR', 23),
(83, 'ATH', 'ATHNI', 16),
(84, 'ATHN', 'ATHANI', 5),
(85, 'ATL', 'ATUL', 7),
(86, 'ATLI', 'ATRAULIA', 27),
(87, 'ATPR', 'ANANTAPUR', 3),
(88, 'ATR', 'ATTUR', 5),
(89, 'ATRL', 'ATRAULI', 27),
(90, 'AUR', 'AURANGABAD (U.P.)', 27),
(91, 'AVAD', 'AVADI', 5),
(92, 'AVNIS', 'AVNISH ROAD', 5),
(93, 'AWR', 'AWAGARH', 27),
(94, 'AYD', 'AYODHYA', 27),
(95, 'AYR', 'ADYAR', 16),
(96, 'AZG', 'AZAMGARH', 27),
(97, 'AZL', 'AIZOL', 20),
(98, 'BAB', 'BABINA', 27),
(99, 'BABU', 'BABUGARH', 27),
(100, 'BAD', 'BARMER', 24),
(101, 'BAH', 'BAH', 27),
(102, 'BAI', 'BANKI', 22),
(103, 'BAJ', 'BAJNA', 27),
(104, 'BAJPU', 'BAJPUR', 28),
(105, 'BALAP', 'BALAPUR', 2),
(106, 'BALE', 'BALESHWAR', 22),
(107, 'BALLA', 'BALLARPUR', 2),
(108, 'BAN', 'BANDA', 27),
(109, 'BAR', 'BARNALA', 23),
(110, 'BARAM', 'BARAMATI', 2),
(111, 'BARAU', 'BARAUT', 27),
(112, 'BARSH', 'BARSHI', 2),
(113, 'BAV', 'BHAVNAGAR', 7),
(114, 'BBK', 'BARABANKI', 27),
(115, 'BBL', 'BARBIL', 22),
(116, 'BBLI', 'BOBBILI', 3),
(117, 'BBN', 'BHUBAN', 22),
(118, 'BBRU', 'BABERU', 27),
(119, 'BBSR', 'BHUBANESWAR', 22),
(120, 'BBU', 'BHABUA', 11),
(121, 'BCH', 'BHARUCH', 7),
(122, 'BCW', 'BACHHRAWAN', 27),
(123, 'BDGJ', 'BAHADURGANJ', 27),
(124, 'BDH', 'BADOHI', 27),
(125, 'BDI', 'BADDI', 13),
(126, 'BDK', 'BHADRAK', 22),
(127, 'BDKI', 'BINDKI', 27),
(128, 'BDL', 'BADLAPUR', 2),
(129, 'BDLDA', 'BUDHLADA', 23),
(130, 'BDN', 'BUDAUN', 27),
(131, 'BDNA', 'BUDHANA', 27),
(132, 'BDO', 'BALDEO', 27),
(133, 'BDQ', 'BARODA', 7),
(134, 'BDR', 'BHADAUR', 23),
(135, 'BEA', 'BEAWAR', 24),
(136, 'BEED', 'BEED', 2),
(137, 'BEG', 'BEGOWAL', 23),
(138, 'BGA', 'BODH GAYA', 11),
(139, 'BGH', 'BAHADURGARH', 12),
(140, 'BGJ', 'BENIGANJ', 27),
(141, 'BGK', 'BAGALKOT', 16),
(142, 'BGMU', 'BANGARMAU', 27),
(143, 'BGN', 'BANSGAON', 27),
(144, 'BGP', 'BHAGALPUR', 11),
(145, 'BGPT', 'BAGHPAT', 27),
(146, 'BGR', 'BALANGIR', 22),
(147, 'BGRM', 'BILGRAM', 27),
(148, 'BGRP', 'BANGARAPET', 16),
(149, 'BGS', 'BEGUSARAI', 11),
(150, 'BHADR', 'BHADRAVATI', 2),
(151, 'BHAG', 'BHAGWANPUR', 28),
(152, 'BHAGU', 'BHAGUR', 2),
(153, 'BHAND', 'BHANDARA', 2),
(154, 'BHIL', 'BHILAI', 1),
(155, 'BHIND', 'BHIND', 23),
(156, 'BHIRM', 'BHIMAVARAM', 3),
(157, 'BHJ', 'BAHJOI', 27),
(158, 'BHL', 'BHILWARA', 24),
(159, 'BHO', 'BHOPAL', 6),
(160, 'BHOKA', 'BHOKARDAN', 2),
(161, 'BHOPA', 'BHOPAL', 6),
(162, 'BHOR', 'BHOR', 2),
(163, 'BHR', 'BAHERI', 27),
(164, 'BHRW', 'BHARWARI', 27),
(165, 'BHUJ', 'BHUJ', 7),
(166, 'BID', 'BIDAR', 16),
(167, 'BIL', 'BILSI', 27),
(168, 'BITH', 'BITHOOR', 27),
(169, 'BJN', 'BIJNOR', 27),
(170, 'BJP', 'BIJAPUR', 16),
(171, 'BKH', 'BHIKHI', 23),
(172, 'BKN', 'BIKANER', 24),
(173, 'BKP', 'BIKAPUR', 27),
(174, 'BKR', 'BARKHERA', 27),
(175, 'BKW', 'BHIKHIWIND', 23),
(176, 'BKWR', 'BAKEWAR', 27),
(177, 'BLA', 'BALLIA', 27),
(178, 'BLB', 'BALLABGARH', 12),
(179, 'BLGJ', 'BARHALGANJ', 27),
(180, 'BLMOR', 'BELLIMORA', 2),
(181, 'BLMP', 'BALRAMPUR', 27),
(182, 'BLPR', 'BELPAHAR', 22),
(183, 'BLR', 'BANGALORE', 16),
(184, 'BLRI', 'BILARI', 27),
(185, 'BLS', 'BILASPUR (1)', 1),
(186, 'BLT', 'BALOTRA', 24),
(187, 'BLU', 'BALUGAON', 22),
(188, 'BLY', 'BAREILLY', 27),
(189, 'BM', 'BHAWANI MANDI', 24),
(190, 'BMNL', 'BOMMANAHALLI', 16),
(191, 'BNG', 'BONGAIGAON', 10),
(192, 'BNJA', 'BANGA', 23),
(193, 'BNK', 'BANKA', 11),
(194, 'BNKI', 'BANKI', 27),
(195, 'BNS', 'BANSWARA', 24),
(196, 'BOK', 'BOKARO', 15),
(197, 'BOT', 'BOTAD', 7),
(198, 'BPAT', 'BHAWANIPATNA', 22),
(199, 'BPD', 'BARIPADA', 22),
(200, 'BPR', 'BILASPUR (HP)', 12),
(201, 'BPT', 'BARPETA', 10),
(202, 'BPTL', 'BAPTLA', 3),
(203, 'BRA', 'BURLA', 22),
(204, 'BRCH', 'BAHRAICH', 27),
(205, 'BRGH', 'BARGARH', 22),
(206, 'BRGN', 'BARAGAON', 27),
(207, 'BRH', 'BARH', 11),
(208, 'BRLA', 'BABRALA', 27),
(209, 'BRPR', 'BIRPUR', 11),
(210, 'BRSD', 'BORSAD', 7),
(211, 'BRT', 'BAROTIWALA', 23),
(212, 'BRV', 'BHADRAVATI', 16),
(213, 'BRW', 'BARWALA', 12),
(214, 'BRY', 'BELLARY', 16),
(215, 'BSD', 'BILSANDA', 27),
(216, 'BSDH', 'BANSDIH', 27),
(217, 'BSF', '11SHARIF', 11),
(218, 'BSI', 'BANSI', 27),
(219, 'BSL', 'BISAULI', 27),
(220, 'BSN', 'BARSANA', 27),
(221, 'BSPR', 'BISALPUR', 27),
(222, 'BSPUP', 'BILASPUR (U.P.)', 27),
(223, 'BST', 'BASTI', 27),
(224, 'BSW', 'BISWAN', 27),
(225, 'BTD', 'BHATINDA', 23),
(226, 'BTGJ', 'BHARATGANJ', 27),
(227, 'BTH', 'BETTIAH', 11),
(228, 'BTHN', 'BHARTHANA', 27),
(229, 'BTK', 'BHATKAL', 16),
(230, 'BTL', 'BATALA', 23),
(231, 'BTP', 'BHARATPUR', 24),
(232, 'BTY', 'BYATARAYANAPURA', 16),
(233, 'BUDH', 'BAUDH', 22),
(234, 'BUDHG', 'BUDHGAON', 2),
(235, 'BUL', 'BULANDSHAHR', 27),
(236, 'BULDH', 'BULDHANA', 2),
(237, 'BUNDI', 'BUNDI', 24),
(238, 'BUR', 'BURDWAN', 4),
(239, 'BWD', 'BHIWADI', 24),
(240, 'BWG', 'BHAWANIGARH', 23),
(241, 'BWL', 'BAWAL', 12),
(242, 'BWN', 'BHIWANI', 12),
(243, 'BWND', 'BHIWANDI', 2),
(244, 'BWNR', 'BHAGWANT NAGAR', 27),
(245, 'BXR', 'BUXAR', 11),
(246, 'BYDG', 'BYADGI', 16),
(247, 'CCU', 'KOLKATA', 4),
(248, 'CDM', 'CHIDAMBARAM', 5),
(249, 'CDP', 'CUDDAPAH', 3),
(250, 'CDPR', 'CHANDPUR', 27),
(251, 'CDVRM', 'CHODAVARAM', 3),
(252, 'CGL', 'CHENGALPATTU', 5),
(253, 'CGNR', 'CHENGANNOOR', 17),
(254, 'CHAKA', 'CHAKAN', 2),
(255, 'CHAM', 'CHAMBHA', 13),
(256, 'CHAN', 'CHANDAUSI (UP)', 27),
(257, 'CHAND', 'CHANDVAD', 2),
(258, 'CHB', 'CHHIBRAMAU', 27),
(259, 'CHD', 'CHARODA', 1),
(260, 'CHELI', 'CHALISGAON', 2),
(261, 'CHENN', 'CHENNAI (RO)', 5),
(262, 'CHGN', 'CHIRAGAON', 13),
(263, 'CHI', 'CHENNAI', 5),
(264, 'CHIDA', 'CHIDAMBARAM', 5),
(265, 'CHIKH', 'CHIKHALDARA', 2),
(266, 'CHINC', 'CHINCHANI', 2),
(267, 'CHK', 'CHEEKA', 12),
(268, 'CHL', 'CHAIL', 27),
(269, 'CHM', 'CHOMU', 24),
(270, 'CHNR', 'CHUNAR', 27),
(271, 'CHOP', 'CHOPDA', 2),
(272, 'CHR', 'CHITRAKOOT', 27),
(273, 'CHT', 'CHITTORGARH', 24),
(274, 'CHU', 'CHURU', 24),
(275, 'CHW', 'CHIRAWA', 24),
(276, 'CJB', 'COIMBATORE', 5),
(277, 'CKA', 'CHAKIA', 27),
(278, 'CKD', 'CHIKODI', 16),
(279, 'CKDD', 'CHARKHI DADRI', 12),
(280, 'CKL', 'CHIKHLI', 7),
(281, 'CKM', 'CHIKAMAGLUR', 16),
(282, 'CLGJ', 'COLONELGANJ', 27),
(283, 'CLT', 'CALICUT', 17),
(284, 'CMLI', 'CHENNIMALAI', 5),
(285, 'CNDL', 'CHANDAULI', 27),
(286, 'CNPT', 'CHANNAPATNA', 16),
(287, 'CNR', 'CANANORE', 5),
(288, 'CNRP', 'CHANNARAYAPATNA', 16),
(289, 'COIMB', 'COIMBATORE', 5),
(290, 'COK', 'COCHIN', 17),
(291, 'CON', 'COONOOR', 5),
(292, 'CPN', 'CHOPAN', 27),
(293, 'CPR', 'CHAPRA', 11),
(294, 'CPRL', 'CHHAPRAULI', 27),
(295, 'CPT', 'CHILAKALURIPETA', 3),
(296, 'CRLA', 'CHIRALA', 3),
(297, 'CTD', 'CHITRADURGA', 16),
(298, 'CTK', 'CUTTACK', 22),
(299, 'CTKM', 'CHITLAPAKKAM', 5),
(300, 'CTP', 'CHATRAPUR', 22),
(301, 'CTR', 'CHITTOR', 3),
(302, 'CUD', 'CUDDALORE', 5),
(303, 'CUDDA', 'CUDDALORE', 5),
(304, 'DAD', 'DADRA', 2),
(305, 'DAHAN', 'DAHANU', 2),
(306, 'DAL', 'DALHOSIE', 13),
(307, 'DARWH', 'DARWHA', 2),
(308, 'DAU', 'DAUSA', 24),
(309, 'DAUND', 'DAUND', 2),
(310, 'DBD', 'DHANBAD', 15),
(311, 'DBG', 'DARBHANGA', 11),
(312, 'DBN', 'DERA BABA NANAK', 23),
(313, 'DBR', 'DIBRUGARH', 10),
(314, 'DBS', 'DERABASSI', 23),
(315, 'DDL', 'DANDELI', 16),
(316, 'DDN', 'DEHRADUN', 28),
(317, 'DDR', 'DADRI (U.P.)', 27),
(318, 'DEHRA', 'DEHRADUN', 28),
(319, 'DEL', 'DELHI', 30),
(320, 'DEO', 'DEOLI', 24),
(321, 'DEOLA', 'DEOLALI', 2),
(322, 'DEONI', 'DEONI', 2),
(323, 'DESAI', 'DESAIGANJ (VADASA)', 2),
(324, 'DEW', 'DEWAS', 6),
(325, 'DGDR', 'DHRANGADHRA', 7),
(326, 'DGH', 'DEBAGARH', 22),
(327, 'DGL', 'DINDIGUL', 5),
(328, 'DGVR', 'DIGVIJAYGRAM', 7),
(329, 'DHA', 'DHARUHERA', 12),
(330, 'DHAM', 'DHAMTARI', 1),
(331, 'DHAMA', 'DHAMANGAON RAILWAY', 2),
(332, 'DHARA', 'DHARANGAON', 2),
(333, 'DHIM', 'DHIMAPUR', 21),
(334, 'DHM', 'DHARAMSALA', 13),
(335, 'DHN', 'DHANAULA', 23),
(336, 'DHRM', 'DHARAMPUR', 13),
(337, 'DHU', 'DHURI', 23),
(338, 'DHULE', 'DHULE', 2),
(339, 'DHW', 'DHARWAR', 16),
(340, 'DIB', 'DIBIYAPUR', 27),
(341, 'DIGRA', 'DIGRAS', 2),
(342, 'DIN ', 'DIMAPUR', 21),
(343, 'DINDI', 'DINDIGAL (HUB)', 5),
(344, 'DJI', 'DAMANJODI', 22),
(345, 'DKL', 'DHENKANAL', 22),
(346, 'DLP', 'DHOLPUR', 24),
(347, 'DLW', 'DHILWAN', 23),
(348, 'DMJI', 'DHEMAJI', 10),
(349, 'DMK', 'DHARAMKOT', 23),
(350, 'DMPR', 'DHAMPUR', 27),
(351, 'DMR', 'DHARMA NAGAR', 26),
(352, 'DNA', 'DINA NAGAR', 23),
(353, 'DNR', 'DHANERA', 7),
(354, 'DOD', 'DOD BALLAPUR', 16),
(355, 'DONE', 'DONE', 3),
(356, 'DRB', 'DIRBA', 23),
(357, 'DRG', 'DURG', 1),
(358, 'DRH', 'DASARAHALLI', 16),
(359, 'DRO', 'DEORIA', 27),
(360, 'DRPR', 'DHARAPUR', 10),
(361, 'DRWL', 'DHARIWAL', 23),
(362, 'DUNG', 'DUNGARPUR', 24),
(363, 'DUR', 'DURGAPUR', 4),
(364, 'DVG', 'DAVANAGERE', 16),
(365, 'DWD', 'DHARWAD', 16),
(366, 'DWK', 'DWARKA', 7),
(367, 'ELN', 'ELLENABAD', 12),
(368, 'ELR', 'ELURU', 3),
(369, 'ERAND', 'ERANDOL', 2),
(370, 'ERD', 'ERODE', 5),
(371, 'ERODE', 'ERODE', 5),
(372, 'ETH', 'ETAH', 27),
(373, 'ETHA', 'EDATHUA', 17),
(374, 'ETW', 'ETAWAH', 27),
(375, 'f', 'KURARA', 27),
(376, 'FAIZP', 'FAIZPUR', 2),
(377, 'FBD', 'FARIDABAD', 12),
(378, 'FBT', 'FORBESGANJ', 11),
(379, 'FRQ', 'FARUKHABAD', 27),
(380, 'FRT', 'FARIDKOT', 23),
(381, 'FTB', 'FATEHABAD', 12),
(382, 'FTBUP', 'FATEHABAD', 27),
(383, 'FTC', 'FATEHGARH CHURIAN', 23),
(384, 'FTH', 'FATEHGARH', 27),
(385, 'FTP', 'FATEHPUR', 27),
(386, 'FTRS', 'FATEHPUR SIKRI', 27),
(387, 'FTS', 'FATEHGARH SAHIB', 23),
(388, 'FZB', 'FAIZABAD', 27),
(389, 'FZD', 'FIROZABAD', 27),
(390, 'FZL', 'FAZILKA ', 12),
(391, 'FZR', 'FEROZEPUR', 23),
(392, 'GADCH', 'GADCHIROLI', 2),
(393, 'GANAP', 'GANAPATHY', 5),
(394, 'GAND', 'GANDHIDHAM', 7),
(395, 'GANDH', 'GANDHINAGAR', 7),
(396, 'GANDP', 'GANDHIPURAM', 5),
(397, 'GB', 'GAURI BAZAR', 27),
(398, 'GBG', 'GULBARGA', 16),
(399, 'GDA', 'GHARAUNDA', 12),
(400, 'GDB', 'GIDDERBAHA', 23),
(401, 'GDG', 'GADAG', 16),
(402, 'GDK', 'GODAVARIKANI', 3),
(403, 'GDL', 'GONDAL', 7),
(404, 'GDR', 'GODHRA', 7),
(405, 'GDRI', 'GADARAI', 3),
(406, 'GDWD', 'GUDIWADA', 3),
(407, 'GGN', 'GURGAON', 12),
(408, 'GGNB', 'GURGAON BANSAL', 12),
(409, 'GGNH', 'GURGAON HUB', 12),
(410, 'GGNS', 'GURGAON SELF', 12),
(411, 'GGW', 'GANGAWATI', 16),
(412, 'GHN', 'GOHANA', 12),
(413, 'GIRID', 'GIRIDIH', 15),
(414, 'GJL', 'GAJRAULA', 27),
(415, 'GJM', 'GANJAM', 22),
(416, 'GJWK', 'GAJUWAKA', 3),
(417, 'GKK', 'GOKAK', 16),
(418, 'GKL', 'GOKUL', 27),
(419, 'GKP', 'GORAKHPUR', 27),
(420, 'GLB', 'GULABPURA', 24),
(421, 'GMT', 'PONNERI', 5),
(422, 'GMU', 'GOPAMAU', 27),
(423, 'GND', 'GONDA', 27),
(424, 'GNGH', 'GANGOH', 27),
(425, 'GNNR', 'GUNNAUR', 27),
(426, 'GNP', 'GUNUPUR', 22),
(427, 'GNPR', 'GYANPUR', 27),
(428, 'GNR', 'GANAUR(12)', 12),
(429, 'GNRP', 'GHANAUR(23)', 23),
(430, 'GNVRM', 'GANNAVARAM', 3),
(431, 'GOP', 'GOPALGANJ', 11),
(432, 'GOR', 'GORAYA', 23),
(433, 'GPGJ', 'GOPIGANJ', 27),
(434, 'GPLR', 'GOPALPUR', 22),
(435, 'GRSR', 'GURSARAI', 27),
(436, 'GRT', 'GARAUTHA', 27),
(437, 'GSGJ', 'GAUSGANJ', 27),
(438, 'GSI', 'GHOSI', 27),
(439, 'GSP', 'GAJSINGHPUR', 24),
(440, 'GTK', 'GANGTOK', 25),
(441, 'GTKL', 'GUNTAKAL', 3),
(442, 'GTR', 'GUNTUR', 3),
(443, 'GUDU', 'GUDURU', 3),
(444, 'GUHAG', 'GUHAGAR', 2),
(445, 'GUR', 'GURDASPUR', 23),
(446, 'GURJ', 'GURSAHAIGANJ', 27),
(447, 'GWL', 'GWALIOR', 6),
(448, 'GWT', 'GUWAHATI', 10),
(449, 'GYA', 'GAYA', 11),
(450, 'GYSG', 'GYALSHING', 25),
(451, 'GZB', 'GHAZIABAD', 27),
(452, 'GZPR', 'GHAZIPUR (U.P.)', 27),
(453, 'HADGA', 'HADGAON', 2),
(454, 'HAJI', 'HAJIPUR', 11),
(455, 'HAL ', 'HALDWANI', 28),
(456, 'HALDW', 'HALDWANI', 28),
(457, 'HAM', 'HAMIRPUR (HP)', 13),
(458, 'HAN', 'HANSI', 12),
(459, 'HAP', 'HAPUR', 27),
(460, 'HAR', 'HARDOI', 27),
(461, 'HAT', 'HATHRAS', 27),
(462, 'HAZAR', 'HAZARIBAGH', 15),
(463, 'HBL', 'HUBLI', 16),
(464, 'HDGH', 'HAIDERGARH', 27),
(465, 'HG', 'HANUMANGARH', 24),
(466, 'HINGA', 'HINGANGHAT', 2),
(467, 'HINGO', 'HINGOLI', 2),
(468, 'HKD', 'HIRAKUD', 22),
(469, 'HKND', 'HANMAKONDA', 3),
(470, 'HKR', 'HUKERI', 16),
(471, 'HLL', 'HALOL', 7),
(472, 'HLT', 'HINJILICUT', 22),
(473, 'HLUR', 'HALDAUR', 27),
(474, 'HMNR', 'HIMATNAGAR', 7),
(475, 'HMP', 'HAMIRPUR (U.P.)', 27),
(476, 'HNC', 'HINDAUN', 24),
(477, 'HND', 'HANDIA', 27),
(478, 'HNG', 'HANGAL', 16),
(479, 'HNPR', 'HINDUPUR', 3),
(480, 'HNVR', 'HONAVAR', 16),
(481, 'HO', 'HEAD OFFICE', 30),
(482, 'HOJA', 'HOJAI', 10),
(483, 'HOS', 'HOSHIARPUR', 23),
(484, 'HOSHA', 'HOSHANGABAD', 6),
(485, 'HRD', 'HARIDWAR', 28),
(486, 'HRDP', 'HARIPAD', 17),
(487, 'HRH', 'HARIHAR', 16),
(488, 'HSK', 'HOSKOTE', 16),
(489, 'HSN', 'HASSAN', 16),
(490, 'HSP', 'HOSPET', 16),
(491, 'HSR', 'HISSAR', 12),
(492, 'HUR', 'HOSUR', 5),
(493, 'HVR', 'HAVERI', 16),
(494, 'HY319', 'PATANCHERU', 3),
(495, 'HYD', 'HYDERBAD', 3),
(496, 'HYD01', 'BASHEER BAGH', 3),
(497, 'HYD03', 'PARADISE', 3),
(498, 'HYD04', 'KHAIRATABAD', 3),
(499, 'HYD07', 'TARNAKA', 3),
(500, 'HYD11', 'BOWEN PALLY', 3),
(501, 'HYD12', 'BEGUM BAZAR', 3),
(502, 'HYD13', 'AMBERPET', 3),
(503, 'HYD14', 'KOMPALLY', 3),
(504, 'HYD16', 'AMEER PET', 3),
(505, 'HYD18', 'MOOSAPET', 3),
(506, 'HYD23', 'KACHIGUDA', 3),
(507, 'HYD25', 'PADMARAO NAGAR', 3),
(508, 'HYD28', 'MASAVTANK', 3),
(509, 'HYD29', 'HIMAYAT NAGAR', 3),
(510, 'HYD33', 'JUBILEE HILLS', 3),
(511, 'HYD34', 'BANJARA HILLS', 3),
(512, 'HYD36', 'MALAKPET', 3),
(513, 'HYD37', 'PRASHANT NAGAR', 3),
(514, 'HYD38', 'S R NAGAR', 3),
(515, 'HYD39', 'RAMATHAPUR', 3),
(516, 'HYD40', 'MOULALI', 3),
(517, 'HYD42', 'BALANAGAR', 3),
(518, 'HYD48', 'MUSHEERABAD', 3),
(519, 'HYD50', 'SANATH NAGAR', 3),
(520, 'HYD51', 'CHERLAPALLY', 3),
(521, 'HYD55', 'JEEVIMETLA', 3),
(522, 'HYD60', 'DILSUK NAGAR', 3),
(523, 'HYD61', 'KUSHAIGUDA', 3),
(524, 'HYD70', 'L B NAGAR', 3),
(525, 'HYD72', 'KUKATPALLY', 3),
(526, 'HYD77', 'KATTEDAN', 3),
(527, 'HYD82', 'PANJAGUTTA', 3),
(528, 'HYD95', 'KOTI', 3),
(529, 'HYDSW', 'SWISS AIR', 3),
(530, 'IDR', 'IDAR', 7),
(531, 'IGL', 'IGLAS', 27),
(532, 'IGP', 'IGATPURI', 2),
(533, 'IJLD', 'IRINJALAKUDA', 17),
(534, 'IKJ', 'ICHALKARANJI', 2),
(535, 'IKN', 'IKAUNA', 27),
(536, 'IMF', 'IMPHAL', 18),
(537, 'IND', 'INDORE', 6),
(538, 'INDAP', 'INDAPUR', 2),
(539, 'INDOR', 'INDORE', 6),
(540, 'INDRI', 'INDRI', 23),
(541, 'ITA', 'ITANAGAR', 9),
(542, 'ITARS', 'ITARASI', 6),
(543, 'IXC', 'CHANDIGARH', 29),
(544, 'IXD', 'ALLAHABAD', 27),
(545, 'IXG', 'BELGAUM', 16),
(546, 'IXJ', 'JAMMU', 14),
(547, 'IXM', 'MADURAI', 5),
(548, 'IXU', 'AURANGABAD', 2),
(549, 'JAG', 'JAGADHRI', 12),
(550, 'JAIS', 'JAIS', 27),
(551, 'JAL', 'JALGAON', 2),
(552, 'JALA', 'JALAUN', 27),
(553, 'JALNA', 'JALNA', 2),
(554, 'JAM', 'JAMSHEDPUR', 15),
(555, 'JAMKH', 'JAMKHD', 2),
(556, 'JAMMU', 'JAMMU', 14),
(557, 'JAN', 'JAINAGAR', 11),
(558, 'JAWHA', 'JAWHAR', 2),
(559, 'JAYSI', 'JAYSINGPUR', 2),
(560, 'JBD', 'JAHANGIRABAD', 27),
(561, 'JBL', 'JABALPUR', 6),
(562, 'JBN', 'JOGBANI', 11),
(563, 'JDA', 'JODA', 22),
(564, 'JDP', 'JODHPUR', 24),
(565, 'JDR', 'JAGDALPUR', 1),
(566, 'JEJUR', 'JEJURI', 2),
(567, 'JFB', 'JAFRABAD', 7),
(568, 'JGN', 'JAGRAON', 23),
(569, 'JGP', 'JAHANGIRPUR', 27),
(570, 'JGPT', 'JAGGAIAHPET', 3),
(571, 'JGSR', 'JAGATSINGHAPUR', 22),
(572, 'JGTL', 'JAGITAL', 3),
(573, 'JHA', 'JHAJHA', 11),
(574, 'JHANS', 'JHANSI', 6),
(575, 'JHJ', 'JHAJJAR', 12),
(576, 'JHN', 'JAHANABAD', 11),
(577, 'JHS', 'JHANSI', 27),
(578, 'JIND', 'JIND', 12),
(579, 'JINTU', 'JIMTUR', 2),
(580, 'JJDP', 'JAM JODHPUR', 7),
(581, 'JJK', 'JHINJHAK', 27),
(582, 'JJN', 'JHUNJHUNU', 24),
(583, 'JJNA', 'JHINJHANA', 27),
(584, 'JLB', 'JALALABAD (PB.)', 23),
(585, 'JLD', 'JALDA', 22),
(586, 'JLLD', 'JALALABAD (UP)', 27),
(587, 'JLORE', 'JALORE', 24),
(588, 'JLP', 'JALALPUR', 27),
(589, 'JLR', 'JALANDHAR', 23),
(590, 'JLS', 'JALESWAR', 22),
(591, 'JLU', 'JHALU', 27),
(592, 'JMN', 'JAMNAGAR', 7),
(593, 'JMP', 'JAMALPUR', 11),
(594, 'JMU', 'JAMUI', 11),
(595, 'JND', 'JIND', 12),
(596, 'JNGO', 'JUNAGARH(22)', 22),
(597, 'JNP', 'JAUNPUR', 27),
(598, 'JNR', 'JHANJHARPUR', 11),
(599, 'JOTHI', 'JOTHIPALAYAM', 5),
(600, 'JOYA', 'JOYA', 27),
(601, 'JPR', 'JAIPUR', 24),
(602, 'JRGD', 'JHARSUGUDA', 22),
(603, 'JRNA', 'JASRANA', 27),
(604, 'JRT', 'JORHAT', 10),
(605, 'JRWL', 'JARWAL', 27),
(606, 'JSD', 'JASDAN', 7),
(607, 'JSMLR', 'JAISALMER', 24),
(608, 'JSNR', 'JASWANTNAGAR', 27),
(609, 'JSR', 'JASSUR (HP)', 23),
(610, 'JTI', 'JATANI', 22),
(611, 'JTU', 'JAITU', 23),
(612, 'JUN', 'JUNAGADH', 7),
(613, 'JUNNA', 'JUNNAR', 2),
(614, 'JUSI', 'JHUSI', 27),
(615, 'JWR', 'JEWAR', 27),
(616, 'KADI', 'KADI', 7),
(617, 'KAGAL', 'KAGAL', 2),
(618, 'KAL', 'KALA AMB', 13),
(619, 'KALAM', 'KALAMB', 2),
(620, 'KALPI', 'KALPI', 27),
(621, 'KALWA', 'KALWAN', 2),
(622, 'KANCH', 'KANCHIPURAM', 5),
(623, 'KANKA', 'KANKAVLI', 2),
(624, 'KANNA', 'KANNAD', 2),
(625, 'KAP', 'KAPURTHALA', 23),
(626, 'KAR', 'KARUR', 5),
(627, 'KARAB', 'KHARAR', 23),
(628, 'KARAN', 'KARANJA', 2),
(629, 'KARIM', 'KARIMNAGAR', 3),
(630, 'KARJA', 'KARJAT', 2),
(631, 'KARMA', 'KARMALA', 2),
(632, 'KARUR', 'KARUR', 5),
(633, 'KAS ', 'KASGANJ', 27),
(634, 'KAT', 'KATHUA', 14),
(635, 'KATOL', 'KATOL', 2),
(636, 'KATPA', 'KATPADI', 5),
(637, 'KATR', 'KATRA (U.P.)', 27),
(638, 'KBT', 'KANTABANJI', 22),
(639, 'KCM', 'KANCHEEPURAM', 5),
(640, 'KDA', 'KHADDA', 27),
(641, 'KDG', 'KODIGENAHALLI', 16),
(642, 'KDH', 'KORDHA', 22),
(643, 'KDKR', 'KANDUKUR', 3),
(644, 'KDP', 'KADIPUR', 27),
(645, 'KDR', 'KADODARA', 7),
(646, 'KDRK', 'KUNDARKI', 27),
(647, 'KGA', 'KHAGA', 27),
(648, 'KGL', 'KHAGAUL', 11),
(649, 'KGR', 'KHAGARIA', 11),
(650, 'KHAIR', 'KHAIR', 27),
(651, 'KHAN', 'KHANPUR (U.P.)', 27),
(652, 'KHAPA', 'KHAPA', 2),
(653, 'KHAR', 'KHARIAR', 22),
(654, 'KHD', 'KHEDA', 7),
(655, 'KHED', 'KHED', 2),
(656, 'KHERD', 'KHERD', 2),
(657, 'KHJ', 'KHURJA', 27),
(658, 'KHL', 'KARHAL', 27),
(659, 'KHN', 'KHANNA', 23),
(660, 'KHNR', 'KHANAPUR', 16),
(661, 'KHO', 'KOHIMA', 21),
(662, 'KHOP', 'KHOPOLI', 2),
(663, 'KHRL', 'KHARELA', 27),
(664, 'KHULD', 'KHULDABAD', 2),
(665, 'KHUT', 'KHUTAR', 27),
(666, 'KICHH', 'KICHHA/PANT NAGAR', 28),
(667, 'KINWA', 'KINWAT', 2),
(668, 'KIR', 'KIRATPUR', 27),
(669, 'KJR', 'KENDUJHAR', 22),
(670, 'KKD', 'KAKINADA', 3),
(671, 'KKL', 'KARAIKAL', 33),
(672, 'KKP', 'KOTKAPURA', 23),
(673, 'KKR', 'KURUKSHETRA', 12),
(674, 'KKRL', 'KAKRALA', 27),
(675, 'KLB', 'KHALILABAD', 27),
(676, 'KLJ', 'KAMALGANJ', 27),
(677, 'KLK', 'KALKA', 13),
(678, 'KLKH', 'KALKA HUB', 12),
(679, 'KLL', 'KALOL', 7),
(680, 'KLM', 'KOLLAM', 17),
(681, 'KLP', 'KOLHAPUR', 2),
(682, 'KLPR', 'KAIKALPUR', 3),
(683, 'KLPT', 'KALPETTA', 17),
(684, 'KLTR', 'KOLATHUR', 5),
(685, 'KLU', 'KULLU', 13),
(686, 'KLVD', 'KALAVAD', 7),
(687, 'KMBL', 'KHAMBHALIA', 7),
(688, 'KMBT', 'KHAMBHAT', 7),
(689, 'KMK', 'KHEM KARAN', 23),
(690, 'KMM', 'KHAMMAM', 3),
(691, 'KMR', 'KHAMARIA', 27),
(692, 'KMSD', 'KARAMSAD', 7),
(693, 'KMT', 'KUMTA', 16),
(694, 'KMU', 'KAIMUR', 11),
(695, 'KNA', 'KARANJIA', 22),
(696, 'KNC', 'KONCH', 27),
(697, 'KNG', 'KANGRA', 13),
(698, 'KNGD', 'KANHANGAD', 17),
(699, 'KNGR', 'KENGERI', 16),
(700, 'KNJ', 'KANNAUJ', 27),
(701, 'KNJB', 'KUNJABAN', 26),
(702, 'KNL', 'KARNAL', 12),
(703, 'KNNR', 'KANNUR', 17),
(704, 'KNP', 'KANPUR', 27),
(705, 'KNPH', 'KANPUR HUB', 27),
(706, 'KNPR', 'KENDRAPARA', 22),
(707, 'KNR', 'KANNUR', 16),
(708, 'KNT', 'KANTH', 27),
(709, 'KNTI', 'KANTI', 11),
(710, 'KODOL', 'KODOLI', 2),
(711, 'KOL', 'KOLAR', 16),
(712, 'KONPL', 'KONDAPALLI', 3),
(713, 'KOPAR', 'KOPARGAON', 2),
(714, 'KOR', 'KORBA', 1),
(715, 'KOS', 'KOSIKALAN', 27),
(716, 'KOT', 'KOTA', 24),
(717, 'KOTT', 'KOTTAYAM', 5),
(718, 'KOVIL', 'KOVILPATTI', 5),
(719, 'KPD', 'KATPADI', 5),
(720, 'KPGJ', 'KOPAGANJ', 27),
(721, 'KRBD', 'KHAIRABAD', 27),
(722, 'KRDY', 'KAMAREDDY', 3),
(723, 'KRGJ', 'KAURIAGANJ', 27),
(724, 'KRI', 'KARARI', 27),
(725, 'KRL', 'KURALI', 23),
(726, 'KRNA', 'KAIRANA', 27),
(727, 'KRPR', 'KARTARPUR', 23),
(728, 'KRPT', 'KORAPUT', 22),
(729, 'KRWR', 'KARWAR', 16),
(730, 'KSD', 'KESHOD', 7),
(731, 'KSG', 'KISHANGARH', 24),
(732, 'KSGA', 'KESINGA', 22),
(733, 'KSGD', 'KASARGOD', 17),
(734, 'KSLN', 'KUSHALNAGAR', 16),
(735, 'KSMB', 'KAUSHAMBI (U.P.)', 27),
(736, 'KSN', 'KUSHINAGAR', 27),
(737, 'KSNI', 'KISHNI', 27),
(738, 'KSNJ', 'KISHANGANJ', 11),
(739, 'KSP', 'KASHIPUR', 28),
(740, 'KTD', 'KOTDWAR', 28),
(741, 'KTGR', 'KOTAGIRI', 5),
(742, 'KTKR', 'KOTTARAKKARA', 17),
(743, 'KTL', 'KAITHAL', 12),
(744, 'KTLI', 'KHATAULI', 27),
(745, 'KTP', 'KOTPUTLI', 24),
(746, 'KTR', 'KATIHAR', 11),
(747, 'KTTR', 'KOTTUR', 5),
(748, 'KUDAL', 'KUDAL', 2),
(749, 'KUN', 'KUNDLI', 12),
(750, 'KUNDA', 'KUNDA', 27),
(751, 'KUNWD', 'KUNDALWADI', 2),
(752, 'KUR', 'KURNOOL', 3),
(753, 'KURL', 'KURAOLI', 27),
(754, 'KURUN', 'KURUNDVAD', 2),
(755, 'KUSM', 'KUSMARA', 27),
(756, 'KVR', 'KOVVUR', 3),
(757, 'KVT', 'KOVILPATTI', 5),
(758, 'KYKM', 'KAYAMKULAM', 17),
(759, 'KZPT', 'KAZIPET', 3),
(760, 'LAD', 'LADWA', 12),
(761, 'LAK', 'LAKHMIPUR KHERI', 27),
(762, 'LAL', 'LALRU', 23),
(763, 'LALG', 'LALGANJ', 11),
(764, 'LALKU', 'LALKUAN', 28),
(765, 'LANJA', 'LANJA', 2),
(766, 'LAR', 'LAR', 27),
(767, 'LATUR', 'LATUR', 2),
(768, 'LDH', 'LUDHIANA', 23),
(769, 'LGJ', 'LALGANJ', 27),
(770, 'LGR', 'LINGSUGUR', 16),
(771, 'LHPR', 'LAHARPUR', 27),
(772, 'LKI', 'LAKHISARAI', 11),
(773, 'LKN', 'LAKHNA', 27),
(774, 'LKO', 'LUCKNOW', 27),
(775, 'LLT', 'LALITPUR', 27),
(776, 'LMB', 'LIMBDI', 7),
(777, 'LNG', 'LONGOWAL', 23),
(778, 'LOHA', 'LOHA', 2),
(779, 'LONAR', 'LONAR', 2),
(780, 'LONAV', 'LONAVALA', 2),
(781, 'LONI', 'LONI', 27),
(782, 'LRG', 'LEHRAGAGA', 23),
(783, 'LZA', 'ALAPUZHA', 17),
(784, 'MADU2', 'MADURAI 2', 5),
(785, 'MADU3', 'MADURAI 3', 5),
(786, 'MADUR', 'MADURAI', 5),
(787, 'MAHAB', 'MAHABALESHWAR', 2),
(788, 'MAHAD', 'MAHAD', 2),
(789, 'MAHOW', 'MAHOW', 6),
(790, 'MAIN', 'MAINPURI', 27),
(791, 'MAL', 'MALANPUR', 6),
(792, 'MALEG', 'MALEGAON', 2),
(793, 'MALKA', 'MALKAPUR', 2),
(794, 'MAMBA', 'WEST MAMBALAM', 5),
(795, 'MAN', 'MANDI', 23),
(796, 'MANCH', 'MANCHAR', 2),
(797, 'MAND', 'MANDSOUR', 6),
(798, 'MANDI', 'MANDIDEEP', 6),
(799, 'MANE', 'MANESAR', 23),
(800, 'MANMA', 'MANMAD', 2),
(801, 'MANS', 'MANSAR', 2),
(802, 'MANSA', 'MANSA', 13),
(803, 'MANWA', 'MANWATH', 2),
(804, 'MATHE', 'MATHERAN', 2),
(805, 'MAU', 'MAUR', 23),
(806, 'MBD', 'MORADABAD', 27),
(807, 'MBNGR', 'MAHABOOBNAGAR', 3),
(808, 'MC', 'MERTA CITY', 24),
(809, 'MCH', 'MACHHIWARA', 23),
(810, 'MCRL', 'MACHIRIYAL', 3),
(811, 'MDB', 'MADHUBANI', 11),
(812, 'MDD', 'MUNDGOD', 16),
(813, 'MDG', 'MUDIGERE', 16),
(814, 'MDGJ', 'MADHOGANJ', 27),
(815, 'MDGR', 'MADHOGARH', 27),
(816, 'MDKR', 'MADIKERI', 16),
(817, 'MDP', 'MADHEPURA', 11),
(818, 'MDPR', 'MAHADEVAPURA', 16),
(819, 'MDR', 'MADDUR', 16),
(820, 'MDVL', 'MADURAVOYAL', 5),
(821, 'MDY', 'MANDYA', 16),
(822, 'METT', 'METTUR', 5),
(823, 'METTU', 'METTUPALAYAM', 5),
(824, 'MGG', 'MANDI GOVIND GARH', 23),
(825, 'MGJ', 'MURLIGANJ', 11),
(826, 'MGN', 'MANGAN', 25),
(827, 'MGR', 'MAGHAR', 27),
(828, 'MHB', 'MAHOBA', 27),
(829, 'MHBN', 'MAHABAN', 27),
(830, 'MHGJ', 'MAHARAJGANJ', 11),
(831, 'MHI', 'MAHOLI (U.P.)', 27),
(832, 'MHJ', 'MAHRAJGANJ', 27),
(833, 'MHL', 'MOHALI', 23),
(834, 'MHS', 'MAHESANA', 7),
(835, 'MHV', 'MAHUVA', 7),
(836, 'MHW', 'MAHWA', 24),
(837, 'MIP', 'MANIKPUR', 27),
(838, 'MIRAJ', 'MIRAJ', 2),
(839, 'MJH', 'MAJITHA', 23),
(840, 'MJLR', 'MAJHAULI RAJ', 27),
(841, 'MKG', 'MALKANGIRI', 22),
(842, 'MKN', 'MUKERIAN', 23),
(843, 'MKRN', 'MAKRANA', 24),
(844, 'MKT', 'MUKTSAR', 23),
(845, 'MKU', 'MAKHU', 23),
(846, 'MLBD', 'MALIHABAD', 27),
(847, 'MLD', 'MANGALDOI', 10),
(848, 'MLK', 'MALERKOTLA', 23),
(849, 'MLNI', 'MAILANI', 27),
(850, 'MLP', 'MAHILPUR (23)', 23),
(851, 'MLPRM', 'MALAPPURAM', 17),
(852, 'MLR', 'MANGALORE', 16),
(853, 'MLT', 'MALOUT', 23),
(854, 'MLWN', 'MALLAWAN', 27),
(855, 'MMNR', 'MARAIMALAINAGAR', 5),
(856, 'MNDR', 'MITHAPUR', 7),
(857, 'MNDV', 'MANDVI', 7),
(858, 'MNDW', 'MANDAWAR', 27),
(859, 'MNGR', 'MANGROL', 7),
(860, 'MNL', 'MANALI', 5),
(861, 'MNO', 'MANDI DABWALI', 12),
(862, 'MNPL', 'MANIPAL', 16),
(863, 'MNS', 'MANESAR', 12),
(864, 'MNV', 'MANVI', 16),
(865, 'MNVR', 'MANAVADAR', 7),
(866, 'MODI', 'MODINAGAR', 27),
(867, 'MOG', 'MOGA', 23),
(868, 'MOR', 'MORINDA', 23),
(869, 'MORSH', 'MORSHI', 2),
(870, 'MOT', 'MOTIPUR', 11),
(871, 'MPZH', 'MOOVATTUPUZHA', 17),
(872, 'MRDN', 'MURADNAGAR', 27),
(873, 'MRGJ', 'MIRGANJ', 11),
(874, 'MRJ', 'MIRGANJ', 27),
(875, 'MRN', 'MORENA', 23),
(876, 'MRT', 'MEERUT', 27),
(877, 'MRZP', 'MIRZAPUR', 27),
(878, 'MSN', 'MESANA', 7),
(879, 'MTH', 'MATHURA', 27),
(880, 'MTM', 'MACHILIPATNAM', 3),
(881, 'MTR', 'MOTIHARI', 11),
(882, 'MUM', 'MUMBAI', 2),
(883, 'MUN', 'MUNGER', 11),
(884, 'MUND', 'MUNDRA', 7),
(885, 'MUNT', 'MOUNT ABO', 24),
(886, 'MUS', 'MUSSOORIE', 28),
(887, 'MUSSO', 'MUSSORIE', 28),
(888, 'MWA', 'MAIRWA', 11),
(889, 'MWN', 'MAWANA', 7),
(890, 'MYS', 'MYSORE', 16),
(891, 'MZF', 'MUZAFFARNAGAR', 27),
(892, 'MZP', 'MUZAFFARPUR', 11),
(893, 'NAD', 'ANAND', 2),
(894, 'NAGDA', 'NAGDA', 6),
(895, 'NAH', 'NAHARLAGON', 3),
(896, 'NAMAK', 'NAMAKAL', 5),
(897, 'NAN', 'NANGAL', 23),
(898, 'NANDE', 'NANDED', 2),
(899, 'NANDG', 'NANDGAON', 2),
(900, 'NANDU', 'NANDURA', 2),
(901, 'NAR', 'NARWANA', 12),
(902, 'NATH', 'NATHDWARA', 24),
(903, 'NBH', 'NABHA', 23),
(904, 'NBZR', 'NAI BAZAR', 27),
(905, 'NDA', 'NOIDA', 27),
(906, 'NDD', 'NADIAD', 7),
(907, 'NDSE', 'NDSE', 30),
(908, 'NDVL', 'NIDADAVOLE', 3),
(909, 'NDYL', 'NANDYAL', 3),
(910, 'NEEMU', 'NEEMUCH', 6),
(911, 'NEGER', 'NEGERCOIL', 5),
(912, 'NEW', 'NEW SIDDAPUDUR', 5),
(913, 'NEY', 'NEYVELI', 5),
(914, 'NGH', 'NAYAGARH', 22),
(915, 'NGN', 'NAGINA', 27),
(916, 'NGND', 'NALGONDA', 3),
(917, 'NGON', 'NAGAON', 10),
(918, 'NGP', 'NAGPUR', 2),
(919, 'NGR', 'NAGAUR', 24),
(920, 'NGT', 'NAGAPATTINAM', 5),
(921, 'NGWT', 'NORTH GUWAHATI', 10),
(922, 'NHN', 'NAHAN', 13),
(923, 'NHR', 'NOHAR', 24),
(924, 'NIL', 'NILOKHERI', 12),
(925, 'NIMB', 'NIMBAHERA', 24),
(926, 'NJB', 'NAJIBABAD', 27),
(927, 'NJGD', 'NANJANGUD', 16),
(928, 'NKD', 'NAKODAR', 23),
(929, 'NKH', 'NOKHA', 24),
(930, 'NKJ', 'NARKATIAGANJ', 11),
(931, 'NKL', 'NAMAKKAL', 5),
(932, 'NLB', 'NALBARI', 10),
(933, 'NLG', 'NALAGARH ( HP)', 13),
(934, 'NLR', 'NELLORE', 3),
(935, 'NMC', 'NAMCHI', 25),
(936, 'NPN', 'NIPANI', 16),
(937, 'NPP', 'NAUPADA', 22),
(938, 'NPT', 'NUAPATNA', 22),
(939, 'NRL', 'NARNAUL', 12),
(940, 'NRML', 'NIRMAL', 3),
(941, 'NRNG', 'NARAINGARH', 12),
(942, 'NRP', 'NABARANGAPUR', 22),
(943, 'NRSP', 'NARSAPUR', 3),
(944, 'NRSTM', 'NARSIPATNAM', 3),
(945, 'NRT', 'NARASAROPET', 3),
(946, 'NSD', 'NASIRABAD', 24),
(947, 'NSK', 'NASHIK', 2),
(948, 'NTL', 'NAINITAL', 28),
(949, 'NUL', 'NARNUL', 13),
(950, 'NVS', 'NAVASARI', 7),
(951, 'NWD', 'NAWADA', 11),
(952, 'NWG', 'NAWALGARH', 24),
(953, 'NWS', 'NAWANSHAHR', 23),
(954, 'NYBR', 'NAYABAZAR', 25),
(955, 'NZB', 'NIZAMABAD', 3),
(956, 'NZMD', 'NIZAMABAD', 27),
(957, 'ONG', 'ONGOLE', 3),
(958, 'ORAI', 'ORAI', 27),
(959, 'ORB', 'OBRA', 27),
(960, 'OSMAN', 'OSMANABAD', 2),
(961, 'OTPLM', 'OTTAPPALM', 17),
(962, 'OTY', 'OOTY', 5),
(963, 'OZAR', 'OZAR', 2),
(964, 'PACHO', 'PACHORA', 2),
(965, 'PADRA', 'PADRA', 7),
(966, 'PAITH', 'PAITHAN', 2),
(967, 'PALI', 'PALI (MAH.)', 2),
(968, 'PALIR', 'PALI (RAJ.)', 24),
(969, 'PAPAN', 'PAPANAYAKAR PALAYAM', 5),
(970, 'PARBH', 'PARBHANI', 2),
(971, 'PAT', 'PATNA', 11),
(972, 'PATG', 'PATNAGARH', 22),
(973, 'PBND', 'PORBANDAR', 7),
(974, 'PCLR', 'POLICHALUR', 5),
(975, 'PCPR', 'PACHPERWA', 27),
(976, 'PDKT', 'PUDUKKOTTAI', 5),
(977, 'PDN', 'PEDANA', 3),
(978, 'PDP', 'PADMAPUR(22)', 22),
(979, 'PDPL', 'PEDDAPALLI', 3),
(980, 'PDPM', 'PEDDAPURAM', 3),
(981, 'PDPR', 'PADAMPUR(RAJ.)', 24),
(982, 'PDR', 'PRODDATUR', 3),
(983, 'PDY', 'PONDICHERRY', 33),
(984, 'PED', 'PEDDAPURAM', 3),
(985, 'PERIY', 'PERIYANAIKAN PALAYAM', 5),
(986, 'PEW', 'PEHOWA', 12),
(987, 'PGDI', 'PERUNGUDI', 5),
(988, 'PGRLA', 'PIDIGURALLA', 3),
(989, 'PHALT', 'PHALTAN', 2),
(990, 'PHG', 'PHAGWARA', 23),
(991, 'PHL', 'PHILLAUR', 23),
(992, 'PHN', 'PUKHRAYAN', 27),
(993, 'PHSU', 'PAHASU', 27),
(994, 'PHUL', 'PHULPUR', 27),
(995, 'PIL', 'PILANI', 24),
(996, 'PILI', 'PILIBANGA', 24),
(997, 'PIMPR', 'PIMPRI CHINCHWAD', 2),
(998, 'PIN', 'PINJORE', 12),
(999, 'PITH', 'PITHAMPUR', 6),
(1000, 'PITHA', 'PITHAMPUR', 6),
(1001, 'PKD', 'PARLAKHEMUNDI', 22),
(1002, 'PKI', 'PANIKOII', 22),
(1003, 'PKL', 'PANCHKULA', 12),
(1004, 'PLBN', 'PHULBANI', 22),
(1005, 'PLBT', 'PILIBHIT', 27),
(1006, 'PLD', 'PHALODI', 24),
(1007, 'PLKD', 'PALAKKAD', 17),
(1008, 'PLKL', 'PALAKOL', 3),
(1009, 'PLKW', 'PILKHUWA', 27),
(1010, 'PLNP', 'PALANPUR', 7),
(1011, 'PLP', 'PALAMPUR (HP)', 13),
(1012, 'PLVK', 'PALAVAKKAM', 5),
(1013, 'PLW', 'PALWAL', 12),
(1014, 'PMML', 'PAMMAL', 5),
(1015, 'PNP', 'PANIPAT', 12),
(1016, 'PNPR', 'PURANPUR', 27),
(1017, 'PNPS', 'PANPOSH', 22),
(1018, 'PNQ', 'PUNE', 2),
(1019, 'PNW', 'PINDWARA', 24),
(1020, 'POHAN', 'POHANA', 28),
(1021, 'POLAD', 'POLADPUR', 2),
(1022, 'POML', 'POONAMALLEE', 5),
(1023, 'POND1', 'PONDICHERRY 1', 5),
(1024, 'POND2', 'PONDICHERRY 2', 5),
(1025, 'POND3', 'PONDICHERRY 3', 5),
(1026, 'POND4', 'PONDICHERRY 4', 5),
(1027, 'POND6', 'PONDICHERRY 6', 5),
(1028, 'PONDI', 'PONDICHERRY (AREA OF', 5),
(1029, 'PRI', 'PURI', 22),
(1030, 'PRN', 'PURNIA', 11),
(1031, 'PRN\\K', 'PADRAUNA', 27),
(1032, 'PRR', 'PORUR', 5),
(1033, 'PRT', 'PANRUTI', 5),
(1034, 'PRW', 'PURWA', 27),
(1035, 'PSK', 'PUSHKAR', 24),
(1036, 'PTL', 'PATIALA', 23),
(1037, 'PTLD', 'PETLAD', 7),
(1038, 'PTM', 'PATTAMUNDAI', 22),
(1039, 'PTN', 'PATRAN', 23),
(1040, 'PTPG', 'PRATAPGARH', 27),
(1041, 'PTQ', 'PATHANKOT', 23),
(1042, 'PTS', 'PONTA SAHIB', 13),
(1043, 'PTT', 'PATTI', 23),
(1044, 'PUDUK', 'PUDUKOTTAI', 5),
(1045, 'PULGA', 'PUL8N', 2),
(1046, 'PUSAD', 'PUSAD', 2),
(1047, 'PWN', 'PARWANOO', 13),
(1048, 'PYNR', 'PAYYANNUR', 17),
(1049, 'QDN', 'QADIAN', 23),
(1050, 'RABLY', 'RAE BARELI', 27),
(1051, 'RAD', 'RADAUR', 12),
(1052, 'RAHUR', 'RAHURI', 2),
(1053, 'RAI', 'RAIPUR', 1),
(1054, 'RAJA', 'RAJAPLAYAM', 5),
(1055, 'RAJAP', 'RAJAPUR', 2),
(1056, 'RAMN', 'RAMNAGAR', 5),
(1057, 'RAMNA', 'RAMNAGAR', 28),
(1058, 'RAMTE', 'RAMTEK', 2),
(1059, 'RAN', 'RANCHI', 15),
(1060, 'RANIP', 'RANIPET', 5),
(1061, 'RANP', 'RANIP', 7),
(1062, 'RAT', 'RATLAM', 6),
(1063, 'RATHI', 'RATHINAPURI', 5),
(1064, 'RATNA', 'RATNAGIRI', 2),
(1065, 'RAVER', 'RAVER', 2),
(1066, 'RBR', 'RANIBENNUR', 16),
(1067, 'RBSH', 'RAMPUR BUSHAR', 13),
(1068, 'RCR', 'RAICHUR', 16),
(1069, 'RDP', 'RUDRAPUR', 27),
(1070, 'RGH', 'RAIGARH', 1),
(1071, 'RGN', 'RAISINGHNAGAR', 24),
(1072, 'RHN', 'RAHON', 23),
(1073, 'RISHI', 'RISHIKESH', 28),
(1074, 'RISOD', 'RISOD', 2),
(1075, 'RJGR', 'RAJGIR', 11),
(1076, 'RJM', 'RAJAM', 3),
(1077, 'RJN', 'RAJNANDGAON', 1),
(1078, 'RJP', 'RAJPURA', 23),
(1079, 'RJPL', 'RAJPIPLA', 7),
(1080, 'RJPM', 'RAJAPALAYAM', 5),
(1081, 'RJUL', 'RAJULA', 7),
(1082, 'RJY', 'RAAJAMUNDRY', 3),
(1083, 'RKL', 'ROURKELA', 22),
(1084, 'RKOT', 'RAIKOT', 23),
(1085, 'RKS', 'RISHIKESH', 28),
(1086, 'RKT', 'RAJKOT', 7),
(1087, 'RM', 'RAMGANJ MANDI', 24),
(1088, 'RMCRM', 'RAMACHANDRPURAM', 3),
(1089, 'RMG', 'RAMGARH', 15),
(1090, 'RMN', 'RAMAN', 23),
(1091, 'RMNG', 'RAMANAGARAM', 16),
(1092, 'RMNR', 'RAMNAGAR', 27),
(1093, 'RMOL', 'RAMOL', 7),
(1094, 'RMP', 'RAMPUR', 27),
(1095, 'RMPH', 'RAMAPUR (H.P.)', 13),
(1096, 'RMPP', 'RAMPURA PHUL', 23),
(1097, 'RMPR', 'RAMAPURAM', 5),
(1098, 'RNG', 'RANGIA', 10),
(1099, 'RNGP', 'RANGPO', 25),
(1100, 'RNK', 'RENUKOOT', 27),
(1101, 'RNPR', 'RANIPUR', 27),
(1102, 'ROH', 'ROHINI-2 (30)', 30),
(1103, 'ROH-2', 'ROHINI-2', 30),
(1104, 'ROH2', 'ROHINI-2', 30),
(1105, 'ROO', 'ROHROO', 13),
(1106, 'ROORK', 'ROORKEE', 28),
(1107, 'ROP', 'ROPAR', 23),
(1108, 'RPR', 'RUPNAGAR', 23),
(1109, 'RPT', 'WALAJAPET', 5),
(1110, 'RRK', 'ROORKEE', 28),
(1111, 'RRP', 'RAIRANGPUR', 22),
(1112, 'RSD', 'RAJSAMAND', 24),
(1113, 'RTG', 'RATANGARH', 24),
(1114, 'RTQ', 'ROHTAK', 12),
(1115, 'RUD', 'RUDARPUR', 28),
(1116, 'RUR', 'RURA', 27),
(1117, 'RVPM', 'RAVULAPALEM', 3),
(1118, 'RWR', 'REWARI', 12),
(1119, 'RYD', 'RAYAGADA', 22),
(1120, 'RZL', 'ROZOLU', 3),
(1121, 'SAG', 'SAGAR', 6),
(1122, 'SAGAR', 'SAGAR', 16),
(1123, 'SAIBA', 'SAIBABA COLONY', 5),
(1124, 'SAL', 'SALON (U.P.)', 27),
(1125, 'SALIG', 'SALIGRAMAM II', 5),
(1126, 'SAM ', 'SAMANA', 23),
(1127, 'SANGA', 'SANGAMNER', 2),
(1128, 'SANGO', 'SANGOLE', 2),
(1129, 'SANK', 'SANKESHWAR', 16),
(1130, 'SAR', 'SARAN', 11),
(1131, 'SATAN', 'SATANA', 2),
(1132, 'SATNA', 'SATNA (M.P.)', 6),
(1133, 'SAVDA', 'SAVDA', 2),
(1134, 'SAVNE', 'SAVNER', 2),
(1135, 'SBD', 'SAHIBABAD', 27),
(1136, 'SBH', 'SAMBHA', 14),
(1137, 'SBKM', 'SEMBAKKAM', 5),
(1138, 'SBM', 'SHAHABAD MARKANDA', 24),
(1139, 'SBP', 'SAMBALPUR', 22),
(1140, 'SBR', 'SIBSAGAR', 10),
(1141, 'SBTH', 'SUBATHU', 13),
(1142, 'SCN', 'SACHIN', 7),
(1143, 'SDBD', 'SADABAD', 27),
(1144, 'SDG', 'SINDGI', 16),
(1145, 'SDH', 'SOUTH 30 HUB', 30),
(1146, 'SDL', 'SANDILA', 27),
(1147, 'SDNR', 'SINDHNUR', 16),
(1148, 'SDPR', 'SAIDPUR', 27),
(1149, 'SDS', 'SADULSHAHAR', 24),
(1150, 'SDSR', 'SARDARSHAHAR', 24),
(1151, 'SDT', 'SADAT', 27),
(1152, 'SEC', 'SECUNDERABAD', 3),
(1153, 'SEKOR', 'SEKORE', 6),
(1154, 'SFPR', 'SAFIPUR', 27),
(1155, 'SGGN', 'SHIGGAON', 16),
(1156, 'SGH', 'SIDDHARTHNAGAR', 27),
(1157, 'SGN', 'SRIGANGA NAGAR', 24),
(1158, 'SGP', 'SIRUGUPPA', 16),
(1159, 'SGR', 'SANGRUR', 23),
(1160, 'SGTM', 'SINGTAM', 25),
(1161, 'SGW', 'SAGWARA', 24),
(1162, 'SHAHA', 'SHAHADE', 2),
(1163, 'SHEO', 'SHEOGANJ', 24),
(1164, 'SHI', 'SHAHI', 27),
(1165, 'SHIRD', 'SHIRDI', 2),
(1166, 'SHIRU', 'SHIRUR', 2),
(1167, 'SHIVA', 'SHIVAJINAGAR', 2),
(1168, 'SHJ', 'SHAHGANJ', 27),
(1169, 'SHK', 'SHAHKOT', 23),
(1170, 'SHL', 'SHILLONG', 19),
(1171, 'SHM', 'SHAMLI', 27),
(1172, 'SHN', 'SOHNA', 12),
(1173, 'SHP', 'SHAHPURA', 24),
(1174, 'SHPR', 'SAHASPUR', 27),
(1175, 'SHPUR', 'SAHANPUR', 27),
(1176, 'SHR', 'SHAHPUR', 27),
(1177, 'SHRIV', 'SHRIVARDHAN', 2),
(1178, 'SHRS', 'SAHARSA', 11),
(1179, 'SIK', 'SIKAR', 24),
(1180, 'SIL', 'SILVASA', 2),
(1181, 'SILLO', 'SILLOD', 2),
(1182, 'SINGA', 'SINGANALLUR', 5),
(1183, 'SINNA', 'SINNAR', 2),
(1184, 'SIR', 'SIRHIND', 23),
(1185, 'SIRO', 'SIROHI', 24),
(1186, 'SIRSI', 'SIRSI (KARNATAKA)', 16),
(1187, 'SIT', 'SITAPUR', 27),
(1188, 'SITRA', 'SITRA', 5),
(1189, 'SJG', 'SUJANGARH', 24),
(1190, 'SJN', 'SAHAJAHAN PUR (RAJ.)', 24),
(1191, 'SJNUP', 'SHAHJAHANPUR (U.P.)', 27),
(1192, 'SJWA', 'SAHJANWA', 27),
(1193, 'SKB', 'SHIKOHABAD', 27),
(1194, 'SKBD', 'SIKANDRABAD', 27),
(1195, 'SKDR', 'SIKANDRA', 27),
(1196, 'SKLM', 'SRIKAKULAM', 3),
(1197, 'SKLP', 'SAKLESHPUR', 16),
(1198, 'SKM', 'SIKKIM', 25),
(1199, 'SKN', 'SHANKARGARH', 27),
(1200, 'SKNR', 'SIKANDERPUR', 27),
(1201, 'SKT', 'SHERKOT', 27),
(1202, 'SKTR', 'SHAKTINAGAR', 16),
(1203, 'SLG', 'SILIGURI', 4),
(1204, 'SLM', 'SALEM', 5),
(1205, 'SLN', 'SOLAN', 13),
(1206, 'SLP', 'SHOLAPUR', 2),
(1207, 'SLPR', 'SALEMPUR', 27),
(1208, 'SLR', 'SILCHAR', 10),
(1209, 'SM', 'SARAI MIR', 27),
(1210, 'SMB', 'SAMBHAL', 27),
(1211, 'SMDP', 'SRI MADHOPUR', 24),
(1212, 'SMG', 'SHIMOGA', 16),
(1213, 'SML', 'SHIMLA', 13),
(1214, 'SMLK', 'SAMALKHA', 12),
(1215, 'SMLKT', 'SAMALKOT', 3),
(1216, 'SMP', 'SWAIMADHOPUR', 24),
(1217, 'SMT', 'SAMTHAR', 27),
(1218, 'SNB', 'SONBHADRA', 27),
(1219, 'SNDI', 'SANDI', 27),
(1220, 'SNG', 'SANGLI', 2),
(1221, 'SNKM', 'SHENBAKKAM', 5),
(1222, 'SNP', 'SONEPAT', 12),
(1223, 'SNPR', 'SONEPUR', 11),
(1224, 'SNU', 'SANAUR', 23),
(1225, 'SONA', 'SONAPUR', 22),
(1226, 'SPD', 'SANPADA', 2),
(1227, 'SPL', 'SUPAUL', 11),
(1228, 'SRDG', 'SARDULGARH', 23),
(1229, 'SRE', 'SAHARANPUR', 27),
(1230, 'SRG', 'SHERGARH', 27),
(1231, 'SRI', 'SRINAGAR', 14),
(1232, 'SRIVA', 'SRIVALLIPUTHUR', 5),
(1233, 'SRL', 'SAMRALA', 23),
(1234, 'SRM', 'SASARA', 11),
(1235, 'SRNA', 'SURENDRANAGAR', 7),
(1236, 'SRO', 'SORO', 22),
(1237, 'SRP', 'SRIPERUMBUDUR', 5),
(1238, 'SRS', 'SIRSA (12)', 12),
(1239, 'SRSI', 'SIRSI (UP)', 27),
(1240, 'SRT', 'SURAT', 7),
(1241, 'SRTH', 'SIRATHU', 27),
(1242, 'SRWN', 'SURIYAWAN', 27),
(1243, 'SSGJ', 'SIRSAGANJ', 27),
(1244, 'SSL', 'SISAULI', 27),
(1245, 'SSWN', 'SAHASWAN', 27),
(1246, 'STG', 'SURATGARH', 24),
(1247, 'STL', 'SULTANPUR LODHI', 23),
(1248, 'STM', 'SITAMARHI', 11),
(1249, 'STN', 'SATNA', 27),
(1250, 'STP ', 'SATTENAPALLI', 3),
(1251, 'STPR', 'SAMASTIPUR', 11),
(1252, 'STWR', 'SAHATWAR', 27),
(1253, 'SUAR', 'SUAR', 27),
(1254, 'SUL', 'SULTANPUR', 27),
(1255, 'SUM', 'SUMERPUR', 24),
(1256, 'SUN', 'SUNAM (23)', 23),
(1257, 'SUNG', 'SUNDARGARH', 22),
(1258, 'SVK', 'SIVAKASI', 5),
(1259, 'SVN', 'SAVANUR', 16),
(1260, 'SWN', 'SIWAN', 11),
(1261, 'SWR', 'SAHAWAR', 27),
(1262, 'SWS', 'SHRAWASTI', 27),
(1263, 'SXR', 'SRI NAGAR', 14),
(1264, 'TALOD', 'TALODE', 2),
(1265, 'TAN ', 'TANUKU', 3),
(1266, 'TANJO', 'TANJORE', 5),
(1267, 'TAR', 'TARAORI', 12),
(1268, 'TASGA', 'TASGAON', 2),
(1269, 'TATA', 'TATABAD', 5),
(1270, 'TBHT', 'TALBEHAT', 27),
(1271, 'TDL', 'TUNDLA', 27),
(1272, 'TDPZ', 'THODUPUZHA', 17),
(1273, 'TENKA', 'TENKASI', 5),
(1274, 'TEZ', 'TEZPUR', 10),
(1275, 'TGR', 'TALGRAM', 27),
(1276, 'THEOG', 'THEOG', 13),
(1277, 'THIN', 'THINELVELI', 5),
(1278, 'THINE', 'THINELVELI', 5),
(1279, 'THIRU', 'THIRUCHENGODU', 5),
(1280, 'THLR', 'THIRUVALLUR', 5),
(1281, 'THN', 'THANE', 2),
(1282, 'THUDI', 'THUDIALUR', 5),
(1283, 'THVM', 'THIRUVANTHAPURAM', 17),
(1284, 'TIR ', 'TIRUPUR', 5),
(1285, 'TIRUK', 'TIRUKATTUPALLI', 5),
(1286, 'TLSRY', 'THALASSERRY', 17),
(1287, 'TMI', 'TIRUVANNAMALAI', 5),
(1288, 'TMK', 'TUMKUR', 16),
(1289, 'TMRM', 'TAMBARAM', 5),
(1290, 'TND', 'TANDA', 27),
(1291, 'TNGD', 'THANGADH', 7),
(1292, 'TNJ', 'THANJAVUR', 5),
(1293, 'TNLI', 'TENALI', 3),
(1294, 'TOH', 'TOHANA', 12),
(1295, 'TON', 'TONK', 24),
(1296, 'TPG', 'TADEPALLIGUDEM', 3),
(1297, 'TPTI', 'TIRUPATHI', 3),
(1298, 'TPTR', 'TADIPATRI', 3),
(1299, 'TRI2', 'TRICHY 2', 5),
(1300, 'TRI3', 'TRICHY 3', 5),
(1301, 'TRI4', 'TRICHY 4', 5),
(1302, 'TRIC', 'TRICHY 1', 5),
(1303, 'TRICR', 'TRICHUR', 17),
(1304, 'TRICY', 'TRICHY', 5),
(1305, 'TRK', 'TARIKERE', 16),
(1306, 'TRPR', 'TRIPRAYAR', 17),
(1307, 'TRV', 'TRIVANDRUM', 17),
(1308, 'TRZ', 'TIRUCHIRAPPALLI', 5),
(1309, 'TSK', 'TINSUKIA', 10),
(1310, 'TUMSA', 'TUMSAR', 2),
(1311, 'TUR', 'TIRUR', 17),
(1312, 'TUT', 'THOOTHUKKUDI', 5),
(1313, 'TUTIC', 'TUTICORIN', 5),
(1314, 'TVKD', 'TIRUVERKADU', 5),
(1315, 'TVL', 'TIRUNELVELI', 5),
(1316, 'TVLA', 'TIRUVALLA', 17),
(1317, 'TVLR', 'TIRUVALLUR', 5),
(1318, 'TVR', 'THIRUVARUR', 5),
(1319, 'TVTR', 'TIRUVOTTIYUR', 5),
(1320, 'TWB', 'TALWANDI BHAI', 23),
(1321, 'UDHAM', 'UDHAMPUR', 14),
(1322, 'UDN', 'UDHANA', 7),
(1323, 'UDP', 'UDAIPUR', 24),
(1324, 'UDPI', 'UDUPI', 16),
(1325, 'UJJAI', 'UJJAIN', 6),
(1326, 'ULS', 'ULHAS NAGAR', 2),
(1327, 'UMRED', 'UMRED', 2),
(1328, 'UNA', 'UNA', 13),
(1329, 'UNJ', 'UNJHA', 7),
(1330, 'UNN', 'UNNAO', 27),
(1331, 'UOLY', 'UPPIDAMANGALAM', 5),
(1332, 'UPLT', 'UPLETA', 7),
(1333, 'VADAP', 'VADAPALANI', 5),
(1334, 'VADO', 'VADODARA', 7),
(1335, 'VDKR', 'VADAKARA', 17),
(1336, 'VDLR', 'VANDALUR', 5),
(1337, 'VDNR', 'VIRUDHUNAGAR', 5),
(1338, 'VELLO', 'VELLORE', 5),
(1339, 'VIDIS', 'VIDISHA', 6),
(1340, 'VILLI', 'VILLIVAKKAM', 5),
(1341, 'VILLU', 'VILLUPURAM', 5),
(1342, 'VIRU', 'VIRUNAGAR', 5),
(1343, 'VIRUD', 'VIRUDHACHALAM', 5),
(1344, 'VJA', 'VIJAYAWADA', 3),
(1345, 'VJLP', 'VEJALPUR', 7),
(1346, 'VLR', 'VELLORE', 5),
(1347, 'VLSD', 'VALSAD', 7),
(1348, 'VNB', 'VANIYAMBADI', 5),
(1349, 'VPI', 'VAPI', 7),
(1350, 'VPM', 'VILUPPURAM', 5),
(1351, 'VRS', 'VARANASI', 27),
(1352, 'VRTJ', 'VARTEJ', 7),
(1353, 'VRVL', 'VERAVAL', 7),
(1354, 'VSK', 'VISAKHAPATNAM', 3),
(1355, 'VSTL', 'VASTRAL', 7),
(1356, 'VSVR', 'VISAVADAR', 7),
(1357, 'VTP', 'VENKATAPURA', 16),
(1358, 'VYR', 'VYARA', 7),
(1359, 'VYRU', 'VUYYURU', 3),
(1360, 'VZM', 'VIZIAYANAGARAM', 3),
(1361, 'WADI', 'WADI', 2),
(1362, 'WANI', 'WANI', 2),
(1363, 'WARDH', 'WARDHA', 2),
(1364, 'WARUD', 'WARUD', 2),
(1365, 'WLGT', 'WELLINGTON', 5),
(1366, 'WLJB', 'WALAJABAD', 5),
(1367, 'WNKR', 'WANKANER', 7),
(1368, 'WRG', 'WARANGAL', 3),
(1369, 'YLCH', 'YELLAMANCHILI', 3),
(1370, 'YLK', 'YELAHANKA', 16),
(1371, 'YLP', 'YELLAPUR', 16),
(1372, 'YMGR', 'YEMMIGANUR', 3),
(1373, 'YNM', 'YANAM', 3),
(1374, 'YNMP', 'YANAM', 33),
(1375, 'YNR', 'YAMUNANAGAR', 12),
(1376, 'YVM', 'YEOTAMAL', 2),
(1377, 'ZRA', 'ZIRA', 23),
(1378, 'ZRK', 'ZIRAK PUR', 23),
(1379, 'SARAI', 'SARAIPALLI', 1),
(1380, 'KONDA', 'KONDAGAON', 1),
(1381, 'KUMH', 'KUMHARI', 1),
(1382, 'SURAJ', 'SURAJPUR', 1),
(1383, 'BAIKU', 'BAIKUNTHPUR', 1),
(1384, 'GOA', 'GOA', 8);

-- --------------------------------------------------------

--
-- Table structure for table `hub_master`
--

CREATE TABLE `hub_master` (
  `Hub_Id` tinyint(4) NOT NULL,
  `Hub_Code` varchar(20) NOT NULL,
  `Hub_Name` varchar(50) NOT NULL,
  `Destination_Id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hub_master`
--

INSERT INTO `hub_master` (`Hub_Id`, `Hub_Code`, `Hub_Name`, `Destination_Id`) VALUES
(3, 'DEL', 'DELHI', 319),
(4, 'MUM', 'MUMBAI', 882),
(5, 'CCU', 'KOLKATA', 247),
(6, 'CHI', 'CHENNAI', 263),
(7, 'HYD', 'HYDERABAD', 495),
(8, 'PNQ', 'PUNE', 1018),
(9, 'BLR', 'BANGALORE', 183),
(10, 'AMD', 'AHMEDABAD', 42),
(11, 'JAM', 'JAMSHEDPUR', 554),
(12, 'RKL', 'ROURKELA', 1083),
(13, 'BHIL', 'BHILAI', 154),
(14, 'RAI', 'RAIPUR', 1053),
(15, 'BSP', 'BILASPUR', 185),
(16, 'RGH', 'RAIGARH', 1070),
(17, 'ABP', 'AMBIKAAPUR', 3),
(18, 'JDR', 'JAGDALPUR', 565),
(19, 'DHAM', 'DHAMTARI', 330),
(20, 'RJN', 'RAJNANDGAON', 1077),
(21, 'DRG', 'DURG', 357);

-- --------------------------------------------------------

--
-- Table structure for table `inscan_detail`
--

CREATE TABLE `inscan_detail` (
  `Detail_Id` int(11) UNSIGNED NOT NULL,
  `Manifest_Id` int(11) NOT NULL,
  `Consignment_No` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Consignment_Reason` tinyint(4) DEFAULT NULL,
  `Destination_Id` smallint(6) NOT NULL,
  `Consignment_Mode` tinyint(4) NOT NULL,
  `Rec_Date` datetime NOT NULL,
  `Pcs` smallint(6) NOT NULL,
  `DoxNdox` tinyint(4) NOT NULL,
  `Weight` decimal(6,2) NOT NULL,
  `Topay` decimal(10,2) DEFAULT NULL,
  `Cod` decimal(10,2) DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inscan_detail`
--

INSERT INTO `inscan_detail` (`Detail_Id`, `Manifest_Id`, `Consignment_No`, `Consignment_Reason`, `Destination_Id`, `Consignment_Mode`, `Rec_Date`, `Pcs`, `DoxNdox`, `Weight`, `Topay`, `Cod`, `Remark`) VALUES
(1, 1, '1', 2, 1, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(2, 1, '2', 2, 1, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(3, 1, '3', 2, 1, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(4, 1, '4', 2, 1, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(5, 1, '5', 2, 1, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(8, 2, '1', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(9, 2, '2', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(10, 2, '3', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(11, 2, '4', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(12, 2, '5', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1216, 38, '6', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1217, 38, '7', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1218, 38, '8', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1219, 38, '9', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1220, 38, '10', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1245, 43, '6', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1246, 43, '7', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1247, 43, '8', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1248, 43, '9', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1249, 43, '10', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1267, 45, '11', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1268, 45, '12', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1269, 45, '13', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1270, 45, '14', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1271, 45, '15', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1274, 46, '11', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1275, 46, '12', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1276, 46, '13', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1277, 46, '14', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1278, 46, '15', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1281, 47, '16', 2, 3, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1282, 47, '17', 2, 3, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1283, 47, '18', 2, 3, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1284, 47, '19', 2, 3, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1285, 47, '20', 2, 3, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1288, 48, '21', 2, 17, 2, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1289, 48, '22', 2, 17, 2, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1290, 48, '23', 2, 17, 2, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1291, 48, '24', 2, 17, 2, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1292, 48, '25', 2, 17, 2, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1309, 51, '21', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1310, 51, '22', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1311, 51, '23', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1312, 51, '24', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1313, 51, '25', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1316, 52, '21', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1317, 52, '22', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1318, 52, '23', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1319, 52, '24', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1320, 52, '25', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1321, 52, '100', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1322, 52, '101', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1323, 52, '102', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1324, 52, '103', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1325, 52, '104', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1326, 52, '105', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1327, 52, '106', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1328, 52, '107', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1329, 52, '108', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1330, 52, '109', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1331, 52, '110', 2, 15, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1347, 53, '101', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1348, 53, '102', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1349, 53, '103', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1350, 53, '104', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1351, 53, '105', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1352, 53, '106', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1353, 53, '107', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1354, 53, '108', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1355, 53, '109', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1356, 53, '110', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1362, 54, '201', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1363, 54, '202', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1364, 54, '203', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1365, 54, '204', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1366, 54, '205', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1367, 54, '206', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1368, 54, '207', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1369, 54, '208', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1370, 54, '209', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1371, 54, '210', 2, 17, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1377, 55, '201', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1378, 55, '202', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1379, 55, '203', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1380, 55, '204', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1381, 55, '205', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1382, 55, '206', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1383, 55, '207', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1384, 55, '208', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1385, 55, '209', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1386, 55, '210', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1392, 56, '50', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1393, 56, '51', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1394, 56, '52', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1395, 56, '53', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1396, 56, '54', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1397, 56, '55', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1398, 56, '56', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1399, 56, '57', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1400, 56, '58', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1401, 56, '59', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1402, 56, '60', 2, 18, 2, '2015-02-26 12:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(1407, 57, '50', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1408, 57, '51', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1409, 57, '52', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1410, 57, '53', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1411, 57, '54', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1412, 57, '55', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1413, 57, '56', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1414, 57, '57', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1415, 57, '58', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1416, 57, '59', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1417, 57, '60', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1418, 58, '50', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1419, 58, '51', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1420, 58, '52', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1421, 58, '53', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1422, 58, '54', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1423, 58, '55', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1424, 58, '56', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1425, 58, '57', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1426, 58, '58', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1427, 58, '59', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1428, 58, '60', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1429, 59, '300', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1430, 59, '301', 2, 1, 1, '2015-03-02 03:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1431, 59, '302', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1432, 59, '303', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1433, 59, '304', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1465, 63, '300', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1466, 63, '301', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1467, 63, '302', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1468, 63, '303', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1469, 63, '304', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1479, 65, '300', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1480, 65, '301', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1481, 65, '302', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1482, 65, '303', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1483, 65, '304', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1486, 66, '305', 2, 3, 2, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1487, 66, '306', 2, 3, 2, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1488, 66, '307', 2, 3, 2, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1489, 66, '308', 2, 3, 2, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1490, 66, '309', 2, 3, 2, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1491, 66, '310', 2, 3, 2, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1492, 67, '305', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1493, 67, '306', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1494, 67, '307', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1495, 67, '308', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1496, 67, '309', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1497, 67, '310', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1506, 69, '305', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1507, 69, '306', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1508, 69, '307', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1509, 69, '308', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1510, 69, '309', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1511, 69, '310', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1512, 70, '123456', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1513, 70, '123457', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1514, 70, '123458', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1515, 70, '123459', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1516, 70, '123460', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1519, 71, '123456', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1520, 71, '123457', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1521, 71, '123458', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1522, 71, '123459', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1523, 71, '123460', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1530, 72, '22222222', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1531, 72, '22222223', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1532, 72, '22222224', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1533, 72, '22222225', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1534, 72, '22222226', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1535, 72, '22222227', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1536, 72, '22222228', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1537, 72, '22222229', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1538, 72, '22222230', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1539, 72, '22222231', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1540, 72, '22222232', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1541, 72, '22222233', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1542, 72, '22222234', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1543, 72, '22222235', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1544, 72, '22222236', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1545, 72, '22222237', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1546, 72, '22222238', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1547, 72, '22222239', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1548, 72, '22222240', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1549, 72, '22222241', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1550, 72, '22222242', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1551, 72, '22222243', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1552, 72, '22222244', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1553, 72, '22222245', 2, 319, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '1.00', ''),
(1555, 73, '2000000', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1556, 73, '2000001', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1557, 73, '2000002', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1558, 73, '2000003', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1559, 73, '2000004', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1560, 73, '2000005', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1561, 73, '2000006', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1562, 73, '2000007', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1563, 73, '2000008', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1564, 73, '2000009', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1565, 73, '2000010', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1566, 73, '2000011', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1567, 73, '2000012', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1568, 73, '2000013', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1569, 73, '2000014', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1570, 73, '2000015', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1571, 73, '2000016', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1572, 73, '2000017', 2, 1, 1, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1573, 73, '156789', 2, 3, 2, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1574, 73, '156790', 2, 3, 2, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1575, 73, '156791', 2, 3, 2, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1576, 73, '156792', 2, 3, 2, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1577, 73, '156793', 2, 3, 2, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1578, 73, '156794', 2, 3, 2, '2015-03-31 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1579, 74, '305', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1580, 74, '301111', 2, 3, 2, '2015-03-02 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1581, 74, '307', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1582, 74, '308', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1583, 74, '309', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1584, 74, '310', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(1669, 97, '111111', 2, 3, 2, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '0.00', ''),
(1670, 97, '111112', 2, 3, 2, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '0.00', ''),
(1671, 97, '111113', 2, 3, 2, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '0.00', ''),
(1672, 97, '111114', 2, 3, 2, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '0.00', ''),
(1673, 97, '111115', 2, 3, 2, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '0.00', ''),
(1674, 99, '111111', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(1675, 99, '111112', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(1676, 99, '111113', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(1677, 99, '111114', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(1678, 99, '111115', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(1695, 102, '111111', 2, 3, 2, '2015-04-16 13:53:07', 1, 1, '1.00', '1.00', '0.00', ''),
(1696, 102, '111112', 2, 3, 2, '2015-04-16 13:53:08', 1, 1, '1.00', '1.00', '0.00', ''),
(1697, 102, '111113', 2, 3, 2, '2015-04-16 13:53:08', 1, 1, '1.00', '1.00', '0.00', ''),
(1698, 102, '111114', 2, 3, 2, '2015-04-16 13:53:09', 1, 1, '1.00', '1.00', '0.00', ''),
(1699, 102, '111115', 2, 3, 2, '2015-04-16 13:53:10', 1, 1, '1.00', '1.00', '0.00', ''),
(1700, 103, '111111', 2, 3, 2, '2015-04-16 13:53:07', 1, 1, '1.00', '1.00', '0.00', ''),
(1701, 103, '111112', 2, 3, 2, '2015-04-16 13:53:08', 1, 1, '1.00', '1.00', '0.00', ''),
(1702, 103, '111113', 2, 3, 2, '2015-04-16 13:53:08', 1, 1, '1.00', '1.00', '0.00', ''),
(1703, 103, '111114', 2, 3, 2, '2015-04-16 13:53:09', 1, 1, '1.00', '1.00', '0.00', ''),
(1704, 103, '111115', 2, 3, 2, '2015-04-16 13:53:10', 1, 1, '1.00', '1.00', '0.00', ''),
(1707, 104, '100001', 2, 1, 1, '2015-05-11 15:41:46', 1, 1, '1.00', '0.00', '0.00', ''),
(1708, 104, '100002', 2, 1, 1, '2015-05-11 15:41:58', 1, 1, '1.00', '0.00', '0.00', ''),
(1709, 104, '100003', 2, 1, 1, '2015-05-11 15:41:59', 1, 1, '1.00', '0.00', '0.00', ''),
(1710, 104, '100004', 2, 1, 1, '2015-05-11 15:42:00', 1, 1, '1.00', '0.00', '0.00', ''),
(1711, 104, '100005', 2, 1, 1, '2015-05-11 15:42:04', 1, 1, '1.00', '0.00', '0.00', ''),
(1735, 120, '100001', 0, 1, 1, '2015-05-11 16:30:55', 1, 1, '1.00', '0.00', '0.00', ''),
(1736, 120, '100002', 0, 1, 1, '2015-05-11 16:31:00', 1, 1, '1.00', '0.00', '0.00', ''),
(1737, 120, '100003', 0, 1, 1, '2015-05-11 16:31:04', 1, 1, '1.00', '0.00', '0.00', ''),
(1738, 120, '100004', 0, 1, 1, '2015-05-11 16:31:08', 1, 1, '1.00', '0.00', '0.00', ''),
(1739, 120, '100005', 0, 1, 1, '2015-05-11 16:31:11', 1, 1, '1.00', '0.00', '0.00', ''),
(1742, 121, '100001', 0, 1, 1, '2015-05-11 16:33:15', 1, 1, '1.00', '0.00', '0.00', ''),
(1743, 121, '100002', 0, 1, 1, '2015-05-11 16:33:27', 1, 1, '1.00', '0.00', '0.00', ''),
(1744, 121, '100003', 0, 1, 1, '2015-05-11 16:33:43', 1, 1, '1.00', '0.00', '0.00', ''),
(1745, 121, '100004', 0, 1, 1, '2015-05-11 16:33:49', 1, 1, '1.00', '0.00', '0.00', ''),
(1746, 121, '100005', 0, 1, 1, '2015-05-11 16:33:56', 1, 1, '1.00', '0.00', '0.00', ''),
(1749, 122, '100001', 0, 1, 1, '2015-05-11 17:03:35', 1, 1, '1.00', '0.00', '0.00', ''),
(1750, 122, '100002', 0, 1, 1, '2015-05-11 17:03:45', 1, 1, '1.00', '0.00', '0.00', ''),
(1751, 122, '100003', 0, 1, 1, '2015-05-11 17:03:52', 1, 1, '1.00', '0.00', '0.00', ''),
(1752, 122, '100004', 0, 1, 1, '2015-05-11 17:03:58', 1, 1, '1.00', '0.00', '0.00', ''),
(1753, 122, '100005', 0, 1, 1, '2015-05-11 17:04:06', 1, 1, '1.00', '0.00', '0.00', ''),
(1754, 123, '100001', 0, 1, 1, '2015-05-11 16:01:12', 1, 1, '1.00', '0.00', '0.00', ''),
(1755, 123, '100002', 0, 1, 1, '2015-05-11 16:01:18', 1, 1, '1.00', '0.00', '0.00', ''),
(1756, 123, '100003', 0, 1, 1, '2015-05-11 16:01:23', 1, 1, '1.00', '0.00', '0.00', ''),
(1757, 123, '100004', 0, 1, 1, '2015-05-11 16:01:38', 1, 1, '1.00', '0.00', '0.00', ''),
(1758, 123, '100005', 0, 1, 1, '2015-05-11 16:01:43', 1, 1, '1.00', '0.00', '0.00', ''),
(1768, 125, '200001', 0, 1, 2, '2015-06-24 17:41:07', 1, 1, '1.00', '1.00', '0.00', ''),
(1769, 125, '200002', 0, 1, 2, '2015-06-24 17:41:08', 1, 1, '1.00', '1.00', '0.00', ''),
(1770, 125, '200003', 0, 1, 2, '2015-06-24 17:41:09', 1, 1, '1.00', '1.00', '0.00', ''),
(1771, 125, '200004', 0, 1, 2, '2015-06-24 17:41:10', 1, 1, '1.00', '1.00', '0.00', ''),
(1772, 125, '200005', 0, 1, 2, '2015-06-24 17:41:12', 1, 1, '1.00', '1.00', '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `inscan_main`
--

CREATE TABLE `inscan_main` (
  `Manifest_Id` int(11) NOT NULL,
  `Manifest_No` varchar(20) NOT NULL,
  `Manifest_From_Destination` smallint(6) DEFAULT NULL,
  `Manifest_From_Branch` smallint(6) DEFAULT NULL,
  `Outscan_Manifest_Id` int(11) DEFAULT NULL,
  `Manifest_Date` datetime DEFAULT NULL,
  `Branch_Id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inscan_main`
--

INSERT INTO `inscan_main` (`Manifest_Id`, `Manifest_No`, `Manifest_From_Destination`, `Manifest_From_Branch`, `Outscan_Manifest_Id`, `Manifest_Date`, `Branch_Id`) VALUES
(1, '100000000001', NULL, NULL, NULL, '2015-02-21 00:00:00', 4),
(2, '100000000002', 1, NULL, NULL, '2015-02-21 00:00:00', 5),
(5, '100000000003', 1, NULL, NULL, '2015-02-21 00:00:00', 5),
(38, '100000000004', NULL, NULL, NULL, '2015-02-26 00:00:00', 4),
(43, '100000000005', NULL, NULL, NULL, '2015-02-26 00:00:00', 5),
(44, '100000000006', 2, NULL, NULL, '2015-02-26 00:00:00', 4),
(45, '100000000007', NULL, NULL, NULL, '2015-02-26 00:00:00', 4),
(46, '100000000008', 2, NULL, NULL, '2015-02-26 00:00:00', 5),
(47, '100000000009', NULL, NULL, NULL, '2015-02-26 00:00:00', 5),
(48, '100000000010', NULL, NULL, NULL, '2015-02-26 00:00:00', 5),
(50, '100000000011', 2, NULL, NULL, '2015-02-26 00:00:00', 4),
(51, '100000000012', 2, NULL, NULL, '2015-02-26 00:00:00', 4),
(52, '100000000013', NULL, NULL, NULL, '2015-02-26 00:00:00', 4),
(53, '100000000014', 1, NULL, NULL, '2015-02-26 00:00:00', 5),
(54, '100000000015', NULL, NULL, NULL, '2015-02-26 00:00:00', 5),
(55, '100000000016', 1053, NULL, NULL, '2015-02-26 00:00:00', 4),
(56, '100000000017', NULL, NULL, NULL, '2015-02-26 00:00:00', 4),
(57, '100000000018', 1, NULL, NULL, '2015-02-26 00:00:00', 5),
(58, '100000000019', 1, NULL, NULL, '2015-02-28 00:00:00', 6),
(59, '100000000020', NULL, NULL, NULL, '2015-03-02 00:00:00', 4),
(63, '100000000021', 3, NULL, NULL, '2015-03-02 00:00:00', 6),
(65, '100000000022', 1, NULL, NULL, '2015-03-02 00:00:00', 7),
(66, '865587538', NULL, NULL, NULL, '2015-03-02 12:00:00', 7),
(67, '131121610', 1053, NULL, NULL, '2015-03-03 12:00:00', 4),
(69, '1258943891', 3, NULL, NULL, '2015-03-03 00:00:00', 6),
(70, '1172057778', NULL, NULL, NULL, '2015-03-25 00:00:00', 4),
(71, '1294659426', 1, NULL, NULL, '2015-03-25 00:00:00', 7),
(72, '1208524166', NULL, NULL, NULL, '2015-03-31 00:00:00', 4),
(73, '1068390120', NULL, NULL, NULL, '2015-03-31 00:00:00', 4),
(74, '1245528665', 1053, NULL, NULL, '2015-04-03 00:00:00', 4),
(97, '1403245167', NULL, NULL, NULL, '2015-04-15 00:00:00', 5),
(98, '1370044986', 158, NULL, NULL, '2015-04-16 13:41:55', 8),
(99, '1392683179', 158, NULL, NULL, '2015-04-16 13:43:33', 8),
(102, '1137155666', 1053, NULL, NULL, '2015-04-16 15:49:49', 4),
(103, '1032161502', 1053, NULL, NULL, '2015-05-11 15:25:24', 4),
(104, '1007946518', NULL, NULL, NULL, '2015-05-11 15:42:07', 4),
(120, '1035940791', 154, 5, NULL, '2015-05-11 16:31:14', 5),
(121, '1309025731', 3, 6, NULL, '2015-05-11 17:02:09', 6),
(122, '1082844024', 1, 7, NULL, '2015-05-11 17:21:38', 7),
(123, '1018470963', 1, 7, NULL, '2015-06-24 16:01:49', 4),
(125, '1024728065', NULL, NULL, NULL, '2015-06-24 17:41:16', 4);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_Id` smallint(5) UNSIGNED NOT NULL,
  `Invoice_No` varchar(10) DEFAULT NULL,
  `Customer_Id` mediumint(8) UNSIGNED DEFAULT NULL,
  `Date_From` date NOT NULL,
  `Date_To` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Paid_Date` date DEFAULT NULL,
  `Receipt_No` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`Invoice_Id`, `Invoice_No`, `Customer_Id`, `Date_From`, `Date_To`, `Amount`, `Paid_Date`, `Receipt_No`) VALUES
(1, '6649169', 3, '2015-02-01', '2015-02-28', '100500.00', '2015-03-26', '384930'),
(8, '2525726', 3, '2015-03-01', '2015-03-31', '240000.00', '2015-04-01', '103021');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `Login_Id` smallint(6) NOT NULL,
  `Login_Name` varchar(50) NOT NULL,
  `Login_Pwd` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`Login_Id`, `Login_Name`, `Login_Pwd`) VALUES
(1, 'admin', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `outscan_detail`
--

CREATE TABLE `outscan_detail` (
  `Detail_Id` int(11) UNSIGNED NOT NULL,
  `Manifest_Id` int(11) NOT NULL,
  `Consignment_No` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Consignment_Reason` tinyint(4) DEFAULT NULL,
  `Destination_Id` smallint(6) NOT NULL,
  `Consignment_Mode` tinyint(4) NOT NULL,
  `Rec_Date` datetime NOT NULL,
  `Pcs` smallint(6) NOT NULL,
  `DoxNdox` tinyint(4) NOT NULL,
  `Weight` decimal(6,2) NOT NULL,
  `Topay` decimal(10,2) DEFAULT NULL,
  `Cod` decimal(10,2) DEFAULT NULL,
  `Remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outscan_detail`
--

INSERT INTO `outscan_detail` (`Detail_Id`, `Manifest_Id`, `Consignment_No`, `Consignment_Reason`, `Destination_Id`, `Consignment_Mode`, `Rec_Date`, `Pcs`, `DoxNdox`, `Weight`, `Topay`, `Cod`, `Remark`) VALUES
(1, 5, '1', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(2, 5, '2', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(3, 5, '3', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(4, 5, '4', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(5, 5, '5', 2, 2, 1, '2015-02-21 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(18, 8, '6', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(19, 8, '7', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(20, 8, '8', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(21, 8, '9', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(22, 8, '10', 2, 2, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(32, 10, '11', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(33, 10, '12', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(34, 10, '13', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(35, 10, '14', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(36, 10, '15', 2, 17, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(39, 11, '16', 2, 16, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(40, 11, '17', 2, 16, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(41, 11, '18', 2, 16, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(42, 11, '19', 2, 16, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(43, 11, '20', 2, 16, 1, '2015-02-26 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(46, 12, '21', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(47, 12, '22', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(48, 12, '23', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(49, 12, '24', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(50, 12, '25', 2, 2, 1, '2015-02-26 00:00:00', 1, 2, '1.00', '1.00', '0.00', ''),
(53, 13, '101', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(54, 13, '102', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(55, 13, '103', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(56, 13, '104', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(57, 13, '105', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(58, 13, '106', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(59, 13, '107', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(60, 13, '108', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(61, 13, '109', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(62, 13, '110', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(68, 14, '201', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(69, 14, '202', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(70, 14, '203', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(71, 14, '204', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(72, 14, '205', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(73, 14, '206', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(74, 14, '207', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(75, 14, '208', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(76, 14, '209', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(77, 14, '210', 2, 18, 2, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(83, 15, '50', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(84, 15, '51', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(85, 15, '52', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(86, 15, '53', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(87, 15, '54', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(88, 15, '55', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(89, 15, '56', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(90, 15, '57', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(91, 15, '58', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(92, 15, '59', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(93, 15, '60', 2, 1, 1, '2015-02-26 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(94, 16, '300', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(95, 16, '301', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(96, 16, '302', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(97, 16, '303', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(98, 16, '304', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(101, 17, '300', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(102, 17, '301', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(103, 17, '302', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(104, 17, '303', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(105, 17, '304', 2, 1, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(115, 19, '305', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(116, 19, '306', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(117, 19, '307', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(118, 19, '308', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(119, 19, '309', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(120, 19, '310', 2, 3, 1, '2015-03-02 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(121, 20, '305', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(122, 20, '306', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(123, 20, '307', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(124, 20, '308', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(125, 20, '309', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(126, 20, '310', 2, 3, 1, '2015-03-03 12:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(127, 21, '123456', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(128, 21, '123457', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(129, 21, '123458', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(130, 21, '123459', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(131, 21, '123460', 2, 3, 2, '2015-03-25 00:00:00', 1, 1, '1.00', '1.00', '0.00', ''),
(202, 32, '111111', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(203, 32, '111112', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(204, 32, '111113', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(205, 32, '111114', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(206, 32, '111115', 2, 3, 1, '2015-04-15 00:00:00', 1, 1, '1.00', '0.00', '1.00', ''),
(207, 33, '111111', 2, 3, 2, '2015-04-16 13:53:07', 1, 1, '1.00', '1.00', '0.00', ''),
(208, 33, '111112', 2, 3, 2, '2015-04-16 13:53:08', 1, 1, '1.00', '1.00', '0.00', ''),
(209, 33, '111113', 2, 3, 2, '2015-04-16 13:53:08', 1, 1, '1.00', '1.00', '0.00', ''),
(210, 33, '111114', 2, 3, 2, '2015-04-16 13:53:09', 1, 1, '1.00', '1.00', '0.00', ''),
(211, 33, '111115', 2, 3, 2, '2015-04-16 13:53:10', 1, 1, '1.00', '1.00', '0.00', ''),
(212, 34, '100001', 0, 1, 1, '2015-05-11 15:51:43', 1, 1, '1.00', '0.00', '0.00', ''),
(213, 34, '100002', 0, 1, 1, '2015-05-11 15:51:50', 1, 1, '1.00', '0.00', '0.00', ''),
(214, 34, '100003', 0, 1, 1, '2015-05-11 15:51:56', 1, 1, '1.00', '0.00', '0.00', ''),
(215, 34, '100004', 0, 1, 1, '2015-05-11 15:52:09', 1, 1, '1.00', '0.00', '0.00', ''),
(216, 34, '100005', 0, 1, 1, '2015-05-11 15:52:18', 1, 1, '1.00', '0.00', '0.00', ''),
(219, 35, '100001', 0, 1, 1, '2015-05-11 16:33:15', 1, 1, '1.00', '0.00', '0.00', ''),
(220, 35, '100002', 0, 1, 1, '2015-05-11 16:33:27', 1, 1, '1.00', '0.00', '0.00', ''),
(221, 35, '100003', 0, 1, 1, '2015-05-11 16:33:43', 1, 1, '1.00', '0.00', '0.00', ''),
(222, 35, '100004', 0, 1, 1, '2015-05-11 16:33:49', 1, 1, '1.00', '0.00', '0.00', ''),
(223, 35, '100005', 0, 1, 1, '2015-05-11 16:33:56', 1, 1, '1.00', '0.00', '0.00', ''),
(226, 36, '100001', 0, 1, 1, '2015-05-11 17:03:35', 1, 1, '1.00', '0.00', '0.00', ''),
(227, 36, '100002', 0, 1, 1, '2015-05-11 17:03:45', 1, 1, '1.00', '0.00', '0.00', ''),
(228, 36, '100003', 0, 1, 1, '2015-05-11 17:03:52', 1, 1, '1.00', '0.00', '0.00', ''),
(229, 36, '100004', 0, 1, 1, '2015-05-11 17:03:58', 1, 1, '1.00', '0.00', '0.00', ''),
(230, 36, '100005', 0, 1, 1, '2015-05-11 17:04:06', 1, 1, '1.00', '0.00', '0.00', ''),
(231, 37, '200004', 0, 1, 2, '2015-06-24 18:05:17', 1, 1, '1.00', '1.00', '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `outscan_main`
--

CREATE TABLE `outscan_main` (
  `Manifest_Id` int(11) NOT NULL,
  `Manifest_No` varchar(20) NOT NULL,
  `Manifest_To_Destination` smallint(6) DEFAULT NULL,
  `Manifest_To_Branch` smallint(6) NOT NULL,
  `Manifest_Date` datetime DEFAULT NULL,
  `Branch_Id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outscan_main`
--

INSERT INTO `outscan_main` (`Manifest_Id`, `Manifest_No`, `Manifest_To_Destination`, `Manifest_To_Branch`, `Manifest_Date`, `Branch_Id`) VALUES
(5, '100000000001', NULL, 0, '2015-02-21 00:00:00', 4),
(8, '100000000002', 1, 7, '2015-02-26 00:00:00', 4),
(10, '100000000003', 2, 0, '2015-02-26 00:00:00', 4),
(11, '100000000004', 2, 0, '2015-02-26 00:00:00', 5),
(12, '100000000005', 2, 0, '2015-02-26 00:00:00', 5),
(13, '100000000006', 1, 7, '2015-02-26 00:00:00', 4),
(14, '100000000007', 1053, 4, '2015-02-26 00:00:00', 5),
(15, '100000000008', 1, 7, '2015-02-26 00:00:00', 4),
(16, '100000000009', 3, 6, '2015-03-02 00:00:00', 4),
(17, '100000000010', 1, 7, '2015-03-02 00:00:00', 6),
(19, '476166490', 1053, 4, '2015-03-02 12:00:00', 7),
(20, '-626748398', 3, 6, '2015-03-03 12:00:00', 4),
(21, '1047991968', 1, 7, '2015-03-25 00:00:00', 4),
(32, '1009360623', 158, 8, '2015-04-15 00:00:00', 5),
(33, '1303281712', 1053, 4, '2015-04-16 13:53:29', 8),
(34, '1165512850', 154, 5, '2015-05-11 15:52:33', 4),
(35, '1022638193', 3, 6, '2015-05-11 16:34:02', 5),
(36, '1174485534', 1, 7, '2015-05-11 17:04:09', 6),
(37, '1039670023', 154, 10, '2015-06-24 18:05:21', 4);

-- --------------------------------------------------------

--
-- Table structure for table `rate_master`
--

CREATE TABLE `rate_master` (
  `Rate_Id` mediumint(6) UNSIGNED NOT NULL,
  `Customer_Id` mediumint(9) UNSIGNED DEFAULT NULL,
  `Zone` tinyint(4) NOT NULL,
  `Service_Tax` varchar(20) DEFAULT NULL,
  `Insurance` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate_master`
--

INSERT INTO `rate_master` (`Rate_Id`, `Customer_Id`, `Zone`, `Service_Tax`, `Insurance`) VALUES
(51, NULL, 1, '', 0),
(78, NULL, 1, ' ', 0),
(90, NULL, 2, ' ', 0),
(94, 5, 1, '', 0),
(95, 5, 2, '', 0),
(96, NULL, 3, ' 1', 1),
(97, NULL, 4, ' 1', 1),
(98, NULL, 10, ' 1', 1),
(99, 3, 1, ' ', 0),
(102, NULL, 11, ' ', 0),
(104, 3, 2, ' 0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rate_weight`
--

CREATE TABLE `rate_weight` (
  `Weight_Id` mediumint(8) UNSIGNED NOT NULL,
  `Rate_Id` mediumint(6) UNSIGNED NOT NULL,
  `Weight_From` decimal(6,2) NOT NULL,
  `Weight_To` decimal(6,2) NOT NULL,
  `Rate` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rate_weight`
--

INSERT INTO `rate_weight` (`Weight_Id`, `Rate_Id`, `Weight_From`, `Weight_To`, `Rate`) VALUES
(37, 78, '1.00', '10.00', '100.00'),
(38, 78, '12.00', '12.00', '23.00'),
(39, 78, '23.00', '45.00', '290.00'),
(58, 90, '1.00', '10.00', '100.00'),
(59, 90, '2.00', '20.00', '200.00'),
(63, 51, '10.00', '1.00', '100.00'),
(64, 51, '30.00', '2.00', '300.00'),
(93, 94, '1.00', '10.00', '100.00'),
(94, 94, '2.00', '20.00', '200.00'),
(99, 96, '1.00', '10.00', '100.00'),
(100, 97, '1.00', '100.00', '10000.00'),
(101, 98, '1.00', '100.00', '10000.00'),
(102, 99, '2.00', '4.00', '100.00'),
(103, 99, '5.00', '9.00', '200.00'),
(104, 95, '1.00', '10.00', '12.00'),
(105, 95, '12.00', '23.00', '33.00'),
(106, 102, '1.00', '10.00', '100.00'),
(107, 102, '11.00', '20.00', '200.00'),
(116, 104, '1.00', '2.00', '1.00'),
(117, 104, '2.00', '3.00', '2.00'),
(118, 104, '3.00', '4.00', '3.00'),
(119, 104, '4.00', '5.00', '4.00'),
(120, 104, '5.00', '6.00', '5.00'),
(121, 104, '6.00', '7.00', '6.00'),
(122, 104, '7.00', '8.00', '7.00'),
(123, 104, '8.00', '9.00', '8.00');

-- --------------------------------------------------------

--
-- Table structure for table `rto_master`
--

CREATE TABLE `rto_master` (
  `Rto_Id` smallint(10) NOT NULL,
  `Reason_Code` varchar(6) NOT NULL,
  `Reason` varchar(50) NOT NULL,
  `Action` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rto_master`
--

INSERT INTO `rto_master` (`Rto_Id`, `Reason_Code`, `Reason`, `Action`) VALUES
(9, '1', 'DOOR LOCK', 'DOOR LOCK'),
(10, '2', 'COUNTINOUS DOOR LOCK', 'COUNTINOUS DOOR LOCK'),
(11, '3', 'PARTY SHIFTED', 'PARTY SHIFTED'),
(12, '4', 'PARTY OUT OF STATION', 'PARTY OUT OF STATION'),
(13, '5', 'WORNG ADDRESS', 'WRONG ADDRESS'),
(14, '6', 'WRONG ADDRESS & WRONG CONTACT NO', 'WRONG ADDRESS & WRONG CONTACT NO'),
(15, '7', 'INCOMPLITE ADDRESS', 'INCOMPLITE ADDRESS');

-- --------------------------------------------------------

--
-- Table structure for table `state_master`
--

CREATE TABLE `state_master` (
  `State_Id` tinyint(4) NOT NULL,
  `State_Code` varchar(20) NOT NULL,
  `State_Name` varchar(50) NOT NULL,
  `Zone_Id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state_master`
--

INSERT INTO `state_master` (`State_Id`, `State_Code`, `State_Name`, `Zone_Id`) VALUES
(1, 'CG', 'CHHATTISGARH', 2),
(2, 'MH', 'MAHARSHTRA', 4),
(3, 'AP', 'ANDHRA PRADESH', 11),
(4, 'WB', 'WEST BANGAL', 3),
(5, 'TN', 'TAMILNADU', 11),
(6, 'MP', 'MADHYA PRADESH', 10),
(7, 'GJ', 'GUJRAT', 4),
(8, 'GA', 'GOA', 4),
(9, 'AR', 'ARUNACHAL PRADESH', 12),
(10, 'AS', 'ASSAM', 12),
(11, 'BR', 'BIHAR', 3),
(12, 'HR', 'HARYANA', 10),
(13, 'HP', 'HIMACHAL PRADESH', 10),
(14, 'JK', 'JAMMU AND KASHMIR', 10),
(15, 'JH', 'JHARKHAND', 3),
(16, 'KA', 'KARNATKA', 11),
(17, 'KL', 'KERLA', 11),
(18, 'MN', 'MANIPUR', 13),
(19, 'ML', 'MEGHALAYA', 13),
(20, 'MZ', 'MIZORAM', 13),
(21, 'NL', 'NAGALAND', 13),
(22, 'OR', 'ORISSA', 3),
(23, 'PB', 'PUNJAB', 10),
(24, 'RJ', 'RAJASTHAN', 10),
(25, 'SK', 'SIKKIM', 13),
(26, 'TR', 'TRIPURA', 13),
(27, 'UP', 'UTTAR PRADESH', 10),
(28, 'UT', 'UTTARAKHAND', 10),
(29, 'CH', 'CHANDIGARH', 10),
(30, 'DL', 'DELHI', 10),
(31, 'DN', 'DADRA NAGAR AND HAVELI', 13),
(32, 'DD', 'DAMAN AND DIU', 13),
(33, 'PY', 'PONDICHERRY', 11),
(34, 'WTCY', 'WITHIN CITY', 1);

-- --------------------------------------------------------

--
-- Table structure for table `state_relation_with_zone`
--

CREATE TABLE `state_relation_with_zone` (
  `State_Relation_Id` smallint(6) NOT NULL,
  `State_Id` tinyint(4) NOT NULL,
  `Zone_Id` tinyint(4) NOT NULL,
  `Branch_Id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_consignment`
--

CREATE TABLE `temp_consignment` (
  `Temp_Id` int(11) NOT NULL,
  `Customer_Id` mediumint(8) UNSIGNED DEFAULT NULL,
  `Consignment_No` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Branch_Id` smallint(6) NOT NULL,
  `Consignment_Reason` tinyint(4) DEFAULT NULL,
  `Destination_Id` smallint(6) NOT NULL,
  `Consignment_Mode` tinyint(4) NOT NULL,
  `Rec_Date` datetime NOT NULL,
  `Pcs` smallint(6) NOT NULL,
  `DoxNdox` tinyint(4) NOT NULL,
  `Weight` decimal(6,2) NOT NULL,
  `Topay` decimal(10,2) DEFAULT NULL,
  `Cod` decimal(10,2) DEFAULT NULL,
  `Remark` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `temp_consignment`
--

INSERT INTO `temp_consignment` (`Temp_Id`, `Customer_Id`, `Consignment_No`, `Branch_Id`, `Consignment_Reason`, `Destination_Id`, `Consignment_Mode`, `Rec_Date`, `Pcs`, `DoxNdox`, `Weight`, `Topay`, `Cod`, `Remark`) VALUES
(1, NULL, '100001', 4, 0, 1, 1, '2015-05-11 17:03:35', 1, 1, '1.00', '0.00', '0.00', ''),
(2, NULL, '100002', 4, 0, 1, 1, '2015-05-11 17:03:45', 1, 1, '1.00', '0.00', '0.00', ''),
(3, NULL, '100003', 4, 0, 1, 1, '2015-05-11 17:03:52', 1, 1, '1.00', '0.00', '0.00', ''),
(4, NULL, '100004', 4, 0, 1, 1, '2015-05-11 17:03:58', 1, 1, '1.00', '0.00', '0.00', ''),
(5, NULL, '100005', 4, 0, 1, 1, '2015-05-11 17:04:06', 1, 1, '1.00', '0.00', '0.00', '');

-- --------------------------------------------------------

--
-- Table structure for table `temp_sheet`
--

CREATE TABLE `temp_sheet` (
  `Temp_Id` tinyint(3) UNSIGNED NOT NULL,
  `Consignment_No` varchar(20) NOT NULL,
  `Area_Id` smallint(6) NOT NULL,
  `Address` varchar(125) NOT NULL,
  `Consignee` varchar(70) NOT NULL,
  `Sheet_Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zone_master`
--

CREATE TABLE `zone_master` (
  `Zone_Id` tinyint(4) NOT NULL,
  `Zone_Code` varchar(30) NOT NULL,
  `Zone_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone_master`
--

INSERT INTO `zone_master` (`Zone_Id`, `Zone_Code`, `Zone_Name`) VALUES
(1, 'ZONE1', 'WITHIN CITY'),
(2, 'ZONE2', 'WITHIN STATE'),
(3, 'ZONE3', 'EAST'),
(4, 'ZONE4', 'WEST'),
(10, 'ZONE5', 'NORTH'),
(11, 'ZONE6', 'SOUTH'),
(12, 'ZONE7', 'NORTH EAST'),
(13, 'ZONE8', 'CRITICAL AREA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_master`
--
ALTER TABLE `area_master`
  ADD PRIMARY KEY (`Area_Id`),
  ADD KEY `Destination_Id` (`Destination_Id`),
  ADD KEY `Branch_Id` (`Branch_Id`);

--
-- Indexes for table `branch_master`
--
ALTER TABLE `branch_master`
  ADD PRIMARY KEY (`Branch_Id`),
  ADD KEY `Destination_Id` (`Destination_Id`),
  ADD KEY `Hub_Id` (`Hub_Id`);

--
-- Indexes for table `cons_track`
--
ALTER TABLE `cons_track`
  ADD PRIMARY KEY (`Track_Id`),
  ADD KEY `From_Des` (`From_Des`),
  ADD KEY `To_Des` (`To_Des`);

--
-- Indexes for table `customer_master`
--
ALTER TABLE `customer_master`
  ADD PRIMARY KEY (`Customer_Id`),
  ADD KEY `Branch_Id` (`Branch_Id`);

--
-- Indexes for table `cust_consignment`
--
ALTER TABLE `cust_consignment`
  ADD PRIMARY KEY (`Detail_Id`),
  ADD KEY `Customer_Id` (`Customer_Id`),
  ADD KEY `Consignment_Id` (`Consignment_Id`);

--
-- Indexes for table `delivery_consignment`
--
ALTER TABLE `delivery_consignment`
  ADD PRIMARY KEY (`Delivery_Id`),
  ADD KEY `Sheet_Id` (`Sheet_Id`);

--
-- Indexes for table `delivery_run_sheet`
--
ALTER TABLE `delivery_run_sheet`
  ADD PRIMARY KEY (`Sheet_Id`),
  ADD KEY `Branch_Id` (`Branch_Id`);

--
-- Indexes for table `del_boy_master`
--
ALTER TABLE `del_boy_master`
  ADD PRIMARY KEY (`Del_Boy_Id`),
  ADD KEY `Branch_Id` (`Branch_Id`);

--
-- Indexes for table `destination_master`
--
ALTER TABLE `destination_master`
  ADD PRIMARY KEY (`Destination_Id`),
  ADD KEY `State_Id` (`State_Id`);

--
-- Indexes for table `hub_master`
--
ALTER TABLE `hub_master`
  ADD PRIMARY KEY (`Hub_Id`),
  ADD KEY `Destination_Id` (`Destination_Id`);

--
-- Indexes for table `inscan_detail`
--
ALTER TABLE `inscan_detail`
  ADD PRIMARY KEY (`Detail_Id`),
  ADD KEY `Manifest_Id` (`Manifest_Id`),
  ADD KEY `Destination_Id` (`Destination_Id`);

--
-- Indexes for table `inscan_main`
--
ALTER TABLE `inscan_main`
  ADD PRIMARY KEY (`Manifest_Id`),
  ADD KEY `Manifest_From_Destination` (`Manifest_From_Destination`),
  ADD KEY `Branch_Id` (`Branch_Id`),
  ADD KEY `Manifest_From_Branch` (`Manifest_From_Branch`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`Invoice_Id`),
  ADD KEY `Customer_Id` (`Customer_Id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`Login_Id`);

--
-- Indexes for table `outscan_detail`
--
ALTER TABLE `outscan_detail`
  ADD PRIMARY KEY (`Detail_Id`),
  ADD KEY `Manifest_Id` (`Manifest_Id`),
  ADD KEY `Destination_Id` (`Destination_Id`);

--
-- Indexes for table `outscan_main`
--
ALTER TABLE `outscan_main`
  ADD PRIMARY KEY (`Manifest_Id`),
  ADD KEY `Manifest_To_Destination` (`Manifest_To_Destination`),
  ADD KEY `Branch_Id` (`Branch_Id`);

--
-- Indexes for table `rate_master`
--
ALTER TABLE `rate_master`
  ADD PRIMARY KEY (`Rate_Id`),
  ADD KEY `Customer_Id` (`Customer_Id`),
  ADD KEY `Zone` (`Zone`);

--
-- Indexes for table `rate_weight`
--
ALTER TABLE `rate_weight`
  ADD PRIMARY KEY (`Weight_Id`),
  ADD KEY `Rate_Id` (`Rate_Id`);

--
-- Indexes for table `rto_master`
--
ALTER TABLE `rto_master`
  ADD PRIMARY KEY (`Rto_Id`);

--
-- Indexes for table `state_master`
--
ALTER TABLE `state_master`
  ADD PRIMARY KEY (`State_Id`),
  ADD KEY `Zone_Id` (`Zone_Id`);

--
-- Indexes for table `temp_consignment`
--
ALTER TABLE `temp_consignment`
  ADD PRIMARY KEY (`Temp_Id`),
  ADD KEY `Branch_Id` (`Branch_Id`),
  ADD KEY `Destination_Id` (`Destination_Id`),
  ADD KEY `Customer_Id` (`Customer_Id`);

--
-- Indexes for table `temp_sheet`
--
ALTER TABLE `temp_sheet`
  ADD PRIMARY KEY (`Temp_Id`);

--
-- Indexes for table `zone_master`
--
ALTER TABLE `zone_master`
  ADD PRIMARY KEY (`Zone_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area_master`
--
ALTER TABLE `area_master`
  MODIFY `Area_Id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `branch_master`
--
ALTER TABLE `branch_master`
  MODIFY `Branch_Id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cons_track`
--
ALTER TABLE `cons_track`
  MODIFY `Track_Id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `Customer_Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cust_consignment`
--
ALTER TABLE `cust_consignment`
  MODIFY `Detail_Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;
--
-- AUTO_INCREMENT for table `delivery_consignment`
--
ALTER TABLE `delivery_consignment`
  MODIFY `Delivery_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `delivery_run_sheet`
--
ALTER TABLE `delivery_run_sheet`
  MODIFY `Sheet_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `del_boy_master`
--
ALTER TABLE `del_boy_master`
  MODIFY `Del_Boy_Id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `destination_master`
--
ALTER TABLE `destination_master`
  MODIFY `Destination_Id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1385;
--
-- AUTO_INCREMENT for table `hub_master`
--
ALTER TABLE `hub_master`
  MODIFY `Hub_Id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `inscan_detail`
--
ALTER TABLE `inscan_detail`
  MODIFY `Detail_Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1773;
--
-- AUTO_INCREMENT for table `inscan_main`
--
ALTER TABLE `inscan_main`
  MODIFY `Manifest_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `Invoice_Id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `Login_Id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `outscan_detail`
--
ALTER TABLE `outscan_detail`
  MODIFY `Detail_Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;
--
-- AUTO_INCREMENT for table `outscan_main`
--
ALTER TABLE `outscan_main`
  MODIFY `Manifest_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `rate_master`
--
ALTER TABLE `rate_master`
  MODIFY `Rate_Id` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `rate_weight`
--
ALTER TABLE `rate_weight`
  MODIFY `Weight_Id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- AUTO_INCREMENT for table `rto_master`
--
ALTER TABLE `rto_master`
  MODIFY `Rto_Id` smallint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `state_master`
--
ALTER TABLE `state_master`
  MODIFY `State_Id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `temp_consignment`
--
ALTER TABLE `temp_consignment`
  MODIFY `Temp_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `temp_sheet`
--
ALTER TABLE `temp_sheet`
  MODIFY `Temp_Id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zone_master`
--
ALTER TABLE `zone_master`
  MODIFY `Zone_Id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `area_master`
--
ALTER TABLE `area_master`
  ADD CONSTRAINT `area_master_ibfk_2` FOREIGN KEY (`Destination_Id`) REFERENCES `destination_master` (`Destination_Id`),
  ADD CONSTRAINT `area_master_ibfk_3` FOREIGN KEY (`Branch_Id`) REFERENCES `branch_master` (`Branch_Id`);

--
-- Constraints for table `branch_master`
--
ALTER TABLE `branch_master`
  ADD CONSTRAINT `branch_master_ibfk_3` FOREIGN KEY (`Destination_Id`) REFERENCES `destination_master` (`Destination_Id`),
  ADD CONSTRAINT `branch_master_ibfk_4` FOREIGN KEY (`Hub_Id`) REFERENCES `hub_master` (`Hub_Id`);

--
-- Constraints for table `customer_master`
--
ALTER TABLE `customer_master`
  ADD CONSTRAINT `customer_master_ibfk_1` FOREIGN KEY (`Branch_Id`) REFERENCES `branch_master` (`Branch_Id`);

--
-- Constraints for table `cust_consignment`
--
ALTER TABLE `cust_consignment`
  ADD CONSTRAINT `cust_consignment_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer_master` (`Customer_Id`),
  ADD CONSTRAINT `cust_consignment_ibfk_2` FOREIGN KEY (`Consignment_Id`) REFERENCES `inscan_detail` (`Detail_Id`);

--
-- Constraints for table `delivery_consignment`
--
ALTER TABLE `delivery_consignment`
  ADD CONSTRAINT `delivery_consignment_ibfk_1` FOREIGN KEY (`Sheet_Id`) REFERENCES `delivery_run_sheet` (`Sheet_Id`);

--
-- Constraints for table `delivery_run_sheet`
--
ALTER TABLE `delivery_run_sheet`
  ADD CONSTRAINT `delivery_run_sheet_ibfk_2` FOREIGN KEY (`Branch_Id`) REFERENCES `branch_master` (`Branch_Id`);

--
-- Constraints for table `del_boy_master`
--
ALTER TABLE `del_boy_master`
  ADD CONSTRAINT `del_boy_master_ibfk_1` FOREIGN KEY (`Branch_Id`) REFERENCES `branch_master` (`Branch_Id`);

--
-- Constraints for table `destination_master`
--
ALTER TABLE `destination_master`
  ADD CONSTRAINT `destination_master_ibfk_1` FOREIGN KEY (`State_Id`) REFERENCES `state_master` (`State_Id`);

--
-- Constraints for table `hub_master`
--
ALTER TABLE `hub_master`
  ADD CONSTRAINT `hub_master_ibfk_1` FOREIGN KEY (`Destination_Id`) REFERENCES `destination_master` (`Destination_Id`);

--
-- Constraints for table `inscan_detail`
--
ALTER TABLE `inscan_detail`
  ADD CONSTRAINT `inscan_detail_ibfk_1` FOREIGN KEY (`Manifest_Id`) REFERENCES `inscan_main` (`Manifest_Id`),
  ADD CONSTRAINT `inscan_detail_ibfk_2` FOREIGN KEY (`Destination_Id`) REFERENCES `destination_master` (`Destination_Id`);

--
-- Constraints for table `inscan_main`
--
ALTER TABLE `inscan_main`
  ADD CONSTRAINT `inscan_main_ibfk_1` FOREIGN KEY (`Manifest_From_Destination`) REFERENCES `destination_master` (`Destination_Id`),
  ADD CONSTRAINT `inscan_main_ibfk_2` FOREIGN KEY (`Branch_Id`) REFERENCES `branch_master` (`Branch_Id`),
  ADD CONSTRAINT `inscan_main_ibfk_3` FOREIGN KEY (`Manifest_From_Branch`) REFERENCES `branch_master` (`Branch_Id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer_master` (`Customer_Id`);

--
-- Constraints for table `outscan_detail`
--
ALTER TABLE `outscan_detail`
  ADD CONSTRAINT `outscan_detail_ibfk_1` FOREIGN KEY (`Manifest_Id`) REFERENCES `outscan_main` (`Manifest_Id`),
  ADD CONSTRAINT `outscan_detail_ibfk_2` FOREIGN KEY (`Destination_Id`) REFERENCES `destination_master` (`Destination_Id`);

--
-- Constraints for table `outscan_main`
--
ALTER TABLE `outscan_main`
  ADD CONSTRAINT `outscan_main_ibfk_1` FOREIGN KEY (`Manifest_To_Destination`) REFERENCES `destination_master` (`Destination_Id`),
  ADD CONSTRAINT `outscan_main_ibfk_2` FOREIGN KEY (`Branch_Id`) REFERENCES `branch_master` (`Branch_Id`);

--
-- Constraints for table `rate_master`
--
ALTER TABLE `rate_master`
  ADD CONSTRAINT `rate_master_ibfk_3` FOREIGN KEY (`Customer_Id`) REFERENCES `customer_master` (`Customer_Id`),
  ADD CONSTRAINT `rate_master_ibfk_4` FOREIGN KEY (`Zone`) REFERENCES `zone_master` (`Zone_Id`);

--
-- Constraints for table `rate_weight`
--
ALTER TABLE `rate_weight`
  ADD CONSTRAINT `rate_weight_ibfk_1` FOREIGN KEY (`Rate_Id`) REFERENCES `rate_master` (`Rate_Id`);

--
-- Constraints for table `state_master`
--
ALTER TABLE `state_master`
  ADD CONSTRAINT `state_master_ibfk_1` FOREIGN KEY (`Zone_Id`) REFERENCES `zone_master` (`Zone_Id`);

--
-- Constraints for table `temp_consignment`
--
ALTER TABLE `temp_consignment`
  ADD CONSTRAINT `temp_consignment_ibfk_1` FOREIGN KEY (`Branch_Id`) REFERENCES `branch_master` (`Branch_Id`),
  ADD CONSTRAINT `temp_consignment_ibfk_2` FOREIGN KEY (`Destination_Id`) REFERENCES `destination_master` (`Destination_Id`),
  ADD CONSTRAINT `temp_consignment_ibfk_3` FOREIGN KEY (`Customer_Id`) REFERENCES `customer_master` (`Customer_Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
