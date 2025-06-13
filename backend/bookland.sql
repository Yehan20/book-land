-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2025 at 09:08 PM
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
-- Database: `bookland`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Angelita', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(2, 'Mekhi', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(3, 'Julien', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(4, 'Maggie', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(5, 'Hassan', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(6, 'Violette', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(7, 'Lilyan', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(8, 'Rahul', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(9, 'Diamond', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(10, 'Adela', NULL, '2025-06-12 09:27:23', '2025-06-12 09:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `genre` enum('fantasy','science fiction','mystery','thriller','romance','historical fiction','horror') DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `author_id`, `title`, `ISBN`, `price`, `available`, `genre`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 8, 'Harry Potter and the Sorcerer\'s Stone', '9799174384054', 81.82, 1, 'fantasy', 'Incidunt recusandae illum quam dolorem. Est nobis corporis fugiat. Et sed occaecati laudantium veritatis dolorem nemo quos reprehenderit. Earum veniam vitae omnis officia a aut velit.', '2025-06-12 09:51:41', '2025-06-12 09:27:25', '2025-06-12 09:51:41'),
(4, 1, 'The Shadow of the Wind', '9788408172171', 19.99, 1, 'mystery', 'A gripping literary thriller that takes place in post-war Barcelona.', '2025-06-12 10:02:41', '2025-06-12 10:01:18', '2025-06-12 10:02:41'),
(5, 1, 'The Shadow of the Wind', '978840817217111', 19.99, 0, 'mystery', 'A gripping literary thriller that takes place in post-war Barcelona.', NULL, '2025-06-12 10:07:30', '2025-06-13 00:11:59'),
(6, 1, 'fefewfwf', '978840817217121', 2000.00, 0, 'mystery', 'A gripping literary thriller that takes place in post-war Barcelona.', NULL, '2025-06-12 10:09:07', '2025-06-12 10:37:19'),
(7, 5, 'The Shadow of the Wind', '978840817217a', 19.99, 0, 'mystery', 'A gripping literary thriller that takes place in post-war Barcelona.', NULL, '2025-06-12 10:10:21', '2025-06-13 00:54:22'),
(8, 5, 'Enim rem voluptas ip', 'Autem aperiam nostru', 821.00, 1, 'science fiction', 'Porro quia facilis v', NULL, '2025-06-12 21:47:24', '2025-06-13 11:07:58'),
(9, 2, 'sss', '1111', 111.00, 0, 'fantasy', 'sssss', NULL, '2025-06-12 22:37:13', '2025-06-13 01:02:48'),
(10, 3, 'ttt', 'ttt', 1111.00, 0, 'science fiction', 'ttt', NULL, '2025-06-13 05:55:37', '2025-06-13 08:45:41'),
(11, 4, 'Dolor ut amet ad et', 'Quisquam odit nisi a', 913.00, 0, 'mystery', 'Cumque numquam volup', NULL, '2025-06-13 06:00:43', '2025-06-13 13:18:49'),
(12, 3, 'Nisi amet voluptate', 'Consectetur debitis', 723.00, 0, 'mystery', 'Esse ullamco proiden', NULL, '2025-06-13 06:18:22', '2025-06-13 08:48:36'),
(13, 3, 'fwef', 'fwefwef', 1111.00, 1, 'mystery', 'fefwef', NULL, '2025-06-13 09:21:56', '2025-06-13 09:21:56'),
(14, 3, 'Veniam placeat cul', 'Rerum amet veniam', 100.00, 1, 'science fiction', 'Voluptatum tempore', NULL, '2025-06-13 09:23:30', '2025-06-13 10:08:07'),
(15, 4, 'ddwqd', 'dwqdwqd', 111.00, 1, 'mystery', 'ddwqd', NULL, '2025-06-13 09:25:19', '2025-06-13 09:25:19'),
(16, 3, 'ddd', 'ddd', 1111.00, 1, 'science fiction', 'wefewf', NULL, '2025-06-13 11:12:02', '2025-06-13 11:12:02'),
(17, 4, 'aaa', 'aaa', 11111.00, 1, 'science fiction', 'aaaaa', NULL, '2025-06-13 11:23:14', '2025-06-13 11:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `book_user`
--

CREATE TABLE `book_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `date_of_borrow` date NOT NULL,
  `date_of_return` date DEFAULT NULL,
  `deadline` date NOT NULL COMMENT 'Must return the book on or before the current date',
  `is_returned` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_user`
--

INSERT INTO `book_user` (`id`, `user_id`, `book_id`, `date_of_borrow`, `date_of_return`, `deadline`, `is_returned`, `created_at`, `updated_at`) VALUES
(1, 7, 7, '2025-06-12', '2025-06-12', '2025-06-26', 1, NULL, NULL),
(2, 7, 6, '2025-06-12', NULL, '2025-06-26', 0, NULL, NULL),
(3, 14, 5, '2025-06-13', NULL, '2025-06-27', 0, NULL, NULL),
(4, 15, 7, '2025-06-13', NULL, '2025-06-27', 0, NULL, NULL),
(5, 15, 9, '2025-06-13', NULL, '2025-06-27', 0, NULL, NULL),
(6, 16, 8, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(7, 16, 8, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(8, 17, 8, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(9, 18, 8, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(10, 18, 11, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(11, 18, 10, '2025-06-13', NULL, '2025-06-27', 0, NULL, NULL),
(12, 18, 12, '2025-06-13', NULL, '2025-06-27', 0, NULL, NULL),
(13, 25, 8, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(14, 25, 11, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(15, 25, 14, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(16, 25, 11, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(17, 27, 8, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(18, 27, 8, '2025-06-13', '2025-06-13', '2025-06-27', 1, NULL, NULL),
(19, 28, 11, '2025-06-13', NULL, '2025-06-27', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_2BMPp4fri7KpD9qv', 'a:1:{s:11:\"valid_until\";i:1749801539;}', 1751009279),
('laravel_cache_2lVYaWDsWScmcqmc', 'a:1:{s:11:\"valid_until\";i:1749841480;}', 1751051080),
('laravel_cache_6WvqizewEMBHdRVt', 'a:1:{s:11:\"valid_until\";i:1749827785;}', 1751037445),
('laravel_cache_777S8ecZ3Ece3Vk5', 'a:1:{s:11:\"valid_until\";i:1749828342;}', 1751037582),
('laravel_cache_c3MuARUTwQdd58jw', 'a:1:{s:11:\"valid_until\";i:1749824921;}', 1751033321),
('laravel_cache_cbiWOSv94W3xjiRj', 'a:1:{s:11:\"valid_until\";i:1749792523;}', 1751002183),
('laravel_cache_cR0pt3o4VMiGb8fO', 'a:1:{s:11:\"valid_until\";i:1749827508;}', 1751037108),
('laravel_cache_cYRm3UAgEhdqVNDL', 'a:1:{s:11:\"valid_until\";i:1749795790;}', 1751002870),
('laravel_cache_fg5sxlxL7FPfbicL', 'a:1:{s:11:\"valid_until\";i:1749827218;}', 1751036878),
('laravel_cache_Gb15pXOdx2RG7sKy', 'a:1:{s:11:\"valid_until\";i:1749823473;}', 1751032953),
('laravel_cache_gRys9K6gsKfD5hpK', 'a:1:{s:11:\"valid_until\";i:1749829789;}', 1751039389),
('laravel_cache_idJyJ9Jha5WYSWFy', 'a:1:{s:11:\"valid_until\";i:1749808820;}', 1751018180),
('laravel_cache_ku7fONcsZvQKmbQy', 'a:1:{s:11:\"valid_until\";i:1749827134;}', 1751036794),
('laravel_cache_NyDUMU71zvnWEbMj', 'a:1:{s:11:\"valid_until\";i:1749824487;}', 1751032767),
('laravel_cache_OkHOqEALQjDaQ8ps', 'a:1:{s:11:\"valid_until\";i:1749829153;}', 1751038033),
('laravel_cache_RR1NYDrYSQ4kajPk', 'a:1:{s:11:\"valid_until\";i:1749827705;}', 1751035745),
('laravel_cache_SC97XQnR8eDcyhyy', 'a:1:{s:11:\"valid_until\";i:1749825148;}', 1751034808),
('laravel_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:0:{}s:11:\"permissions\";a:0:{}s:5:\"roles\";a:0:{}}', 1749915346),
('laravel_cache_t95LRAgNKKVIYjGm', 'a:1:{s:11:\"valid_until\";i:1749827760;}', 1751037420),
('laravel_cache_tcXP571t7y8BiNra', 'a:1:{s:11:\"valid_until\";i:1749787560;}', 1750997160),
('laravel_cache_tgy9EwDw0eZVy4Pe', 'a:1:{s:11:\"valid_until\";i:1749827728;}', 1751037208),
('laravel_cache_TNfNEMfGeY6d1LMQ', 'a:1:{s:11:\"valid_until\";i:1749823658;}', 1751033258),
('laravel_cache_TvgZHPWa2arLLXFG', 'a:1:{s:11:\"valid_until\";i:1749831464;}', 1751041124),
('laravel_cache_XTYs6LRWwZNCVaO9', 'a:1:{s:11:\"valid_until\";i:1749832733;}', 1751041973),
('laravel_cache_y6mlLwRGIlK8qZri', 'a:1:{s:11:\"valid_until\";i:1749827897;}', 1751037557);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Book', 1, 'ab7e542b-9364-4762-b81a-5c56c08dd02e', 'books', 'book', 'book.jpg', 'image/jpeg', 'public', 'public', 52681, '[]', '[]', '[]', '[]', 1, '2025-06-12 09:27:25', '2025-06-12 09:27:25'),
(2, 'App\\Models\\Book', 4, '33351a9e-9804-484b-b8eb-8a2dbd380143', 'books', 'booksss', 'booksss.jpg', 'image/jpeg', 'public', 'public', 9447, '[]', '[]', '[]', '[]', 1, '2025-06-12 10:01:18', '2025-06-12 10:01:18'),
(3, 'App\\Models\\Book', 5, '4f8d2727-5c69-4267-bbae-265c2495e7ae', 'books', 'booksss', 'booksss.jpg', 'image/jpeg', 'public', 'public', 9447, '[]', '[]', '[]', '[]', 1, '2025-06-12 10:07:30', '2025-06-12 10:07:30'),
(4, 'App\\Models\\Book', 6, '6a20efa7-e51f-43a7-afd0-e2d65f061109', 'books', 'booksss', 'booksss.jpg', 'image/jpeg', 'public', 'public', 9447, '[]', '[]', '[]', '[]', 1, '2025-06-12 10:09:07', '2025-06-12 10:09:07'),
(7, 'App\\Models\\Book', 7, '6e079886-f377-4e2d-8698-35b8f685e43c', 'books', 'fwefwef', 'fwefwef.jpg', 'image/jpeg', 'public', 'public', 28942, '[]', '[]', '[]', '[]', 3, '2025-06-12 10:21:03', '2025-06-12 10:21:03'),
(8, 'App\\Models\\Book', 8, '279d8716-e4e2-46df-be01-83ba114256d5', 'books', 'profile', 'profile.jpg', 'image/jpeg', 'public', 'public', 4379, '[]', '[]', '[]', '[]', 1, '2025-06-12 21:47:24', '2025-06-12 21:47:24'),
(9, 'App\\Models\\Book', 9, '6428d04d-9aed-4e8a-b7a8-ab1cf487df55', 'books', 'profile', 'profile.jpg', 'image/jpeg', 'public', 'public', 4379, '[]', '[]', '[]', '[]', 1, '2025-06-12 22:37:13', '2025-06-12 22:37:13'),
(10, 'App\\Models\\Book', 10, '480b5d2e-0290-4631-a39a-cdfaa0b725c3', 'books', 'book', 'book.JPG', 'image/jpeg', 'public', 'public', 52681, '[]', '[]', '[]', '[]', 1, '2025-06-13 05:55:37', '2025-06-13 05:55:37'),
(11, 'App\\Models\\Book', 11, '26a0a52d-788b-4a0b-aa91-68557f4cbed3', 'books', 'fwefwef', 'fwefwef.jpg', 'image/jpeg', 'public', 'public', 28942, '[]', '[]', '[]', '[]', 1, '2025-06-13 06:00:43', '2025-06-13 06:00:43'),
(12, 'App\\Models\\Book', 12, '2cc856bc-7910-4905-a2e2-cc4d39a21a35', 'books', 'book', 'book.JPG', 'image/jpeg', 'public', 'public', 52681, '[]', '[]', '[]', '[]', 1, '2025-06-13 06:18:22', '2025-06-13 06:18:22'),
(13, 'App\\Models\\Book', 13, '3114957d-840f-4908-acf9-cbb6183ef224', 'books', 'ff', 'ff.jpg', 'image/jpeg', 'public', 'public', 5619, '[]', '[]', '[]', '[]', 1, '2025-06-13 09:21:56', '2025-06-13 09:21:56'),
(14, 'App\\Models\\Book', 14, 'cafd6f13-8700-4c8e-a258-6d05193ff449', 'books', 'fwefwef', 'fwefwef.jpg', 'image/jpeg', 'public', 'public', 28942, '[]', '[]', '[]', '[]', 1, '2025-06-13 09:23:30', '2025-06-13 09:23:30'),
(15, 'App\\Models\\Book', 15, 'd17e26ac-f6b1-4b3d-b54d-2456c579ceff', 'books', 'profile', 'profile.jpg', 'image/jpeg', 'public', 'public', 4379, '[]', '[]', '[]', '[]', 1, '2025-06-13 09:25:19', '2025-06-13 09:25:19'),
(16, 'App\\Models\\Book', 16, '00ea2e4a-8d99-47e8-b968-de15dcb47b92', 'books', 'ff', 'ff.jpg', 'image/jpeg', 'public', 'public', 5619, '[]', '[]', '[]', '[]', 1, '2025-06-13 11:12:02', '2025-06-13 11:12:02'),
(17, 'App\\Models\\Book', 17, 'ae232410-d03a-4963-912a-5503a6502ff7', 'books', 'profile', 'profile.jpg', 'image/jpeg', 'public', 'public', 4379, '[]', '[]', '[]', '[]', 1, '2025-06-13 11:23:14', '2025-06-13 11:23:14');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_11_171913_create_personal_access_tokens_table', 1),
(5, '2025_06_11_173415_create_telescope_entries_table', 1),
(6, '2025_06_11_173542_create_permission_tables', 1),
(7, '2025_06_11_195540_create_media_table', 1),
(8, '2025_06_11_211136_create_authors_table', 1),
(9, '2025_06_11_211138_create_books_table', 1),
(10, '2025_06_11_213944_create_book_user_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 26),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 28),
(2, 'App\\Models\\User', 29);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'api', '2025-06-12 09:27:23', '2025-06-12 09:27:23'),
(2, 'customer', 'api', '2025-06-12 09:27:23', '2025-06-12 09:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('te4BqCKnrZOIpiTukBabZTo4pWdg2A8DgM7fxPNN', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:140.0) Gecko/20100101 Firefox/140.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUU4cTA1bldJblQ4MElmc2tRUHNGTGpmWmtjNXpLOEdoaW9CZElaUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC90ZWxlc2NvcGUvcmVxdWVzdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1749801485);

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries`
--

CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `batch_id` char(36) NOT NULL,
  `family_hash` varchar(255) DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_entries_tags`
--

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `telescope_monitoring`
--

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@test.com', NULL, '$2y$12$UkR3UjRILbmM2fT4BoHV3OTbCrtjZAQUslQIlkW6cuMgBcm9Lc.46', NULL, NULL, '2025-06-12 09:25:11', '2025-06-12 09:25:11'),
(2, 'Deshawn O\'Keefe', 'katherine.mann@example.org', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'jXgQaZlRsu', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(3, 'Marielle Ankunding', 'stehr.kariane@example.net', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'a6qvel21BL', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(4, 'Haylee Greenfelder', 'gaston43@example.com', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'XzHs35jRBV', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(5, 'Travon Koss IV', 'smitham.felton@example.net', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'ZVXVdqgEWh', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(6, 'Genevieve Huel', 'lisa09@example.net', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'Mhl6zLj4jy', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(7, 'Leanna Ryan', 'tpowlowski@example.net', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'jH9Dtv8Uni', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(8, 'Lionel Barrows', 'omertz@example.org', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', '9o1YM3Iy67', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(9, 'Hertha Satterfield I', 'bethany96@example.org', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'Y91btYq0eW', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(10, 'Mrs. Velva Mosciski', 'amari13@example.org', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'Rv0vwqwMS9', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(11, 'Ms. Linnea Wuckert IV', 'larkin.peter@example.com', '2025-06-12 09:27:24', '$2y$12$n72Ytvhdcl6fbo1VEACwmuH4L0SDlgYcO4Tn1cMflGcSaIlnkTHTa', 'TXG6HnSLam', NULL, '2025-06-12 09:27:24', '2025-06-12 09:27:24'),
(12, 'admin', 'admin@test2.com', NULL, '$2y$12$76ZFN7OTKkAW8YxOnxx9BOe3fc6I6CvXegLCIjFls2ukSrKW9w5xe', NULL, NULL, '2025-06-12 09:27:39', '2025-06-12 09:27:39'),
(13, 'pavan', 'pavan@test.com', NULL, '$2y$12$p3sTZK.fbL42Oaw9KGV92ep0bFsteCW/h2mjzQi9zMXpxfB2fKqWW', NULL, NULL, '2025-06-12 10:21:47', '2025-06-12 10:21:47'),
(14, 'Katell', 'syfon@mailinator.com', NULL, '$2y$12$yDHvGVOFRUHoo4CP0uRhiuN5z0usIuw9Ib.cb4ytwrOK.cm8YtbfS', NULL, NULL, '2025-06-13 00:09:57', '2025-06-13 00:09:57'),
(15, 'maria', 'cyfovuna@mailinator.com', NULL, '$2y$12$MYc/cnkjgvZFpjp4McXJne5rMEXfAxNNYDfOGvsyNpLLCTNJ1B9kG', NULL, NULL, '2025-06-13 00:53:33', '2025-06-13 00:53:33'),
(16, 'yyyy', 'kujatudav@mailinator.com', NULL, '$2y$12$wE2mNKRx4Tx7BBelcM4ZOec/jgdqDzWRCYYYJw5fxv8zEeDK8vEzW', NULL, NULL, '2025-06-13 01:56:53', '2025-06-13 01:56:53'),
(17, 'peter', '11111@gmail.com', NULL, '$2y$12$yGm.Qu9WlHfj27cFHZHUpOJJLNbwCJtmGUO3vTjv6UpvBjqGhPc3q', NULL, NULL, '2025-06-13 05:19:24', '2025-06-13 05:19:24'),
(18, 'sss', 'test@test2.com', NULL, '$2y$12$9AX25KSLlaQvdT9hlKhV4O58ZCcmSf37Awxhe9a4yiXLPzs5KiTky', NULL, NULL, '2025-06-13 08:28:34', '2025-06-13 08:28:34'),
(19, 'rr', 'ishan.nimh@gmail.com', NULL, '$2y$12$X0/S6gAnCYFnWBMJ6k42S.Rmjy/Co1i.WCRRfdc0K/ruPpTjcCC.W', NULL, NULL, '2025-06-13 08:31:38', '2025-06-13 08:31:38'),
(20, 'aa', 'test2@test.com', NULL, '$2y$12$fePY9weVdtcBNtgvbVLbS.qjvcYx2HEQkUHvK6EqhByRck10ZnMVy', NULL, NULL, '2025-06-13 08:35:03', '2025-06-13 08:35:03'),
(21, 'aslan', 'aslan@test.com', NULL, '$2y$12$Ao0udfQDFL6cYeg2cbZXj.tc2g/gh8Yp06MRXNe21aRQK/sGRuxKS', NULL, NULL, '2025-06-13 08:35:48', '2025-06-13 08:35:48'),
(22, 'aslana', 'aslan2@test.com', NULL, '$2y$12$TaiwgKb39sWHJ0tHu5izcu0mNtHH8wn1vJRi7vAAV8UDPo3IMa6UC', NULL, NULL, '2025-06-13 08:36:27', '2025-06-13 08:36:27'),
(23, 'ashan', 'aaa@test.co', NULL, '$2y$12$PR4BXua3g1JCbR2Z33L6yeSeQWCntio8ghADoTGuz6js2stz./xCO', NULL, NULL, '2025-06-13 08:38:01', '2025-06-13 08:38:01'),
(24, 'moshan', 'xojalice@mailinator.com', NULL, '$2y$12$O4jnq4cj1Q1iJ/115klai.2dPEXKmIfRBwf5Z5JLtaOBTWLY6LVe.', NULL, NULL, '2025-06-13 09:36:52', '2025-06-13 09:36:52'),
(25, 'imal', 'imal@test.com', NULL, '$2y$12$X8lsRRqw4VO2Dnprv6/0PugnSk6fYQPd0Z368dXZG5i2Dvt5tD1aa', NULL, NULL, '2025-06-13 09:41:03', '2025-06-13 09:41:03'),
(26, 'fff', 'ima@test.com', NULL, '$2y$12$2HuXWrw/ebwzR8OlrTSHA.PqBztfW5Lq2JKGgG8u.KfD7X0sS5xCu', NULL, NULL, '2025-06-13 10:19:11', '2025-06-13 10:19:11'),
(27, 'lanakantrh', 'lanka@l.com', NULL, '$2y$12$NutK4kVFB/M9b/VlRMolH.CBamMdyhoCd8avMAJEgfzq1XJB.X0t6', NULL, NULL, '2025-06-13 11:02:16', '2025-06-13 11:02:16'),
(28, 'ravin', 'ravin@teat.com', NULL, '$2y$12$2wz.2omZnseRZ27EpfYP4O1fUTDuJ2KL7dn2rEAsWv0J7dYZ6/4b2', NULL, NULL, '2025-06-13 13:17:42', '2025-06-13 13:17:42'),
(29, 'daniel', 'danie@test.com', NULL, '$2y$12$trLQ6nU.2iTxXOi3ivcKsu69epo2fy7/5Uyg.hBGIJegGZxqelRdK', NULL, NULL, '2025-06-13 13:33:48', '2025-06-13 13:33:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_isbn_unique` (`ISBN`),
  ADD KEY `books_author_id_foreign` (`author_id`);

--
-- Indexes for table `book_user`
--
ALTER TABLE `book_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_user_user_id_foreign` (`user_id`),
  ADD KEY `book_user_book_id_foreign` (`book_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  ADD PRIMARY KEY (`sequence`),
  ADD UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  ADD KEY `telescope_entries_batch_id_index` (`batch_id`),
  ADD KEY `telescope_entries_family_hash_index` (`family_hash`),
  ADD KEY `telescope_entries_created_at_index` (`created_at`),
  ADD KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`);

--
-- Indexes for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD PRIMARY KEY (`entry_uuid`,`tag`),
  ADD KEY `telescope_entries_tags_tag_index` (`tag`);

--
-- Indexes for table `telescope_monitoring`
--
ALTER TABLE `telescope_monitoring`
  ADD PRIMARY KEY (`tag`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `book_user`
--
ALTER TABLE `book_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `telescope_entries`
--
ALTER TABLE `telescope_entries`
  MODIFY `sequence` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17490;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`);

--
-- Constraints for table `book_user`
--
ALTER TABLE `book_user`
  ADD CONSTRAINT `book_user_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `telescope_entries_tags`
--
ALTER TABLE `telescope_entries_tags`
  ADD CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
