-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2025 at 05:40 AM
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
-- Database: `ajax-form`
--
CREATE DATABASE IF NOT EXISTS `ajax-form` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ajax-form`;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `age`, `gender`, `country`) VALUES
(1, 'Ram Kumar', 23, 'male', 'ind'),
(2, 'Keshvi Gami', 20, 'female', 'ban'),
(3, 'Sonam kapoor', 30, 'female', 'ne'),
(4, 'Anil khan', 23, 'male', 'sl');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `cake_jwt`
--
CREATE DATABASE IF NOT EXISTS `cake_jwt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cake_jwt`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20250529111555, 'CreateUsers', '2025-05-29 05:46:55', '2025-05-29 05:46:55', 0),
(20250529111945, 'CreateCategories', '2025-05-29 05:49:46', '2025-05-29 05:49:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created`, `modified`) VALUES
(1, 'Keshvi', 'keshvi@gmail.com', '123', '2025-05-30 07:25:03', '2025-05-30 07:25:03'),
(2, 'test', 'test@gmail.com', '123', '2025-05-30 07:25:43', '2025-05-30 07:25:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `ck_auth`
--
CREATE DATABASE IF NOT EXISTS `ck_auth` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_auth`;

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20240320092640, 'CreateUsers', '2025-05-06 11:05:14', '2025-05-06 11:05:14', 0),
(20240320092641, 'CreatePosts', '2025-05-06 11:05:14', '2025-05-06 11:05:14', 0),
(20240321000518, 'AddAuthTokenToUsers', '2025-05-06 11:05:14', '2025-05-06 11:05:14', 0),
(20240829090343, 'AddUserNameToUsers', '2025-05-06 11:05:14', '2025-05-06 11:05:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created`, `modified`) VALUES
(1, 1, 'My title', 'My Body', '2025-05-06 11:06:21', '2025-05-06 11:06:21'),
(2, 2, 'My title 2', 'My Body 2', '2025-05-06 11:06:21', '2025-05-06 11:06:21'),
(3, 3, 'post title', 'post body', '2025-05-06 11:14:25', '2025-05-06 11:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `token_active` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`, `token`, `token_active`, `username`) VALUES
(1, 'test@example.com', '$2y$10$H4kieXu8IujphYgQdlGVjucP7kQVr9B03nV1qhA6lzHHj2BYfp9Mm', '2025-05-06 11:06:21', '2025-05-06 11:15:34', '61be55a8e2f6b4e172338bddf184d6dbee29c98853e0a0485ecee7f27b9af0b4', 1, 'test'),
(3, 'keshvi123@gmail.com', '$2y$10$rfjYyK.ZufG0DbjTVSiR9up8LGp4I.7q.Nh8l.e8DY8McMBVmGl6.', '2025-05-06 11:10:56', '2025-05-06 12:14:17', '', 0, 'Keshvi'),
(4, 'admin@gmail.com', '$2y$10$W0a/RQo3WfXZwlwIFeu.8ObPkHomJmYXoC.eI9tbK/IaJXWHSX70O', '2025-05-06 12:11:58', '2025-05-06 12:22:16', '9834876dcfb05cb167a5c24953eba58c4ac89b1adf57f28f2f9d09af107ee8f0', 1, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `ck_avg`
--
CREATE DATABASE IF NOT EXISTS `ck_avg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_avg`;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Jone', '2025-05-05 10:14:36', '2025-05-05 10:14:36'),
(2, 'Jone due', '2025-05-05 10:14:56', '2025-05-05 10:14:56');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `article_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `article_id`, `created`, `modified`) VALUES
(1, 'lorem ipsum 1', 1, '2025-05-05 10:19:03', '2025-05-05 10:19:03'),
(2, 'lorem ipsum 2', 1, '2025-05-05 10:19:14', '2025-05-05 10:19:14'),
(3, 'lorem ipsum 3', 1, '2025-05-05 10:19:25', '2025-05-05 10:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `article_id`, `value`) VALUES
(1, 2, 1, 4),
(2, 1, 1, 5),
(3, 1, 2, 3),
(4, 1, 1, 1),
(5, 2, 1, 22);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `amount`, `created`, `modified`) VALUES
(1, 100, '2025-04-05 11:13:10', '2025-05-05 11:13:10'),
(2, 300, '2025-03-05 11:13:16', '2025-05-05 11:13:16'),
(3, 200, '2025-05-05 11:13:22', '2025-05-05 11:13:22'),
(4, 50, '2025-04-05 11:13:27', '2025-05-05 11:13:27'),
(5, 700, '2025-05-05 11:13:31', '2025-05-05 11:13:31'),
(6, 100, '2025-05-05 11:13:35', '2025-05-05 11:13:35'),
(7, 200, '2025-05-05 11:14:32', '2025-05-05 11:14:32'),
(8, 450, '2025-05-29 09:31:59', '2025-05-29 09:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Keshvi', '2025-05-05 12:31:57', '2025-05-05 12:31:57'),
(2, 'vasu', '2025-05-05 12:31:57', '2025-05-05 12:31:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `ck_bootstrap`
--
CREATE DATABASE IF NOT EXISTS `ck_bootstrap` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_bootstrap`;
--
-- Database: `ck_crud`
--
CREATE DATABASE IF NOT EXISTS `ck_crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_crud`;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Welcome to the CakePHP Docs', '2025-04-25 05:55:18', '2025-04-28 07:28:32'),
(2, 'What is CakePHP?', '2025-04-25 05:56:47', '2025-04-25 05:56:47'),
(3, 'Installing CakePHP via Composer', '2025-04-25 05:58:08', '2025-04-25 05:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts_categories`
--

CREATE TABLE `blog_posts_categories` (
  `category_id` int(11) NOT NULL,
  `blog_post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts_categories`
--

INSERT INTO `blog_posts_categories` (`category_id`, `blog_post_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Preface', '2025-04-25 05:51:04', '2025-05-08 04:09:00'),
(2, 'CakePHP at a Glance', '2025-04-25 05:52:36', '2025-04-25 05:52:36'),
(3, 'Quick Start Guide', '2025-04-25 05:52:44', '2025-04-25 05:52:44'),
(4, 'Migration Guides', '2025-04-25 05:52:50', '2025-04-25 05:52:50'),
(5, 'Tutorials & Examples', '2025-04-25 05:52:59', '2025-04-25 05:52:59'),
(6, 'Contributing', '2025-04-25 05:53:14', '2025-04-25 05:53:14');

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_fields`
--

CREATE TABLE `meta_fields` (
  `id` int(11) NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` text NOT NULL,
  `blog_post_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `meta_fields`
--

INSERT INTO `meta_fields` (`id`, `meta_key`, `meta_value`, `blog_post_id`, `created`, `modified`) VALUES
(1, 'metakey1', 'metafield1', 1, '2025-04-25 05:55:18', '2025-04-25 05:55:18'),
(2, 'metakey2', 'metafield2', 1, '2025-04-25 05:55:18', '2025-04-25 05:55:18'),
(3, 'slug', 'metafield1', 2, '2025-04-25 05:56:47', '2025-04-25 05:56:47'),
(4, 'seo_title', 'metafield2', 2, '2025-04-25 05:56:47', '2025-04-25 05:56:47'),
(5, 'slug', 'installing-cakephp', 3, '2025-04-25 05:58:08', '2025-04-25 05:58:08'),
(6, 'author', 'John Baker', 3, '2025-04-25 05:58:08', '2025-04-25 05:58:08'),
(7, 'seo_title', 'Learn What CakePHP Is and Why It Matters', 3, '2025-04-25 05:59:25', '2025-04-25 05:59:25'),
(8, 'metakey1', 'metafield1', 1, '2025-04-28 05:42:52', '2025-04-28 05:42:52'),
(9, 'metaaakey2', 'metafield2', 1, '2025-04-28 05:42:52', '2025-04-28 05:42:52'),
(10, 'metakey1', 'metafield1\r\n', 1, '2025-04-28 07:28:32', '2025-04-28 07:29:19');

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20250425071213, 'Test', '2025-04-25 04:40:24', '2025-04-25 04:40:24', 0),
(20250425090442, 'Demo', '2025-04-25 04:40:24', '2025-04-25 04:40:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts_categories`
--
ALTER TABLE `blog_posts_categories`
  ADD PRIMARY KEY (`category_id`,`blog_post_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_fields`
--
ALTER TABLE `meta_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_fields`
--
ALTER TABLE `meta_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `ck_custom`
--
CREATE DATABASE IF NOT EXISTS `ck_custom` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_custom`;

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
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mutation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`mutation`)),
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `author`, `created`, `modified`, `mutation`, `category_id`) VALUES
(1, 'Mollit dolor', 'Ipsum qui voluptas e', 'Glenna Horton', '2025-05-21 04:18:54', '2025-05-30 10:19:39', NULL, 1),
(2, 'Officia ', 'Quia culpa nulla ip', 'Rajah Graves', '2025-05-21 05:01:40', '2025-05-29 12:31:08', NULL, 2),
(3, 'Id quod animi', 'Odio repudiandae ', 'Orlando Leach', '2025-05-28 03:58:39', '2025-05-29 12:31:11', NULL, 3),
(5, 'Updated Blog Title', 'Updated content here', 'Lorem', '2025-05-28 09:39:48', '2025-05-30 06:53:35', '\"{\\\"x\\\":999,\\\"y\\\":888}\"', 6),
(10, 'Qui veritatis in quia amet officia quo perspiciatis odit', 'Tempore est repelle', 'lorem', '2025-05-29 11:29:51', '2025-05-30 10:18:18', '{\"x\":100,\"y\":200}', 5),
(11, 'New Blog Post 1', 'Content for new blog post 1', 'Author One', '2025-05-30 06:33:31', '2025-05-30 06:33:31', NULL, 1),
(12, 'New Blog Post 2', 'Content for new blog post 2', 'Author Two', '2025-05-30 06:33:31', '2025-05-30 06:33:31', '\"{\\\"x\\\":50,\\\"y\\\":150}\"', 2);

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
(4, 'Jamal Smith', 'Proident officia ', '2025-05-27 06:38:52', '2025-05-27 06:38:52'),
(5, 'Technology', 'Technology', '2025-05-29 12:11:38', '2025-05-29 12:11:38');

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
(2, 1, 'Ad dolor velit rem', 'Quo id et odio offic', 'posts/1747803827.webp', '2025-05-21 05:03:47', '2025-05-30 10:52:12'),
(3, 2, 'Sit proident occaecat incidunt ', 'Quis est nulla offi', 'posts/1747803849.jpeg', '2025-05-21 05:04:09', '2025-05-21 05:04:09'),
(4, 5, 'Quia ad est quia vel vero dolores do libero', 'Culpa sunt nihil vol', 'posts/1748584024.jpeg', '2025-05-30 05:46:29', '2025-05-30 05:47:04');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
--
-- Database: `ck_demo`
--
CREATE DATABASE IF NOT EXISTS `ck_demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_demo`;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `details`, `created`, `modified`) VALUES
(1, 'How to Start Blogging', 'This article explains the basics of starting a blog and what tools you need.Starting a blog can be one of the most rewarding ways to share your thoughts, knowledge, or business with the world. This article walks you through the fundamental steps to launch', '2025-04-01 10:00:00', '2025-04-01 10:00:00'),
(2, '10 Tips for Writing Engaging Content', 'Discover techniques for writing content that keeps readers interested.Learn powerful techniques to craft compelling content that captures attention and keeps readers engaged from the first sentence to the last. This includes using captivating headlines, s', '2025-04-02 12:30:00', '2025-04-02 12:30:00'),
(3, 'The Importance of SEO in 2025', 'An in-depth look at how search engine optimization has evolved.Take an in-depth look at the evolution of search engine optimization (SEO) — from keyword stuffing and backlink farming in the early 2000s to today’s focus on user experience, high-quality con', '2025-04-03 15:00:00', '2025-04-03 15:00:00'),
(4, 'Using Social Media to Promote Your Articles', 'Learn how to use social media platforms to increase article visibility.Discover how to effectively leverage social media platforms like Facebook, Twitter, Instagram, and LinkedIn to increase the visibility of your articles.  and engaging with your audienc', '2025-04-04 11:45:00', '2025-04-04 11:45:00'),
(5, 'Creating a Content Calendar for Your Blog', 'Maintain consistency and stay organized by using a content calendar to plan your writing schedule. A well-structured calendar helps you map out topics in advance, set realistic deadlines, and balance content types across the month. Whether you\'re publishi', '2025-04-05 09:20:00', '2025-04-05 09:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created`, `modified`) VALUES
(1, 'Electronics', '2025-04-30 12:00:00', '2025-04-30 12:00:00'),
(2, 'Books', '2025-04-30 12:05:00', '2025-04-30 12:05:00'),
(3, 'Clothing', '2025-04-30 12:10:00', '2025-04-30 12:10:00'),
(4, 'Home & Kitchen', '2025-04-30 12:15:00', '2025-04-30 12:15:00'),
(5, 'Sports', '2025-04-30 12:20:00', '2025-04-30 12:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` smallint(5) NOT NULL,
  `name` varchar(25) NOT NULL,
  `amount` float NOT NULL,
  `city` varchar(20) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `name`, `amount`, `city`, `created`) VALUES
(1, 'Jamal', 200, 'Tokyo', '2019-11-12 00:00:00'),
(2, 'Jone', 120, 'Dhaka', '2019-11-12 00:00:00'),
(3, 'Kamal', 100, 'Mosko', '2019-11-12 00:00:00'),
(4, 'Satis', 20, 'KolKata', '2019-11-12 00:00:00'),
(5, 'Lili', 223, 'Dhaka', '2019-11-11 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `status`, `created`, `modified`) VALUES
(1, 'PHP', 1, '2025-05-02 11:24:15', '2025-05-02 11:24:15'),
(2, 'JavaScript', 1, '2025-05-02 11:24:15', '2025-05-02 11:24:15'),
(3, 'Java', 1, '2025-05-02 11:24:15', '2025-05-02 11:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20250502120540, 'CreateProducts', '2025-05-02 06:41:09', '2025-05-02 06:41:09', 0),
(20250502121452, 'Initial', '2025-05-02 06:44:52', '2025-05-02 06:44:52', 0),
(20250503035314, 'AddMarksToStudents', '2025-05-02 22:27:49', '2025-05-02 22:27:50', 0),
(20250503040842, 'AddMarksAndFirstNameToStudents', '2025-05-02 22:44:21', '2025-05-02 22:44:22', 0),
(20250503043640, 'RemoveMarksAndFirstNameFormStudents', '2025-05-02 23:10:09', '2025-05-02 23:10:09', 0),
(20250503045814, 'AddMarksAndFirstNameToStudents', '2025-05-02 23:28:48', '2025-05-02 23:28:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile` int(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `mobile`, `created`, `modified`) VALUES
(1, 1, 2147483647, '2025-05-02 06:26:56', '2025-05-02 06:26:56'),
(2, 2, 1243267098, '2025-05-02 06:30:00', '2025-05-02 06:30:00'),
(3, 3, 2147483647, '2025-05-02 06:31:00', '2025-05-02 06:31:00'),
(4, 4, 2147483647, '2025-05-02 06:32:00', '2025-05-02 06:32:00'),
(5, 5, 2147483647, '2025-05-02 06:33:00', '2025-05-02 06:33:00'),
(7, 7, 1234567890, '2025-05-02 06:26:56', '2025-05-02 06:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `user_id`, `name`, `created`, `modified`) VALUES
(1, 2, 'php', '2020-04-13 14:33:23', '2020-04-13 14:33:23'),
(2, 3, 'javascript', '2020-04-13 14:33:23', '2020-04-13 14:33:23'),
(4, 4, 'Python', '2020-04-16 15:47:00', '2020-04-16 15:47:00'),
(6, 1, 'c', '2020-04-16 15:47:37', '2020-04-16 15:47:37'),
(7, 1, 'c++', '2020-04-16 15:47:37', '2020-04-16 15:47:37'),
(8, 5, 'TypeScript', '2025-05-02 09:30:35', '2025-05-02 09:30:35'),
(9, 7, 'Ruby', '2025-05-02 09:31:46', '2025-05-02 09:31:46'),
(10, 7, 'Bash', '2025-05-02 10:36:32', '2025-05-02 10:36:32'),
(13, 1, 'php', '2025-05-29 04:35:48', '2025-05-29 04:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Alice Johnson', 'USA', '2025-04-30 10:00:00', '2025-04-30 10:00:00'),
(2, 'Mohammed Ali', 'UAE', '2025-04-30 10:05:00', '2025-04-30 10:05:00'),
(3, 'Ravi Kumar', 'India', '2025-04-30 10:10:00', '2025-04-30 10:10:00'),
(4, 'Emily Chen', 'China', '2025-04-30 10:15:00', '2025-04-30 10:15:00'),
(5, 'Carlos Diaz', 'Mexico', '2025-04-30 10:20:00', '2025-04-30 10:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `submenus`
--

CREATE TABLE `submenus` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenus`
--

INSERT INTO `submenus` (`id`, `menu_id`, `name`, `status`, `created`, `modified`) VALUES
(1, 1, 'CakePHP', 1, '2025-05-02 11:41:09', '2025-05-02 11:41:09'),
(2, 1, 'Leravel', 1, '2025-05-02 11:41:09', '2025-05-02 11:41:09'),
(3, 1, 'Yii', 1, '2025-05-02 11:41:09', '2025-05-02 11:41:09'),
(4, 2, 'NodeJs', 1, '2025-05-02 11:41:09', '2025-05-02 11:41:09'),
(5, 2, 'React Js', 1, '2025-05-02 11:41:09', '2025-05-02 11:41:09');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `amount`, `created`, `modified`) VALUES
(1, 100, '2025-04-05 09:26:12', '2025-05-05 09:26:49'),
(2, 500, '2025-04-05 09:26:58', '2025-05-05 09:26:58'),
(3, 300, '2025-05-05 09:27:04', '2025-05-05 09:27:04'),
(4, 500, '2025-05-05 09:27:12', '2025-05-05 09:27:12'),
(5, 800, '2025-05-05 09:27:19', '2025-05-05 09:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1,
  `password` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `image`, `status`, `password`, `created`, `modified`) VALUES
(1, 'Keshvi', 'keshvi123@gmail.com', 'user-img/profile5.png', 0, '$2y$10$rGLxPt86LJbn40nbefrIO.slRrm4MmAoS1PFEZiD89gimvVp5Ds3y', '2025-05-02 04:59:21', '2025-05-02 08:37:15'),
(2, 'Spidey', 'spidey@gmail.com', 'user-img/profile2.jpg', 0, '$2y$10$Alf5lkiCkoL3J.1B7XU...gUdNj1d.j64typaVuqba0qKAmpp0P/m', '2025-05-02 04:59:47', '2025-05-02 05:37:11'),
(3, 'Jack', 'jack45@email.com', 'user-img/user1.jpg', 1, '$2y$10$3PAvKKtMwv5ft8NyCYUdUuo9V5jTMyV1AAty/gjJMAfpdwwHNEF56', '2025-05-02 05:00:03', '2025-05-02 05:00:03'),
(4, 'Priya', 'priya123@gmail.com', 'user-img/profile4.webp', 1, '$2y$10$ifAirH972fPhpladM7TmCeNI8ww.hZ0oJB/YLOTG5TG5/RnF5Fh86', '2025-05-02 05:00:28', '2025-05-02 05:00:28'),
(5, 'sophia', 'sophia@example.com', 'user-img/profile3.png', 0, '$2y$10$XVx.mBZL6nmAblX8vGvSD.DhNFij6J9S/OngUawZjjnyytTvncy..', '2025-05-02 05:00:50', '2025-05-03 06:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id`, `user_id`, `ip`, `created`, `modified`) VALUES
(1, 1, '::1', '2025-05-03 06:20:43', '2025-05-03 06:20:43'),
(2, 1, '::1', '2025-05-03 07:29:45', '2025-05-03 07:29:45'),
(3, 1, '::1', '2025-05-05 03:42:12', '2025-05-05 03:42:12'),
(4, 1, '::1', '2025-05-05 04:44:20', '2025-05-05 04:44:20'),
(5, 1, '::1', '2025-05-05 08:33:28', '2025-05-05 08:33:28'),
(6, 1, '::1', '2025-05-06 03:36:17', '2025-05-06 03:36:17'),
(7, 1, '::1', '2025-05-07 03:38:15', '2025-05-07 03:38:15'),
(8, 4, '::1', '2025-05-27 11:46:54', '2025-05-27 11:46:54'),
(9, 4, '::1', '2025-05-27 11:47:03', '2025-05-27 11:47:03'),
(10, 1, '::1', '2025-05-27 11:47:13', '2025-05-27 11:47:13'),
(11, 1, '::1', '2025-05-27 11:50:19', '2025-05-27 11:50:19'),
(12, 1, '::1', '2025-05-29 04:00:15', '2025-05-29 04:00:15'),
(13, 1, '::1', '2025-05-29 04:10:13', '2025-05-29 04:10:13'),
(14, 1, '::1', '2025-05-29 04:34:33', '2025-05-29 04:34:33'),
(15, 1, '::1', '2025-05-29 05:40:15', '2025-05-29 05:40:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenus`
--
ALTER TABLE `submenus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `submenus`
--
ALTER TABLE `submenus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Database: `ck_reg`
--
CREATE DATABASE IF NOT EXISTS `ck_reg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_reg`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created`, `modified`) VALUES
(1, 'Keshvi', 'keshvi123@gmail.com', '$2y$10$b8vvd7GeByDARYlEjNGuRukHrkLnBwesetSrWSVT8PGgvBJPtqAVO', '2025-05-06 06:05:43', '2025-05-06 06:05:43'),
(2, 'vasu', 'vasu@gmail.com', '$2y$10$lDOx6cUaKmAHWt8ROqe/..73UTJ.Uwq31Cq/.4uzzU5H6KbakcT3W', '2025-05-06 06:06:26', '2025-05-06 06:06:26'),
(3, 'roshni', 'roshni@gmail.com', '$2y$10$efTSD9THkQg1wFqD2QEJE.P4xMS2feGfzMN.UzEZ54UOXiO.ewwEe', '2025-05-07 03:39:43', '2025-05-07 03:39:43'),
(4, 'Valima', 'Valima123@gmail.com', '$2y$10$S59RD2ZiZ6yq55RrzCGiquVtx7V2MxkEQ7wUgaFmW9UFSUvcEmUhe', '2025-05-23 10:04:38', '2025-05-23 10:04:38'),
(5, 'riya', 'riya@gmail.com', '$2y$10$Px524CyvEVo.xteYv2Cx9uYq5pfTT/DJvoRSkiMc9TmpU2TAP8Xty', '2025-05-29 10:43:24', '2025-05-29 10:43:24');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `ck_token`
--
CREATE DATABASE IF NOT EXISTS `ck_token` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ck_token`;

-- --------------------------------------------------------

--
-- Table structure for table `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20240320092640, 'CreateUsers', '2025-05-06 12:29:50', '2025-05-06 12:29:50', 0),
(20240320092641, 'CreatePosts', '2025-05-06 12:29:50', '2025-05-06 12:29:50', 0),
(20240321000518, 'AddAuthTokenToUsers', '2025-05-06 12:29:50', '2025-05-06 12:29:50', 0),
(20240829090343, 'AddUserNameToUsers', '2025-05-06 12:29:50', '2025-05-06 12:29:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created`, `modified`) VALUES
(1, 1, 'My title', 'My Body', '2025-05-06 12:29:56', '2025-05-06 12:29:56'),
(2, 2, 'My title 2', 'My Body 2', '2025-05-06 12:29:56', '2025-05-06 12:29:56'),
(4, 3, 'post title', 'post body', '2025-05-06 12:38:42', '2025-05-06 12:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `token_active` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`, `token`, `token_active`, `username`) VALUES
(1, 'test@example.com', '$2y$10$UFeyq8joN67mLnuRRrNw1.T949OQ6aOedikGWihJ6An3TVLyogHKi', '2025-05-06 12:29:56', '2025-05-06 12:36:38', '61be55a8e2f6b4e172338bddf184d6dbee29c98853e0a0485ecee7f27b9af0b4', 1, 'test'),
(2, 'test2@example.com', '$2y$10$vc6e2sCZJzmVfrlLVpgjaugjItMVl.crM6hN70rxqoY5GaoIF.cZu', '2025-05-06 12:29:56', '2025-05-06 12:36:45', '81cc5b17018674b401b42f35ba07bb79e211239c23bffe658da1577e3e646877', 1, 'test2'),
(3, 'keshvi123@gmail.com', '$2y$10$R4dkfJgRkhbByS1dbGbG3uTgvAEzw6Smx1jqgo5CcDFAlacuX/KNy', '2025-05-06 12:37:29', '2025-05-06 12:51:32', '96efbc43a462ab9d9c6a8173e5b322e17f218b56eb3a05a4bbc53221adebc7b3', 0, 'Keshvi'),
(4, 'vasu@gmail.com', '$2y$10$hMxx9KRZhsjfN1bJ1TlOPOxZRtsrjmndS5HUWWqd5Hul6tlUmXLD2', '2025-05-06 12:52:07', '2025-05-07 06:23:11', '8b6832f35a015a55df7267b59aa6acc19ccaacc2146f391027fed2586688ebc3', 0, 'vasu'),
(5, 'priya123@gmail.com', '$2y$10$549QayzOnZgX/zkXkEoQiuuRCvcTAKW8Vmn5berck.eX8Upwrk9fm', '2025-05-07 06:37:56', '2025-05-07 06:37:56', '', 0, 'priya'),
(6, 'Valima123@gmail.com', '$2y$10$VZSmx94J.SLQOED6I5DpPeAM1A1xqQUnDF1eYqJRl8oZERbOuDIwi', '2025-05-23 10:42:39', '2025-05-23 10:42:39', '', 0, 'Valima'),
(7, 'bhavisha123@gmail.com', '$2y$10$fSTLoKriRrlWgfMvmAN7o.kOEPWdw2HVVDZnh1JN1YlWn7V9ATMae', '2025-05-23 10:50:55', '2025-05-23 10:50:55', '', 0, 'Bhavisha');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Database: `crud`
--
CREATE DATABASE IF NOT EXISTS `crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud`;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` int(10) NOT NULL,
  `sname` varchar(30) NOT NULL,
  `saddress` varchar(100) NOT NULL,
  `sclass` int(10) NOT NULL,
  `sphone` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `sname`, `saddress`, `sclass`, `sphone`) VALUES
(1, 'Keshvi', 'river kent app.', 1, '9874563210'),
(2, 'Deep', '64 - md building', 2, '8695477531'),
(3, 'Yash ', '149  Vesu Surat', 3, '9632587416'),
(4, 'Rita', '#23 dfgfdgf', 3, '4576534532'),
(5, 'Mihir', '44 vardhman soc.', 1, '8980066847');

-- --------------------------------------------------------

--
-- Table structure for table `studentclass`
--

CREATE TABLE `studentclass` (
  `cid` int(11) NOT NULL,
  `cname` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentclass`
--

INSERT INTO `studentclass` (`cid`, `cname`) VALUES
(1, 'BCA'),
(2, 'Btech'),
(3, 'BSC'),
(4, 'BCOM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `studentclass`
--
ALTER TABLE `studentclass`
  ADD PRIMARY KEY (`cid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `studentclass`
--
ALTER TABLE `studentclass`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `crudop`
--
CREATE DATABASE IF NOT EXISTS `crudop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crudop`;

-- --------------------------------------------------------

--
-- Table structure for table `crud`
--

CREATE TABLE `crud` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crud`
--

INSERT INTO `crud` (`id`, `name`, `email`, `mobile`, `password`) VALUES
(1, 'Keshvi', 'keshvi123@gmail.com', '8758230914', '1234'),
(2, 'priya', 'riyapatel@gmail.com', '9876890765', '123'),
(3, 'ram', 'ram1@gmail.com', '8675678943', '1234'),
(6, 'pihu', 'pihu12@gmail.com', '123456780', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `department_status` varchar(50) NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`, `department_status`) VALUES
(1, 'Admin', 'Enable'),
(2, 'Accounts', 'Enable'),
(3, 'HR', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `menu_icon` varchar(100) NOT NULL,
  `menu_status` varchar(100) NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_icon`, `menu_status`) VALUES
(1, 'Category', 'fa fa-list', 'Enable'),
(2, 'User', 'fa fa-user', 'Enable'),
(3, 'Salary', 'fa fa-cash', 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `menu_useraccess`
--

CREATE TABLE `menu_useraccess` (
  `permisssion_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `sub_menu_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_permission` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_useraccess`
--

INSERT INTO `menu_useraccess` (`permisssion_id`, `menu_id`, `sub_menu_id`, `user_id`, `user_permission`) VALUES
(80, 1, 1, 1, 'True'),
(81, 2, 2, 1, 'True'),
(82, 2, 5, 1, 'True'),
(83, 1, 6, 1, 'True'),
(84, 1, 7, 1, 'True'),
(85, 3, 8, 1, 'False'),
(86, 3, 9, 1, 'True'),
(87, 1, 1, 2, 'False'),
(88, 2, 2, 2, 'False'),
(89, 2, 5, 2, 'False'),
(90, 1, 6, 2, 'False'),
(91, 1, 7, 2, 'False'),
(92, 3, 8, 2, 'True'),
(93, 3, 9, 2, 'True'),
(101, 1, 1, 3, 'False'),
(102, 2, 2, 3, 'False'),
(103, 2, 5, 3, 'True'),
(104, 1, 6, 3, 'False'),
(105, 1, 7, 3, 'False'),
(106, 3, 8, 3, 'True'),
(107, 3, 9, 3, 'False');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `image`) VALUES
(10, 'product1', 3000, 'product details', '62026product.webp'),
(11, 'product2', 1000, 'product details', '42763p1.webp'),
(12, 'product3', 200, 'product details', '14802p2.webp'),
(13, 'product4', 35000, 'product details', '99659p5.jpg'),
(14, 'product5', 3400, 'product details', '30701p6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `submenu_department`
--

CREATE TABLE `submenu_department` (
  `subid` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `sub_menu_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `submenu_department`
--

INSERT INTO `submenu_department` (`subid`, `menu_id`, `sub_menu_id`, `department_id`, `status`) VALUES
(1, 1, 1, 1, 'Enable'),
(2, 3, 2, 2, 'Enable'),
(3, 3, 2, 3, 'Enable'),
(4, 2, 3, 3, 'Enable'),
(5, 2, 4, 1, 'Enable'),
(6, 2, 4, 2, 'Enable'),
(7, 1, 5, 2, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

CREATE TABLE `sub_menu` (
  `submenu_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `submenu_name` varchar(100) NOT NULL,
  `submenu_url` varchar(100) NOT NULL,
  `submenu_display` varchar(11) NOT NULL,
  `submenu_order` int(11) NOT NULL,
  `submenu_status` varchar(40) NOT NULL DEFAULT 'Enable',
  `submenu_department` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_menu`
--

INSERT INTO `sub_menu` (`submenu_id`, `menu_id`, `submenu_name`, `submenu_url`, `submenu_display`, `submenu_order`, `submenu_status`, `submenu_department`) VALUES
(1, 1, 'Category List', 'category_list.php', 'Yes', 0, 'Enable', ''),
(2, 3, 'Salary Generate', 'salary_generate.php', 'Yes', 0, 'Enable', ''),
(3, 2, 'User List', 'user_list.php', 'Yes', 0, 'Enable', ''),
(4, 2, 'Add User', 'user_add.php', 'Yes', 0, 'Enable', ''),
(5, 1, 'Category Add', 'category_add.php', 'Yes', 0, 'Enable', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_department` varchar(100) NOT NULL,
  `user_status` varchar(20) NOT NULL DEFAULT 'Enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_department`, `user_status`) VALUES
(1, 'Knowledge', '1', 'Enable'),
(2, 'Thruster', '2', 'Enable'),
(3, 'Users', '3', 'Enable');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crud`
--
ALTER TABLE `crud`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `menu_useraccess`
--
ALTER TABLE `menu_useraccess`
  ADD PRIMARY KEY (`permisssion_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submenu_department`
--
ALTER TABLE `submenu_department`
  ADD PRIMARY KEY (`subid`);

--
-- Indexes for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`submenu_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crud`
--
ALTER TABLE `crud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_useraccess`
--
ALTER TABLE `menu_useraccess`
  MODIFY `permisssion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `submenu_department`
--
ALTER TABLE `submenu_department`
  MODIFY `subid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `submenu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `crud_mvc`
--
CREATE DATABASE IF NOT EXISTS `crud_mvc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud_mvc`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`) VALUES
(1, 'John Doe', 'john@example.com', '1234567890'),
(2, 'Jane Smith', 'jane@example.com', '9876543210'),
(3, 'Alice Johnson', 'alice@example.com', '5551112233'),
(4, 'Bob Brown', 'bob@example.com', '0000000000'),
(7, 'Sarah Taylor', 'sarah@example.com', '4455667788');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `discuss`
--
CREATE DATABASE IF NOT EXISTS `discuss` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `discuss`;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(300) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer`, `question_id`, `user_id`) VALUES
(1, 'yes, it can be a good choice.', 3, 1),
(2, 'Yes,PHP is a highly scalable language', 1, 1),
(3, 'its depending on your intrest', 3, 1),
(4, 'Yes, Java is considered a very good programming language', 2, 1),
(5, 'Your Breath', 4, 1),
(6, 'A mobile phone is a phone which is movable to any place you like', 5, 3),
(7, 'Lok Sabha', 6, 3),
(8, 'Ketchup', 7, 4),
(9, 'A laptop is a portable personal computer, designed to be small and lightweight', 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'mobile'),
(2, 'laptop'),
(3, 'food'),
(4, 'coding'),
(5, 'general');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `description`, `category_id`, `user_id`) VALUES
(1, 'is PHP a good programming language ?', 'is PHP a good programming language ', 4, 4),
(2, 'is Java good programming language ? ', 'is Java good programming language ? Please Help..', 4, 1),
(3, 'Should I buy I phone ?', 'Should I buy I phone ? Please help', 1, 3),
(4, 'Warm up with questions that are considered easier ?', 'What’s something you can hold without touching?', 5, 2),
(5, 'Why mobile is called mobile?', 'Why mobile is called mobile?', 1, 3),
(6, 'Some questions on general knowledge.. ?', 'What is the term for the lower house of Parliament?', 5, 1),
(7, 'What condiment was used for its medicinal qualities in the 1800s?', 'Any one can help me ?', 3, 2),
(8, 'What is a laptop?', 'Information about the laptop..!', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `address`) VALUES
(1, 'keshvi', 'keshvi123@gmail.com', '12345', 'surat'),
(2, 'Jack', 'jack45@email.com', '12345', 'noida'),
(3, 'kajal', 'kajal123@gmail.com', '12345', 'surat'),
(4, 'Divu', 'divu50@gmail.com', '12345', 'Delhi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `hidden_shop`
--
CREATE DATABASE IF NOT EXISTS `hidden_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hidden_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_image` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_image`, `admin_password`) VALUES
(1, 'Ram', 'ram@gmail.com', 'user.png', '$2y$10$Y74x4k1dLlN1MsB0YqMX7elPb2LQ10Q6u8NQRMfMig.3kbGLIMd0e');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Swiggy'),
(2, 'Flipkart'),
(3, 'Amazon'),
(4, 'Adidas'),
(5, 'Zomato'),
(8, 'Nike');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(1, 'Fruits'),
(2, 'Juices'),
(3, 'Vegetables'),
(4, 'Milk products'),
(5, 'Books'),
(6, 'Biryani'),
(10, 'Shoes'),
(11, 'Clothes');

-- --------------------------------------------------------

--
-- Table structure for table `order_pending`
--

CREATE TABLE `order_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_pending`
--

INSERT INTO `order_pending` (`order_id`, `user_id`, `invoice_number`, `product_id`, `quantity`, `order_status`) VALUES
(1, 2, 1225050720, 3, 1, 'pending'),
(2, 2, 1130795322, 1, 1, 'pending'),
(3, 2, 421032092, 6, 1, 'pending'),
(4, 2, 212434454, 8, 1, 'pending'),
(5, 2, 1057659802, 14, 1, 'pending'),
(6, 2, 234030516, 2, 1, 'pending'),
(7, 2, 181150805, 11, 1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_keyword` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_image1` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_image3` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keyword`, `category_id`, `brand_id`, `product_image1`, `product_image2`, `product_image3`, `product_price`, `date`, `status`) VALUES
(2, 'Fresh Apple', 'Apples are rich in fiber, vitamins, and minerals, all of which benefit human health.', 'Apple, Fresh Fruit , Good Product , Healthy Fruit ', 1, 1, 'apple.jpeg', 'apple1.webp', 'apple2.webp', '300', '2025-03-18 11:23:58', 'true'),
(3, 'Capsicum', 'Capsicum, also known as red pepper or chili pepper, is an herb Vitamin C.Chili peppers grow  of Capsicum', 'Green , Red , Yellow Capsicum, Fresh Product , Good Product', 3, 5, 'capsicum.webp', 'capsicum1.jpg', 'capsicum2.jpg', '250', '2025-03-18 12:38:46', 'true'),
(4, 'Dairy Milk', 'Milk is an excellent source of vitamins and minerals, particularly calcium condensed milk is cow\'s milk', 'Dairy Milk , Milk Product ,fresh Product', 4, 5, 'dairy2.jpg', 'dairy1.jpeg', 'dairy milk.webp', '700', '2025-03-18 12:38:09', 'true'),
(5, 'Shoes', 'Shoes Online-Shop shoes online for Men, Women & Kids at 70% Discount in EORS garments worn on the feet.', 'Shoes , Black Shoes , White Shoes , Nike , Comfertable', 8, 7, 'nike1.webp', 'nike.avif', 'nike2.avif', '6000', '2025-03-18 12:40:51', 'true'),
(6, 'Fresh Juice', 'Juice is a drink made from the extraction or pressing of the natural liquid contained in fruit and vegetables.', 'Juice , Drink , Natural, Healthy  ', 2, 1, 'juice1.webp', 'juice3.jpeg', 'juice2.webp', '300', '2025-03-24 08:46:59', 'true'),
(7, 'Books', 'A book is an object recording information in the form of printed writing or images.', 'Book, Object , Read book ,Write a book , improve knowledge', 5, 3, 'book.webp', 'book1.jpeg', 'book2.jpeg', '1000', '2025-03-24 12:55:06', 'true'),
(8, 'Hyderabadi Biryani', 'Biryani is a mixed rice dish popular in South Asia, made with rice, meat or seafood  and spices.', 'Biryani , Veg Biryani , Non-veg Biryani , Famous Dish', 6, 1, 'biryani.jpeg', 'biryani1.jpeg', 'biryani3.jpg', '450', '2025-03-24 13:00:39', 'true'),
(9, 'Shoes', 'Shoes Online-Shop shoes online for Men, Women & Kids at 70% Discount in EORS', 'Shoes , Black Shoes , White Shoes , Nike , Comfertable', 10, 8, 'nike1.webp', 'nike.avif', 'nike2.avif', '6000', '2025-03-25 08:43:15', 'true'),
(10, 'Kurti', 'A kurti top or simply kurti, is an upper garment worn in the Indian subcontinent that does not leave the midriff bare', 'Kurti,Comfortable,Daily-wear,Traditional,Party-wear', 11, 2, 'cloth.jpg', 'cloth1.jpg', 'cloth2.avif', '700', '2025-03-25 08:50:13', 'true'),
(11, 'Fresh Mangoes', 'Mangoes, the king of fruits, are a popular tropical fruit, known for their juicy flesh, sweet flavor, and various health benefits. ', 'Mangoes, Fresh Mango , Raw Mango , Good Products', 1, 1, 'mango.jpg', 'mango2.webp', 'mango3.jpeg', '250', '2025-03-25 08:51:48', 'true'),
(12, 'Diet Juice', 'Vegetable juice is a juice drink made primarily of blended vegetables and also available in the form of powders.', 'Vegetable Juice , Drink , Natural, Healthy  ', 2, 5, 'g_juice.jpg', 'g_juice1.jpg', 'g_juice2.jpeg', '150', '2025-03-25 08:56:17', 'true'),
(13, 'Carrot', 'The carrot is a root vegetable, typically orange in colour, though heirloom variants including purple, black, red', 'carrot , fresh vegetable ,healthy vegetable', 3, 1, 'carrot.jpg', 'carrot1.webp', 'carrot2.jpg', '250', '2025-03-25 09:00:19', 'true'),
(14, 'Amul Butter', 'Butter is a dairy product made from the fat and protein components of churned cream. made by churning milk or cream', 'Butter  ,  dairy product ,milk or cream', 4, 5, 'butter.webp', 'butter1.webp', 'butter2.jpg', '150', '2025-03-25 09:05:05', 'true'),
(15, 'Adidas', ' German athletic apparel and footwear corporation headquartered in Herzogenaurach, Bavaria, Germany.', 'Adidas , Sports , Running , Sneakers , Comfortable', 10, 4, 'adidas2.webp', 'adidas.webp', 'adidas1.webp', '5000', '2025-03-25 09:09:31', 'true'),
(16, 'Stylish T-Shirt', 'A T-shirt is a style of fabric shirt named after the T of its body and sleeves. it has short sleeves and a round neckline', 'T-shirt , kind of shirt ,cloth ,daily-wear', 11, 2, 'cloth3.avif', 'cloth4.avif', 'cloth5.avif', '400', '2025-03-25 09:13:03', 'true'),
(17, 'Kashmiri Biryani', 'Biryani is a mixed rice dish popular in South Asia, made with rice, meat or seafood  and spices.', 'Kashmiri Biryani, Mixed vegetable and spices', 6, 5, 'biryani6.jpg', 'biryani5.jpg', 'biryani4.avif', '700', '2025-03-25 09:17:20', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_mobile` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `user_email`, `user_password`, `user_image`, `user_ip`, `user_address`, `user_mobile`) VALUES
(2, 'Keshvi', 'keshvigami@gmail.com', '$2y$10$.aHQCw0GaP43EOc27lCyhOm8/aZ5p/6GEupCkqLXIT0w593cC/YZe', 'user2.png', '::1', 'surat', '8758230914'),
(5, 'Seema', 'seema21@gmail.com', '$2y$10$a0Hj6m4ofNesBQv/yYXEo.Mc0RcDMCZ.Oc3jFfHGmfVosv0YWZcZi', 'user3.png', '::1', 'Mumbai', '7890654321'),
(6, 'rahul', 'rahul12@gmail.com', '$2y$10$cyYysyCdl9z2e5zyhPXWJ.IWoBsAwJ2/nsXjNOmh4z5VwF2vmS3k2', 'user.png', '::1', 'Navsari', '8908765467');

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_products` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `user_id`, `amount_due`, `invoice_number`, `total_products`, `order_date`, `order_status`) VALUES
(1, 2, 550, 1225050720, 2, '2025-03-24 10:20:34', 'Complete'),
(3, 2, 300, 421032092, 1, '2025-03-25 10:13:53', 'Complete'),
(5, 2, 150, 1057659802, 1, '2025-03-25 10:14:05', 'pending'),
(6, 2, 300, 234030516, 1, '2025-03-25 10:38:39', 'pending'),
(7, 2, 250, 181150805, 1, '2025-03-25 10:39:51', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `user_payment`
--

CREATE TABLE `user_payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_payment`
--

INSERT INTO `user_payment` (`payment_id`, `order_id`, `invoice_number`, `amount`, `payment_mode`, `date`) VALUES
(1, 1, 1225050720, 550, 'Paypal', '2025-03-24 10:20:34'),
(3, 7, 181150805, 250, 'UPI', '2025-03-25 10:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `product_id` int(11) NOT NULL,
  `ip_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`product_id`, `ip_address`) VALUES
(4, 0),
(14, 0),
(3, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `order_pending`
--
ALTER TABLE `order_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payment`
--
ALTER TABLE `user_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_pending`
--
ALTER TABLE `order_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_payment`
--
ALTER TABLE `user_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `mvcdb`
--
CREATE DATABASE IF NOT EXISTS `mvcdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mvcdb`;

-- --------------------------------------------------------

--
-- Table structure for table `fruit`
--

CREATE TABLE `fruit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quality` varchar(100) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fruit`
--

INSERT INTO `fruit` (`id`, `name`, `price`, `quality`, `userId`) VALUES
(1, 'Apple', '390', 'A', 6),
(2, 'Kiwi', '500', 'B', 9),
(3, 'Banana', '200', 'C', 8),
(4, 'Mango', '120', 'B', 3),
(5, 'Orange', '250', 'A', 5),
(6, 'Pineapple', '430', 'A', 4),
(7, 'Strawberry', '620', 'A', 7),
(8, 'Grapes', '310', 'B', 2),
(9, 'Watermelon', '700', 'B', 6),
(11, 'Guava', '180', 'B', 1),
(12, 'Lychee', '450', 'A', 8),
(13, 'Blueberry', '720', 'A', 4),
(14, 'Raspberry', '670', 'A', 9),
(15, 'Blackberry', '640', 'A', 5),
(16, 'Cherry', '550', 'A', 2),
(17, 'Peach', '390', 'B', 6),
(18, 'Plum', '410', 'B', 7),
(19, 'Apricot', '430', 'B', 8),
(20, 'Dragonfruit', '880', 'A', 1),
(21, 'Pomegranate', '590', 'A', 5),
(22, 'Pear', '370', 'B', 2),
(23, 'Coconut', '330', 'C', 3),
(24, 'Starfruit', '400', 'B', 4),
(25, 'Jackfruit', '460', 'C', 7),
(26, 'Passionfruit', '630', 'B', 8),
(27, 'Fig', '510', 'B', 9),
(28, 'Mulberry', '570', 'B', 2),
(29, 'Gooseberry', '520', 'B', 3),
(30, 'Persimmon', '690', 'A', 6),
(31, 'Cantaloupe', '310', 'B', 1),
(32, 'Honeydew', '390', 'B', 2),
(33, 'Longan', '470', 'A', 4),
(34, 'Cranberry', '580', 'B', 5),
(35, 'Durian', '920', 'C', 9),
(36, 'Rambutan', '680', 'A', 8),
(38, 'Jujube', '300', 'C', 6),
(39, 'Soursop', '860', 'B', 7),
(40, 'Sapodilla', '350', 'B', 2),
(41, 'Miracle Fruit', '390', 'C', 1),
(43, 'Papaya', '280', 'C', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`) VALUES
(1, 'Varun', 'varun12@gmail.com', '$2y$10$FhJd4vb78RQVsOsURk8mQegsBxVxvduI5zAzh2cs5N1qSSf5/vFbi'),
(2, 'Priyanka', 'priya123@gmail.com', '$2y$10$FhJd4vb78RQVsOsURk8mQegsBxVxvduI5zAzh2cs5N1qSSf5/vFbi'),
(3, 'keshvi', 'keshvi123@gmail.com', '$2y$10$LY/oWwLWzsNwmbTqubIXZe2VY50qS31ufQhjPA5Y8saDuA9SUoy..'),
(4, 'karan', 'karan@gmail.com', '$2y$10$65h3roO6YH5h8PGnAcHk/es38WBKoQVygYcBpqTa5fAbCcgJN3ZdC'),
(6, 'Vasu', 'vasu12@gmail.com', '$2y$10$LY/oWwLWzsNwmbTqubIXZe2VY50qS31ufQhjPA5Y8saDuA9SUoy..'),
(7, 'kiran', 'kiran12@gmail.com', '$2y$10$k1gRkwYRlxaiFqUnoU.NFuvOIj8Q9gUcRmR6dgTCQKaxSZR45C7/W'),
(8, 'siya', 'siya123@gmail.com', '$2y$10$65h3roO6YH5h8PGnAcHk/es38WBKoQVygYcBpqTa5fAbCcgJN3ZdC'),
(9, 'mihir', 'mihir12@gmail.com', '$2y$10$FhJd4vb78RQVsOsURk8mQegsBxVxvduI5zAzh2cs5N1qSSf5/vFbi'),
(10, 'rita', 'rita123@gmail.com', '$2y$10$Wp8ynB8.PMWObxoihlzUTeLUOwlsMXAOO9f5d5cHtsoZHwAxIhrZ.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fruit`
--
ALTER TABLE `fruit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `myshop`
--
CREATE DATABASE IF NOT EXISTS `myshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myshop`;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `address`, `created_at`) VALUES
(1, 'Bill Gates', 'bill.gates@microsoft.com', '+123456789', 'New York,USA', '2025-03-11 17:59:39'),
(2, 'Elon Musk', 'elon.musk@spacex.com', '+111222333', 'Florida,USA', '2025-03-11 17:59:39'),
(3, 'Will Smith', 'will.smith@gmail.com', '+111333555', 'California,USA', '2025-03-11 17:59:39'),
(4, 'Bob Marley', 'bob@gmail.com', '+111555999', 'Texas,USA', '2025-03-11 17:59:39'),
(5, 'Cristiano Ronaldo', 'cristiano.ronaldo@gmail.com', '+32447788993', 'Manchester,England', '2025-03-11 17:59:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `news-site`
--
CREATE DATABASE IF NOT EXISTS `news-site` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `news-site`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `post` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `post`) VALUES
(35, 'Politics', 2),
(34, 'Health', 2),
(33, 'sports', 1),
(36, 'Entertainment', 3);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `post_date` varchar(50) NOT NULL,
  `author` int(11) NOT NULL,
  `post_img` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `title`, `description`, `category`, `post_date`, `author`, `post_img`) VALUES
(43, 'Health ', '                    Health is the condition of the human body which is free from any injury or illness. But staying healthy is defined as staying mentally, physically and socially fit. Maintaining good health will ultimately lead to a happy mind which is more valuable than any precious gift in today’s life. Having a healthy life must be a part of everyone’s lifestyle. If one has a healthy and happy mind, then one will always stay motivated towards one’s work and will be productive at work. It is essential for every individual to feel good about themselves, which will keep them happy. It is necessary to lead a healthy life to avoid any kind of chronic disease. To maintain a healthy life, a person can go running or take a morning walk, can exercise daily, and support healthy food habits.                ', '34', '26 Feb, 2025', 24, 'health.jpg'),
(44, 'sports', '                                                            Sports are the physical activities with different names according to the ways of playing them. Sports are generally liked by almost all the children whether girls or boys. Generally the topic of benefits and importance of sports are argues by the people. And yes, any type of sport is deeply connected with the physical, physiological, mental and intellectual health of the person. It helps in maintaining the physical and mental fitness of the person. Playing sports on daily basis help in developing the mental skills. It also improves the psychological skills of the person playing. It brings motivation, courage, discipline and concentration.                                                ', '33', '26 Feb, 2025', 24, 'sports.jpg'),
(45, 'Entertainment ', 'Free entertainment comes in a variety of forms, catering to diverse interests and preferences. Online platforms offer an abundance of options, from streaming services that provide access to movies, TV shows, and documentaries at no cost to virtual museums and art galleries that allow users to explore cultural treasures without spending a dime. Social media platforms contribute to the landscape of free entertainment through user-generated content, offering everything from comedic sketches to educational tutorials. Additionally, public events such as community festivals, street performances, and open-air concerts provide opportunities for people to enjoy cultural experiences without any financial burden. ', '36', '26 Feb, 2025', 24, 'entertainment.jpg'),
(46, 'Politics', '                    Politics does not limit to those in power in the government. It is also about the ones who are in the run to achieve the same power. The candidates of the opposition party question the party on power during political debates. They intend to inform people and make them aware of their agenda and what the present government is doing. All this is done with the help of politics only.Dirty politics refers to the kind of politics in which moves are made for the personal interest of a person or party.                ', '35', '26 Feb, 2025', 24, 'politics2.jpg'),
(48, 'Crime', 'A lot of important measures, on the one hand, can be taken by the governments in order to reduce or even eradicate different types of crimes .First, governments can introduce more police forces everywhere to monitor people s activities and stop them from committing crimes. Second, the state can apply new technologies such as surveillance cameras in the streets, shopping centers, restaurants and all public places to cease criminals .Third, strict punishments on criminals can have really preventive and deterrent effects on all age groups in society , so by using harsh penalties like emprisonment,physical or financial', '35', '26 Feb, 2025', 24, 'crime.jpg'),
(49, 'New post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mi turpis, semper id orci at, lacinia porta libero. Curabitur mauris nibh, volutpat ut odio vitae, pharetra malesuada urna. Donec interdum eleifend ante, non cursus risus semper a. Donec id maximus augue, sed rhoncus leo. Nunc accumsan viverra justo, convallis ullamcorper risus ultrices nec. Nulla tempor porttitor tellus sed tempor. Etiam in augue quis nulla ullamcorper maximus. Praesent sit amet nisl sem. Aliquam vitae erat id nisi vestibulum auctor.', '34', '27 Feb, 2025', 33, 'health1.jpg'),
(50, 'Recent post demo', '                                        Praesent commodo quam a convallis pellentesque. Sed ac orci eget tortor aliquam gravida. Vestibulum tincidunt pretium suscipit. Aenean lectus eros, vestibulum nec dui eu, dictum tristique mi. Aliquam ex dolor, fringilla id sapien sed, vestibulum tincidunt nisi. Donec elementum vehicula quam, auctor hendrerit sapien molestie nec. Suspendisse eu tristique felis.                                ', '36', '27 Feb, 2025', 28, '1740641128-entertainment1.jpg'),
(51, 'image testing', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '36', '27 Feb, 2025', 24, '1740646517-entertainment.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `websitename` varchar(60) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `footerdesc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`websitename`, `logo`, `footerdesc`) VALUES
('New News Website', 'news.jpg', '© Copyright 2025 News | Powered by Yahoo Baba');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `role` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `username`, `password`, `role`) VALUES
(24, 'Keshvi', 'Gami', 'keshvi', '21232f297a57a5a743894a0e4a801fc3', 1),
(33, 'Kajal', 'Agarwal', 'kajal', 'fea087517c26fadd409bd4b9dc642555', 0),
(27, 'Kriti ', 'Sanon', 'Kriti', 'd98ce759d86ce4570314367a10820568', 0),
(28, 'Shahid ', 'Kapoor', 'shahid', '21232f297a57a5a743894a0e4a801fc3', 0),
(34, 'Madhuri', 'Dixit', 'Madhuri', '21232f297a57a5a743894a0e4a801fc3', 1),
(30, 'Anil', 'Kapoor', 'Anil', '4d9986601c64b3809c018cdf34561bc1', 0),
(31, 'Salman', 'Khan', 'Salman', '97502267ac1b12468f69c14dd70196e9', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `post_id` (`post_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- Database: `oops`
--
CREATE DATABASE IF NOT EXISTS `oops` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `oops`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `created_at`) VALUES
(21, 1, 2, 2, '2025-04-11 12:33:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `payment_method`, `order_date`, `status`) VALUES
(9, 1, 549.00, 'Credit/Debit Card', '2025-04-11 17:19:02', 'Pending'),
(10, 1, 1200.00, 'Cash on Delivery', '2025-04-12 09:38:58', 'completed'),
(12, 2, 700.00, 'Net Banking', '2025-04-12 10:53:58', 'Cancelled'),
(13, 5, 1799.00, 'UPI', '2025-04-12 11:38:00', 'Cancelled'),
(15, 1, 900.00, 'Cash on Delivery', '2025-04-30 09:43:25', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('Pending','Cancelled','Completed') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `status`) VALUES
(15, 9, 23, 1, 549.00, 'Pending'),
(16, 10, 6, 1, 1200.00, 'Pending'),
(18, 12, 2, 1, 700.00, 'Cancelled'),
(19, 13, 21, 1, 1799.00, 'Cancelled'),
(21, 15, 7, 1, 900.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category`, `image`) VALUES
(2, 'Classic Spring', 700.00, 'men', 'uploads/products/men-02.jpg'),
(3, ' Green Jacket', 500.00, 'women', 'uploads/products/women-01.jpg'),
(4, 'School Collection', 800.00, 'kids', 'uploads/products/kid-01.jpg'),
(5, 'Classic Dress', 600.00, 'women', 'uploads/products/women-02.jpg'),
(6, 'Summer Cap', 1200.00, 'kids', 'uploads/products/kid-02.jpg'),
(7, 'Air Force 1 X', 900.00, 'men', 'uploads/products/men-01.jpg'),
(8, 'Love Nana ‘20', 700.00, 'men', 'uploads/products/men-03.jpg'),
(9, 'Spring Collection', 300.00, 'women', 'uploads/products/women-03.jpg'),
(10, 'Classic Kid', 300.00, 'kids', 'uploads/products/kid-03.jpg'),
(12, 'Printed Casual Shirt', 1999.00, 'men', 'uploads/products/men-04.webp'),
(13, 'Columbia Sportswear', 2000.00, 'men', 'uploads/products/men-05.webp'),
(14, 'Coofandy long sleeve', 2000.00, 'men', 'uploads/products/men-06.jpg'),
(15, 'DL Woman Oversized', 999.00, 'women', 'uploads/products/women-04.webp'),
(16, ' Waffle Cotton ', 424.00, 'women', 'uploads/products/women-05.webp'),
(17, 'Straight Kurta', 390.00, 'women', 'uploads/products/women-06.webp'),
(18, 'Cotton Cloth', 590.00, 'kids', 'uploads/products/kid-04.webp'),
(19, 'Printed Hooded ', 2329.00, 'kids', 'uploads/products/kid-05.webp'),
(20, 'Stylish fashion', 570.00, 'kids', 'uploads/products/kid-06.webp'),
(21, 'Bow Tie', 1799.00, 'men', 'uploads/products/acc-01.webp'),
(22, ' Silver Rings', 599.00, 'men', 'uploads/products/acc-02.webp'),
(23, ' Crystal Bracelet', 549.00, 'women', 'uploads/products/acc-03.webp'),
(24, ' Rose Gold Watch', 1999.00, 'women', 'uploads/products/acc-04.webp'),
(25, 'Rainbow Shaped', 550.00, 'kids', 'uploads/products/acc-06.webp'),
(26, 'Water Bottle', 890.00, 'kids', 'uploads/products/acc-07.webp');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_as` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-user,1-admin',
  `created_at` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `role_as`, `created_at`) VALUES
(1, 'keshvi', 'Gami', 'keshvi123@gmail.com', '1234', 0, 2147483647),
(2, 'Vasu', 'Gami', 'vasu12@gmail.com', '1234', 0, 2147483647),
(3, 'priya', 'sudani', 'priya123@gmail.com', '1234', 1, 2147483647),
(5, 'Divyand', 'Man', 'divyand@gmail.com', '12345', 0, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`) VALUES
(1, 1, 2, '2025-04-11 12:54:20'),
(3, 1, 8, '2025-04-11 13:01:54'),
(4, 1, 21, '2025-04-12 03:33:18'),
(6, 1, 15, '2025-04-12 03:49:11'),
(7, 1, 22, '2025-04-12 03:53:19'),
(8, 5, 6, '2025-04-12 06:03:06'),
(9, 5, 7, '2025-04-12 06:03:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
--
-- Database: `oop_project`
--
CREATE DATABASE IF NOT EXISTS `oop_project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `oop_project`;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `course` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fullname`, `email`, `phone`, `course`) VALUES
(1, 'Vasu', 'vasu@gmail.com', '6789012567', 'BCA'),
(4, 'Priya', 'priya@gmail.com', '9809876123', 'BCA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_as` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0-user,1-admin,2-superadmin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `email`, `password`, `role_as`, `created_at`) VALUES
(1, 'Keshvi', 'Gami', 'keshvi123@gmail.com', '12345', 0, '2025-04-07 08:56:49'),
(2, 'Admin', 'Man', 'admin@gmail.com', '123', 1, '2025-04-07 12:19:53'),
(5, 'Divyand', 'Patel', 'divyand@gmail.com', '12345', 0, '2025-04-08 06:52:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `phpchatapp_db`
--
CREATE DATABASE IF NOT EXISTS `phpchatapp_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpchatapp_db`;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` varchar(255) DEFAULT NULL,
  `outgoing_msg_id` varchar(255) DEFAULT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `edited` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`, `edited`) VALUES
(1, '902025301', '954452262', 'hyy', 0),
(2, '486420429', '954452262', 'hello manan', 0),
(3, '954452262', '1450073472', 'hyyy', 0),
(4, '1450073472', '1210237215', 'Good morning', 0),
(5, '1450073472', '1210237215', 'good morning', 0),
(6, '486420429', '954452262', 'hy', 0),
(7, '954452262', '486420429', 'hyy rina', 0),
(8, '486420429', '954452262', 'how are you ?', 0),
(9, '954452262', '486420429', 'fine', 0),
(10, '954452262', '486420429', 'nd you', 0),
(11, '1450073472', '954452262', 'hyy', 0),
(12, '1210237215', '1450073472', 'Good morning', 0),
(13, '954452262', '1450073472', 'how are you', 0),
(14, '902025301', '954452262', 'hello', 0),
(15, '632416618', '1450073472', 'hyy', 0),
(16, '954452262', '1210237215', 'hyy', 0),
(17, '1210237215', '954452262', 'hyy', 0),
(18, '902025301', '954452262', 'hyy', 0),
(19, '954452262', '902025301', 'hyy', 0),
(20, '486420429', '632416618', 'hyy', 0),
(21, '632416618', '486420429', 'yhy', 0),
(22, '632416618', '486420429', 'ffgfgf', 0),
(23, '486420429', '632416618', 'fvdg', 0),
(24, '902025301', '486420429', 'hyyy', 0),
(25, '486420429', '902025301', 'heelo', 0),
(26, '902025301', '486420429', 'hyy', 0),
(27, '486420429', '902025301', 'heelo', 0),
(28, '902025301', '486420429', 'hyy', 0),
(29, '486420429', '902025301', 'heelo', 0),
(30, '486420429', '902025301', 'hello', 0),
(31, '902025301', '486420429', 'fgdfgh', 0),
(32, '486420429', '902025301', 'vfhfsgh', 0),
(33, '1450073472', '486420429', 'hyy', 0),
(36, '486420429', '1450073472', 'hyyy', 0),
(38, '1450073472', '486420429', 'fdtdgt', 0),
(42, '1450073472', '902025301', 'hello', 0),
(46, '636372808', '446295075', 'Good morning', 0),
(47, '446295075', '636372808', 'Good morning', 0),
(48, '1450073472', '446295075', 'hyy', 0),
(49, '446295075', '1450073472', 'hyy', 0),
(50, '1210237215', '1450073472', 'ff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL COMMENT 'Offline Now,Online'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `img`, `status`) VALUES
(1, '1450073472', 'Keshvi', 'Gami', 'keshvi123@gmail.com', '$2y$10$OKNIJov1ccHHV.fJfGCEfOjHg1VQHy0v2zSPfxSkdLyYL/xdk/BHa', '1744949840profile4.webp', 'Offline now'),
(2, '954452262', 'Rina ', 'Patel', 'rinap17@gmail.com', '$2y$10$oT5pygvpiTuvdB3BBQB4auWqWVa0KyN3x5y.l0qnXOy2YSFBQKx/u', '1744950801profile5.png', 'Offline now'),
(3, '902025301', 'Ram', 'Patel', 'ram23@gmail.com', '$2y$10$KWEY5w/4vXwpAzHXeVUnl./tDo87A3e23IH0IjbQL1cs35Wzo19q6', '1744953264user2.png', 'Online'),
(4, '486420429', 'Manan', 'Ghevriya', 'manan10@gmail.com', '$2y$10$e2mL2L1nDT9aLJfzRrRSu.wywlmSRiQXph8MEfOsHbzQCSfXz9sCq', '1744959339user1.jpg', 'Offline now'),
(5, '1210237215', 'Mihir ', 'Virani', 'mihir12@gmail.com', '$2y$10$7521X4zyJS41hr/S342SeezuuzKI.ohaIj/VEmXUzIQSQuEIWvDt6', '1744959511profile2.jpg', 'Offline now'),
(6, '632416618', 'test', 'demo', 'test12@gmail.com', '$2y$10$BRnxTJ8vQXsp1PTqkwx.RO18zqoNDTtxKr2c0P2xhuB8tdUK.xS.m', '1744959606profile3.png', 'Offline now'),
(7, '446295075', 'roshni', 'patel', 'roshni@gmail.com', '$2y$10$2fnpmnr1dhOvj4eYp.f6qucDjrnkw14tgBI2PnZA8c6O3VmZS19na', '1746598638profile1.webp', 'Offline now'),
(8, '636372808', 'mohit', 'patel', 'mohit123@gmail.com', '$2y$10$.daDS1UmDcW0x5BnjMA4H.WX7j24VO7oProusraR3elfTW.XbdDte', '1746598680profile2.jpg', 'Offline now');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ck_custom\",\"table\":\"categories\"},{\"db\":\"ck_custom\",\"table\":\"blogs\"},{\"db\":\"crudop\",\"table\":\"crud\"},{\"db\":\"cake_jwt\",\"table\":\"categories\"},{\"db\":\"cake_jwt\",\"table\":\"users\"},{\"db\":\"ck_custom\",\"table\":\"customers\"},{\"db\":\"ck_custom\",\"table\":\"posts\"},{\"db\":\"ck_custom\",\"table\":\"products\"},{\"db\":\"ck_token\",\"table\":\"users\"},{\"db\":\"ck_avg\",\"table\":\"ratings\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-05-31 03:39:56', '{\"Console\\/Mode\":\"show\",\"NavigationWidth\":253,\"Console\\/Height\":-28.00494}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `pictogram`
--
CREATE DATABASE IF NOT EXISTS `pictogram` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pictogram`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `block_list`
--

CREATE TABLE `block_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blocked_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(1, 8, 1, 'Finding beauty in every petal. 🌸', '2025-04-04 06:17:51'),
(2, 8, 2, 'Beautiful!', '2025-04-04 06:18:36'),
(3, 11, 2, 'Nature\'s beauty!', '2025-04-04 06:19:46'),
(4, 9, 1, 'Nature\'s beauty!', '2025-04-04 06:20:19'),
(5, 7, 3, ' I need more! 😋', '2025-04-04 06:21:51'),
(7, 5, 5, ' don’t ever change!', '2025-04-04 06:23:03'),
(8, 6, 5, 'Picture perfect! 📸', '2025-04-04 06:23:48'),
(9, 10, 4, 'So elegant! 🌺', '2025-04-04 06:24:12'),
(10, 11, 1, 'Such a natural beauty.', '2025-04-04 06:26:44'),
(12, 2, 1, 'Looks delicious!', '2025-04-04 06:33:46'),
(16, 9, 6, 'wow...', '2025-04-04 06:48:17'),
(17, 8, 6, 'Love it!', '2025-04-04 06:56:02'),
(19, 1, 6, 'keep up the great work!', '2025-04-04 06:58:59'),
(20, 7, 6, 'Looks delicious!', '2025-04-04 07:03:34'),
(21, 7, 4, 'So testy..!', '2025-04-04 09:09:41'),
(24, 8, 1, 'woww', '2025-04-25 04:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `follow_list`
--

CREATE TABLE `follow_list` (
  `id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `follow_list`
--

INSERT INTO `follow_list` (`id`, `follower_id`, `user_id`) VALUES
(7, 4, 1),
(10, 4, 2),
(13, 3, 2),
(15, 4, 3),
(17, 5, 3),
(18, 5, 4),
(19, 6, 2),
(20, 6, 1),
(21, 1, 3),
(23, 1, 6),
(24, 5, 1),
(26, 1, 2),
(27, 1, 4),
(28, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`) VALUES
(9, 6, 2),
(18, 2, 1),
(19, 6, 1),
(20, 7, 1),
(21, 8, 2),
(22, 7, 2),
(24, 10, 3),
(25, 8, 4),
(26, 9, 4),
(27, 6, 5),
(28, 11, 5),
(30, 9, 1),
(31, 9, 6),
(32, 8, 6),
(33, 1, 6),
(35, 5, 1),
(36, 11, 1),
(37, 7, 4),
(38, 12, 6),
(39, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `msg`, `read_status`, `created_at`) VALUES
(1, 6, 5, 'this is test message', 0, '2025-04-04 10:39:34'),
(2, 4, 3, 'hyyy', 0, '2025-04-04 11:07:06'),
(3, 1, 2, 'hy', 1, '2025-04-04 11:36:00'),
(4, 2, 1, 'hyyy', 1, '2025-04-04 11:47:21'),
(5, 1, 2, 'how are you', 1, '2025-04-04 11:49:20'),
(6, 2, 1, 'fine', 1, '2025-04-04 11:49:43'),
(7, 2, 1, 'and you', 1, '2025-04-04 11:49:53'),
(8, 1, 2, 'I am also fine', 1, '2025-04-04 11:50:05'),
(9, 6, 2, 'hyy krisha', 1, '2025-04-04 12:23:06'),
(10, 2, 6, 'hyy mihir', 1, '2025-04-04 12:23:51'),
(11, 6, 2, 'how are you', 1, '2025-04-04 12:24:29'),
(12, 2, 6, 'i m fineeeeeeeeee', 1, '2025-04-04 12:24:38'),
(13, 6, 2, '????????????????????????????Nd you', 1, '2025-04-04 12:24:47'),
(14, 1, 4, 'hyy', 1, '2025-04-25 04:13:13'),
(15, 4, 1, 'hyy', 1, '2025-04-25 04:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_user_id` int(11) NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT 0,
  `post_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `to_user_id`, `message`, `created_at`, `from_user_id`, `read_status`, `post_id`) VALUES
(1, 3, 'liked your post !', '2025-04-04 09:04:04', 1, 0, '5'),
(2, 4, 'unliked your post !', '2025-04-04 09:05:33', 1, 1, '11'),
(3, 4, 'liked your post !', '2025-04-04 09:05:35', 1, 1, '11'),
(4, 1, 'blocked you', '2025-04-04 09:07:18', 2, 1, '0'),
(5, 1, 'Unblocked you !', '2025-04-04 09:08:31', 2, 1, '0'),
(6, 1, 'started following you !', '2025-04-04 09:08:34', 2, 1, '0'),
(7, 1, 'liked your post !', '2025-04-04 09:09:07', 4, 1, '7'),
(8, 1, 'commented on your post', '2025-04-04 09:09:41', 4, 1, '7'),
(9, 1, 'Unfollowed you !', '2025-04-04 09:11:17', 3, 1, '0'),
(10, 6, 'started following you !', '2025-04-04 09:25:16', 1, 1, '0'),
(11, 1, 'liked your post !', '2025-04-04 09:33:19', 6, 1, '12'),
(12, 1, 'commented on your post', '2025-04-04 09:34:09', 6, 1, '12'),
(13, 1, 'liked your post !', '2025-04-04 09:34:24', 6, 1, '7'),
(14, 1, 'started following you !', '2025-04-04 09:36:55', 5, 1, '0'),
(15, 1, 'commented on your post', '2025-04-04 09:37:27', 5, 1, '13'),
(16, 4, 'Unfollowed you !', '2025-04-22 10:14:16', 2, 1, '0'),
(17, 1, 'blocked you', '2025-04-22 10:14:27', 2, 1, '0'),
(18, 1, 'Unblocked you !', '2025-04-22 10:14:32', 2, 1, '0'),
(19, 3, 'liked your post !', '2025-04-25 04:10:10', 1, 0, '10'),
(20, 3, 'unliked your post !', '2025-04-25 04:10:20', 1, 0, '10'),
(21, 3, 'liked your post !', '2025-04-25 04:10:26', 1, 0, '10'),
(22, 3, 'unliked your post !', '2025-04-25 04:10:39', 1, 0, '10'),
(23, 4, 'Unfollowed you !', '2025-04-25 04:10:56', 1, 1, '0'),
(24, 2, 'started following you !', '2025-04-25 06:50:20', 1, 0, '0'),
(25, 2, 'Unfollowed you !', '2025-04-25 06:50:54', 1, 0, '0'),
(26, 2, 'started following you !', '2025-04-25 06:52:15', 1, 0, '0'),
(27, 4, 'started following you !', '2025-04-25 06:52:16', 1, 0, '0'),
(28, 5, 'started following you !', '2025-04-25 06:52:17', 1, 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_img` text NOT NULL,
  `post_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_img`, `post_text`, `created_at`) VALUES
(2, 2, '1743575893apple.jpeg', '', '2025-04-02 06:38:13'),
(5, 3, '1743579089book2.jpeg', ' Modern books are typically in codex format, composed of many pages bound together and protected by a cover. ', '2025-04-02 07:31:29'),
(6, 4, '1743587493nature.webp', 'Nature can refer to the general realm of living beings, and in some cases to the processes associated with inanimate objects', '2025-04-02 09:51:33'),
(7, 1, '1743739310post6.jpeg', 'Food is usually of plant, animal, or fungal origin and contains essential nutrients such as carbohydrates, fats, proteins, vitamins, or minerals.', '2025-04-04 04:01:50'),
(8, 1, '1743739472post7.webp', 'A flower, also known as a bloom or blossom, is the reproductive structure found in flowering plants', '2025-04-04 04:04:32'),
(9, 2, '1743739612post8.jpeg', 'A mountain is an elevated portion of the Earth\'s crust, generally with steep sides that show significant exposed bedrock', '2025-04-04 04:06:52'),
(10, 3, '1743739661post9.webp', '', '2025-04-04 04:07:41'),
(11, 4, '1743739808post10].jpeg', 'Garden ... For other uses, see Garden (disambiguation). A garden is a planned space, usually outdoors, set aside for the cultivation, display.', '2025-04-04 04:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `profile_pic` text NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `ac_status` int(11) NOT NULL COMMENT '0=not verified,1=active,2=blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `email`, `username`, `password`, `profile_pic`, `created_at`, `updated_at`, `ac_status`) VALUES
(1, 'Keshvi', 'Gami', 2, 'keshvigami1@gmail.com', 'k_s_v2194', '81dc9bdb52d04dc20036dbd8313ed055', '1743568261profile.webp', '2025-03-27 11:40:58', '2025-05-03 07:12:24', 1),
(2, 'krisha', 'Patel', 2, 'keshvi.g@queueloopsolutions.com', 'krisha', '81dc9bdb52d04dc20036dbd8313ed055', '1743576144profile3.jpg', '2025-03-27 11:44:09', '2025-04-21 12:33:45', 1),
(3, 'Bhavisha', 'Sharma', 2, 'bhavisha.queueloop@gmail.com', 'Bhavisha', '81dc9bdb52d04dc20036dbd8313ed055', '1743579037profile4.jpg', '2025-03-28 08:38:30', '2025-04-02 07:31:54', 1),
(4, 'Isha', 'Jasoliya', 2, 'ishajasoliya227@gmail.com', 'isha', '81dc9bdb52d04dc20036dbd8313ed055', '1743587295profile5.jpg', '2025-04-02 09:46:06', '2025-04-05 04:49:22', 1),
(5, 'vasu', 'Vaghela', 1, 'vasu12@gmail.com', 'vasu', '81dc9bdb52d04dc20036dbd8313ed055', '1743594937profile7.jpg', '2025-04-02 11:48:20', '2025-04-05 04:58:43', 2),
(6, 'Mihir', 'Virani', 1, 'mihirv11@gmail.com', 'Mihir', '81dc9bdb52d04dc20036dbd8313ed055', '1743749261profile8.jpg', '2025-04-04 06:47:08', '2025-04-05 05:00:01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block_list`
--
ALTER TABLE `block_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `follow_list`
--
ALTER TABLE `follow_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `block_list`
--
ALTER TABLE `block_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `follow_list`
--
ALTER TABLE `follow_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `products_db`
--
CREATE DATABASE IF NOT EXISTS `products_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `products_db`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Product A', 'Description for product A', 19.99, 'product_a.jpg'),
(3, 'Product C', 'Description for product C', 9.99, 'product_c.jpg'),
(6, 'Product 1', 'Description for product 1', 3.90, 'acc-01.webp'),
(7, 'Product 3', 'Description for product 3', 5.56, 'explore-image-01.jpg'),
(16, 'Product B', 'Description for product B', 9.56, 'acc-06.webp'),
(17, 'Product 2', 'Description for product 2', 3.90, 'acc-05.webp');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'John Doe', 'john@example.com', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
--
-- Database: `shopping_db`
--
CREATE DATABASE IF NOT EXISTS `shopping_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shopping_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `com_logo` varchar(100) DEFAULT NULL,
  `com_name` varchar(100) NOT NULL,
  `com_email` varchar(60) NOT NULL,
  `com_phone` varchar(15) DEFAULT NULL,
  `com_address` varchar(255) DEFAULT NULL,
  `cur_format` varchar(10) NOT NULL,
  `admin_role` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `username`, `password`, `com_logo`, `com_name`, `com_email`, `com_phone`, `com_address`, `cur_format`, `admin_role`) VALUES
(1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'Inventory', 'inventory@gmail.com', NULL, NULL, '$', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` text NOT NULL,
  `brand_cat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`, `brand_cat`) VALUES
(13, 'Realme', 9),
(12, 'Lenovo', 9),
(11, 'LG', 9),
(10, 'Samsung', 9);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL,
  `products` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `products`) VALUES
(9, 'Electronics', 0),
(10, 'Men', 0),
(11, 'Women', 0),
(12, 'Furniture', 0);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `s_no` int(11) NOT NULL,
  `site_name` varchar(100) NOT NULL,
  `site_title` varchar(100) DEFAULT NULL,
  `site_logo` varchar(100) NOT NULL,
  `site_desc` varchar(255) DEFAULT NULL,
  `footer_text` varchar(100) NOT NULL,
  `currency_format` varchar(20) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`s_no`, `site_name`, `site_title`, `site_logo`, `site_desc`, `footer_text`, `currency_format`, `contact_phone`, `contact_email`, `contact_address`) VALUES
(1, 'Super Market', 'Online Shopping Project for Mobiles, Clothes, Electronics and many more....', '1607398563shopping-logo.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequuntur, perspiciatis quia repudiandae sapiente sed sunt.', 'Copyright 2020', 'Rs.', '9876541230', 'email@email1.com', '#123, Lorem Ipsum');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  `product_qty` varchar(100) NOT NULL,
  `total_amount` varchar(10) NOT NULL,
  `product_user` int(11) NOT NULL,
  `order_date` varchar(11) NOT NULL,
  `pay_req_id` varchar(100) DEFAULT NULL,
  `confirm` tinyint(4) NOT NULL DEFAULT 0,
  `delivery` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_id`, `product_id`, `product_qty`, `total_amount`, `product_user`, `order_date`, `pay_req_id`, `confirm`, `delivery`) VALUES
(19, '12', '1', '299', 2, '2020-11-17', 'd7a5b179cd07480782fc2d21edec7031', 1, 1),
(18, '12', '1', '299', 2, '2020-11-17', '4e2738d7eade4f57b5fd32434239d35f', 1, 0),
(17, '11', '1', '759', 2, '2020-11-12', 'd388939cdaca4087acca75574a34b035', 1, 0),
(20, '12', '1', '299', 2, '2020-11-17', 'a0f61b1acd6b444ba5856cc4387e7710', 0, 0),
(21, '12', '2', '598', 2, '2020-11-17', '0e2fdf1541994d338c676201097d2481', 1, 0),
(22, '12', '1', '299', 2, '2020-11-17', '8b0791e3eb764e45b497b0f0c401d9d6', 1, 0),
(23, '12', '1', '299', 2, '2020-11-17', '92c9c474ae864d01b81f7e2f4d3a098e', 1, 0),
(27, '11', '1', '759', 2, '2020-11-17', '6863fbdf68be45d5a77aa01774a80885', 1, 0),
(28, '11', '1', '759', 2, '2020-11-17', 'ee7d6cea937c4f06b6e5e1fffe47b778', 1, 1),
(29, '12', '1', '299', 2, '2020-11-17', 'f7ce91d5964c462fa3972f6cb5373d4a', 0, 1),
(30, '11', '2', '1518', 2, '2020-11-30', '939d866425ef479c84e276e664ce5a31', 0, 0),
(38, '11,12,', '1,1,', '1058', 2, '2020-12-01', '2c648ec714914c18b447309d691b7eef', 0, 0),
(37, '4,12,', '2,1,', '94279', 4, '2020-12-01', 'd19818d2ba3543ffa03a79a7eb64901b', 0, 0),
(36, '10,11,12,', '1,1,1,', '1342', 4, '2020-12-01', 'df952fa6bacd4f389de80b1080ed3871', 0, 1),
(39, '11,12,', '1,1,', '1058', 2, '2020-12-01', '700bf310ca4a4697b59184f61309275a', 0, 0),
(40, '11,12,', '1,1,', '1058', 2, '2020-12-01', '639ccfba60cd41eeba02ba5ff1849249', 0, 0),
(41, '11,12,', '1,1,', '1058', 2, '2020-12-01', '792c6616026948e48a2fcc07eb35c158', 0, 0),
(42, '11,12,', '1,1,', '1058', 2, '2020-12-02', '153427404661463f83a5e8bd080a95e9', 0, 0),
(43, '11,12,', '1,1,', '1058', 2, '2020-12-02', '37473185580340ab8c54d102204c7bf9', 0, 0),
(44, '11,12,', '1,1,', '1058', 2, '2020-12-02', '2bb8d2ccf3544d0089d211abf4d55e36', 0, 1),
(45, '12,13,', '1,1,', '1532', 2, '2020-12-02', '63148f0e7b7043f5a5e470a9ac1d3dde', 0, 1),
(46, '12,', '1,', '299', 2, '2020-12-04', '3c209af45445486c8aefb6cfb55dcbb7', 0, 1),
(47, '11,', '1,', '759', 2, '2025-03-08', '', 0, 0),
(48, '11,', '1,', '759', 2, '2025-03-08', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `item_number` varchar(50) NOT NULL,
  `txn_id` varchar(50) NOT NULL,
  `payment_gross` float(10,2) NOT NULL,
  `currency_code` varchar(5) NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `item_number`, `txn_id`, `payment_gross`, `currency_code`, `payment_status`) VALUES
(5, '11', 'd388939cdaca4087acca75574a34b035', 759.00, '', 'credit'),
(6, '12', '4e2738d7eade4f57b5fd32434239d35f', 299.00, '', 'credit'),
(7, '12', 'd7a5b179cd07480782fc2d21edec7031', 299.00, '', 'credit'),
(8, '12', 'a0f61b1acd6b444ba5856cc4387e7710', 299.00, '', 'pending'),
(9, '12', '0e2fdf1541994d338c676201097d2481', 598.00, '', 'credit'),
(10, '12', '8b0791e3eb764e45b497b0f0c401d9d6', 299.00, '', 'credit'),
(11, '12', '92c9c474ae864d01b81f7e2f4d3a098e', 299.00, '', 'credit'),
(20, '11', '6863fbdf68be45d5a77aa01774a80885', 759.00, '', 'credit'),
(21, '11', 'ee7d6cea937c4f06b6e5e1fffe47b778', 759.00, '', 'credit'),
(22, '12', 'f7ce91d5964c462fa3972f6cb5373d4a', 299.00, '', 'credit'),
(23, '11', '939d866425ef479c84e276e664ce5a31', 1518.00, '', 'credit'),
(29, '10,11,12,', 'df952fa6bacd4f389de80b1080ed3871', 1342.00, '', 'credit'),
(30, '4,12,', 'd19818d2ba3543ffa03a79a7eb64901b', 94279.00, '', 'credit'),
(31, '11,12,', '2c648ec714914c18b447309d691b7eef', 1058.00, '', 'credit'),
(32, '11,12,', '700bf310ca4a4697b59184f61309275a', 1058.00, '', 'credit'),
(33, '11,12,', '639ccfba60cd41eeba02ba5ff1849249', 1058.00, '', 'credit'),
(34, '11,12,', '792c6616026948e48a2fcc07eb35c158', 1058.00, '', 'credit'),
(35, '11,12,', '153427404661463f83a5e8bd080a95e9', 1058.00, '', 'credit'),
(36, '11,12,', '37473185580340ab8c54d102204c7bf9', 1058.00, '', 'credit'),
(37, '11,12,', '2bb8d2ccf3544d0089d211abf4d55e36', 1058.00, '', 'credit'),
(38, '12,13,', '63148f0e7b7043f5a5e470a9ac1d3dde', 1532.00, '', 'credit'),
(39, '12,', '3c209af45445486c8aefb6cfb55dcbb7', 299.00, '', 'credit'),
(40, '11,', '', 759.00, '', 'credit'),
(41, '11,', '', 759.00, '', 'credit');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_sub_cat` int(11) NOT NULL,
  `product_brand` int(100) DEFAULT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `product_desc` text NOT NULL,
  `featured_image` text NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  `product_keywords` text DEFAULT NULL,
  `product_views` int(11) DEFAULT 0,
  `product_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_code`, `product_cat`, `product_sub_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `featured_image`, `qty`, `product_keywords`, `product_views`, `product_status`) VALUES
(2, '5fc500f4330ad', 9, 18, 10, 'Samsung Galaxy A20s (Blue, 32 GB)  (3 GB RAM)', '12900', '3 GB RAM | 32 GB ROM | Expandable Upto 512 GB\r\n16.51 cm (6.5 inch) HD+ Display\r\n13MP + 8MP + 5MP | 8MP Front Camera\r\n4000 mAh Lithium Ion Battery\r\nQualcomm SDM450-B01 Processor', '1598962160galaxy-a20s.jpeg', 0, NULL, 1, 1),
(3, '5fc500ec98a64', 9, 18, 13, 'Realme C3 (Volcano Grey, 32 GB)  (3 GB RAM)', '8999', '3 GB RAM | 32 GB ROM | Expandable Upto 256 GB\r\n16.56 cm (6.52 inch) HD+ Display\r\n12MP + 2MP | 5MP Front Camera\r\n5000 mAh Battery\r\nHelio G70 Processor', '1598962665realme-c3.jpeg', 1, NULL, 31, 1),
(4, '5fc500e4de9c2', 9, 19, 12, 'Lenovo Ideapad Flex 5 Core i3 10th Gen - (4 GB/256 GB SSD/Windows 10 Home) 14IIL05 2 in 1 Laptop  (14 inch, Graphite Grey, 1.5 kg, With MS Office)', '46990', 'Carry It Along 2 in 1 Laptop\r\n14 inch Full HD LED Backlit Glossy IPS Touch Display (16:9 Aspect Ratio, 250 nits Brightness, Stylus Support)\r\nLight Laptop without Optical Disk Drive\r\n\r\nShipping charges are calculated based on the number of units, distance and delivery date.\r\nFor Plus customers, shipping charges are free.\r\nFor non-Plus customers, if the total value of FAssured items is more than Rs.500, shipping charges are free. If the total value of FAssured items is less than Rs.500, shipping charges = Rs.40 per unit\r\n* For faster delivery, shipping charges will be applicable.', '1598962854lenovo.jpeg', 1, NULL, 10, 1),
(5, '5fc500decacd2', 9, 19, 12, 'Lenovo Ideapad 3 Core i3 10th Gen - (4 GB/1 TB HDD/DOS) 14IIL05 Thin and Light Laptop  (14 inch, Platinum Grey, 1.6 kg)', '32095', 'Stylish &amp; Portable Thin and Light Laptop\r\n14 inch HD LED Backlit Anti-glare TN Display (220 nits Brightness)\r\nLight Laptop without Optical Disk Drive', '1598963006lenovo-2.jpeg', 1, NULL, 1, 1),
(6, '5fc500d9502a7', 12, 25, 0, 'Flipkart Perfect Homes Iris Therapedic 6 inch King Bonnell Spring Mattress', '11090', 'Length: 78 inch, Width: 72 inch, Thickness: 6 inch (6 ft 6 in x 6 ft x 6 in)\r\nSupport Type: Bonnell Spring\r\nComfort Layer: PU Foam\r\nMattress Features: Orthopedic Mattress, Zero Partner Disturbance, Sag Resistant Mattress', '1598963093queen-10.jpeg', 1, NULL, 1, 1),
(7, '5fc500d3ae088', 12, 25, 0, 'Peps Springkoil Normal Top Blue 6 inch Double Bonnell Spring Mattress', '10540', 'Length: 72 inch, Width: 48 inch, Thickness: 6 inch (6 ft x 4 ft x 6 in)\r\nSupport Type: Bonnell Spring\r\nComfort Layer: PU Foam\r\nMattress Features: Reversible Mattress', '1598963343double-10.jpeg', 1, NULL, 4, 1),
(8, '5fc500cd9a2c4', 12, 24, 0, 'Delite Kom Riley Engineered Wood Bedside Table  (Finish Color - Acacia Dark)', '2750', 'Rectangular\r\nWidth x Height: 44.958 x 39.878 cm (1 ft 5 in x 1 ft 3 in)\r\nSuitable For: Bedroom Furniture, Living Room\r\nStorage Included\r\nDIY - Basic assembly to be done with simple tools by the customer, comes with instructions', '1598963469particle-board.jpeg', 1, NULL, 0, 1),
(9, '5fc500c7c7bef', 10, 26, 0, 'Abstract Men Hooded Neck Dark Blue T-Shirt', '359', '10% Instant Discount on Bank Of Baroda Credit Cards\r\n10% Instant Discount on Federal Bank Debit Cards', '1598963616s-tnvhdf.jpeg', 1, NULL, 2, 1),
(10, '5fc500c285db4', 10, 26, 0, 'Printed Men Round Neck Yellow T-Shirt', '284', 'Get extra 5.0% off (price inclusive of discount)\r\n10% Instant Discount on Federal Bank Debit Cards\r\n10% Instant Discount on Bank Of Baroda Credit Cards', '1598963703xl-newyork.jpeg', 1, NULL, 0, 1),
(11, '5fc500bc5d3e3', 11, 27, 0, 'Women Printed Pure Cotton A-line Kurta  (White, Blue, Pink)', '759', '10% Instant Discount on Federal Bank Debit Cards\r\n10% Instant Discount on Bank Of Baroda Credit Cards\r\n5% Unlimited Cashback on Flipkart Axis Bank Credit Card', '1598963806xxl-md377.jpeg', 3, NULL, 18, 1),
(12, '5fc500b5570aa', 11, 28, 0, 'Polka Print Bhagalpuri Cotton Blend Saree  (Blue)', '299', 'Special Price  Get extra 10.0% off (price inclusive of discount)\r\nBank Offer10% Instant Discount on Federal Bank Debit Cards', '1598963976free-kora.jpeg', 12, NULL, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cart`
--

CREATE TABLE `product_cart` (
  `s_no` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `sub_cat_id` int(11) NOT NULL,
  `sub_cat_title` varchar(100) NOT NULL,
  `cat_parent` int(11) NOT NULL,
  `cat_products` int(11) NOT NULL DEFAULT 0,
  `show_in_header` tinyint(4) NOT NULL DEFAULT 1,
  `show_in_footer` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`sub_cat_id`, `sub_cat_title`, `cat_parent`, `cat_products`, `show_in_header`, `show_in_footer`) VALUES
(19, 'Laptops', 9, 2, 1, 0),
(21, 'Camera', 9, 0, 1, 0),
(20, 'Speakers', 9, 0, 1, 0),
(18, 'Mobiles', 9, 2, 1, 1),
(22, 'Kitchen', 12, 0, 1, 0),
(23, 'Tableware', 12, 0, 0, 1),
(24, 'Living Room', 12, 1, 0, 1),
(25, 'Beds', 12, 2, 1, 1),
(26, 'Men\'s T-Shirts', 10, 2, 1, 1),
(27, 'Kurti\'s', 11, 1, 1, 1),
(28, 'Sarees', 11, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `city` text NOT NULL,
  `user_role` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `f_name`, `l_name`, `username`, `email`, `password`, `mobile`, `address`, `city`, `user_role`) VALUES
(2, 'user12', 'user', 'user@gmail.com', '', '24c9e15e52afc47c225b757e7bee1f9d', '9856231042', '#1234', 'delhi', 1),
(3, 'user2', 'user last', 'user2@gmail.com', '', '7e58d63b60197ceb55a1c487989a3720', '9999999999', '#kdjfg s gfd gdfjgkdsf gsdfkgjk', 'Delhi', 1),
(4, 'user3', 'user last', 'user3@gmail.com', '', '92877af70a45fd6a2ed7fe81e1236b78', '9999999999', '#hsd sdfsd fs df asdf', 'dsf asdf a', 1),
(5, 'user testing', 'user last', 'user4@gmail.com', '', '3f02ebe3d7929b091e3d8ccfde2f3bc6', '999999999', '#dsjg sdf sd f', 'dskfs f aslkf', 1),
(6, 'sadsadsa', 'sdsadsa', 'hh@gmail.com', '', '5e36941b3d856737e81516acd45edc50', '999999999', 'dsfsd fs', 'sdf a', 1),
(7, 'dsf sdfsd safasd', 'sdd fsdfsadf', 'user5@gmail.com', '', '0a791842f52a0acfbb3a783378c066b8', '9999999999', 'dsf adfasd', 'dsafsadf', 1),
(8, 'dsf sdfsd safasd', 'sdd fsdfsadf', 'user51@gmail.com', '', '0a791842f52a0acfbb3a783378c066b8', '9999999999', 'dsf adfasd', 'dsafsadf', 1),
(9, 'dsf sdfsd safasd', 'sdd fsdfsadf', 'user51s@gmail.com', '', '0a791842f52a0acfbb3a783378c066b8', '9999999999', 'dsf adfasd', 'dsafsadf', 1),
(10, 'sfnsdfbsd', 'sdfasdfsa', 'useryusdfnds@gmail.com', '', 'ba407c68e2448c005ee7459f89dd3e63', '9999999999', '#d dsfh', 'dsfdsf', 1),
(11, 's ds ad', 'sad sad', 'rti@gmail.com', '', '620dc68bbfc5d7654e44817a8d3b2cdf', '9999999999', '#fg', 'adsad', 1),
(12, 's ds ad', 'sad sad', 'rtis@gmail.com', '', '620dc68bbfc5d7654e44817a8d3b2cdf', '9999999999', '#fg', 'adsad', 1),
(13, 's ds ad', 'sad sad', 'rtisf@gmail.com', '', '620dc68bbfc5d7654e44817a8d3b2cdf', '9999999999', '#fg', 'adsad', 1),
(14, 'final user', 'user last', 'userf@gmail.com', '', 'add5092c13fbcc5cceaf1fdb98411871', '9999999999', 'lcnsd', 'dsfs df', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_cart`
--
ALTER TABLE `product_cart`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`sub_cat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_cart`
--
ALTER TABLE `product_cart`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `sub_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Database: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `store`;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `product_id` int(11) UNSIGNED DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) UNSIGNED DEFAULT 1,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `price`, `quantity`, `created`, `modified`, `status`) VALUES
(1, 1, 1, 200, 1, '2016-01-02 04:52:00', '2016-01-02 04:52:00', 1),
(2, 1, 2, 180, 1, '2016-01-02 04:52:00', '2016-01-02 04:52:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created`, `modified`, `status`) VALUES
(1, 'Category 1', 'sdfsaf', '2015-12-31 07:13:00', '2015-12-31 07:13:00', 1),
(2, 'Category 2', '', '2015-12-31 07:19:50', '2015-12-31 07:19:50', 1),
(3, 'Category 3', '', '2015-12-31 07:20:14', '2015-12-31 07:20:14', 1),
(4, 'Category 4', '', '2015-12-31 07:23:19', '2015-12-31 07:23:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `product_id`, `amount`, `start_at`, `end_at`, `created`, `modified`, `status`) VALUES
(1, 1, 25, '2015-12-31 07:38:43', '2016-12-20 07:38:43', '2015-12-31 07:38:43', '2015-12-31 07:38:43', 1),
(2, 1, 20, '2016-01-31 07:38:43', '2016-12-31 07:38:43', '2015-12-31 07:38:43', '2015-12-31 07:38:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `receiver_address` text DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `zip` int(11) UNSIGNED NOT NULL,
  `state` varchar(64) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `content` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(11) UNSIGNED DEFAULT NULL,
  `sku` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `model` varchar(64) NOT NULL,
  `description` text DEFAULT NULL,
  `buy_price` double UNSIGNED DEFAULT NULL,
  `sell_price` double UNSIGNED DEFAULT NULL,
  `units_in_stock` int(11) NOT NULL DEFAULT 0,
  `size` varchar(64) DEFAULT NULL,
  `color` varchar(64) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `sku`, `name`, `model`, `description`, `buy_price`, `sell_price`, `units_in_stock`, `size`, `color`, `weight`, `rating`, `thumb`, `created`, `modified`, `status`) VALUES
(1, 1, 1, 'MPR01', 'Product 1', 'Model 01', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 200, 5, 'XS', 'Blue', 1, NULL, 'products/dress1home.jpg', '2015-12-31 07:38:43', '2015-12-31 07:38:43', 1),
(2, 1, 2, '', 'Product 2', 'Model 02', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 180, 0, '', '', 0, NULL, 'products/dress2home.jpg', '2015-12-31 07:39:33', '2015-12-31 07:39:33', 1),
(3, 3, 8, '', 'Product 3', 'Model 03', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 150, 0, '', '', 0, NULL, 'products/dress3home.jpg', '2015-12-31 07:40:21', '2015-12-31 07:40:21', 1),
(4, 1, 1, '', 'Product 4', 'Model 04', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 190, 0, '', '', 0, NULL, 'products/dress4home.jpg', '2015-12-31 07:38:43', '2015-12-31 07:38:43', 1),
(5, 1, 2, '', 'Product 5', 'Model 05', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 200, 0, '', '', 0, NULL, 'products/dress5home.jpg', '2015-12-31 07:39:33', '2015-12-31 07:39:33', 1),
(6, 3, 8, '', 'Product 6', 'Model 06', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 210, 0, '', '', 0, NULL, 'products/dress6home.jpg', '2015-12-31 07:40:21', '2015-12-31 07:40:21', 1),
(7, 1, 1, '', 'Product 7', 'Model 07', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 120, 0, '', '', 0, NULL, 'products/dress7home.jpg', '2015-12-31 07:38:43', '2015-12-31 07:38:43', 1),
(8, 1, 2, '', 'Product 8', 'Model 08', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 300, 0, '', '', 0, NULL, 'products/dress8home.jpg', '2015-12-31 07:39:33', '2015-12-31 07:39:33', 1),
(9, 3, 8, '', 'Product 9', 'Model 09', 'When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then', NULL, 250, 0, '', '', 0, NULL, 'products/dress9home.jpg', '2015-12-31 07:40:21', '2015-12-31 07:40:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `price` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `rating` int(11) UNSIGNED NOT NULL,
  `message` int(11) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `description`, `created`, `modified`, `status`) VALUES
(1, 1, 'Sub Category 1', '', '2015-12-31 07:20:33', '2015-12-31 07:20:33', 1),
(2, 1, 'Sub Category 2', '', '2015-12-31 07:35:13', '2015-12-31 07:35:13', 1),
(3, 1, 'Sub Category 3', '', '2015-12-31 07:35:26', '2015-12-31 07:35:26', 1),
(4, 2, 'Sub Category 1', '', '2015-12-31 07:20:33', '2015-12-31 07:20:33', 1),
(5, 2, 'Sub Category 2', '', '2015-12-31 07:35:13', '2015-12-31 07:35:13', 1),
(6, 2, 'Sub Category 3', '', '2015-12-31 07:35:26', '2015-12-31 07:35:26', 1),
(7, 3, 'Sub Category 1', '', '2015-12-31 07:20:33', '2015-12-31 07:20:33', 1),
(8, 3, 'Sub Category 2', '', '2015-12-31 07:35:13', '2015-12-31 07:35:13', 1),
(9, 3, 'Sub Category 3', '', '2015-12-31 07:35:26', '2015-12-31 07:35:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(64) NOT NULL DEFAULT '',
  `last_name` varchar(64) NOT NULL DEFAULT '',
  `company_name` varchar(64) DEFAULT '',
  `avatar` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) NOT NULL DEFAULT '',
  `address2` varchar(255) DEFAULT '',
  `city` varchar(64) NOT NULL DEFAULT '',
  `zip` int(11) UNSIGNED NOT NULL,
  `country` varchar(64) DEFAULT '',
  `phone` varchar(16) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `role` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `first_name`, `last_name`, `company_name`, `avatar`, `birth_date`, `address`, `address2`, `city`, `zip`, `country`, `phone`, `created`, `modified`, `role`, `status`) VALUES
(1, 'admin@example.com', '$2y$10$uP02MmkfbML7t5Y/c68k2OKxnP4pTVh2MsF2v/al8z1cYOlN86muG', '', '', '', '', NULL, '', '', '', 0, '', '', '2015-12-30 15:37:18', '0000-00-00 00:00:00', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `student`
--
CREATE DATABASE IF NOT EXISTS `student` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `student`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cid` int(11) NOT NULL,
  `cname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cid`, `cname`) VALUES
(1, 'Agra'),
(2, 'Delhi'),
(3, 'Bhopal'),
(4, 'Jaipur'),
(5, 'Noida');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`) VALUES
(1, 'Btech'),
(2, 'BCA'),
(3, 'MCA');

-- --------------------------------------------------------

--
-- Table structure for table `lecturers`
--

CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `city` int(11) NOT NULL,
  `courses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lecturers`
--

INSERT INTO `lecturers` (`id`, `name`, `age`, `gender`, `city`, `courses`) VALUES
(1, 'Raj kapoor', 37, 'M', 1, 2),
(2, 'Sadhna', 39, 'F', 4, 3),
(3, 'Ram Kumar', 38, 'M', 2, 1),
(4, 'Salman Khan ', 45, 'M', 3, 2),
(5, 'Nagma', 42, 'F', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `city` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`id`, `student_name`, `age`, `city`) VALUES
(1, 'Ram Kumar', 19, 1),
(2, 'Sarita Kumari', 22, 2),
(3, 'Salman Khan ', 20, 5),
(4, 'Juhi Chawla', 18, 3),
(5, 'Anil Kapoor', 22, 4),
(6, 'John Abraham', 21, 2),
(7, 'Shahid Kapoor', 20, 1),
(8, 'Sanchit', 23, 2),
(9, 'Madan Kumar', 25, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `lecturers`
--
ALTER TABLE `lecturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lecturers`
--
ALTER TABLE `lecturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `cid` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`cid`, `city_name`) VALUES
(1, 'Delhi'),
(2, 'Agra'),
(3, 'Bhopal'),
(5, 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_name`, `age`, `city`) VALUES
(1, 'Yahoo Baba', 25, 1),
(2, 'Salman Khan', 24, 2),
(3, 'Shahid Kapoor', 24, 3),
(4, 'Juhi Chawla	', 26, 1),
(5, 'Katrina Kaif', 23, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'keshvi@gmail.com', '1234'),
(2, 'ram@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `uy`
--
CREATE DATABASE IF NOT EXISTS `uy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uy`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `oauth_provider` enum('linkedin','google','facebook','twitter') NOT NULL DEFAULT 'linkedin',
  `oauth_uid` varchar(50) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `locale` varchar(25) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `oauth_provider`, `oauth_uid`, `first_name`, `last_name`, `email`, `gender`, `locale`, `picture`, `link`, `created`, `modified`) VALUES
(1, 'linkedin', 'np3Sn5DIKi', 'yogesh', 'singh', 'py27091998@gmail.com', NULL, '', 'https://media.licdn.com/dms/image/C5103AQFY1iyMbvvXNw/profile-displayphoto-shrink_100_100/0?e=1567036800&v=beta&t=ymWi8fNUlvSOPD5qsjcfSqW6PNXuN2tq0vVirnjTtKs', 'https://www.linkedin.com/', '2019-06-23 17:44:03', '2019-06-23 18:13:22');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
