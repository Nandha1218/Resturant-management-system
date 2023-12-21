-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2023 at 06:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `min_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `DishID` int(11) NOT NULL,
  `DishName` varchar(50) NOT NULL,
  `Category` varchar(30) DEFAULT NULL,
  `Price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`DishID`, `DishName`, `Category`, `Price`) VALUES
(1, 'Spaghetti Bolognese', 'Pasta', 12.99),
(2, 'Grilled Chicken Salad', 'Salad', 10.99),
(3, 'Baked Salmon', 'Seafood', 15.99),
(4, 'Chicken Baguette', 'Sandwich', 8.99),
(5, 'Cappuccino', 'Beverage', 3.99),
(6, 'Spinach Salad', 'Salad', 9.99),
(7, 'Buffalo Chicken Wings', 'Appetizer', 7.99),
(8, 'Red Wine Glass', 'Beverage', 6.99),
(9, 'Espresso', 'Beverage', 2.99),
(10, 'Dark Chocolate Cake', 'Dessert', 8.99);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `phn_num` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `dish_name` varchar(60) DEFAULT NULL,
  `DishID` int(11) DEFAULT NULL,
  `veg_or_nonveg` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerName`, `phn_num`, `OrderDate`, `dish_name`, `DishID`, `veg_or_nonveg`) VALUES
(1, 'siddhart N R', 69554786, '2023-12-06', 'Spaghetti Bolognese', 1, 'veg'),
(2, 'siddhart N R', 2147483647, '2023-12-13', 'chicken briyani', 2, 'nonveg'),
(3, 'suhail', 947824278, '2023-12-15', 'veg rice', 3, 'nonveg'),
(4, 'suhail m', 947824278, '2023-12-15', 'veg rice', 4, 'veg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`DishID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `DishID` (`DishID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`DishID`) REFERENCES `menu` (`DishID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
