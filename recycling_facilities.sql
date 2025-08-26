-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2025 at 12:02 PM
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
-- Database: `recycling_facilities`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `last_update_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `business_name`, `street_address`, `city`, `state`, `postal_code`, `last_update_date`, `created_at`, `updated_at`) VALUES
(1, 'Green Earth Recycling', '123 Main Ave', 'New York', 'NY', '11001', '2022-11-13 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(2, 'E-Waste Recycling', '45 Main St', 'New York', 'NY', '11201', '2022-09-09 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(3, 'Hudson Valley E-Waste', '200 Market St', 'Albany', 'NY', '12207', '2022-09-30 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(4, 'Manhattan Green Disposal', '70 Broadway', 'New York', 'NY', '10007', '2022-07-14 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(5, 'Upstate Reuse Center', '141 Elm St', 'Rochester', 'NY', '14604', '2022-08-11 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(6, 'Bronx Eco Center', '1200 Grand St', 'Bronx', 'NY', '10451', '2022-05-21 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(7, 'Staten Island Reuse', '201 Bay St', 'Staten Island', 'NY', '10301', '2022-07-11 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(8, 'Queens Recycling Hub', '99-12 150th St', 'Queens', 'NY', '11435', '2022-10-17 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(9, 'Brooklyn Materials Recovery', '405 Atlantic Ave', 'Brooklyn', 'NY', '11217', '2022-07-24 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(10, 'NY Sustainable Solutions', '900 Madison Ave', 'New York', 'NY', '10021', '2022-11-20 18:30:00', '2025-08-25 07:59:04', '2025-08-25 07:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `facility_material`
--

CREATE TABLE `facility_material` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facility_material`
--

INSERT INTO `facility_material` (`id`, `facility_id`, `material_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 3),
(8, 3, 7),
(9, 3, 8),
(10, 4, 9),
(11, 4, 10),
(12, 4, 11),
(13, 5, 12),
(14, 5, 13),
(15, 5, 14),
(16, 6, 1),
(17, 6, 15),
(18, 6, 16),
(19, 7, 4),
(20, 7, 17),
(21, 7, 18),
(22, 8, 2),
(23, 8, 19),
(24, 8, 20),
(25, 9, 5),
(26, 9, 6),
(27, 9, 21),
(28, 10, 1),
(29, 10, 22),
(30, 10, 14);

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
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Computers', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(2, 'Smartphones', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(3, 'Laptops', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(4, 'Paper', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(5, 'Glass', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(6, 'Aluminum', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(7, 'Servers', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(8, 'Cables', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(9, 'Cellphones', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(10, 'Chargers', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(11, 'Small Electronics', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(12, 'Batteries', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(13, 'Power Supplies', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(14, 'Printers', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(15, 'Monitors', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(16, 'Printer Cartridges', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(17, 'Cardboard', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(18, 'Desktops', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(19, 'Tablets', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(20, 'Lithium Batteries', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(21, 'Steel', '2025-08-25 07:59:04', '2025-08-25 07:59:04'),
(22, 'LED Bulbs', '2025-08-25 07:59:04', '2025-08-25 07:59:04');

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
(4, '2025_08_24_151821_create_facilities_table', 1),
(5, '2025_08_24_152126_create_materials_table', 1),
(6, '2025_08_24_152132_create_facility_material_table', 1);

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
('oqGZ15xi3e3voiiuzjhkjGOFbxrytukOTkU8U0EY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoia280b3pFWUE1T05FdnNma0dtZUl5ZGNmY216S29EZjJSeWt4WHRyUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mYWNpbGl0aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2ZhY2lsaXRpZXMiO319', 1756202100);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-08-25 07:55:51', '$2y$12$qlWi9c.AvHG7EGKT/UBIp.euxDZ3QKN4oW0y2yrAg1BzgWMgIafBi', 'YsUXk0bADJEgRhhHI7xMNJhXH6AzTr01KlaQLujV4B6OOqDzmzxjsYkPk5jP', '2025-08-25 07:55:51', '2025-08-25 07:55:51'),
(2, 'daksh', 'daksh@gmail.com', NULL, '$2y$12$VBNu0F0A3s2C9fkvmA/WiurVZJTfRWV3kRnx/e9fX9/xfhI.def.e', NULL, '2025-08-26 04:01:06', '2025-08-26 04:01:06');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facility_material`
--
ALTER TABLE `facility_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_material_facility_id_foreign` (`facility_id`),
  ADD KEY `facility_material_material_id_foreign` (`material_id`);

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
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `facility_material`
--
ALTER TABLE `facility_material`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

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
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facility_material`
--
ALTER TABLE `facility_material`
  ADD CONSTRAINT `facility_material_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `facility_material_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
