-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2018 at 07:13 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogcomments`
--

CREATE TABLE `blogcomments` (
  `id` int(10) UNSIGNED NOT NULL,
  `blogpost_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogcomments`
--

INSERT INTO `blogcomments` (`id`, `blogpost_id`, `name`, `email`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amber', 'amber65r@gmail.com', 'Nice post.', NULL, NULL),
(2, 4, 'Liza', 'jest@mgoe.com', 'Another good post.', NULL, NULL),
(3, 2, 'Ana Lee', 'analee094@hotmail.com', 'Well it is not true and does not make sense', '2018-06-30 14:21:02', '2018-06-30 14:21:02'),
(4, 3, 'Ali Haider', 'alihaider05715@gmail.com', 'A very impressive post.', '2018-06-30 14:22:34', '2018-06-30 14:22:34'),
(5, 1, 'Adam Hans', 'polod455d@gmail.com', 'Impressed by the content.', '2018-06-30 14:27:38', '2018-06-30 14:27:38'),
(8, 1, 'Bravo', '344bravo@yahoo.com', 'This is correct altogether. So true', '2018-06-30 16:20:20', '2018-06-30 16:20:20'),
(15, 15, 'Johnny', 'johnny2323@gmail.com', 'I agree with problem, but what could be the solution. Fresh water and sear water levels are decreasing day by day.', '2018-07-01 22:34:53', '2018-07-01 22:34:53'),
(16, 2, 'Samantha', 'samantha343@gmail.com', 'Awesome!!', '2018-07-01 23:00:27', '2018-07-01 23:00:27'),
(17, 15, 'Oliver', 'polier543@hotmail.com', 'Well, it depends on geography of world and the climate change. There is possibility that this never happen.', '2018-07-01 23:57:00', '2018-07-01 23:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `blogposts`
--

CREATE TABLE `blogposts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogposts`
--

INSERT INTO `blogposts` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Explore within. Enjoy cool breeze with calm mind and atmosphere.', 'free air life concept is used to describe the feeling of being outside, exploring and appreciating nature. It isn’t strictly defined as a term, but can include anything from meditating, taking photographs, sleeping outdoors or even dancing. It does not require money, equipment or a particular setting.', '2018-06-30 02:58:56', '2018-06-30 02:58:56'),
(2, 1, 'It\'s not only car that we travel, It\'s a family member that accompanies us.', 'Ah, life on the open road! What\'s not to love? There\'s the freedom, the adventure... the kids fighting in the back and demanding to know if you\'re \"there yet.\" OK, maybe a road trip isn\'t exactly a flawless family vacation. Still, we\'re intrigued about the idea of renting an RV.  ', '2018-06-30 02:59:47', '2018-06-30 02:59:47'),
(3, 1, 'Let the life flow like Fluid to survive through race of Peace.', 'As the twentieth century draws to a close, we find that the world has grown smaller and the world\'s people have become almost one community. Political and military alliances have created large multinational groups, industry and international trade have produced a global economy.', '2018-06-30 05:10:14', '2018-06-30 05:10:14'),
(4, 1, 'One Good thing about music is that when it hits you, you feel no pain.\r\n', 'This is further underscored by the fact that the Symposium has previously been held in Africa and in his land of forests. It seeks to give the youth an opportunity to come together to \r\nidentify, discuss and create realistic solutions to challenges and issues that impact and affect them, the environment, the countries and the world. ', '2018-06-30 06:14:22', '2018-06-30 06:14:22'),
(15, 30, 'Why there is a need to preserve water', 'It is a worrisome fact that world is facing water scarcity. The consumption of ground water is increasing at a rapid speed.Water is probably the most important substance for preserving life. In fact, scientists looking for evidence of life on other planets regard the presence of water as a vital clue. ', '2018-07-01 22:32:54', '2018-07-01 22:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2018_06_30_035422_create_blogposts_table', 2),
(6, '2018_06_30_035539_create_blogcomments_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `created_at`, `updated_at`) VALUES
(1, 'Alice', 'alice6577@hotmail.com', 'alice', NULL, NULL),
(2, 'John Green', 'johnyty9672@hotmail.com', 'john', NULL, NULL),
(3, 'Sozen Blacksmit', 'sozen75676@newmail.com', 'sozen', '2018-07-01 15:47:53', '2018-07-01 15:47:53'),
(24, 'Ali Haider', 'bastro343@yahoo.com', 'ali', '2018-07-01 16:11:05', '2018-07-01 16:11:05'),
(25, 'Lia Aan', 'deepbluespes@yahoo.com', 'liabest', '2018-07-01 16:12:53', '2018-07-01 16:12:53'),
(26, 'Mia Tarrat', 'always5654@yahoo.com', 'miatarrat', '2018-07-01 16:16:46', '2018-07-01 16:16:46'),
(27, 'Sandra Smith', 'cuteandrer455@newmail.com', 'sandra', '2018-07-01 16:25:03', '2018-07-01 16:25:03'),
(28, 'Walter Junior', 'captownla@yahoo.com', 'walter', '2018-07-01 16:26:27', '2018-07-01 16:26:27'),
(29, 'David storm', 'drasdrrere@yahoo.com', 'david', '2018-07-01 17:57:58', '2018-07-01 17:57:58'),
(30, 'Joseph Tedd', 'joseph4542@hotmail.com', 'Joseph', '2018-07-01 22:29:27', '2018-07-01 22:29:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogcomments`
--
ALTER TABLE `blogcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogcomments_blogpost_id_foreign` (`blogpost_id`);

--
-- Indexes for table `blogposts`
--
ALTER TABLE `blogposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogposts_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogcomments`
--
ALTER TABLE `blogcomments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `blogposts`
--
ALTER TABLE `blogposts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogcomments`
--
ALTER TABLE `blogcomments`
  ADD CONSTRAINT `blogcomments_blogpost_id_foreign` FOREIGN KEY (`blogpost_id`) REFERENCES `blogposts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogposts`
--
ALTER TABLE `blogposts`
  ADD CONSTRAINT `blogposts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
