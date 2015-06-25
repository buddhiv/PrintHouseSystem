-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2015 at 06:02 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `printhouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `Attendance_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Arrival_Time` time NOT NULL,
  `Departure_Time` time NOT NULL,
  PRIMARY KEY (`Attendance_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Telephone` varchar(15) NOT NULL,
  `E_Mail` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customerpayment`
--

CREATE TABLE IF NOT EXISTS `customerpayment` (
  `CustomerPayment_Id` int(31) NOT NULL,
  `amount` double NOT NULL,
  `paymentId` int(31) NOT NULL,
  `customerOrderId` int(31) NOT NULL,
  PRIMARY KEY (`CustomerPayment_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `CustomerOder_Id` int(11) NOT NULL,
  `Description` varchar(511) NOT NULL,
  `Date` date NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  PRIMARY KEY (`CustomerOder_Id`),
  UNIQUE KEY `Description` (`Description`),
  UNIQUE KEY `Date` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `Employee_Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `NIC` varchar(15) NOT NULL,
  `Basic_Salary` double NOT NULL,
  `Telephone` varchar(15) NOT NULL,
  `E-Mail` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`Employee_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `Item_Id` int(11) NOT NULL,
  `Description` varchar(511) NOT NULL,
  `Brand` varchar(31) NOT NULL,
  `State` tinyint(1) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` double NOT NULL,
  PRIMARY KEY (`Item_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item_job_detail`
--

CREATE TABLE IF NOT EXISTS `item_job_detail` (
  `Item_Job_Detail_Id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Item_Id` int(11) NOT NULL,
  `Job_Id` int(11) NOT NULL,
  PRIMARY KEY (`Item_Job_Detail_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE IF NOT EXISTS `job` (
  `Job_Id` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  `Expected_Deliver_Date` date NOT NULL,
  `State` tinyint(1) NOT NULL,
  `Start_Time` datetime NOT NULL,
  `Deliver_Time` datetime NOT NULL,
  `Employee_Id` int(11) NOT NULL,
  `CustomerOrder_Id` int(11) NOT NULL,
  PRIMARY KEY (`Job_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_roal`
--

CREATE TABLE IF NOT EXISTS `job_roal` (
  `JobRoal_Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(511) NOT NULL,
  PRIMARY KEY (`JobRoal_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_roal_detail`
--

CREATE TABLE IF NOT EXISTS `job_roal_detail` (
  `Job_Roal_Detail` int(11) NOT NULL,
  `Employee_Id` int(11) NOT NULL,
  `Job_Roal_Id` int(11) NOT NULL,
  PRIMARY KEY (`Job_Roal_Detail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `Payment_Id` int(11) NOT NULL,
  `Description` varchar(511) NOT NULL,
  `Date` date NOT NULL,
  `Type` varchar(15) NOT NULL,
  PRIMARY KEY (`Payment_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplierId` int(31) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`supplierId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplierpayment`
--

CREATE TABLE IF NOT EXISTS `supplierpayment` (
  `SupplierPayment_Id` int(31) NOT NULL,
  `Amount` double NOT NULL,
  `paymentId` int(31) NOT NULL,
  `supplierOrderId` int(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supply_order`
--

CREATE TABLE IF NOT EXISTS `supply_order` (
  `Supplier_Order_Id` int(11) NOT NULL,
  `Description` varchar(511) NOT NULL,
  `Date` date NOT NULL,
  `supplierId` int(31) NOT NULL,
  PRIMARY KEY (`Supplier_Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supply_order_detail`
--

CREATE TABLE IF NOT EXISTS `supply_order_detail` (
  `Supplier_Order_Detail_Id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` double NOT NULL,
  `Supplier_Order_Id` int(11) NOT NULL,
  `Item_Id` int(11) NOT NULL,
  PRIMARY KEY (`Supplier_Order_Detail_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
