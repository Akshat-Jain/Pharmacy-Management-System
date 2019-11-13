-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 13, 2019 at 12:00 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.32

DROP DATABASE myDb IF EXISTS;
CREATE DATABASE myDb;
USE myDb;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` tinyint(5) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `date`) VALUES
(1, 'admin', 'admin', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

CREATE TABLE `cashier` (
  `cashier_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashier_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(8, 'cashier', 'one', '1', 'ajmer', '1234', 'cashier1@gmail.com', 'cashier1', 'pwd', '2019-11-13 13:16:22');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(5) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `served_by` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Unpaid',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` tinyint(5) NOT NULL,
  `invoice` int(5) NOT NULL,
  `drug` tinyint(5) NOT NULL,
  `cost` int(5) DEFAULT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(19, 'manager', 'one', '1', 'ajmer', '1234', 'manager1@gmail.com', 'manager1', 'pwd', '2019-11-13 13:17:48');

-- --------------------------------------------------------

--
-- Table structure for table `paymenttypes`
--

CREATE TABLE `paymenttypes` (
  `id` tinyint(5) NOT NULL,
  `Name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paymenttypes`
--

INSERT INTO `paymenttypes` (`id`, `Name`) VALUES
(1, 'Cash'),
(2, 'Credit card'),
(3, 'Mobile Money'),
(4, 'Cheque');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `pharmacist_id` tinyint(5) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `staff_id` varchar(10) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `first_name`, `last_name`, `staff_id`, `postal_address`, `phone`, `email`, `username`, `password`, `date`) VALUES
(30, 'pharmacist', 'one', '1', 'ajmer', '1234', 'pharma1@gmail.com', 'pharma1', 'pwd', '2019-11-13 13:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` tinyint(5) NOT NULL,
  `prescription_id` int(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` varchar(6) NOT NULL,
  `postal_address` varchar(20) NOT NULL,
  `invoice_id` tinyint(5) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_details`
--

CREATE TABLE `prescription_details` (
  `id` tinyint(5) NOT NULL,
  `pres_id` int(5) NOT NULL,
  `drug_name` tinyint(5) NOT NULL,
  `strength` varchar(15) NOT NULL,
  `dose` varchar(15) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `reciptNo` int(10) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `total` int(10) NOT NULL,
  `payType` varchar(10) NOT NULL,
  `serialno` varchar(10) DEFAULT NULL,
  `served_by` varchar(15) NOT NULL,
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_id` tinyint(5) NOT NULL,
  `drug_name` varchar(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `company` varchar(20) NOT NULL,
  `supplier` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `status` enum('Available','Inavailable') NOT NULL,
  `date_supplied` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stock_id`, `drug_name`, `category`, `description`, `company`, `supplier`, `quantity`, `cost`, `status`, `date_supplied`) VALUES
(5, 'Piriton', 'tablet', 'Painkiller', 'SB', 'SB', 1000, 5, 'Available', '2013-11-30'),
(6, 'Dual Cotexin', 'tablet', 'Malaria', 'GX', 'Clinix', 150, 120, 'Available', '2013-11-30'),
(7, 'Naproxen', 'Tablet', 'Reproductive', 'Family Health', 'Stopes', 250, 250, 'Available', '2013-11-30'),
(8, 'Flagi', 'talet', 'Digestive', 'GX', 'Clinix', 657, 15, 'Available', '2013-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `tempprescri`
--

CREATE TABLE `tempprescri` (
  `id` tinyint(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `postal_address` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `drug_name` varchar(30) NOT NULL,
  `strength` varchar(30) NOT NULL,
  `dose` varchar(30) NOT NULL,
  `quantity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cashier`
--
ALTER TABLE `cashier`
ADD PRIMARY KEY (`cashier_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
ADD PRIMARY KEY (`id`),
ADD KEY `stocks` (`drug`),
ADD KEY `invoices` (`invoice`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
ADD PRIMARY KEY (`manager_id`);

--
-- Indexes for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
ADD PRIMARY KEY (`id`,`prescription_id`);

--
-- Indexes for table `prescription_details`
--
ALTER TABLE `prescription_details`
ADD PRIMARY KEY (`id`),
ADD KEY `dsfd` (`drug_name`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
ADD PRIMARY KEY (`reciptNo`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `tempprescri`
--
ALTER TABLE `tempprescri`
ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
MODIFY `admin_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cashier`
--
ALTER TABLE `cashier`
MODIFY `cashier_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
MODIFY `manager_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
MODIFY `pharmacist_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `prescription_details`
--
ALTER TABLE `prescription_details`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
MODIFY `stock_id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tempprescri`
--
ALTER TABLE `tempprescri`
MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
ADD CONSTRAINT `invoices` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `stocks` FOREIGN KEY (`drug`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription_details`
--
ALTER TABLE `prescription_details`
ADD CONSTRAINT `dsfd` FOREIGN KEY (`drug_name`) REFERENCES `stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
