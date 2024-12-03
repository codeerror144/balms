-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2024 at 07:10 AM
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
  `logout_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `login_time`, `logout_time`) VALUES
(1, 2, '2024-12-01 06:05:50', '2024-12-01 06:10:17');

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
(2, 2, 'uploads/faces/face_2_1733012492.png', '2024-11-30 16:21:32', '2024-12-02 16:44:39', '3917250F'),
(3, 2, 'uploads/faces/face_2_1733012492.png', '2024-11-30 16:21:32', '2024-11-30 16:21:32', NULL),
(4, 2, 'uploads/faces/face_2_1733012492.png', '2024-11-30 16:21:32', '2024-11-30 16:21:32', NULL),
(5, 3, 'uploads/faces/face_3_1733207561.png', '2024-11-30 19:11:19', '2024-12-02 22:32:41', NULL),
(6, 3, 'uploads/faces/face_3_1733022679.png', '2024-11-30 19:11:19', '2024-11-30 19:11:19', NULL),
(7, 3, 'uploads/faces/face_3_1733022679.png', '2024-11-30 19:11:19', '2024-11-30 19:11:19', NULL),
(8, 4, 'uploads/faces/face_4_1733048835.png', '2024-12-01 02:27:04', '2024-12-01 02:27:15', NULL),
(9, 4, 'uploads/faces/face_4_1733048824.png', '2024-12-01 02:27:04', '2024-12-01 02:27:04', NULL),
(10, 4, 'uploads/faces/face_4_1733048824.png', '2024-12-01 02:27:04', '2024-12-01 02:27:04', NULL);

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
(2, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 10:21:02', 'entry'),
(5, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 10:24:51', 'exit'),
(174, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 18:27:49', 'entry'),
(175, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 18:27:50', 'entry'),
(176, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 20:00:21', 'entry'),
(177, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 20:00:33', 'entry'),
(178, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 20:15:03', 'entry'),
(179, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 20:15:16', 'entry'),
(180, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 20:16:47', 'entry'),
(181, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-01 20:16:50', 'entry'),
(182, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:35:37', 'entry'),
(183, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:35:57', 'entry'),
(184, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:39:00', 'entry'),
(185, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:39:03', 'entry'),
(186, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:40:22', 'entry'),
(187, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:41:23', 'entry'),
(188, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:42:04', 'entry'),
(189, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:45:50', 'entry'),
(190, 2, 'Room 1', NULL, NULL, '2024-12-02 22:43:04', 'exit'),
(191, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:46', 'entry'),
(192, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:47', 'entry'),
(193, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:48', 'entry'),
(194, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:48', 'entry'),
(195, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:49', 'entry'),
(196, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:50', 'entry'),
(197, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:51', 'entry'),
(198, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:52', 'entry'),
(199, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:53', 'entry'),
(200, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:53', 'entry'),
(201, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:54', 'entry'),
(202, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:55', 'entry'),
(203, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:56', 'entry'),
(204, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:57', 'entry'),
(205, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:58', 'entry'),
(206, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:59', 'entry'),
(207, 2, 'Room 1', NULL, NULL, '2024-12-02 22:46:59', 'entry'),
(208, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:00', 'entry'),
(209, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:01', 'entry'),
(210, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:02', 'entry'),
(211, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:03', 'entry'),
(212, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:03', 'entry'),
(213, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:04', 'entry'),
(214, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:05', 'entry'),
(215, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:06', 'entry'),
(216, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:07', 'entry'),
(217, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:07', 'entry'),
(218, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:08', 'entry'),
(219, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:09', 'entry'),
(220, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:10', 'entry'),
(221, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:11', 'entry'),
(222, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:11', 'entry'),
(223, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:12', 'entry'),
(224, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:13', 'entry'),
(225, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:14', 'entry'),
(226, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:14', 'entry'),
(227, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:15', 'entry'),
(228, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:16', 'entry'),
(229, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:17', 'entry'),
(230, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:17', 'entry'),
(231, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:18', 'entry'),
(232, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:19', 'entry'),
(233, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:20', 'entry'),
(234, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:20', 'entry'),
(235, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:23', 'entry'),
(236, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:24', 'entry'),
(237, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:25', 'entry'),
(238, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:25', 'entry'),
(239, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:26', 'entry'),
(240, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:27', 'entry'),
(241, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:28', 'entry'),
(242, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:28', 'entry'),
(243, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:29', 'entry'),
(244, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:30', 'entry'),
(245, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:31', 'entry'),
(246, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:31', 'entry'),
(247, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:32', 'entry'),
(248, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:33', 'entry'),
(249, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:34', 'entry'),
(250, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:34', 'entry'),
(251, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:35', 'entry'),
(252, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:36', 'entry'),
(253, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:37', 'entry'),
(254, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:37', 'entry'),
(255, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:40', 'entry'),
(256, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:42', 'entry'),
(257, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:43', 'entry'),
(258, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:44', 'entry'),
(259, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:45', 'entry'),
(260, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:45', 'entry'),
(261, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:46', 'entry'),
(262, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:47', 'entry'),
(263, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:48', 'entry'),
(264, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:48', 'entry'),
(265, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:49', 'entry'),
(266, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:50', 'entry'),
(267, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:51', 'entry'),
(268, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:51', 'entry'),
(269, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:53', 'entry'),
(270, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:54', 'entry'),
(271, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:55', 'entry'),
(272, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:56', 'entry'),
(273, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:57', 'entry'),
(274, 2, 'Room 1', NULL, NULL, '2024-12-02 22:47:58', 'entry'),
(275, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:03', 'entry'),
(276, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:04', 'entry'),
(277, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:06', 'entry'),
(278, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:07', 'entry'),
(279, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:08', 'entry'),
(280, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:09', 'entry'),
(281, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:09', 'entry'),
(282, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:10', 'entry'),
(283, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:11', 'entry'),
(284, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:18', 'entry'),
(285, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:18', 'entry'),
(286, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:19', 'entry'),
(287, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:20', 'entry'),
(288, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:21', 'entry'),
(289, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:21', 'entry'),
(290, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:22', 'entry'),
(291, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:23', 'entry'),
(292, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:24', 'entry'),
(293, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:24', 'entry'),
(294, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:25', 'entry'),
(295, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:26', 'entry'),
(296, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:27', 'entry'),
(297, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:28', 'entry'),
(298, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:28', 'entry'),
(299, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:29', 'entry'),
(300, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:30', 'entry'),
(301, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:31', 'entry'),
(302, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:31', 'entry'),
(303, 4, 'Room 1', NULL, NULL, '2024-12-02 22:46:50', 'exit'),
(304, 4, 'Room 1', NULL, NULL, '2024-12-02 22:48:32', 'entry'),
(305, 4, 'Room 1', NULL, NULL, '2024-12-02 22:48:34', 'entry'),
(306, 4, 'Room 1', NULL, NULL, '2024-12-02 22:48:35', 'entry'),
(307, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:36', 'entry'),
(308, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:37', 'entry'),
(309, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:37', 'entry'),
(310, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:46', 'entry'),
(311, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:47', 'entry'),
(312, 4, 'Room 1', NULL, NULL, '2024-12-02 22:48:47', 'entry'),
(313, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:48', 'entry'),
(314, 2, 'Room 1', NULL, NULL, '2024-12-02 22:48:49', 'entry'),
(315, 3, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:49:13', 'entry'),
(316, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:49:14', 'entry'),
(317, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:49:20', 'entry'),
(318, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:50:15', 'exit'),
(319, 3, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:50:31', 'exit'),
(320, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 22:50:34', 'exit'),
(321, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 23:01:59', 'entry'),
(322, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 23:02:02', 'entry'),
(323, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 23:04:03', 'entry'),
(324, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-02 23:04:04', 'entry'),
(325, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 08:48:52', 'entry'),
(326, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 08:49:15', 'entry'),
(327, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 09:24:17', 'entry'),
(328, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 09:24:27', 'entry'),
(329, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 09:26:25', 'entry'),
(330, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 09:26:28', 'entry'),
(331, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 09:34:00', 'entry'),
(332, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 12:53:09', 'entry'),
(333, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 12:53:21', 'entry'),
(334, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 12:55:12', 'entry'),
(335, 3, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 13:33:01', 'entry'),
(336, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 13:33:03', 'entry'),
(337, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 13:34:30', 'exit'),
(338, 3, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 13:34:55', 'exit'),
(339, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:24:17', 'entry'),
(340, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:24:27', 'entry'),
(341, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:28:53', 'entry'),
(342, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:28:55', 'entry'),
(343, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:29:58', 'entry'),
(344, 4, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:30:12', 'entry'),
(345, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:35:03', 'entry'),
(346, 3, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:35:30', 'entry'),
(347, 2, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:39:14', 'entry'),
(348, 3, 'Computer Laboratory 3', NULL, NULL, '2024-12-03 14:39:24', 'entry');

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
(15, '2024_11_24_051600_drop_method_column_from_logs_table', 1);

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
(13, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110826.jpg', 'unread', NULL, NULL),
(14, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110827.jpg', 'read', NULL, '2024-12-02 22:41:47'),
(15, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110828.jpg', 'unread', NULL, NULL),
(16, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110829.jpg', 'unread', NULL, NULL),
(17, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241201110830.jpg', 'unread', NULL, NULL),
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
(130, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203133428.jpg', 'unread', NULL, NULL),
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
(167, 'Unknown User', 'Unknown user face saved at public\\unregister_user\\unknown_user_20241203143540.jpg', 'read', NULL, '2024-12-02 22:41:40');

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
(2, 'Helee Joy Oppus N.', 'oppus@gmail.com', NULL, '$2y$10$9q6m8frrHLVg6dt4KgBlRugBZOQ2kFBTD1r3hlmlgOLjWEE4ivx8.', 'Employee', NULL, '2024-11-30 16:20:20', '2024-12-02 04:09:13', 2),
(3, 'Dennis Amparo O.', 'amparo@gmail.com', NULL, '$2y$10$8DCN8hCXzgtgaAmudE77uOlW7h0vCheV2QmY81LO0EhMg8GM9cPfq', 'Student', NULL, '2024-11-30 19:10:41', '2024-12-02 04:08:57', 3),
(4, 'Anna Pontod', 'pontod@gmail.com', NULL, '$2y$10$zWwakWjO42OJ/4aR09SdgulPBKsywHJjUYKRy9P6Sw0NVuhBMM4A6', 'Student', NULL, '2024-12-01 02:26:11', '2024-12-01 02:26:11', 3);

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `biometrics`
--
ALTER TABLE `biometrics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

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
