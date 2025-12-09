-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Des 2025 pada 04.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_spending`
--

CREATE TABLE `detail_spending` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `spending_report_id` bigint(20) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_spending`
--

INSERT INTO `detail_spending` (`id`, `spending_report_id`, `nama_barang`, `jumlah`, `harga`, `supplier`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 39, 'kunci T', 2, 10000, 'tekiro', 'kunci T kemarin', '2025-10-30 04:04:52', '2025-10-30 04:04:52'),
(2, 40, 'kunci T', 2, 10000, 'tekiro', 'kunci T kemarin', '2025-10-30 04:27:34', '2025-10-30 04:27:34'),
(3, 40, 'ring', 3, 15000, 'tekiro', 'kunci Ring kemarin', '2025-10-30 04:27:34', '2025-10-30 04:27:34'),
(4, 41, 'kunci T', 2, 10000, 'tekiro', 'kunci T kemarin', '2025-10-30 04:27:59', '2025-10-30 04:27:59'),
(5, 41, 'ring', 3, 15000, 'tekiro', 'kunci Ring kemarin', '2025-10-30 04:27:59', '2025-10-30 04:27:59'),
(6, 42, 'kunci T', 3, 122121, 'tekiro', 'kunci T kemarin', '2025-11-05 00:01:09', '2025-11-05 00:01:09'),
(7, 42, 'dawadw', 2, 12311, 'dawwa', 'adas', '2025-11-05 00:01:09', '2025-11-05 00:01:09'),
(8, 43, 'kunci T', 2, 131, '1dwa', 'dawa', '2025-11-05 00:33:03', '2025-11-05 00:33:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_23_032830_create_personal_access_tokens_table', 1),
(5, '2025_09_23_114943_create_produk_table', 1),
(6, '2025_09_23_131854_create_transaksi_table', 1),
(7, '2025_09_27_163455_create_transaksi_detail_table', 1),
(8, '2025_10_30_072406_create_spending_reports_table', 2),
(9, '2025_10_30_000001_create_detail_spending_table', 3),
(10, '2025_11_04_042452_create_personal_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'fec724cf0b285412c6f017233cabcfef707004070cb438cc19dbf74bfe177488', '[\"*\"]', NULL, NULL, '2025-11-03 23:18:44', '2025-11-03 23:18:44'),
(2, 'App\\Models\\User', 7, 'auth_token', '1db819a85e7bb9bed51ae30210cd8e30ab616d2f427043c6a654ca1a141ff52c', '[\"*\"]', NULL, NULL, '2025-11-03 23:19:45', '2025-11-03 23:19:45'),
(3, 'App\\Models\\User', 7, 'auth_token', '1b18234fd945792aa64d6068c1d918ef7cd0075e8da9aad0863d7a55726733ee', '[\"*\"]', NULL, NULL, '2025-11-03 23:19:46', '2025-11-03 23:19:46'),
(4, 'App\\Models\\User', 7, 'auth_token', '68fbca2b968860d2ec9cd11467644230c1e3eab855c187b86a0c630a02f48f72', '[\"*\"]', NULL, NULL, '2025-11-03 23:19:48', '2025-11-03 23:19:48'),
(5, 'App\\Models\\User', 7, 'auth_token', 'c8ec116b2686af6c4d441a3a0fced10e72820b3dad64a795712c10a7acb9ca55', '[\"*\"]', NULL, NULL, '2025-11-03 23:19:49', '2025-11-03 23:19:49'),
(6, 'App\\Models\\User', 1, 'auth_token', '3bb556aa47528d489e03b7f67bdb76112ecc6d72ee2876cd7b6f01d8e4797a56', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:14', '2025-11-03 23:20:14'),
(7, 'App\\Models\\User', 1, 'auth_token', 'ec77c6a866d015a38efedbdabc3511697f0126e4b0ae3bc21a5f4df19a3d11cd', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:16', '2025-11-03 23:20:16'),
(8, 'App\\Models\\User', 1, 'auth_token', '2167ecadc4d80606ce9e930b68b28a2beb81c8dc70a8ff933c7622e3a0f5e164', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:17', '2025-11-03 23:20:17'),
(9, 'App\\Models\\User', 1, 'auth_token', '812dadcee5af64e81db04dbde5203be489a043f788c44239940156dc90aa1637', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:18', '2025-11-03 23:20:18'),
(10, 'App\\Models\\User', 1, 'auth_token', '203b92c1aaf855638fbfee23cfad5362e267dae62befe1d0ebbbafe21494bb64', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:18', '2025-11-03 23:20:18'),
(11, 'App\\Models\\User', 1, 'auth_token', '321f5d61a3b118dc379c67ebf109dddc906ac3d2970a5afee36cf8e150fa40f8', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:19', '2025-11-03 23:20:19'),
(12, 'App\\Models\\User', 1, 'auth_token', '13029416711e56e92a4e2d760e7979f31faaa480583f130052389a1e98beaf5a', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:20', '2025-11-03 23:20:20'),
(13, 'App\\Models\\User', 1, 'auth_token', 'df71c174d1ae7aea7b2139058d1b62000747e71a9abd1663401c7c1dfd8000eb', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:21', '2025-11-03 23:20:21'),
(14, 'App\\Models\\User', 1, 'auth_token', 'dcb1ec33c3fee0fd52daeeec5b2f3fb4666ac429781729207ff93e12d143f7b9', '[\"*\"]', NULL, NULL, '2025-11-03 23:20:22', '2025-11-03 23:20:22'),
(15, 'App\\Models\\User', 1, 'auth_token', '0daa63dd80bb11dfbc4b907705894eb76870f49de6f75919f8a6596b0afcb89f', '[\"*\"]', NULL, NULL, '2025-11-03 23:25:04', '2025-11-03 23:25:04'),
(16, 'App\\Models\\User', 1, 'auth_token', '8d3c2c3008aec787a4db004cfed08e8377fcfd305e48de3410aca10c5fb4fa85', '[\"*\"]', NULL, NULL, '2025-11-03 23:26:49', '2025-11-03 23:26:49'),
(17, 'App\\Models\\User', 1, 'auth_token', '2771c08e4acb54065227c73fb67082cc89680b367d80705d04e387ca5e21c081', '[\"*\"]', NULL, NULL, '2025-11-03 23:29:06', '2025-11-03 23:29:06'),
(18, 'App\\Models\\User', 1, 'auth_token', 'd8462138c188627d61ab7d0f6d558f109d02d11bbc88c1a8bb88e3d50735f16d', '[\"*\"]', NULL, NULL, '2025-11-03 23:30:30', '2025-11-03 23:30:30'),
(19, 'App\\Models\\User', 7, 'auth_token', '6f253c38e7c32868136dd048c776e45ae61730c1657dca36939e13f2c1744e59', '[\"*\"]', NULL, NULL, '2025-11-03 23:36:00', '2025-11-03 23:36:00'),
(20, 'App\\Models\\User', 1, 'auth_token', '7d333244db4ace2f7e983889c174cc612e72fdf4340179b8b524a33746590107', '[\"*\"]', NULL, NULL, '2025-11-03 23:50:19', '2025-11-03 23:50:19'),
(21, 'App\\Models\\User', 1, 'auth_token', '2ecdb6b69f42da513e72f49848f40b014d704dac8943d662e2115b6f0a6713b1', '[\"*\"]', NULL, NULL, '2025-11-04 00:18:39', '2025-11-04 00:18:39'),
(22, 'App\\Models\\User', 7, 'auth_token', 'f27519b33e9bcfe59954429ee4f53cb5a64dcb2d643cf18f391b405a481f1a8f', '[\"*\"]', '2025-11-04 00:21:58', NULL, '2025-11-04 00:18:51', '2025-11-04 00:21:58'),
(23, 'App\\Models\\User', 7, 'auth_token', '64d2d33cca60e4f69a8bf15934cd168b056d6e447e9383081a111126c83dd617', '[\"*\"]', '2025-11-04 00:41:04', NULL, '2025-11-04 00:23:08', '2025-11-04 00:41:04'),
(24, 'App\\Models\\User', 1, 'auth_token', '061f2f6adbcabe4b69e4a491302113c6b1740f2148b306db00b8a411faf82b48', '[\"*\"]', NULL, NULL, '2025-11-04 04:01:37', '2025-11-04 04:01:37'),
(25, 'App\\Models\\User', 7, 'auth_token', '91b9ac1df05f6e591ae545cb433aece850110359c6ce2cf0bbba8cf735e936e4', '[\"*\"]', NULL, NULL, '2025-11-04 04:06:02', '2025-11-04 04:06:02'),
(26, 'App\\Models\\User', 7, 'auth_token', '38ab853d9973906c0ff7ab937797ef6b1a089a0b49e8d984e77d7a835daf212c', '[\"*\"]', NULL, NULL, '2025-11-04 04:06:03', '2025-11-04 04:06:03'),
(27, 'App\\Models\\User', 7, 'auth_token', 'b4ef33938593f70f8c155bc315e021e002b2f1356a5ea440dfef987a995d41f8', '[\"*\"]', NULL, NULL, '2025-11-04 04:06:04', '2025-11-04 04:06:04'),
(28, 'App\\Models\\User', 7, 'auth_token', '9c93e2f5ed53791f8809939e124f61ea5e99a35517dc6ff1a8fa28ee4937d3f4', '[\"*\"]', '2025-11-04 04:11:11', NULL, '2025-11-04 04:06:04', '2025-11-04 04:11:11'),
(29, 'App\\Models\\User', 1, 'auth_token', '4ab19f22c8937084c87ffd061bf4ec788cda6c435ca196d7467e0b4bc78e7c40', '[\"*\"]', NULL, NULL, '2025-11-04 04:13:04', '2025-11-04 04:13:04'),
(30, 'App\\Models\\User', 1, 'auth_token', '91f8791de830dc5e349c339a6ff63915e5392bbf04d253d3dbe804c5e3a56b99', '[\"*\"]', NULL, NULL, '2025-11-04 04:15:06', '2025-11-04 04:15:06'),
(31, 'App\\Models\\User', 1, 'auth_token', '194e28e041207391c97daf730330ea745fda78260be6641984c6503befe4c8db', '[\"*\"]', NULL, NULL, '2025-11-04 04:30:46', '2025-11-04 04:30:46'),
(32, 'App\\Models\\User', 7, 'auth_token', 'c6df607fe109af6f48ffa4facc8140567c537c4c54fa7036a23ec4cb17c8ee63', '[\"*\"]', '2025-11-04 04:31:07', NULL, '2025-11-04 04:31:01', '2025-11-04 04:31:07'),
(33, 'App\\Models\\User', 7, 'auth_token', 'b01898a2f9a74198b2e3b3aa543b6449c115b07ccb471c82ec925f80f3deccb9', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:16', '2025-11-05 00:00:16'),
(34, 'App\\Models\\User', 7, 'auth_token', 'fcbdea53cd2056d2f346903cf5a1138f21eda058de7f77bc3cf5baf5d9174ad4', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:17', '2025-11-05 00:00:17'),
(35, 'App\\Models\\User', 7, 'auth_token', 'b7fb4ee027fc4b25f59fe0ac29ceb1c80a266070d0a060f9e122854ae4001e9c', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:19', '2025-11-05 00:00:19'),
(36, 'App\\Models\\User', 7, 'auth_token', 'e2d5ebe42d66a89386d1347244b66b823e58212a11e34e2de524d17a025e99b4', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:19', '2025-11-05 00:00:19'),
(37, 'App\\Models\\User', 7, 'auth_token', '19d0c0d45ed09a77d87d315555d42917b96fbfd3fc4d7b2ffc125e248e906bf1', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:19', '2025-11-05 00:00:19'),
(38, 'App\\Models\\User', 7, 'auth_token', '4e46386573889473bf4eeb578082e0379928308cf41685e76a04363f50a9a1d0', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:20', '2025-11-05 00:00:20'),
(39, 'App\\Models\\User', 7, 'auth_token', '176e40a8d5e0eb715a9c0fc3f9efca3a0bab0a4bf450bc3f32494939e8c77135', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:20', '2025-11-05 00:00:20'),
(40, 'App\\Models\\User', 7, 'auth_token', '786ae5d92fe98e5ddad08ad951161c1c49bae76306c231351e34f8428bd4f1b3', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:20', '2025-11-05 00:00:20'),
(41, 'App\\Models\\User', 7, 'auth_token', '8ea588f5d4f81e101853ceee7d6295333e17ab6f1d005d23b2a518945e3f07a5', '[\"*\"]', NULL, NULL, '2025-11-05 00:00:21', '2025-11-05 00:00:21'),
(42, 'App\\Models\\User', 7, 'auth_token', '6cf632741b7708130dd8e0201f0e26ff46b361a60b508e1437bba3e44d15992a', '[\"*\"]', '2025-11-05 00:07:37', NULL, '2025-11-05 00:00:21', '2025-11-05 00:07:37'),
(43, 'App\\Models\\User', 7, 'auth_token', '1af944d4c1470942f7d7cb76cfbc6f5eea2e44730176398686019463b431016f', '[\"*\"]', NULL, NULL, '2025-11-05 00:07:50', '2025-11-05 00:07:50'),
(44, 'App\\Models\\User', 7, 'auth_token', '05400cd5e4f83a69f6fb61bca17405f4ecb9563cc964fabc8a71e4e82dd1d3a1', '[\"*\"]', NULL, NULL, '2025-11-05 00:27:16', '2025-11-05 00:27:16'),
(45, 'App\\Models\\User', 7, 'auth_token', '292147823412c26f747dae11764cbbc3cf532e689db90173eb0b6e466b883b7c', '[\"*\"]', NULL, NULL, '2025-11-05 00:27:18', '2025-11-05 00:27:18'),
(46, 'App\\Models\\User', 7, 'auth_token', '3f1c0e9a41d78be3f7177be9f416be4c121ea7a0c5589bfaf8df461890683c3f', '[\"*\"]', NULL, NULL, '2025-11-05 00:29:10', '2025-11-05 00:29:10'),
(47, 'App\\Models\\User', 7, 'auth_token', '3a3d0c243fdc0af75222c49a4c424a8ff0f07dc323d0eeefe8ae3438183e8e2c', '[\"*\"]', NULL, NULL, '2025-11-05 04:38:10', '2025-11-05 04:38:10'),
(48, 'App\\Models\\User', 7, 'auth_token', '6dac15a468d631097c0d560367a44e43b9f2193754a6ca60f2948bc48c713d84', '[\"*\"]', '2025-11-05 04:58:01', NULL, '2025-11-05 04:38:12', '2025-11-05 04:58:01'),
(49, 'App\\Models\\User', 7, 'auth_token', '1149e2df130e450b904d610381a9163e759c992341634e3317de97f9bdcf4a69', '[\"*\"]', NULL, NULL, '2025-11-10 19:34:12', '2025-11-10 19:34:12'),
(50, 'App\\Models\\User', 7, 'auth_token', '1bf4d17be4fced2e6ba94613cff418cd98ae10ae123377fecb8359de46cd2609', '[\"*\"]', NULL, NULL, '2025-11-10 19:34:15', '2025-11-10 19:34:15'),
(51, 'App\\Models\\User', 7, 'auth_token', '07247a64415b35e2c55f9ba1d04f7d9d2e39d83441fa6f67d18acb5bdbbbe136', '[\"*\"]', NULL, NULL, '2025-11-10 19:34:15', '2025-11-10 19:34:15'),
(52, 'App\\Models\\User', 7, 'auth_token', '10477efd9be70518a0e8af9826b37fdcc5b9ed1cdbea3ddcc53e29352663dda4', '[\"*\"]', '2025-11-10 19:34:48', NULL, '2025-11-10 19:34:16', '2025-11-10 19:34:48'),
(53, 'App\\Models\\User', 1, 'auth_token', '54a888702f9934c1c550f133f3a608292cdcb5632ba40b6f73d11a74d49a9edf', '[\"*\"]', '2025-11-10 19:45:07', NULL, '2025-11-10 19:35:31', '2025-11-10 19:45:07'),
(54, 'App\\Models\\User', 7, 'auth_token', '67797b1480fa6fc8cb4e76e0687e172d83835a1eafc3ac19f1598c04f74c91eb', '[\"*\"]', NULL, NULL, '2025-11-10 19:53:11', '2025-11-10 19:53:11'),
(55, 'App\\Models\\User', 7, 'auth_token', 'b89f17ddaf3be6ab2684e2c6aed03357a81b3ad9eac9ca8190eee9c55bba2fe6', '[\"*\"]', NULL, NULL, '2025-11-10 19:53:13', '2025-11-10 19:53:13'),
(56, 'App\\Models\\User', 7, 'auth_token', 'e62b62c149d1c64ad2567b4cab42967f37e8420b14937be31613ea6c8e4a63f0', '[\"*\"]', NULL, NULL, '2025-11-10 19:53:14', '2025-11-10 19:53:14'),
(57, 'App\\Models\\User', 7, 'auth_token', 'e17f873975f90b751749b4e30876b4be87f642e021bc0c4be4ad4b0bc33f9f09', '[\"*\"]', '2025-11-10 20:01:41', NULL, '2025-11-10 19:53:15', '2025-11-10 20:01:41'),
(58, 'App\\Models\\User', 7, 'auth_token', '35b11018446f8caca20212c6f86c844e7c2b478afef41ac24cd5dd7d75ea9151', '[\"*\"]', NULL, NULL, '2025-11-10 20:09:48', '2025-11-10 20:09:48'),
(59, 'App\\Models\\User', 7, 'auth_token', '8e59a0d8d3beb8425332c09b2d6a86f951725c7e277db1f6c673aa4e9f90ee98', '[\"*\"]', '2025-11-10 20:12:01', NULL, '2025-11-10 20:10:57', '2025-11-10 20:12:01'),
(60, 'App\\Models\\User', 7, 'auth_token', 'bec96bb6993eceed465475b8d72372dcb8ef4ca5959fb1114d34dd1362d326a9', '[\"*\"]', NULL, NULL, '2025-11-14 04:30:06', '2025-11-14 04:30:06'),
(61, 'App\\Models\\User', 1, 'auth_token', '81712ea7f8a3b0aabcf12bc6c90bd6ab2b6c5e8cd1ce031d01f915a8c403c75f', '[\"*\"]', NULL, NULL, '2025-11-14 04:30:32', '2025-11-14 04:30:32'),
(62, 'App\\Models\\User', 1, 'test-token', '39e3ccb0b0f6c43ed3fbb521a55bb999d47dfc0b60707085d8aed85ffaf36307', '[\"*\"]', NULL, NULL, '2025-11-18 20:39:38', '2025-11-18 20:39:38'),
(63, 'App\\Models\\User', 7, 'auth_token', '18aa903d216d67a5107859ec94054fa8bd1668960d03ccda7fa2cea3ec27afbd', '[\"*\"]', '2025-11-24 01:12:35', NULL, '2025-11-24 01:12:29', '2025-11-24 01:12:35'),
(64, 'App\\Models\\User', 1, 'auth_token', 'f86b002288050574b74d5a297e8ededed73119986fb0f4255b9f4789a5f32a2b', '[\"*\"]', NULL, NULL, '2025-11-24 01:14:32', '2025-11-24 01:14:32'),
(65, 'App\\Models\\User', 7, 'auth_token', '084ce8b7ac11af823bce05b4b9f15730deb7c272b3c5927f04f13a0958673704', '[\"*\"]', '2025-11-24 01:25:48', NULL, '2025-11-24 01:20:54', '2025-11-24 01:25:48'),
(66, 'App\\Models\\User', 7, 'auth_token', 'bd03919e2bdd78ac0735d41b1d925fd1f46fd416c236232d27e7fe66568fb4d5', '[\"*\"]', '2025-11-24 02:01:37', NULL, '2025-11-24 01:48:56', '2025-11-24 02:01:37'),
(67, 'App\\Models\\User', 1, 'auth_token', 'b4574af76231d4e6af8ecd26e577be013f04a620a4fa9d149586a0593eb7520d', '[\"*\"]', NULL, NULL, '2025-11-30 08:16:03', '2025-11-30 08:16:03'),
(68, 'App\\Models\\User', 7, 'auth_token', '99ffbeecb389bc4710260f9dd2ce6f3672219f364cafb2c56100187aad945207', '[\"*\"]', NULL, NULL, '2025-11-30 08:18:16', '2025-11-30 08:18:16'),
(69, 'App\\Models\\User', 1, 'auth_token', '39cfff052a8978573313c2ee07a654ece08af1f3cda155c701ae97c65ffc9697', '[\"*\"]', NULL, NULL, '2025-11-30 08:22:13', '2025-11-30 08:22:13'),
(70, 'App\\Models\\User', 1, 'auth_token', 'aa7e8e83a2d56d619fac594e4daae7aedfacfd58ac4a3e4de0efc0300bba3e11', '[\"*\"]', NULL, NULL, '2025-11-30 08:32:59', '2025-11-30 08:32:59'),
(71, 'App\\Models\\User', 1, 'auth_token', 'd01aa0dcbfc662b1f1e7bae8b89962890e074353eb67d375e5a5a704f97dac4a', '[\"*\"]', NULL, NULL, '2025-11-30 09:02:33', '2025-11-30 09:02:33'),
(72, 'App\\Models\\User', 12, 'auth_token', 'dfab0221b56affee8cdb00d2ccc5c14e0c5187cc3a30fe97bee6dfff4418c00e', '[\"*\"]', NULL, NULL, '2025-11-30 09:03:04', '2025-11-30 09:03:04'),
(73, 'App\\Models\\User', 7, 'auth_token', '28e8bc8c6fe1460ee22ae6d6b2e05e7dec63b9f5c95d38f296fffaa541175ce1', '[\"*\"]', '2025-11-30 09:21:22', NULL, '2025-11-30 09:19:56', '2025-11-30 09:21:22'),
(74, 'App\\Models\\User', 1, 'auth_token', '35f4f6b0e833af53f34ff4149b5d5832533e8b6624d03cfbbb27765dcfe7454b', '[\"*\"]', NULL, NULL, '2025-11-30 19:32:25', '2025-11-30 19:32:25'),
(75, 'App\\Models\\User', 1, 'auth_token', '5dc19e689f130acf45e018e4f523ba1e388d7124c888d1d81d1fc5fc325dd38c', '[\"*\"]', NULL, NULL, '2025-11-30 19:32:27', '2025-11-30 19:32:27'),
(76, 'App\\Models\\User', 1, 'auth_token', '46c6b68a44bdd6f5571f4bb77cb52b9fb1022ff172237d3f8926f88d5fb9e068', '[\"*\"]', NULL, NULL, '2025-11-30 19:32:28', '2025-11-30 19:32:28'),
(77, 'App\\Models\\User', 1, 'auth_token', 'c72130b5868a05af09195676119341f762b0f4e7c660e93d95f0dfedbf4997ac', '[\"*\"]', NULL, NULL, '2025-11-30 19:32:30', '2025-11-30 19:32:30'),
(78, 'App\\Models\\User', 1, 'auth_token', '53d16afcd501fec16064d62153e6b1bea406acaef2f12f2ae0bd269eb2354184', '[\"*\"]', NULL, NULL, '2025-11-30 19:32:30', '2025-11-30 19:32:30'),
(79, 'App\\Models\\User', 1, 'auth_token', '7e009963473f27120ae68484e43f4b69651718dc401b0433d0ffa944a00b7740', '[\"*\"]', NULL, NULL, '2025-11-30 19:32:31', '2025-11-30 19:32:31'),
(80, 'App\\Models\\User', 7, 'auth_token', '79d759be86b2a91092e0f3af71ad6f3cc64435d6833b8e23069db50e3c211f90', '[\"*\"]', NULL, NULL, '2025-12-08 20:31:11', '2025-12-08 20:31:11'),
(81, 'App\\Models\\User', 7, 'auth_token', 'b28ea16fe8baff3d6702586c54491a6cd327f7b76ecb79474adcd33478cc96a7', '[\"*\"]', '2025-12-08 20:31:17', NULL, '2025-12-08 20:31:13', '2025-12-08 20:31:17'),
(82, 'App\\Models\\User', 7, 'auth_token', '8a9e588dc0f7526b230f58531eb95a907d6adc19bd35c734163795a0f39e5d7f', '[\"*\"]', NULL, NULL, '2025-12-08 20:38:54', '2025-12-08 20:38:54'),
(83, 'App\\Models\\User', 1, 'auth_token', '0b750e6cbcfc7c25edda94e0c0205d1f614193b2c9b178a567f8e6176fdcf832', '[\"*\"]', NULL, NULL, '2025-12-08 20:39:04', '2025-12-08 20:39:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `id_barcode` varchar(100) DEFAULT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga_modal` decimal(15,2) NOT NULL,
  `harga_jual` decimal(15,2) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_barcode`, `nama_produk`, `harga_modal`, `harga_jual`, `kategori`, `lokasi`, `stok`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Oli Mesin 1L', 35000.00, 50000.00, 'Pelumas', 'Rak A1', 3, '2025-10-14 05:10:53', '2025-11-03 23:51:04'),
(2, NULL, 'Busi Motor', 12000.00, 18000.00, 'Sparepart', 'Rak B2', 1, '2025-10-14 05:10:53', '2025-11-04 04:17:47'),
(3, NULL, 'Kampas Rem', 15000.00, 22000.00, 'Sparepart', 'Rak B3', 7, '2025-10-14 05:10:53', '2025-11-03 23:51:05'),
(4, NULL, 'Aki Motor', 95000.00, 120000.00, 'Aki', 'Rak C1', 4, '2025-10-14 05:10:53', '2025-11-04 04:17:47'),
(5, NULL, 'Filter Udara', 18000.00, 25000.00, 'Sparepart', 'Rak B4', 6, '2025-10-14 05:10:53', '2025-10-30 20:28:45'),
(6, NULL, 'Lampu Depan', 22000.00, 35000.00, 'Aksesoris', 'Rak D1', 13, '2025-10-14 05:10:53', '2025-10-22 19:31:13'),
(7, NULL, 'Ban Luar', 120000.00, 150000.00, 'Ban', 'Rak E1', 7, '2025-10-14 05:10:53', '2025-10-14 05:10:53'),
(8, '111111', 'Ban Dalam', 25000.00, 35000.00, 'Ban', 'Rak E2', 18, '2025-10-14 05:10:53', '2025-11-30 09:21:22'),
(9, '654321', 'Rantai Motor', 40000.00, 60000.00, 'Sparepart', 'Rak B5', 9, '2025-10-14 05:10:53', '2025-11-30 09:21:15'),
(10, '123456', 'Oli Gardan', 20000.00, 30000.00, 'Pelumas', 'Rak A2', 8, '2025-10-14 05:10:53', '2025-11-30 09:21:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spending_reports`
--

CREATE TABLE `spending_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `spending_reports`
--

INSERT INTO `spending_reports` (`id`, `keterangan`, `jumlah`, `kategori`, `tanggal`, `harga`, `created_at`, `updated_at`) VALUES
(39, 'Kunci', NULL, 'alat', '2025-10-30', 10000, '2025-10-30 04:04:52', '2025-10-30 04:04:52'),
(40, 'Kunci', NULL, 'alat', '2025-10-30', 65000, '2025-10-30 04:27:34', '2025-10-30 04:27:34'),
(41, 'Kuncii', NULL, 'alat', '2025-10-30', 65000, '2025-10-30 04:27:59', '2025-10-30 04:27:59'),
(42, 'Kunci', NULL, 'alat', '2025-11-05', 390985, '2025-11-05 00:01:09', '2025-11-05 00:01:09'),
(43, 'kondom', NULL, 'alat', '2025-11-05', 262, '2025-11-05 00:33:03', '2025-11-05 00:33:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `tanggal` datetime NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `nama_kasir` varchar(255) NOT NULL,
  `total_pembayaran` decimal(15,2) NOT NULL,
  `nominal_bayar` decimal(15,2) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal`, `nama_pelanggan`, `nama_kasir`, `total_pembayaran`, `nominal_bayar`, `metode_pembayaran`, `status`, `created_at`, `updated_at`) VALUES
(1, '2025-10-22 13:40:00', 'test', 'Chandra Kurnia Santoso', 72000.00, 100000.00, 'tunai', 'BELUM LUNAS', '2025-10-21 23:40:02', '2025-10-30 20:49:28'),
(2, '2025-10-22 13:56:41', 'can', 'Chandra Kurnia Santoso', 40000.00, 50000.00, 'tunai', 'LUNAS', '2025-10-21 23:56:42', '2025-10-21 23:56:42'),
(3, '2025-10-22 14:32:43', 'ikancupang', 'Chandra Kurnia Santoso', 180000.00, 200000.00, 'tunai', 'LUNAS', '2025-10-22 00:32:43', '2025-10-22 00:32:43'),
(4, '2025-10-22 15:17:17', 'bima', 'Chandra Kurnia Santoso', 230000.00, 300000.00, 'transfer', 'LUNAS', '2025-10-22 01:17:19', '2025-10-22 01:17:19'),
(5, '2025-10-22 15:17:18', 'bima', 'Chandra Kurnia Santoso', 230000.00, 300000.00, 'transfer', 'LUNAS', '2025-10-22 01:17:20', '2025-10-22 01:17:20'),
(6, '2025-10-22 21:31:36', 'ca', 'Chandra Kurnia Santoso', 70000.00, 100000.00, 'tunai', 'LUNAS', '2025-10-22 07:31:38', '2025-10-22 07:31:38'),
(7, '2025-10-22 21:33:06', 'test', 'Chandra Kurnia Santoso', 25000.00, 25000.00, 'tunai', 'LUNAS', '2025-10-22 07:33:07', '2025-10-22 07:33:07'),
(8, '2025-10-22 21:35:03', 'dawda', 'Chandra Kurnia Santoso', 35000.00, 35000.00, 'tunai', 'LUNAS', '2025-10-22 07:35:04', '2025-10-22 07:35:04'),
(9, '2025-10-22 21:58:27', 'test1', 'Chandra Kurnia Santoso', 270000.00, 300000.00, 'tunai', 'LUNAS', '2025-10-22 07:58:28', '2025-10-22 07:58:28'),
(10, '2025-10-23 09:25:08', 'wey', 'Chandra Kurnia Santoso', 30000.00, 30000.00, 'transfer', 'LUNAS', '2025-10-22 19:25:10', '2025-10-22 19:25:10'),
(11, '2025-10-23 09:31:12', 'ok', 'Chandra Kurnia Santoso', 70000.00, 70000.00, 'tunai', 'LUNAS', '2025-10-22 19:31:13', '2025-10-22 19:31:13'),
(12, '2025-10-23 12:32:57', 'Chandra', 'Chandra Kurnia Santoso', 115000.00, 150000.00, 'tunai', 'LUNAS', '2025-10-22 22:32:59', '2025-10-22 22:32:59'),
(13, '2025-10-23 13:43:43', 'gonda', 'Chandra Kurnia Santoso', 102000.00, 105000.00, 'tunai', 'LUNAS', '2025-10-22 23:43:45', '2025-10-22 23:43:45'),
(16, '2025-10-31 11:21:48', 'can', 'Chandra Kurnia Santoso', 120000.00, 120000.00, 'tunai', 'BELUM LUNAS', '2025-10-30 21:21:49', '2025-11-04 00:28:43'),
(18, '2025-11-04 18:17:46', 'aku', 'Chandra Kurnia Santoso', 138000.00, 150000.00, 'tunai', 'LUNAS', '2025-11-04 04:17:47', '2025-11-04 04:17:47'),
(19, '2025-11-30 23:06:41', 'test', 'cann', 60000.00, 100000.00, 'tunai', 'LUNAS', '2025-11-30 09:06:42', '2025-11-30 09:06:42'),
(20, '2025-11-30 23:13:25', 'UMUM/CASH/-', 'cann', 60000.00, 100000.00, 'transfer', 'LUNAS', '2025-11-30 09:13:25', '2025-11-30 09:13:25'),
(21, '2025-11-30 23:19:37', 'UMUM/CASH/-', 'cann', 30000.00, 30000.00, 'transfer', 'LUNAS', '2025-11-30 09:19:37', '2025-11-30 09:19:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_detail` bigint(20) UNSIGNED NOT NULL,
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `id_produk` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_detail`, `id_transaksi`, `id_produk`, `qty`, `harga`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 50000.00, 50000.00, '2025-10-21 23:40:02', '2025-10-21 23:40:02'),
(2, 1, 3, 1, 22000.00, 22000.00, '2025-10-21 23:40:02', '2025-10-21 23:40:02'),
(3, 2, 2, 1, 18000.00, 18000.00, '2025-10-21 23:56:42', '2025-10-21 23:56:42'),
(4, 2, 3, 1, 22000.00, 22000.00, '2025-10-21 23:56:42', '2025-10-21 23:56:42'),
(5, 3, 4, 1, 120000.00, 120000.00, '2025-10-22 00:32:43', '2025-10-22 00:32:43'),
(6, 3, 5, 1, 25000.00, 25000.00, '2025-10-22 00:32:43', '2025-10-22 00:32:43'),
(7, 3, 6, 1, 35000.00, 35000.00, '2025-10-22 00:32:44', '2025-10-22 00:32:44'),
(8, 4, 2, 10, 18000.00, 180000.00, '2025-10-22 01:17:19', '2025-10-22 01:17:19'),
(9, 4, 1, 1, 50000.00, 50000.00, '2025-10-22 01:17:19', '2025-10-22 01:17:19'),
(10, 5, 2, 10, 18000.00, 180000.00, '2025-10-22 01:17:20', '2025-10-22 01:17:20'),
(11, 5, 1, 1, 50000.00, 50000.00, '2025-10-22 01:17:20', '2025-10-22 01:17:20'),
(12, 6, 6, 2, 35000.00, 70000.00, '2025-10-22 07:31:38', '2025-10-22 07:31:38'),
(13, 7, 5, 1, 25000.00, 25000.00, '2025-10-22 07:33:07', '2025-10-22 07:33:07'),
(14, 8, 6, 1, 35000.00, 35000.00, '2025-10-22 07:35:04', '2025-10-22 07:35:04'),
(15, 9, 6, 1, 35000.00, 35000.00, '2025-10-22 07:58:28', '2025-10-22 07:58:28'),
(16, 9, 5, 1, 25000.00, 25000.00, '2025-10-22 07:58:28', '2025-10-22 07:58:28'),
(17, 9, 4, 1, 120000.00, 120000.00, '2025-10-22 07:58:28', '2025-10-22 07:58:28'),
(18, 9, 3, 1, 22000.00, 22000.00, '2025-10-22 07:58:28', '2025-10-22 07:58:28'),
(19, 9, 2, 1, 18000.00, 18000.00, '2025-10-22 07:58:28', '2025-10-22 07:58:28'),
(20, 9, 1, 1, 50000.00, 50000.00, '2025-10-22 07:58:28', '2025-10-22 07:58:28'),
(21, 10, 10, 1, 30000.00, 30000.00, '2025-10-22 19:25:10', '2025-10-22 19:25:10'),
(22, 11, 6, 2, 35000.00, 70000.00, '2025-10-22 19:31:13', '2025-10-22 19:31:13'),
(23, 12, 1, 1, 50000.00, 50000.00, '2025-10-22 22:32:59', '2025-10-22 22:32:59'),
(24, 12, 2, 1, 18000.00, 18000.00, '2025-10-22 22:32:59', '2025-10-22 22:32:59'),
(25, 12, 3, 1, 22000.00, 22000.00, '2025-10-22 22:32:59', '2025-10-22 22:32:59'),
(26, 12, 5, 1, 25000.00, 25000.00, '2025-10-22 22:32:59', '2025-10-22 22:32:59'),
(27, 13, 2, 2, 18000.00, 36000.00, '2025-10-22 23:43:45', '2025-10-22 23:43:45'),
(28, 13, 3, 3, 22000.00, 66000.00, '2025-10-22 23:43:45', '2025-10-22 23:43:45'),
(31, 16, 4, 1, 120000.00, 120000.00, '2025-10-30 21:21:49', '2025-10-30 21:21:49'),
(35, 18, 2, 1, 18000.00, 18000.00, '2025-11-04 04:17:47', '2025-11-04 04:17:47'),
(36, 18, 4, 1, 120000.00, 120000.00, '2025-11-04 04:17:47', '2025-11-04 04:17:47'),
(37, 19, 10, 2, 30000.00, 60000.00, '2025-11-30 09:06:42', '2025-11-30 09:06:42'),
(38, 20, 10, 2, 30000.00, 60000.00, '2025-11-30 09:13:25', '2025-11-30 09:13:25'),
(39, 21, 10, 1, 30000.00, 30000.00, '2025-11-30 09:19:37', '2025-11-30 09:19:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','kasir','manager') NOT NULL DEFAULT 'kasir',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'kasir', '$2y$12$1igHwXYJYFFe2KNlrXRjHuL5cJa5frHzAhMIyCFP05O.QuMctS2ku', 'kasir', '2025-10-13 22:11:44', '2025-10-13 22:11:44'),
(7, 'admin', '$2y$12$L/ld.Kf.NPW9q6CDPXybrOgj6nw7MVhslP0s3p2IR/eDL77D.RaW2', 'admin', '2025-10-22 20:58:47', '2025-10-22 20:58:47'),
(8, 'test', '$2y$12$5ZaH8S3s2zRGKxxDyRDLCeCjadVz6Q/j1I2B1lPkAHkarjBQmdMv6', 'kasir', '2025-10-28 23:08:22', '2025-10-28 23:08:22'),
(11, 'dw', '$2y$12$9.Mxy2MGVMnzW2Al1hXxTuhxnfR7RkMrJ0gQvV5zmvPkvCSSUXSLO', 'kasir', '2025-11-04 00:21:13', '2025-11-04 00:21:13'),
(12, 'cann', '$2y$12$EvBwu3U0beatCO1B8m4Q4eCOJ46l3ARsTKFa/3qFkmGiO1pPPoUrC', 'kasir', '2025-11-30 09:02:55', '2025-11-30 09:02:55');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `detail_spending`
--
ALTER TABLE `detail_spending`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_spending_spending_report_id_foreign` (`spending_report_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `spending_reports`
--
ALTER TABLE `spending_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `transaksi_detail_id_transaksi_foreign` (`id_transaksi`),
  ADD KEY `transaksi_detail_id_produk_foreign` (`id_produk`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_spending`
--
ALTER TABLE `detail_spending`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `spending_reports`
--
ALTER TABLE `spending_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_detail` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_spending`
--
ALTER TABLE `detail_spending`
  ADD CONSTRAINT `detail_spending_spending_report_id_foreign` FOREIGN KEY (`spending_report_id`) REFERENCES `spending_reports` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_id_produk_foreign` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_detail_id_transaksi_foreign` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
