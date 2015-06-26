-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2015 at 07:57 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `PrintHouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `Attendance_Id` int(11) NOT NULL,
  `Employee_Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Arrival_Time` time NOT NULL,
  `Departure_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `Address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `CustomerOder_Id` int(11) NOT NULL,
  `Description` varchar(511) NOT NULL,
  `Date` date NOT NULL,
  `Customer_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customerpayment`
--

CREATE TABLE IF NOT EXISTS `customerpayment` (
  `CustomerPayment_Id` int(31) NOT NULL,
  `amount` double NOT NULL,
  `paymentId` int(31) NOT NULL,
  `customerOrderId` int(31) NOT NULL
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
  `Address` varchar(255) NOT NULL
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
  `Price` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`Item_Id`, `Description`, `Brand`, `State`, `Quantity`, `Price`) VALUES
(1, 'A4 - Bundle - 80g', 'JK', 0, 200, 400),
(2, 'Glue - 100mg', 'Nimali', 0, 200, 200);

-- --------------------------------------------------------

--
-- Table structure for table `item_job_detail`
--

CREATE TABLE IF NOT EXISTS `item_job_detail` (
  `Item_Job_Detail_Id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Item_Id` int(11) NOT NULL,
  `Job_Id` int(11) NOT NULL
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
  `CustomerOrder_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_roal`
--

CREATE TABLE IF NOT EXISTS `job_roal` (
  `JobRoal_Id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(511) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_roal_detail`
--

CREATE TABLE IF NOT EXISTS `job_roal_detail` (
  `Job_Roal_Detail` int(11) NOT NULL,
  `Employee_Id` int(11) NOT NULL,
  `Job_Roal_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `Payment_Id` int(11) NOT NULL,
  `Description` varchar(511) NOT NULL,
  `Date` date NOT NULL,
  `Type` varchar(15) NOT NULL
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
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplierId`, `name`, `address`, `telephone`, `email`) VALUES
(1, 'Bahala Delivers', 'Panadura', '0714367463', 'bahaladeliver@gmail.com'),
(2, 'Nimal Suppliers', 'Moratuwa', '071468358', 'nimalsuplier@gmail.com');

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
  `supplierId` int(31) NOT NULL
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
  `Item_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`Attendance_Id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_Id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`CustomerOder_Id`),
  ADD UNIQUE KEY `Description` (`Description`),
  ADD UNIQUE KEY `Date` (`Date`);

--
-- Indexes for table `customerpayment`
--
ALTER TABLE `customerpayment`
  ADD PRIMARY KEY (`CustomerPayment_Id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_Id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Item_Id`);

--
-- Indexes for table `item_job_detail`
--
ALTER TABLE `item_job_detail`
  ADD PRIMARY KEY (`Item_Job_Detail_Id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`Job_Id`);

--
-- Indexes for table `job_roal`
--
ALTER TABLE `job_roal`
  ADD PRIMARY KEY (`JobRoal_Id`);

--
-- Indexes for table `job_roal_detail`
--
ALTER TABLE `job_roal_detail`
  ADD PRIMARY KEY (`Job_Roal_Detail`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_Id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplierId`);

--
-- Indexes for table `supply_order`
--
ALTER TABLE `supply_order`
  ADD PRIMARY KEY (`Supplier_Order_Id`);

--
-- Indexes for table `supply_order_detail`
--
ALTER TABLE `supply_order_detail`
  ADD PRIMARY KEY (`Supplier_Order_Detail_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `Attendance_Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `Item_Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplierId` int(31) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
