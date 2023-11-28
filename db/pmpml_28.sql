-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 28, 2023 at 04:35 PM
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
(2, 'vaibhav', 'v@gmail.com', 'v@gmail.com', '2023-11-26 17:45:45'),
(3, 'sainath', 'sainpm@gmail.com', 'Need help for bus', '2023-11-27 11:51:37'),
(4, 'prasad', 'preas@gamil.com', 'Routes Help', '2023-11-27 11:51:56'),
(5, 'sumit', 'sumit@gmail.com', 'how to buy tickets?', '2023-11-27 11:52:30');

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
(4, 'vaibhav', 'vaibhavvakil1234@gmail.com', 'second feedback', '2023-11-26 17:17:36'),
(5, 'Prasad Gosavi', 'Gosaviprasa@gmail.com', 'Its save my time , Thank You', '2023-11-27 11:50:41');

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
('0158773a-b8ee-4a0d-9000-30939144fa97', '415910274040', '9284378620', 'combined', '27/11/2023, 8:02:10 pm'),
('06b383a6-58b1-4980-b86d-2125bd7a9612', '415910274037', '9284378620', 'combined', '22/11/2023, 4:40:44 pm'),
('091f1612-a0a5-44eb-8f4d-39ebdb08abda', '415910274038', '9284378620', 'combined', '27/11/2023, 7:37:01 pm'),
('122e0ea3-bc22-47b9-b86e-8895159d0232', '415910274044', '8805164615', 'puneCorp', '27/11/2023, 8:09:19 pm'),
('337ba321-a4b3-445f-9de7-c829b482efc1', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 7:54:00 pm'),
('3d20d591-5ed1-4d5f-b653-654cfa9ed3e0', '746195491000', '8459875293', 'puneCorp', '24/11/2023, 5:16:40 pm'),
('429c910f-abd8-43db-9905-d0641ea5ed95', '415910274028', '8805164620', 'puneCorp', '27/11/2023, 10:51:55 pm'),
('4b9d0873-c3fb-4c05-97f8-5311f1853a28', '415910274085', '8856077610', 'pimpriChinchwad', '27/11/2023, 10:52:42 pm'),
('4e9638eb-b223-4c66-bfe4-cb089aa74fd8', '415910274037', '9284378620', 'combined', '22/11/2023, 4:40:48 pm'),
('4f77fa9e-9b04-4169-b5ab-3c19a9023863', '415910274038', '8805164615', 'puneDistrict', '23/11/2023, 2:06:16 pm'),
('5df03e9b-a426-4894-832e-20e9c2c8b34b', '415910274039', '9284378620', 'puneCorp', '27/11/2023, 7:48:04 pm'),
('624dc8b0-4ba0-4e18-91b0-d18e457ed442', '415910274037', '9284378620', 'puneCorp', '28/11/2023, 12:11:57 pm'),
('6c21ab0a-30a7-4751-bd2d-0e17125a6360', '328062022497', '9588493727', 'puneCorp', '23/11/2023, 9:37:21 pm'),
('738da1e0-8854-4aad-bd60-9a3439baa335', '415910274037', '9284378620', 'puneCorp', '22/11/2023, 6:52:55 pm'),
('7744cc5c-3b93-4497-b9e2-96746c2bff84', '415910274037', '8805164615', 'puneCorp', '27/11/2023, 8:10:46 pm'),
('78ad93dd-7bc5-408f-9ca1-f54a38d92423', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 7:52:05 pm'),
('825862e6-950a-4d2e-9a10-65ead0b5981b', '415910274037', '9284378620', 'combined', '27/11/2023, 7:58:41 pm'),
('894d6b70-0e6b-4977-86e0-72999f02aa20', '415910274040', '9284378620', 'combined', '27/11/2023, 8:04:28 pm'),
('8c91f94d-a7b1-4533-9b10-691779a6a1fb', '952788076312', '9527880763', 'seniorCitizen', '23/11/2023, 9:57:47 pm'),
('98b81768-7b03-4aa6-9da5-d754fe2f1c3b', '415910274039', '9284378620', 'puneCorp', '27/11/2023, 8:07:38 pm'),
('9bb95a26-499a-4537-998f-c1c1cc8fce7b', '415910274041', '9284378620', 'pimpriChinchwad', '27/11/2023, 8:06:12 pm'),
('9c4e2007-a9df-4def-b814-151f9a0345ca', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 7:51:18 pm'),
('a2ba6ff0-c2f8-4dd5-87ec-0eb899a839d7', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 7:44:59 pm'),
('c02345a2-db82-4e93-aa2a-e4f0ef41c6e4', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 7:57:22 pm'),
('c0f07fe4-017d-4b4c-986c-c51492d01a93', '415910274038', '8805164615', 'puneDistrict', '27/11/2023, 10:50:32 pm'),
('cc4c4f2b-5799-4843-a028-ada47814f9c0', '201667755841', '8856077610', 'puneCorp', '23/11/2023, 9:52:54 pm'),
('ccae8e55-2826-44fb-9d19-eabbe042c902', '415910274037', '9284378620', 'combined', '26/11/2023, 8:36:38 pm'),
('cf8c5771-d242-44ef-ac07-334485a5c482', '415910274035', '8805164618', 'seniorCitizen', '27/11/2023, 10:51:18 pm'),
('d4e62242-4cdb-44f7-9bb3-93137068b4e2', '415910274038', '9284378620', 'combined', '27/11/2023, 7:46:51 pm'),
('e0d8c742-fbd1-4dc0-a989-5f348eb0b6bc', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 8:00:16 pm'),
('edc2f64e-adf3-40e2-9988-e615920dedbb', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 11:30:10 am'),
('f2f6e25f-dbfe-4364-87e0-61d32c3b1c75', '415910274040', '9284378621', 'combined', '23/11/2023, 11:44:10 pm'),
('fbcf63aa-0e1e-4d10-9b86-78fe4ea624a6', '415910274037', '9284378621', 'pimpriChinchwad', '27/11/2023, 7:50:01 pm'),
('feeedc5d-a554-459e-8dd8-c1349fcda63c', '415910274037', '9284378620', 'puneCorp', '27/11/2023, 7:43:53 pm');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

CREATE TABLE `transaction_history` (
  `transaction_id` int NOT NULL,
  `ticket_id` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`transaction_id`, `ticket_id`, `amount`, `description`, `transaction_date`) VALUES
(4, '7744cc5c-3b93-4497-b9e2-96746c2bff84', '40.00', 'Bus Ticket (puneCorp)', '2023-11-27 14:40:46'),
(5, 'c0f07fe4-017d-4b4c-986c-c51492d01a93', '120.00', 'Bus Ticket (puneDistrict)', '2023-11-27 17:20:33'),
(6, 'cf8c5771-d242-44ef-ac07-334485a5c482', '40.00', 'Bus Ticket (seniorCitizen)', '2023-11-27 17:21:18'),
(7, '429c910f-abd8-43db-9905-d0641ea5ed95', '40.00', 'Bus Ticket (puneCorp)', '2023-11-27 17:21:55'),
(8, '4b9d0873-c3fb-4c05-97f8-5311f1853a28', '40.00', 'Bus Ticket (pimpriChinchwad)', '2023-11-27 17:22:42'),
(9, '624dc8b0-4ba0-4e18-91b0-d18e457ed442', '40.00', 'Bus Ticket (puneCorp)', '2023-11-28 06:41:58');

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
(3, 'admin1', 'admin1p', 'admin'),
(4, 'vaibhav', 'vaibhav', 'superadmin'),
(5, 'sainath', 'sainath', 'admin');

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
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`transaction_id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `transaction_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
