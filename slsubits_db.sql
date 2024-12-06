-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2024 at 03:34 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slsubits_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  `session` enum('morning','afternoon') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'morning'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `login_time`, `logout_time`, `session`) VALUES
(1, 2, '2024-12-03 13:15:02', NULL, 'morning'),
(2, 3, '2024-12-04 00:39:55', NULL, 'morning'),
(11, 2, '2024-12-04 01:46:24', NULL, 'morning'),
(12, 2, '2024-12-04 04:10:26', NULL, 'afternoon'),
(13, 3, '2024-12-04 05:40:20', NULL, 'afternoon');

-- --------------------------------------------------------

--
-- Table structure for table `biometrics`
--

CREATE TABLE `biometrics` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `captured_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rfid_data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `biometrics`
--

INSERT INTO `biometrics` (`id`, `user_id`, `captured_image`, `created_at`, `updated_at`, `rfid_data`) VALUES
(1, 2, 'uploads/faces/face_2_1733224862.png', '2024-12-03 03:20:29', '2024-12-03 04:43:51', '3917250F'),
(2, 3, 'uploads/faces/face_3_1733229013.png', '2024-12-03 04:30:04', '2024-12-03 05:00:06', '80ABAFBD'),
(3, 4, 'uploads/faces/face_4_1733292448.png', '2024-12-03 22:07:16', '2024-12-03 22:07:55', '0D22AE43'),
(4, 4, 'uploads/faces/face_4_1733292436.png', '2024-12-03 22:07:16', '2024-12-03 22:07:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `room` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `log_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'entry'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `room`, `created_at`, `updated_at`, `log_time`, `log_type`) VALUES
(349, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 19:31:55', 'entry'),
(350, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:20:37', 'entry'),
(351, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:21:50', 'exit'),
(352, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:22:51', 'entry'),
(353, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:23:51', 'exit'),
(354, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:24:52', 'entry'),
(355, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:25:53', 'exit'),
(356, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:26:53', 'entry'),
(357, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:28:45', 'entry'),
(358, 3, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:30:32', 'entry'),
(359, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 20:30:43', 'entry'),
(360, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-04 10:00:11', 'entry'),
(361, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-04 10:01:50', 'entry'),
(362, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-04 11:16:57', 'entry'),
(363, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-04 12:11:56', 'entry'),
(364, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-04 19:08:03', 'entry'),
(365, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-05 11:09:24', 'entry'),
(366, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-05 11:13:39', 'entry'),
(367, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-05 11:13:57', 'entry'),
(368, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-05 19:43:30', 'entry'),
(369, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-06 10:44:33', 'entry');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_14_040756_create_user_roles_table', 1),
(6, '2024_10_02_142825_create_biometrics_table', 1),
(7, '2024_10_16_031506_add_role_id_and_type_to_users_table', 1),
(8, '2024_10_29_062010_create_logs_table', 1),
(9, '2024_10_31_030457_add_rfid_data_to_biometrics_table', 1),
(10, '2024_11_02_123423_update_rfid_data_nullable_in_biometrics_table', 1),
(11, '2024_11_17_234606_create_notifications_table', 1),
(12, '2024_11_21_030245_create_attendances_table', 1),
(13, '2024_11_24_042004_update_logs_table_for_single_log_time_column', 1),
(14, '2024_11_24_044356_add_log_type_to_logs_table', 1),
(15, '2024_11_24_051600_drop_method_column_from_logs_table', 1),
(16, '2024_12_04_010930_add_session_to_attendances_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('unread','read') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201102257.jpg', 'unread', NULL, NULL),
(2, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201102624.jpg', 'unread', NULL, NULL),
(3, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110808.jpg', 'unread', NULL, NULL),
(4, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110818.jpg', 'read', NULL, '2024-12-02 03:57:02'),
(5, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110819.jpg', 'unread', NULL, NULL),
(6, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110819.jpg', 'unread', NULL, NULL),
(7, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110820.jpg', 'read', NULL, '2024-11-30 20:03:42'),
(8, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110821.jpg', 'read', NULL, '2024-11-30 20:04:01'),
(9, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110822.jpg', 'read', NULL, '2024-12-02 22:41:51'),
(10, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110823.jpg', 'read', NULL, '2024-12-01 04:01:48'),
(11, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110825.jpg', 'unread', NULL, NULL),
(12, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110826.jpg', 'read', NULL, '2024-12-02 05:06:59'),
(13, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110826.jpg', 'read', NULL, '2024-12-03 04:09:55'),
(14, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110827.jpg', 'read', NULL, '2024-12-02 22:41:47'),
(15, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110828.jpg', 'read', NULL, '2024-12-03 00:32:14'),
(16, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110829.jpg', 'unread', NULL, NULL),
(17, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110830.jpg', 'read', NULL, '2024-12-03 19:06:36'),
(18, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110831.jpg', 'unread', NULL, NULL),
(19, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110831.jpg', 'unread', NULL, NULL),
(20, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110832.jpg', 'unread', NULL, NULL),
(21, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201111207.jpg', 'unread', NULL, NULL),
(22, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201111218.jpg', 'unread', NULL, NULL),
(23, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201111235.jpg', 'unread', NULL, NULL),
(24, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201113532.jpg', 'unread', NULL, NULL),
(25, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201113546.jpg', 'read', NULL, '2024-11-30 20:03:56'),
(26, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201113552.jpg', 'unread', NULL, NULL),
(27, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201113554.jpg', 'unread', NULL, NULL),
(28, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201113804.jpg', 'read', NULL, '2024-11-30 20:03:50'),
(29, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202194040.jpg', 'unread', NULL, NULL),
(30, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202194157.jpg', 'unread', NULL, NULL),
(31, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202221142.jpg', 'unread', NULL, NULL),
(32, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202222943.jpg', 'unread', NULL, NULL),
(33, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223041.jpg', 'unread', NULL, NULL),
(34, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223230.jpg', 'unread', NULL, NULL),
(35, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223535.jpg', 'unread', NULL, NULL),
(36, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223548.jpg', 'unread', NULL, NULL),
(37, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223609.jpg', 'unread', NULL, NULL),
(38, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223610.jpg', 'unread', NULL, NULL),
(39, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223612.jpg', 'unread', NULL, NULL),
(40, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223613.jpg', 'unread', NULL, NULL),
(41, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223614.jpg', 'unread', NULL, NULL),
(42, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223615.jpg', 'unread', NULL, NULL),
(43, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223616.jpg', 'unread', NULL, NULL),
(44, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223858.jpg', 'unread', NULL, NULL),
(45, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202223859.jpg', 'unread', NULL, NULL),
(46, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224023.jpg', 'unread', NULL, NULL),
(47, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224032.jpg', 'unread', NULL, NULL),
(48, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224115.jpg', 'unread', NULL, NULL),
(49, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224116.jpg', 'unread', NULL, NULL),
(50, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224205.jpg', 'unread', NULL, NULL),
(51, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224722.jpg', 'unread', NULL, NULL),
(52, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224738.jpg', 'unread', NULL, NULL),
(53, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224739.jpg', 'unread', NULL, NULL),
(54, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224740.jpg', 'unread', NULL, NULL),
(55, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224741.jpg', 'unread', NULL, NULL),
(56, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224743.jpg', 'unread', NULL, NULL),
(57, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224752.jpg', 'unread', NULL, NULL),
(58, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224753.jpg', 'unread', NULL, NULL),
(59, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224757.jpg', 'unread', NULL, NULL),
(60, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224758.jpg', 'unread', NULL, NULL),
(61, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224801.jpg', 'unread', NULL, NULL),
(62, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224801.jpg', 'unread', NULL, NULL),
(63, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224803.jpg', 'unread', NULL, NULL),
(64, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224804.jpg', 'unread', NULL, NULL),
(65, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224806.jpg', 'unread', NULL, NULL),
(66, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224810.jpg', 'unread', NULL, NULL),
(67, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224838.jpg', 'unread', NULL, NULL),
(68, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224838.jpg', 'unread', NULL, NULL),
(69, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224839.jpg', 'unread', NULL, NULL),
(70, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224844.jpg', 'unread', NULL, NULL),
(71, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202224845.jpg', 'unread', NULL, NULL),
(72, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202225310.jpg', 'unread', NULL, NULL),
(73, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202225311.jpg', 'unread', NULL, NULL),
(74, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202225312.jpg', 'unread', NULL, NULL),
(75, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202225326.jpg', 'unread', NULL, NULL),
(76, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202225646.jpg', 'unread', NULL, NULL),
(77, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202225648.jpg', 'unread', NULL, NULL),
(78, 'Unknown User', 'An unrecognized user was detected.', 'unread', NULL, NULL),
(79, 'Unknown User', 'An unrecognized user was detected.', 'unread', NULL, NULL),
(80, 'Unknown User', 'An unrecognized user was detected.', 'unread', NULL, NULL),
(81, 'Unknown User', 'An unrecognized user was detected.', 'unread', NULL, NULL),
(82, 'Unknown User', 'An unrecognized user was detected.', 'unread', NULL, NULL),
(83, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202230210.jpg', 'unread', NULL, NULL),
(84, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241202230434.jpg', 'unread', NULL, NULL),
(85, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203125314.jpg', 'unread', NULL, NULL),
(86, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203125325.jpg', 'unread', NULL, NULL),
(87, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203125512.jpg', 'unread', NULL, NULL),
(88, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203125514.jpg', 'unread', NULL, NULL),
(89, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133156.jpg', 'unread', NULL, NULL),
(90, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133157.jpg', 'unread', NULL, NULL),
(91, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133158.jpg', 'unread', NULL, NULL),
(92, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133159.jpg', 'unread', NULL, NULL),
(93, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133201.jpg', 'unread', NULL, NULL),
(94, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133202.jpg', 'unread', NULL, NULL),
(95, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133203.jpg', 'unread', NULL, NULL),
(96, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133204.jpg', 'unread', NULL, NULL),
(97, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133205.jpg', 'unread', NULL, NULL),
(98, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133206.jpg', 'unread', NULL, NULL),
(99, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133207.jpg', 'unread', NULL, NULL),
(100, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133208.jpg', 'unread', NULL, NULL),
(101, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133210.jpg', 'unread', NULL, NULL),
(102, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133220.jpg', 'unread', NULL, NULL),
(103, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133228.jpg', 'unread', NULL, NULL),
(104, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133229.jpg', 'unread', NULL, NULL),
(105, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133234.jpg', 'unread', NULL, NULL),
(106, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133236.jpg', 'unread', NULL, NULL),
(107, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133240.jpg', 'unread', NULL, NULL),
(108, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133241.jpg', 'unread', NULL, NULL),
(109, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133244.jpg', 'unread', NULL, NULL),
(110, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133245.jpg', 'unread', NULL, NULL),
(111, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133246.jpg', 'unread', NULL, NULL),
(112, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133247.jpg', 'unread', NULL, NULL),
(113, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133248.jpg', 'unread', NULL, NULL),
(114, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133249.jpg', 'unread', NULL, NULL),
(115, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133251.jpg', 'unread', NULL, NULL),
(116, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133252.jpg', 'unread', NULL, NULL),
(117, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133253.jpg', 'unread', NULL, NULL),
(118, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133254.jpg', 'unread', NULL, NULL),
(119, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133255.jpg', 'unread', NULL, NULL),
(120, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133256.jpg', 'unread', NULL, NULL),
(121, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133258.jpg', 'unread', NULL, NULL),
(122, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133259.jpg', 'unread', NULL, NULL),
(123, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133300.jpg', 'unread', NULL, NULL),
(124, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133303.jpg', 'unread', NULL, NULL),
(125, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133306.jpg', 'unread', NULL, NULL),
(126, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133307.jpg', 'unread', NULL, NULL),
(127, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133308.jpg', 'unread', NULL, NULL),
(128, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133310.jpg', 'unread', NULL, NULL),
(129, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133427.jpg', 'unread', NULL, NULL),
(130, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133428.jpg', 'read', NULL, '2024-12-03 03:47:59'),
(131, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133452.jpg', 'unread', NULL, NULL),
(132, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133453.jpg', 'unread', NULL, NULL),
(133, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133528.jpg', 'unread', NULL, NULL),
(134, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133529.jpg', 'unread', NULL, NULL),
(135, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133535.jpg', 'unread', NULL, NULL),
(136, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142456.jpg', 'unread', NULL, NULL),
(137, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142514.jpg', 'unread', NULL, NULL),
(138, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142516.jpg', 'unread', NULL, NULL),
(139, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142517.jpg', 'unread', NULL, NULL),
(140, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142519.jpg', 'unread', NULL, NULL),
(141, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142519.jpg', 'unread', NULL, NULL),
(142, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142856.jpg', 'unread', NULL, NULL),
(143, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203142858.jpg', 'unread', NULL, NULL),
(144, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143007.jpg', 'unread', NULL, NULL),
(145, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143010.jpg', 'unread', NULL, NULL),
(146, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143013.jpg', 'unread', NULL, NULL),
(147, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143015.jpg', 'unread', NULL, NULL),
(148, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143016.jpg', 'unread', NULL, NULL),
(149, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143019.jpg', 'unread', NULL, NULL),
(150, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143021.jpg', 'unread', NULL, NULL),
(151, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143023.jpg', 'unread', NULL, NULL),
(152, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143024.jpg', 'unread', NULL, NULL),
(153, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143026.jpg', 'unread', NULL, NULL),
(154, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143027.jpg', 'unread', NULL, NULL),
(155, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143029.jpg', 'unread', NULL, NULL),
(156, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143031.jpg', 'unread', NULL, NULL),
(157, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143034.jpg', 'unread', NULL, NULL),
(158, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143036.jpg', 'unread', NULL, NULL),
(159, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143039.jpg', 'unread', NULL, NULL),
(160, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143041.jpg', 'unread', NULL, NULL),
(161, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143045.jpg', 'unread', NULL, NULL),
(162, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143517.jpg', 'unread', NULL, NULL),
(163, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143531.jpg', 'unread', NULL, NULL),
(164, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143534.jpg', 'unread', NULL, NULL),
(165, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143535.jpg', 'unread', NULL, NULL),
(166, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143536.jpg', 'read', NULL, '2024-12-02 22:41:58'),
(167, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143540.jpg', 'read', NULL, '2024-12-02 22:41:40'),
(168, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193153.jpg', 'unread', NULL, NULL),
(169, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193154.jpg', 'unread', NULL, NULL),
(170, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193200.jpg', 'unread', NULL, NULL),
(171, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193201.jpg', 'unread', NULL, NULL),
(172, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193202.jpg', 'unread', NULL, NULL),
(173, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193203.jpg', 'unread', NULL, NULL),
(174, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193203.jpg', 'unread', NULL, NULL),
(175, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193204.jpg', 'unread', NULL, NULL),
(176, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193205.jpg', 'unread', NULL, NULL),
(177, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193207.jpg', 'read', NULL, '2024-12-03 03:47:54'),
(178, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193210.jpg', 'unread', NULL, NULL),
(179, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203193211.jpg', 'unread', NULL, NULL),
(180, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202035.jpg', 'unread', NULL, NULL),
(181, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202036.jpg', 'unread', NULL, NULL),
(182, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202046.jpg', 'unread', NULL, NULL),
(183, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202050.jpg', 'unread', NULL, NULL),
(184, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202053.jpg', 'unread', NULL, NULL),
(185, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202103.jpg', 'unread', NULL, NULL),
(186, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202124.jpg', 'unread', NULL, NULL),
(187, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202128.jpg', 'unread', NULL, NULL),
(188, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202129.jpg', 'unread', NULL, NULL),
(189, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202130.jpg', 'unread', NULL, NULL),
(190, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202132.jpg', 'unread', NULL, NULL),
(191, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202133.jpg', 'unread', NULL, NULL),
(192, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202135.jpg', 'unread', NULL, NULL),
(193, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202136.jpg', 'unread', NULL, NULL),
(194, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202137.jpg', 'unread', NULL, NULL),
(195, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202138.jpg', 'unread', NULL, NULL),
(196, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202139.jpg', 'unread', NULL, NULL),
(197, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202141.jpg', 'unread', NULL, NULL),
(198, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202142.jpg', 'unread', NULL, NULL),
(199, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202144.jpg', 'unread', NULL, NULL),
(200, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202145.jpg', 'unread', NULL, NULL),
(201, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202146.jpg', 'unread', NULL, NULL),
(202, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202147.jpg', 'unread', NULL, NULL),
(203, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202148.jpg', 'unread', NULL, NULL),
(204, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202154.jpg', 'unread', NULL, NULL),
(205, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202155.jpg', 'unread', NULL, NULL),
(206, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202202.jpg', 'unread', NULL, NULL),
(207, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202221.jpg', 'unread', NULL, NULL),
(208, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202253.jpg', 'unread', NULL, NULL),
(209, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202256.jpg', 'unread', NULL, NULL),
(210, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202306.jpg', 'unread', NULL, NULL),
(211, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202324.jpg', 'unread', NULL, NULL),
(212, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202345.jpg', 'unread', NULL, NULL),
(213, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202412.jpg', 'unread', NULL, NULL),
(214, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202416.jpg', 'unread', NULL, NULL),
(215, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202457.jpg', 'unread', NULL, NULL),
(216, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202508.jpg', 'unread', NULL, NULL),
(217, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202511.jpg', 'unread', NULL, NULL),
(218, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202513.jpg', 'unread', NULL, NULL),
(219, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202514.jpg', 'unread', NULL, NULL),
(220, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202516.jpg', 'unread', NULL, NULL),
(221, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202519.jpg', 'unread', NULL, NULL),
(222, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202520.jpg', 'unread', NULL, NULL),
(223, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202521.jpg', 'unread', NULL, NULL),
(224, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202522.jpg', 'unread', NULL, NULL),
(225, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202524.jpg', 'unread', NULL, NULL),
(226, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202525.jpg', 'unread', NULL, NULL),
(227, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202526.jpg', 'unread', NULL, NULL),
(228, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202527.jpg', 'unread', NULL, NULL),
(229, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202528.jpg', 'unread', NULL, NULL),
(230, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202529.jpg', 'unread', NULL, NULL),
(231, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202530.jpg', 'unread', NULL, NULL),
(232, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202531.jpg', 'unread', NULL, NULL),
(233, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202533.jpg', 'unread', NULL, NULL),
(234, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202534.jpg', 'unread', NULL, NULL),
(235, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202535.jpg', 'unread', NULL, NULL),
(236, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202536.jpg', 'unread', NULL, NULL),
(237, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202537.jpg', 'unread', NULL, NULL),
(238, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202538.jpg', 'unread', NULL, NULL),
(239, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202539.jpg', 'unread', NULL, NULL),
(240, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202540.jpg', 'unread', NULL, NULL),
(241, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202541.jpg', 'unread', NULL, NULL),
(242, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202542.jpg', 'unread', NULL, NULL),
(243, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202543.jpg', 'unread', NULL, NULL),
(244, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202550.jpg', 'unread', NULL, NULL),
(245, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202551.jpg', 'unread', NULL, NULL),
(246, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202553.jpg', 'unread', NULL, NULL),
(247, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202555.jpg', 'unread', NULL, NULL),
(248, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202556.jpg', 'unread', NULL, NULL),
(249, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202600.jpg', 'unread', NULL, NULL),
(250, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202608.jpg', 'unread', NULL, NULL),
(251, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202609.jpg', 'unread', NULL, NULL),
(252, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202612.jpg', 'unread', NULL, NULL),
(253, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202634.jpg', 'unread', NULL, NULL),
(254, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202635.jpg', 'unread', NULL, NULL),
(255, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202635.jpg', 'unread', NULL, NULL),
(256, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202635.jpg', 'unread', NULL, NULL),
(257, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202638.jpg', 'unread', NULL, NULL),
(258, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202639.jpg', 'unread', NULL, NULL),
(259, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202639.jpg', 'unread', NULL, NULL),
(260, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202640.jpg', 'unread', NULL, NULL),
(261, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202641.jpg', 'unread', NULL, NULL),
(262, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202642.jpg', 'unread', NULL, NULL),
(263, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202644.jpg', 'unread', NULL, NULL),
(264, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202645.jpg', 'unread', NULL, NULL),
(265, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202646.jpg', 'unread', NULL, NULL),
(266, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202656.jpg', 'unread', NULL, NULL),
(267, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202657.jpg', 'unread', NULL, NULL),
(268, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202658.jpg', 'unread', NULL, NULL),
(269, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202659.jpg', 'unread', NULL, NULL),
(270, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202700.jpg', 'unread', NULL, NULL),
(271, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202701.jpg', 'unread', NULL, NULL),
(272, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202703.jpg', 'unread', NULL, NULL),
(273, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202704.jpg', 'unread', NULL, NULL),
(274, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202705.jpg', 'unread', NULL, NULL),
(275, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202707.jpg', 'unread', NULL, NULL),
(276, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202708.jpg', 'unread', NULL, NULL),
(277, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202709.jpg', 'unread', NULL, NULL),
(278, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202710.jpg', 'unread', NULL, NULL),
(279, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202712.jpg', 'unread', NULL, NULL),
(280, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202714.jpg', 'unread', NULL, NULL),
(281, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202714.jpg', 'unread', NULL, NULL),
(282, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202715.jpg', 'unread', NULL, NULL),
(283, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202716.jpg', 'unread', NULL, NULL),
(284, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202716.jpg', 'unread', NULL, NULL),
(285, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202718.jpg', 'unread', NULL, NULL),
(286, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202719.jpg', 'unread', NULL, NULL),
(287, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202721.jpg', 'unread', NULL, NULL),
(288, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202722.jpg', 'unread', NULL, NULL),
(289, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202723.jpg', 'unread', NULL, NULL),
(290, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202728.jpg', 'unread', NULL, NULL),
(291, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202730.jpg', 'unread', NULL, NULL),
(292, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202731.jpg', 'unread', NULL, NULL),
(293, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202732.jpg', 'unread', NULL, NULL),
(294, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202733.jpg', 'unread', NULL, NULL),
(295, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202735.jpg', 'unread', NULL, NULL),
(296, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202736.jpg', 'unread', NULL, NULL),
(297, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202737.jpg', 'unread', NULL, NULL),
(298, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202739.jpg', 'unread', NULL, NULL),
(299, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202740.jpg', 'unread', NULL, NULL),
(300, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202741.jpg', 'unread', NULL, NULL),
(301, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202742.jpg', 'unread', NULL, NULL),
(302, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202743.jpg', 'unread', NULL, NULL),
(303, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202847.jpg', 'unread', NULL, NULL),
(304, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202847.jpg', 'unread', NULL, NULL),
(305, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202848.jpg', 'unread', NULL, NULL),
(306, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202914.jpg', 'unread', NULL, NULL),
(307, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202915.jpg', 'unread', NULL, NULL),
(308, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202917.jpg', 'unread', NULL, NULL),
(309, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202918.jpg', 'unread', NULL, NULL),
(310, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202923.jpg', 'unread', NULL, NULL),
(311, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202923.jpg', 'unread', NULL, NULL),
(312, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203202924.jpg', 'unread', NULL, NULL),
(313, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203034.jpg', 'unread', NULL, NULL),
(314, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203040.jpg', 'unread', NULL, NULL),
(315, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203041.jpg', 'unread', NULL, NULL),
(316, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203042.jpg', 'unread', NULL, NULL),
(317, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203042.jpg', 'unread', NULL, NULL),
(318, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203045.jpg', 'unread', NULL, NULL),
(319, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203057.jpg', 'unread', NULL, NULL),
(320, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203203058.jpg', 'read', NULL, '2024-12-03 19:06:45'),
(321, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111624.jpg', 'unread', NULL, NULL),
(322, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111625.jpg', 'unread', NULL, NULL),
(323, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111627.jpg', 'unread', NULL, NULL),
(324, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111628.jpg', 'unread', NULL, NULL),
(325, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111629.jpg', 'unread', NULL, NULL),
(326, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111630.jpg', 'unread', NULL, NULL),
(327, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111631.jpg', 'unread', NULL, NULL),
(328, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111632.jpg', 'unread', NULL, NULL),
(329, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111633.jpg', 'unread', NULL, NULL),
(330, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111634.jpg', 'unread', NULL, NULL),
(331, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111635.jpg', 'unread', NULL, NULL),
(332, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111636.jpg', 'unread', NULL, NULL),
(333, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111638.jpg', 'unread', NULL, NULL),
(334, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111638.jpg', 'unread', NULL, NULL),
(335, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111640.jpg', 'unread', NULL, NULL),
(336, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111640.jpg', 'unread', NULL, NULL),
(337, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111642.jpg', 'unread', NULL, NULL),
(338, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111642.jpg', 'unread', NULL, NULL),
(339, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111643.jpg', 'unread', NULL, NULL),
(340, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111643.jpg', 'unread', NULL, NULL),
(341, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111645.jpg', 'unread', NULL, NULL),
(342, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111645.jpg', 'unread', NULL, NULL),
(343, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111646.jpg', 'unread', NULL, NULL),
(344, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111647.jpg', 'unread', NULL, NULL),
(345, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111648.jpg', 'unread', NULL, NULL),
(346, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111649.jpg', 'unread', NULL, NULL),
(347, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111650.jpg', 'unread', NULL, NULL),
(348, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111651.jpg', 'unread', NULL, NULL),
(349, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111652.jpg', 'unread', NULL, NULL),
(350, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111653.jpg', 'unread', NULL, NULL),
(351, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111654.jpg', 'unread', NULL, NULL),
(352, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111655.jpg', 'unread', NULL, NULL),
(353, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111659.jpg', 'unread', NULL, NULL),
(354, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111659.jpg', 'unread', NULL, NULL),
(355, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111702.jpg', 'unread', NULL, NULL),
(356, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111702.jpg', 'unread', NULL, NULL),
(357, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111703.jpg', 'unread', NULL, NULL),
(358, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111704.jpg', 'unread', NULL, NULL),
(359, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111705.jpg', 'unread', NULL, NULL),
(360, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111705.jpg', 'unread', NULL, NULL),
(361, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111706.jpg', 'unread', NULL, NULL),
(362, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111707.jpg', 'unread', NULL, NULL),
(363, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111708.jpg', 'unread', NULL, NULL),
(364, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111710.jpg', 'unread', NULL, NULL),
(365, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111710.jpg', 'unread', NULL, NULL),
(366, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111711.jpg', 'unread', NULL, NULL),
(367, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111712.jpg', 'unread', NULL, NULL),
(368, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111713.jpg', 'unread', NULL, NULL),
(369, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111715.jpg', 'unread', NULL, NULL),
(370, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111715.jpg', 'unread', NULL, NULL),
(371, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111717.jpg', 'unread', NULL, NULL),
(372, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111717.jpg', 'unread', NULL, NULL),
(373, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111718.jpg', 'unread', NULL, NULL),
(374, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111718.jpg', 'unread', NULL, NULL),
(375, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111720.jpg', 'unread', NULL, NULL),
(376, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111720.jpg', 'unread', NULL, NULL),
(377, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111722.jpg', 'unread', NULL, NULL),
(378, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111722.jpg', 'unread', NULL, NULL),
(379, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111723.jpg', 'unread', NULL, NULL),
(380, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111724.jpg', 'unread', NULL, NULL),
(381, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111725.jpg', 'unread', NULL, NULL),
(382, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111726.jpg', 'unread', NULL, NULL),
(383, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111727.jpg', 'unread', NULL, NULL),
(384, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111728.jpg', 'unread', NULL, NULL);
INSERT INTO `notifications` (`id`, `title`, `message`, `status`, `created_at`, `updated_at`) VALUES
(385, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204111729.jpg', 'unread', NULL, NULL),
(386, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121151.jpg', 'unread', NULL, NULL),
(387, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121152.jpg', 'unread', NULL, NULL),
(388, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121153.jpg', 'unread', NULL, NULL),
(389, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121154.jpg', 'unread', NULL, NULL),
(390, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121157.jpg', 'unread', NULL, NULL),
(391, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121157.jpg', 'unread', NULL, NULL),
(392, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121159.jpg', 'unread', NULL, NULL),
(393, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121200.jpg', 'unread', NULL, NULL),
(394, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121202.jpg', 'unread', NULL, NULL),
(395, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121202.jpg', 'unread', NULL, NULL),
(396, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121204.jpg', 'unread', NULL, NULL),
(397, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121206.jpg', 'unread', NULL, NULL),
(398, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121207.jpg', 'unread', NULL, NULL),
(399, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121207.jpg', 'unread', NULL, NULL),
(400, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121209.jpg', 'unread', NULL, NULL),
(401, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121211.jpg', 'unread', NULL, NULL),
(402, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121213.jpg', 'unread', NULL, NULL),
(403, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121213.jpg', 'unread', NULL, NULL),
(404, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121214.jpg', 'unread', NULL, NULL),
(405, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121214.jpg', 'unread', NULL, NULL),
(406, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121215.jpg', 'unread', NULL, NULL),
(407, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204121216.jpg', 'unread', NULL, NULL),
(408, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204190802.jpg', 'unread', NULL, NULL),
(409, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204190806.jpg', 'unread', NULL, NULL),
(410, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204190807.jpg', 'unread', NULL, NULL),
(411, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241204190820.jpg', 'unread', NULL, NULL),
(412, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205110930.jpg', 'unread', NULL, NULL),
(413, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205110957.jpg', 'unread', NULL, NULL),
(414, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205110958.jpg', 'unread', NULL, NULL),
(415, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205110959.jpg', 'unread', NULL, NULL),
(416, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111000.jpg', 'unread', NULL, NULL),
(417, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111001.jpg', 'unread', NULL, NULL),
(418, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111002.jpg', 'unread', NULL, NULL),
(419, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111003.jpg', 'unread', NULL, NULL),
(420, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111005.jpg', 'unread', NULL, NULL),
(421, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111006.jpg', 'unread', NULL, NULL),
(422, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111007.jpg', 'unread', NULL, NULL),
(423, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111009.jpg', 'unread', NULL, NULL),
(424, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111010.jpg', 'unread', NULL, NULL),
(425, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111011.jpg', 'unread', NULL, NULL),
(426, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111012.jpg', 'unread', NULL, NULL),
(427, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111013.jpg', 'unread', NULL, NULL),
(428, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111014.jpg', 'unread', NULL, NULL),
(429, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111015.jpg', 'unread', NULL, NULL),
(430, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111017.jpg', 'unread', NULL, NULL),
(431, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111018.jpg', 'read', NULL, '2024-12-04 19:12:53'),
(432, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111340.jpg', 'unread', NULL, NULL),
(433, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111341.jpg', 'unread', NULL, NULL),
(434, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111342.jpg', 'unread', NULL, NULL),
(435, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111343.jpg', 'unread', NULL, NULL),
(436, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111344.jpg', 'unread', NULL, NULL),
(437, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111345.jpg', 'unread', NULL, NULL),
(438, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111346.jpg', 'unread', NULL, NULL),
(439, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111347.jpg', 'unread', NULL, NULL),
(440, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111349.jpg', 'unread', NULL, NULL),
(441, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205111350.jpg', 'unread', NULL, NULL),
(442, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205194346.jpg', 'unread', NULL, NULL),
(443, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241205194347.jpg', 'unread', NULL, NULL),
(444, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104433.jpg', 'unread', NULL, NULL),
(445, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104434.jpg', 'unread', NULL, NULL),
(446, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104436.jpg', 'unread', NULL, NULL),
(447, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104438.jpg', 'unread', NULL, NULL),
(448, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104440.jpg', 'unread', NULL, NULL),
(449, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104441.jpg', 'unread', NULL, NULL),
(450, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104443.jpg', 'unread', NULL, NULL),
(451, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104444.jpg', 'unread', NULL, NULL),
(452, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104446.jpg', 'unread', NULL, NULL),
(453, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104448.jpg', 'unread', NULL, NULL),
(454, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104449.jpg', 'unread', NULL, NULL),
(455, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104451.jpg', 'unread', NULL, NULL),
(456, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104451.jpg', 'unread', NULL, NULL),
(457, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104453.jpg', 'unread', NULL, NULL),
(458, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104455.jpg', 'unread', NULL, NULL),
(459, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104455.jpg', 'unread', NULL, NULL),
(460, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104457.jpg', 'unread', NULL, NULL),
(461, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104459.jpg', 'unread', NULL, NULL),
(462, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104459.jpg', 'unread', NULL, NULL),
(463, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104501.jpg', 'unread', NULL, NULL),
(464, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241206104501.jpg', 'unread', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'Administrator', 'slsubits@gmail.com', '2024-11-29 22:40:41', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Administrator', 'yBa8bnQTV89QIrCOtaq9gGrGrlRXLcPo7zXwmx6QvDblkTWoleuxfwQSAQTn', '2024-11-29 22:40:41', '2024-11-29 22:40:41', 1),
(2, 'Helee Joy Oppus', 'oppus@gmail.com', NULL, '$2y$10$pkhA6SSkFk3pjn/cfyN5kOKjJp9nTL1Lz210yKYTOiWPyaCTveVPm', 'Employee', NULL, '2024-12-03 03:20:11', '2024-12-03 03:20:11', 2),
(3, 'Kylla Octobre', 'kyla@gmail.com', NULL, '$2y$10$RA/g8FBDHcGWHyuoxR86cO/SFKMHmQ6BkfICvPyXQ1L65c.qZM2wW', 'Employee', NULL, '2024-12-03 04:28:20', '2024-12-03 04:59:30', 2),
(4, 'SANDRA WABINA', 'wabina@gmail.com', NULL, '$2y$10$gtkwkSl.82gpIVa8PZ5a5.glLAEI6vsixjXqdWNxAYRP08TCt9V.a', 'Employee', NULL, '2024-12-03 22:06:08', '2024-12-03 22:06:08', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2024-11-29 22:40:37', '2024-11-29 22:40:37'),
(2, 'Employee', '2024-11-29 22:40:37', '2024-11-29 22:40:37'),
(3, 'Student', '2024-11-29 22:40:37', '2024-11-29 22:40:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`);

--
-- Indexes for table `biometrics`
--
ALTER TABLE `biometrics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `biometrics_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `biometrics`
--
ALTER TABLE `biometrics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `biometrics`
--
ALTER TABLE `biometrics`
  ADD CONSTRAINT `biometrics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`) ON DELETE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
