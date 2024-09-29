-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2024 at 09:58 AM
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
-- Database: `meal_planner`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `dietary_restrictions` text DEFAULT NULL,
  `food_habits` text NOT NULL,
  `health_goals` text DEFAULT NULL,
  `medical_history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `age`, `weight`, `height`, `gender`, `dietary_restrictions`, `food_habits`, `health_goals`, `medical_history`) VALUES
(1, 'tom', 20, 80.00, 150.00, 'male', 'Vegan, Gluten-Free, Nut Allergy', 'High Protein, Paleo', 'Weight Loss, Improve Stamina', 'High Blood Pressure'),
(2, 'Jerry', 20, 80.00, 150.00, 'male', 'Vegetarian, Gluten-Free', 'High Protein', 'Weight Loss, Improve Stamina', 'High Blood Pressure'),
(6, 'tom', 20, 57.00, 155.00, 'male', 'Vegan, Gluten-Free, Nut Allergy', 'Low Carb', 'Muscle Gain', 'High Blood Pressure'),
(7, 'Stalen', 21, 90.00, 150.00, 'male', 'None', 'High Protein', 'Muscle Gain', 'High Blood Pressure'),
(8, 'Stalen', 21, 90.00, 150.00, 'male', 'None', 'High Protein', 'Muscle Gain', 'High Blood Pressure'),
(9, 'Stalen', 21, 90.00, 150.00, 'male', 'None', 'High Protein', 'Muscle Gain', 'High Blood Pressure'),
(10, 'Stalen', 21, 90.00, 150.00, 'male', 'None', 'High Protein', 'Muscle Gain', 'High Blood Pressure'),
(11, 'Stalen', 20, 100.00, 150.00, 'male', 'Gluten-Free', 'High Protein', '', 'High Blood Pressure'),
(12, 'Stalen', 20, 100.00, 150.00, 'male', 'Gluten-Free', 'High Protein', '', 'High Blood Pressure'),
(16, 'Bob', 20, 54.00, 154.00, 'male', 'Vegetarian, Dairy-Free', 'Low Carb', 'Muscle Gain, Maintain Weight', 'Diabetes'),
(19, 'Bob', 20, 54.00, 154.00, 'male', 'Vegetarian, Dairy-Free', 'Low Carb', 'Muscle Gain, Maintain Weight', 'Diabetes'),
(22, 'tom', 20, 55.00, 100.00, 'male', 'Gluten-Free', 'Low Carb', 'Muscle Gain', 'High Blood Pressure'),
(23, 'Stalen', 20, 55.00, 100.00, 'male', 'Dairy-Free', 'Low Carb', 'Maintain Weight', 'High Blood Pressure'),
(24, 'lee', 20, 45.00, 100.00, 'female', 'Vegetarian', 'Paleo', 'Maintain Weight', 'Heart Disease'),
(26, 'Ant', 20, 55.00, 150.00, 'female', 'Vegetarian, Nut Allergy', 'Low Carb, Paleo', 'Muscle Gain, Maintain Weight', 'Heart Disease, Food Allergies'),
(28, 'Pratham Shinde og the REAL', 20, 79.00, 100.00, 'other', 'Vegetarian, Gluten-Free, Dairy-Free, Nut Allergy', 'High Protein, Low Carb, Paleo', 'Weight Loss, Muscle Gain, Improve Stamina, Maintain Weight', 'Diabetes, Heart Disease');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
