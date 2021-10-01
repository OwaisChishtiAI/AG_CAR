-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2021 at 10:15 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agcasvls_ag_car_db`
--
CREATE DATABASE IF NOT EXISTS `agcasvls_ag_car_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `agcasvls_ag_car_db`;

-- --------------------------------------------------------

--
-- Table structure for table `emp_salary`
--

DROP TABLE IF EXISTS `emp_salary`;
CREATE TABLE `emp_salary` (
  `agent_id` text NOT NULL,
  `salary` text NOT NULL,
  `com_b_15` text NOT NULL,
  `com_a_15` text NOT NULL,
  `X_15` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_salary`
--

INSERT INTO `emp_salary` (`agent_id`, `salary`, `com_b_15`, `com_a_15`, `X_15`) VALUES
('sowais672@gmail.com', '1', '4', '5', ''),
('mustufa.shark@gmail.com', '30000', '150', '200', '2000');

-- --------------------------------------------------------

--
-- Table structure for table `emp_sales`
--

DROP TABLE IF EXISTS `emp_sales`;
CREATE TABLE `emp_sales` (
  `sale_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `agent_name` text NOT NULL,
  `order_id` text NOT NULL,
  `client_name` text NOT NULL,
  `contact` text NOT NULL,
  `email_id` text NOT NULL,
  `total_tariff` text NOT NULL,
  `deposit` text NOT NULL,
  `profit` text NOT NULL,
  `driver_pay` text NOT NULL,
  `payment_method` text NOT NULL,
  `pickup_date` text NOT NULL,
  `no_of_vehicles` text NOT NULL,
  `pickup` text NOT NULL,
  `booking_status` text NOT NULL,
  `agreement` text NOT NULL,
  `agent_notes` text NOT NULL,
  `jt_link` text NOT NULL,
  `agent_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Employee sales form data';

--
-- Dumping data for table `emp_sales`
--

INSERT INTO `emp_sales` (`sale_id`, `timestamp`, `agent_name`, `order_id`, `client_name`, `contact`, `email_id`, `total_tariff`, `deposit`, `profit`, `driver_pay`, `payment_method`, `pickup_date`, `no_of_vehicles`, `pickup`, `booking_status`, `agreement`, `agent_notes`, `jt_link`, `agent_id`) VALUES
(16, '2021-09-21 06:56:46', 'owais', '2qw1', 'q', 'q', 'q', '200', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'sowais672@gmail.com'),
(17, '2021-09-23 11:12:43', 'q', 'q', 'q', 'q', 'q', '20', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'mustufa.shark@gmail.com'),
(18, '2021-09-24 12:34:09', 'chalres', 'addd', 'ajaj', 'q', 'q', '1000', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'q', 'mustufa.shark@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `emp_time`
--

DROP TABLE IF EXISTS `emp_time`;
CREATE TABLE `emp_time` (
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `agent_id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp_time`
--

INSERT INTO `emp_time` (`start_time`, `end_time`, `agent_id`) VALUES
('2021-09-20 11:33:42', '2021-09-20 02:33:42', 'sowais672@gmail.com'),
('2021-09-21 11:44:42', '2021-09-21 11:44:42', 'sowais672@gmail.com'),
('2021-09-23 11:13:36', '2021-09-23 11:13:36', 'mustufa.shark@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `exp_name` text NOT NULL,
  `exp_amt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expense_id`, `timestamp`, `exp_name`, `exp_amt`) VALUES
(2, '2021-09-22 05:14:50', 'office rent', '150000'),
(3, '2021-09-22 05:15:04', 'transportation', '200');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `admin_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `username`, `password`, `admin_status`) VALUES
(1, 'sowais672@gmail.com', 'abcd@123', 1),
(2, 'mustufa.shark@gmail.com', 'abcd@123', 0),
(3, 'ali@agc.com', 'abcd@123', 0),
(4, 'soc@gmail.com', 'abcd@123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
CREATE TABLE `partners` (
  `partner_id` int(11) NOT NULL,
  `agent_id` text NOT NULL,
  `salary` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`partner_id`, `agent_id`, `salary`) VALUES
(2, 'Owais', '25'),
(3, 'Ali', '75');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp_sales`
--
ALTER TABLE `emp_sales`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`partner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emp_sales`
--
ALTER TABLE `emp_sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `partner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
