-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 26, 2023 at 07:10 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmpml`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'v', 'v@gmail.com', 'v@gmail.com\n', '2023-11-26 17:39:32'),
(2, 'vaibhav', 'v@gmail.com', 'v@gmail.com', '2023-11-26 17:45:45');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `feedback` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `feedback`, `created_at`) VALUES
(1, 'vaibhav mohanalkar', 'vaibhavvakil1234@gmail.com', 'first feedback testing', '2023-11-26 17:14:40'),
(2, 'v', 'v', 'v', '2023-11-26 17:16:05'),
(3, 'vaibhav', 'vaibhavvakil1234@gmail.com', 'second feeback', '2023-11-26 17:16:37'),
(4, 'vaibhav', 'vaibhavvakil1234@gmail.com', 'second feedback', '2023-11-26 17:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `created_at`) VALUES
(1, 'bus', '151 bus are cancelled today', '2023-11-26 18:01:53'),
(2, 'bus', 'दिनांक २३ ते २९ ऑक्टोबर पर्यंत मार्गावरील बस ब्रेकडाऊन व महसूल संबंधित माहिती', '2023-11-26 18:12:15'),
(3, 'bus', 'दिनांक १६ ऑक्टोबर २०२३ ते २२ ऑक्टोबर २०२३ पर्यंत मार्गावरील बसेस ब्रेकडाऊन आणि महसूल संबंधित माहिती', '2023-11-26 18:12:42'),
(4, 'route', 'दिनांक ९ ऑक्टोबर ते १६ ऑक्टोबर पर्यंत मार्गावरील बसेस ब्रेकडाऊन व महसूल संबंधित माहिती', '2023-11-26 18:12:59'),
(5, 'bus', 'दिनांक २१ ऑगस्ट ते २७ ऑगस्ट २०२३ पर्यंत मार्गावरील बसेस ब्रेकडाऊन व महसूल संबंधित माहिती', '2023-11-26 18:13:29'),
(6, 'bus', 'दिनांक २ ऑक्टोबर २०२३ ते ८ ऑक्टोबर २०२३ पर्यंत मार्गावरील बसेस ब्रेकडाऊन व महसूल संबंधित माहिती', '2023-11-26 18:13:38'),
(7, 'route', 'दिनांक 28 ऑगस्ट ते 3 सेप्टेंबर २०२३ पर्यंत मार्गावरील बस ब्रेकडाऊन व महसूल संबंधित माहिती', '2023-11-26 18:13:51'),
(8, 'coworkers', 'परिवहन महामंडळाकडील निगडी डेपोतील कर्मचार्‍यांनी केलेल्या उल्लेखनिय कामगिरी बाबत', '2023-11-26 18:14:10'),
(9, 'bus', 'परिवहन महामंडळाकडील निगडी डेपोतील कर्माचारी यांनी केलेल्या उल्लेखनीय कामगिरी बाबत', '2023-11-26 18:14:23'),
(10, '', 'दिनांक १४ ऑगस्ट ते २० ऑगस्ट २०२३ पर्यंत मार्गावरील बसेस ब्रेकडाऊन व महसूल् संबंधित माहिती', '2023-11-26 18:15:26');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticketId` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `adharCard` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobileNumber` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ticketType` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ticketTime` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticketId`, `adharCard`, `mobileNumber`, `ticketType`, `ticketTime`) VALUES
('06b383a6-58b1-4980-b86d-2125bd7a9612', '415910274037', '9284378620', 'combined', '22/11/2023, 4:40:44 pm'),
('3d20d591-5ed1-4d5f-b653-654cfa9ed3e0', '746195491000', '8459875293', 'puneCorp', '24/11/2023, 5:16:40 pm'),
('4e9638eb-b223-4c66-bfe4-cb089aa74fd8', '415910274037', '9284378620', 'combined', '22/11/2023, 4:40:48 pm'),
('4f77fa9e-9b04-4169-b5ab-3c19a9023863', '415910274038', '8805164615', 'puneDistrict', '23/11/2023, 2:06:16 pm'),
('6c21ab0a-30a7-4751-bd2d-0e17125a6360', '328062022497', '9588493727', 'puneCorp', '23/11/2023, 9:37:21 pm'),
('738da1e0-8854-4aad-bd60-9a3439baa335', '415910274037', '9284378620', 'puneCorp', '22/11/2023, 6:52:55 pm'),
('8c91f94d-a7b1-4533-9b10-691779a6a1fb', '952788076312', '9527880763', 'seniorCitizen', '23/11/2023, 9:57:47 pm'),
('cc4c4f2b-5799-4843-a028-ada47814f9c0', '201667755841', '8856077610', 'puneCorp', '23/11/2023, 9:52:54 pm'),
('ccae8e55-2826-44fb-9d19-eabbe042c902', '415910274037', '9284378620', 'combined', '26/11/2023, 8:36:38 pm'),
('f2f6e25f-dbfe-4364-87e0-61d32c3b1c75', '415910274040', '9284378621', 'combined', '23/11/2023, 11:44:10 pm');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'adminp', 'admin'),
(2, 'superadmin', 'superadminp', 'superadmin'),
(3, 'admin1', 'admin1p', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticketId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
