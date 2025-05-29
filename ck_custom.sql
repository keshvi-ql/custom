-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 09:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ck_custom`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `author`, `created`, `modified`) VALUES
(1, 'Mollit dolor', 'Ipsum qui voluptas e', 'Glenna Horton', '2025-05-21 04:18:54', '2025-05-21 04:35:13'),
(2, 'Officia ', 'Quia culpa nulla ip', 'Rajah Graves', '2025-05-21 05:01:40', '2025-05-21 05:01:46'),
(3, 'Id quod animi', 'Odio repudiandae ', 'Orlando Leach', '2025-05-28 03:58:39', '2025-05-28 03:58:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created`, `modified`) VALUES
(1, 'Brielle Sanders', 'Suscipit numquam lab', '2025-05-08 11:25:11', '2025-05-08 11:25:11'),
(2, 'Fiona Barnes', 'Doloribus in delectu', '2025-05-08 11:25:20', '2025-05-08 11:25:20'),
(3, 'Herman Mack', 'Eius ipsam est veli', '2025-05-08 11:25:27', '2025-05-08 11:25:27'),
(4, 'Jamal Smith', 'Proident officia ', '2025-05-27 06:38:52', '2025-05-27 06:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `created`, `modified`) VALUES
(1, 'Keshvi ', 'keshvi123@gmail.com', '8758230914', 'river kent', '2025-05-08 07:21:20', '2025-05-08 10:12:18'),
(2, 'vasu Gami', 'vasu@gmail.com', '9067345678', 'Consequatur ', '2025-05-08 10:21:19', '2025-05-08 10:22:00'),
(5, 'Mohammad Stephenson', 'rybilyji@mailinator.com', '7865743219', 'Corporis rerum neque', '2025-05-08 10:38:40', '2025-05-21 03:43:36'),
(6, 'akash', 'akash12@gmail.com', '9087657987', 'Environment variables', '2025-05-21 05:43:59', '2025-05-22 12:57:01'),
(9, 'vishu', 'vishu@gmail.com', '9809876123', 'xsfvsdgdsgdf', '2025-05-28 03:55:51', '2025-05-28 03:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `blog_id`, `title`, `content`, `image`, `created`, `modified`) VALUES
(1, 1, 'Eum praesentium ', 'Magnam aspernatur re', 'posts/1747803804.webp', '2025-05-21 05:03:24', '2025-05-21 05:03:24'),
(2, 1, 'Ad dolor velit rem', 'Quo id et odio offic', 'posts/1747803827.webp', '2025-05-21 05:03:47', '2025-05-21 05:03:47'),
(3, 2, 'Sit proident occaecat incidunt ', 'Quis est nulla offi', 'posts/1747803849.jpeg', '2025-05-21 05:04:09', '2025-05-21 05:04:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `image`, `created`, `modified`) VALUES
(1, 2, 'product1', 'Product1 Description', 390.00, 'products/1747799186.webp', '2025-05-21 03:46:27', '2025-05-21 03:46:27'),
(3, 3, 'product2', 'Product2 Description', 500.00, 'products/1747800464.webp', '2025-05-21 04:07:44', '2025-05-21 04:07:44'),
(4, 2, 'Jolene Vincent', 'Quos aut duis repreh', 109.00, 'products/1747918424.jpg', '2025-05-22 12:53:44', '2025-05-22 12:53:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
