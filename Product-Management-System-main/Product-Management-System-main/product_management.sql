-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2021 at 11:39 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(30) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `user_id`) VALUES
(1, 'cloths', '19'),
(8, 'books', '18'),
(9, 'cloths', '18'),
(10, 'bags', '18'),
(11, 'cloths', '16'),
(12, 'books', '16'),
(13, 'other', '18');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `category` varchar(30) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_id`, `category`, `product_name`, `user_id`) VALUES
(1, 'cloths_658', 'cloths', 'saree', '19'),
(2, 'cloths_232', 'cloths', 'saree', '19'),
(3, 'books_313', 'books', 'hindi', '16'),
(4, 'books_1102', 'books', 'math', '16'),
(5, 'bags_283', 'bags', 'nicky', '18'),
(6, 'cloths_1077', 'cloths', 'paints', '18'),
(7, 'other_304', 'other', 'sampu', '18');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mob_no` varchar(20) NOT NULL,
  `passwd` varchar(25) NOT NULL,
  `location` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `first_name`, `last_name`, `email`, `mob_no`, `passwd`, `location`) VALUES
(16, 'Rakesh', 'Bhaker', 'rakeshbhaker@gmail.com', '0987654321', '12345678', 'Banglore'),
(17, 'sayanti', 'manna', 'sayantimanna@gmail.com', '1235678907', '123456789', 'bang'),
(18, 'Rakesh', 'Bhaker', 'rkaybhaker@gmail.com', 'null', 'Rak@12345', 'null'),
(19, 'Rakesh', 'Singh', 'rakeshbhaker0@gmail.com', 'null', 'Rak1234567', 'null'),
(20, 'Rakesh', 'Bhaker', 'rakeshbhaker02@gmail.com', 'null', 'Rak\"1999', 'null');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
