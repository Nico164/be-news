-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 12, 2021 at 03:22 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `Posts`
--

CREATE TABLE `Posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `images` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `author` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`id`, `title`, `description`, `images`, `createdAt`, `updatedAt`, `author`) VALUES
(1, 'NULL replacement', 'this it to replace NULL', 'https://images.unsplash.com/photo-1633156114581-fc28bb136fa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', '2021-11-20 03:21:41', '2021-11-27 03:28:56', 6),
(6, 'test ok', 'test desciption ok', 'https://images.unsplash.com/photo-1633156114581-fc28bb136fa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', '2021-11-20 03:59:58', '2021-11-20 03:59:58', 6),
(7, 'Hello world', 'ok this is a test', 'https://images.unsplash.com/photo-1633156114581-fc28bb136fa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', '2021-11-20 04:51:39', '2021-11-20 04:51:39', 6),
(8, 'Hello world', 'ok this is a test', 'https://images.unsplash.com/photo-1633156114581-fc28bb136fa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', '2021-11-27 02:56:35', '2021-11-27 02:56:35', 6),
(9, 'Hello world', 'Mailtrain allows you to easily manage even very large lists. Million subscribers? Not a problem. You can add subscribers manually, through the API or import from a CSV file. All lists come with support for custom fields and merge tags as well.Mailtrain allows you to easily manage even very large lists. Million subscribers? Not a problem. You can add subscribers manually, through the API or import from a CSV file. All lists come with support for custom fields and merge tags as well. Mailtrain allows you to easily manage even very large lists. Million subscribers? Not a problem. You can add subscribers manually, through the API or import from a CSV file. All lists come with support for custom fields and merge tags as well. Mailtrain allows you to easily manage even very large lists. Million subscribers? Not a problem. You can add subscribers manually, through the API or import from a CSV file. All lists come with support for custom fields and merge tags as well.', 'https://images.unsplash.com/photo-1633156114581-fc28bb136fa8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80', '2021-11-27 03:12:31', '2021-11-27 03:12:31', 6);

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20211107025252-create-user.js'),
('20211107041048-create-post.js'),
('20211120032415-modify_posts_add_new_fields.js');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `firstName`, `lastName`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'John', 'Doe', 'John.Doe@gmail.com', '12345', '2021-11-07 03:18:25', '2021-11-07 03:18:25'),
(6, 'Asrul', 'Harahap', 'mail@mail.com', '$2b$10$EIRnCpuStWXuPCL557BLDuYmTtIBCGMrfrCo03DxXXsmbrP/L3rpa', '2021-11-13 03:47:08', '2021-11-13 03:47:08'),
(7, 'Nicolas', 'Faite', 'nicolas@gmail.com', '$2b$10$VRLy4538mkZTnYwtZ4im1e/WMzoUF7kZrV6njP36sOi471/V.38xm', '2021-11-20 03:39:55', '2021-11-20 03:39:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
