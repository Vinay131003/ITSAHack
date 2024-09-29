-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2024 at 09:47 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `foodInput` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `total_calories` varchar(100) NOT NULL,
  `total_fat` varchar(100) NOT NULL,
  `carbohydrates` varchar(100) NOT NULL,
  `total_protein` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`foodInput`, `user_id`, `total_calories`, `total_fat`, `carbohydrates`, `total_protein`, `date`) VALUES
('1 apple', 'constant_user_id', '105.10000000000001', '0.3', '25.6', '5', '2024-09-28'),
('1 cup rice', 'constant_user_id', '290.7', '0.7', '71.1', '5', '2024-09-28'),
('1lb brisket', 'constant_user_id', '746.1', '82.9', '0', '5', '0000-00-00'),
('salad', 'constant_user_id', '21.400000000000002', '0.2', '4.9', '5', '0000-00-00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
