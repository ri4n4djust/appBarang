-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2023 at 05:33 AM
-- Server version: 8.0.30
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `winmaxapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `connection` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `queue` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_acc`
--

CREATE TABLE `link_acc` (
  `id` int NOT NULL,
  `acc_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `link_acc`
--

INSERT INTO `link_acc` (`id`, `acc_id`, `name`, `link`, `date_create`, `date_update`) VALUES
(1, 31000, 'MODAL', 'modal', '2022-06-21 15:00:24', '2022-12-30 00:01:02'),
(20, 62310, 'BIAYA NON OPERASIONAL LAIN', 'opnum_persediaan', '2022-06-21 15:00:26', '2022-12-30 00:01:02'),
(22, 23210, 'PPN MASUKAN', 'ppn_masukan', '2022-06-21 15:00:26', '2022-12-30 00:01:02'),
(23, 23220, 'PPN KELUARAN', 'ppn_keluaran', '2022-06-21 15:00:26', '2022-12-30 00:01:02'),
(35, 21300, 'HUTANG USAHA', 'hutang_usaha', '2022-09-22 07:51:05', '2022-12-30 00:01:02'),
(50, 21100, 'HUTANG PIHAK KETIGA', 'hutang_pihak3', '2022-09-25 10:31:17', '2022-12-30 00:01:02'),
(53, 21400, 'PENDAPATAN DITERIMA DIMUKA', 'hutang_pendapatan', '2022-09-25 10:32:10', '2022-12-30 00:01:02'),
(61, 11300, 'PIUTANG PENDAPATAN', 'piutang_pendapatan', '2022-09-25 10:37:15', '2022-12-30 00:01:02'),
(62, 11310, 'PIUTANG BARU', 'piutang_baru', '2022-09-25 10:37:34', '2022-12-30 00:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_08_31_112609_create_rooms_table', 2),
(6, '2022_09_02_234530_create_rates_table', 3),
(7, '2023_01_12_121218_create_bbms_table', 4),
(8, '2023_01_14_092711_create_bbm_details_table', 5),
(9, '2023_01_14_093003_create_nosel_details_table', 5),
(10, '2023_01_15_020120_create_transaksi_nosels_table', 6),
(11, '2023_01_17_064557_create_pegawais_table', 7),
(12, '2023_01_18_054236_create_persediaans_table', 8),
(13, '2023_01_18_054644_create_persediaan_details_table', 8),
(14, '2023_01_18_145254_create_pembelians_table', 8),
(15, '2023_01_18_173900_create_pembelian_details_table', 8),
(19, '2023_01_25_205144_create_opnums_table', 9),
(20, '2023_01_25_205534_create_opnum_details_table', 10),
(21, '2023_01_27_054617_create_general_ledgers_table', 11),
(22, '2023_01_28_222515_create_kupons_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'ApiToken', '20c4ff4fddebc932ff8b59832171fb03e57302334d55d0ce6a24daaff5385b44', '[\"*\"]', NULL, '2023-01-21 10:59:41', '2023-01-21 10:59:41'),
(2, 'App\\Models\\User', 1, 'ApiToken', 'fdfd2079dabd38afd54d2525a81aa693c734fc59709919d0fb6e7fa930f9ec33', '[\"*\"]', NULL, '2023-01-21 11:19:51', '2023-01-21 11:19:51'),
(3, 'App\\Models\\User', 1, 'ApiToken', '6b9dd6a19edacbdc3882902e6d4c11e00c52a6efb9435648d41d71cf215f1d84', '[\"*\"]', NULL, '2023-01-26 21:23:44', '2023-01-26 21:23:44'),
(4, 'App\\Models\\User', 1, 'ApiToken', 'f75866907573a376464d5b7ffd407e896017186e5b1ac0d573ab9f80ac4857f0', '[\"*\"]', NULL, '2023-01-26 21:26:13', '2023-01-26 21:26:13'),
(5, 'App\\Models\\User', 1, 'ApiToken', '9625608f63a3190265e388f297b9db7985b00f06abb1780dd5e24db8395d0f7f', '[\"*\"]', NULL, '2023-01-26 21:41:01', '2023-01-26 21:41:01'),
(6, 'App\\Models\\User', 1, 'ApiToken', '88f5c4897d259933b398944c5653fb8116d34b36e19cda9b9e92d553c5e5962f', '[\"*\"]', NULL, '2023-01-27 11:16:12', '2023-01-27 11:16:12'),
(7, 'App\\Models\\User', 1, 'ApiToken', 'e8d8f4ecbde6f3e7d7b0189351333e3a057f86bf2e825ab28c928679c705634f', '[\"*\"]', NULL, '2023-01-27 11:38:15', '2023-01-27 11:38:15'),
(8, 'App\\Models\\User', 1, 'ApiToken', 'ab9f1ae4a3e51a81b676f0d04d3edbdc40cf00a74a843de5fa376503b87ccc93', '[\"*\"]', NULL, '2023-01-27 11:42:14', '2023-01-27 11:42:14'),
(9, 'App\\Models\\User', 1, 'ApiToken', 'ee36c45463b1650476dbb30ac7c2db0812dbbf9f79ecd75cbd76bcdcc25f8a0d', '[\"*\"]', NULL, '2023-01-27 11:44:36', '2023-01-27 11:44:36'),
(10, 'App\\Models\\User', 1, 'ApiToken', 'e512f064bd81c781c256a6de3d7fcfed429e712a14e9d420f6f930f32967ad8a', '[\"*\"]', NULL, '2023-01-27 12:04:21', '2023-01-27 12:04:21'),
(11, 'App\\Models\\User', 1, 'ApiToken', 'b39dd0ff8440af9197138402af597e159b12d28aa5d8db7e6428d4a1ca7a7be4', '[\"*\"]', NULL, '2023-01-27 12:08:39', '2023-01-27 12:08:39'),
(12, 'App\\Models\\User', 1, 'ApiToken', 'eff7a7d6a464642945d8e44f276e3c746c183cd34baa9dbb14428ebb691247e4', '[\"*\"]', NULL, '2023-01-27 12:22:39', '2023-01-27 12:22:39'),
(13, 'App\\Models\\User', 1, 'ApiToken', 'b8c76f0afd50c1eb001b1ed95c00ac0979f5d4736ba69aa93af062b809397431', '[\"*\"]', NULL, '2023-01-27 12:27:47', '2023-01-27 12:27:47'),
(14, 'App\\Models\\User', 1, 'ApiToken', 'd7603cd0b423e9368c3b8def077b19299def3f1639ee15aeeb8f052f609d8493', '[\"*\"]', NULL, '2023-01-27 12:30:24', '2023-01-27 12:30:24'),
(15, 'App\\Models\\User', 1, 'ApiToken', 'cbea163d8c4bcf8fb4c49d79a5348ca934266a1de316cd0d8366cda7b1bac895', '[\"*\"]', NULL, '2023-01-27 12:31:35', '2023-01-27 12:31:35'),
(16, 'App\\Models\\User', 1, 'ApiToken', 'bfcc24cdff7550e8ba1c7a5269f6fb3a2773ac70d32bbf3e50e24013d50eb6f6', '[\"*\"]', NULL, '2023-01-27 12:33:34', '2023-01-27 12:33:34'),
(17, 'App\\Models\\User', 1, 'ApiToken', 'bb4a42eaef171dd457b6d66022808375220977e156ba1dc374daf34a2651de87', '[\"*\"]', NULL, '2023-01-27 12:34:05', '2023-01-27 12:34:05'),
(18, 'App\\Models\\User', 1, 'ApiToken', 'c908f0454c4351ab5248b59d097936d3e00a2156d9898b2dbcb9f2b34bcdf9ff', '[\"*\"]', NULL, '2023-01-27 12:36:29', '2023-01-27 12:36:29'),
(19, 'App\\Models\\User', 1, 'ApiToken', '24a4c78944df2c61666d3886bc452dc4145a05ba2125ae457a7b9c2fef1d35bf', '[\"*\"]', NULL, '2023-01-27 12:36:38', '2023-01-27 12:36:38'),
(20, 'App\\Models\\User', 1, 'ApiToken', '18fbeab2794ad50df48ce9901f37bfa406a9e1fecd80024b4a06107246ae0b16', '[\"*\"]', NULL, '2023-01-27 12:36:43', '2023-01-27 12:36:43'),
(21, 'App\\Models\\User', 1, 'ApiToken', 'e4ed70b67f481a0dd5b8e5d70689fcc1959ab8002c7423b863d93c82f6ade3e5', '[\"*\"]', NULL, '2023-01-27 12:37:57', '2023-01-27 12:37:57'),
(22, 'App\\Models\\User', 1, 'ApiToken', '4aacb9757c6b98048804ed4ab031502d94eba65823fd24bf39abb61ae571b15b', '[\"*\"]', NULL, '2023-01-27 12:40:26', '2023-01-27 12:40:26'),
(23, 'App\\Models\\User', 1, 'ApiToken', 'e40dbd910496874015fc3659c235be360892adfecbbe95c038b5227ac11a100c', '[\"*\"]', NULL, '2023-01-27 12:40:43', '2023-01-27 12:40:43'),
(24, 'App\\Models\\User', 1, 'ApiToken', '14fcd68e5c9def50311bd3515933f8cd451db254117dbdef87fb49342bf847dd', '[\"*\"]', NULL, '2023-01-27 12:42:58', '2023-01-27 12:42:58'),
(25, 'App\\Models\\User', 1, 'ApiToken', '0c7469bd11d050bfe4b9dfc94035cb0448a925086d6442f646b32ca17d434f40', '[\"*\"]', NULL, '2023-01-27 12:48:37', '2023-01-27 12:48:37'),
(26, 'App\\Models\\User', 1, 'ApiToken', 'de566d7b3d6a93f1444ae5def89f8febe7681a7e8af614dad8660ab7c0e4a0e6', '[\"*\"]', NULL, '2023-01-27 12:52:26', '2023-01-27 12:52:26'),
(27, 'App\\Models\\User', 1, 'ApiToken', '7b2cd289a3ac1b6434e029cb40e2bf83930bda4a6f17a6e1de9202f82d1b2a0b', '[\"*\"]', NULL, '2023-01-27 12:52:36', '2023-01-27 12:52:36'),
(28, 'App\\Models\\User', 1, 'ApiToken', '816f01ea3828b9ea1f31a52f83fdab519e0e3f280e706d4d33703b5786fb7781', '[\"*\"]', NULL, '2023-01-27 12:52:40', '2023-01-27 12:52:40'),
(29, 'App\\Models\\User', 1, 'ApiToken', 'ed1babad547dd42e7b022582545824fbbef57b424f2d0f5737ae747a51212be4', '[\"*\"]', NULL, '2023-01-27 12:53:45', '2023-01-27 12:53:45'),
(30, 'App\\Models\\User', 1, 'ApiToken', '6e4f4cb06d2d38be32851cee024b17502d0a8dd090bd9533eaa51b1a5f90ade4', '[\"*\"]', NULL, '2023-01-27 13:07:25', '2023-01-27 13:07:25'),
(31, 'App\\Models\\User', 1, 'ApiToken', '27dca5f4a337c3486ea5079fad2d4162b4fa450d1bf67d32c5611c25f9ea0ebe', '[\"*\"]', NULL, '2023-01-27 13:07:44', '2023-01-27 13:07:44'),
(32, 'App\\Models\\User', 1, 'ApiToken', '51e87493539330a9c85b7c04f91042fa8eb555ec901efa996c53e789695a29f4', '[\"*\"]', NULL, '2023-01-27 13:11:22', '2023-01-27 13:11:22'),
(33, 'App\\Models\\User', 1, 'ApiToken', 'a550b600f26d453c14836e14f1ddf9e7d34dbb0dd444d300d82c99933d8280d3', '[\"*\"]', NULL, '2023-01-27 13:11:39', '2023-01-27 13:11:39'),
(34, 'App\\Models\\User', 1, 'ApiToken', '11dd50e00cafbb459d7649732820f5ac4f08e848541b28394bbf181fc7fbca2a', '[\"*\"]', NULL, '2023-01-27 13:12:26', '2023-01-27 13:12:26'),
(35, 'App\\Models\\User', 1, 'ApiToken', '31b9809cffd720dcba8759b49ca49bb5fdae3e97445e834f38e29a356a91d8a7', '[\"*\"]', NULL, '2023-01-27 13:12:35', '2023-01-27 13:12:35'),
(36, 'App\\Models\\User', 1, 'ApiToken', '56878db2c47bd2332d1c6040b77794eb5bfbd940117103872d762eaa49cda228', '[\"*\"]', NULL, '2023-01-27 13:12:39', '2023-01-27 13:12:39'),
(37, 'App\\Models\\User', 1, 'ApiToken', '3d2c75b7905b41cca4138b12caddbc2a964111da9f01b73fe2d225bf0281ebee', '[\"*\"]', NULL, '2023-01-27 13:13:13', '2023-01-27 13:13:13'),
(38, 'App\\Models\\User', 1, 'ApiToken', '03a5b5a1646f3eba843e4bf29e61a9f2c511b03319569d3d81f02bcb11dcd60d', '[\"*\"]', NULL, '2023-01-27 13:17:42', '2023-01-27 13:17:42'),
(39, 'App\\Models\\User', 1, 'ApiToken', '9454efc3227654d8d079489bec2a24ff48c329e8748617efad05f56847daeac2', '[\"*\"]', NULL, '2023-01-27 13:18:12', '2023-01-27 13:18:12'),
(40, 'App\\Models\\User', 1, 'ApiToken', '6bbf2667c842b68f358034e653043fcb5cd501435abc37b7118f94408cc1fff4', '[\"*\"]', NULL, '2023-01-27 13:19:51', '2023-01-27 13:19:51'),
(41, 'App\\Models\\User', 1, 'ApiToken', 'daa4c7a5079c0af2e5553957dc0a19d17fedf742194935ddaaa4025e9a9ab8cd', '[\"*\"]', NULL, '2023-01-27 13:22:25', '2023-01-27 13:22:25'),
(42, 'App\\Models\\User', 1, 'ApiToken', 'cf351eae8b1b1688fb2834627f9e63613b84a7f3ca398bf14e6a98568b07b427', '[\"*\"]', NULL, '2023-01-27 21:33:43', '2023-01-27 21:33:43'),
(43, 'App\\Models\\User', 1, 'ApiToken', '58ecffdc7013a5d16163e0d2e4db44e3d1bd97d3b952f599a7b69d89d83aa277', '[\"*\"]', NULL, '2023-01-27 23:14:14', '2023-01-27 23:14:14'),
(44, 'App\\Models\\User', 1, 'ApiToken', 'd7bc41ae7872b9c23fff910de7572dba8fa9e54db6407910bbd2eb8747d302e2', '[\"*\"]', NULL, '2023-01-27 23:32:42', '2023-01-27 23:32:42'),
(45, 'App\\Models\\User', 1, 'ApiToken', 'ca2885b10ac5af10bb725e460360bb5bcbcaa161a2b33a6a14408a73c3c97860', '[\"*\"]', NULL, '2023-01-28 10:42:01', '2023-01-28 10:42:01'),
(46, 'App\\Models\\User', 1, 'ApiToken', '923c73028217a56e46d443a4e0cd89e94600c324a2e12b7f557c8a0f013d2a0f', '[\"*\"]', NULL, '2023-01-28 11:04:42', '2023-01-28 11:04:42'),
(47, 'App\\Models\\User', 1, 'ApiToken', '66352d9bfb8cdfa085edb8ed137d3b635620fac4d4fe91831623b4d67d90521b', '[\"*\"]', NULL, '2023-01-28 13:30:40', '2023-01-28 13:30:40'),
(48, 'App\\Models\\User', 1, 'ApiToken', 'e215c3c67a9beccd0b1ab0fe6ea25a5eb8675d0590f46669193fe41885c4e664', '[\"*\"]', NULL, '2023-01-28 13:39:25', '2023-01-28 13:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_anggaran`
--

CREATE TABLE `rekening_anggaran` (
  `id_rekening` int NOT NULL,
  `nomor_rekening` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_rekening` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `anggaran` decimal(12,2) NOT NULL DEFAULT '0.00',
  `parent_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `view_level` int NOT NULL DEFAULT '0',
  `tipe` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'D',
  `rlocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_anggaran` int NOT NULL DEFAULT '2022',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_create` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_update` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbarang`
--

CREATE TABLE `tblbarang` (
  `id` bigint UNSIGNED NOT NULL,
  `kdBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hrgPokok` double NOT NULL,
  `hrgJual` double NOT NULL,
  `ktgBarang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `satuanBarang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `merek` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stkBarang` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stkSatuan` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qtyMin` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qtyMax` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stsBarang` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbarang`
--

INSERT INTO `tblbarang` (`id`, `kdBarang`, `nmBarang`, `hrgPokok`, `hrgJual`, `ktgBarang`, `satuanBarang`, `merek`, `stkBarang`, `stkSatuan`, `qtyMin`, `qtyMax`, `stsBarang`, `deskripsi`, `created_at`, `updated_at`) VALUES
(2, 'BRG0004', 'GAS ELPIGI 3KG', 220000, 250000, 'KT-2021-3', 'BOTOL', 'ELPIGI', '140', NULL, '5', '200', '', 'oli mesin', NULL, NULL),
(3, 'BRG0005', 'GAS ELPIGI 12KG', 18000, 220000, 'KT-2021-3', 'TABUNG', 'ELPIGI', '39', NULL, '5', '200', '1', 'Tabung gas elipgi', '2023-01-23 00:04:44', '2023-01-23 00:04:44'),
(4, 'BRG0006', 'OLI', 20000, 40000, 'KT-2021-2', 'BOTOL', 'Mesran', '0', NULL, '2', '10', '0', 'des', '2023-02-03 13:26:02', '2023-02-03 13:26:02'),
(5, 'BRG0007', 'OLI MESRAN 5L', 150000, 220000, 'KT-2021-2', 'BOTOL', 'MESRAN', '6', NULL, '5', '100', '0', 'des', '2023-02-04 02:58:44', '2023-02-04 02:58:44'),
(6, 'BRG0008', 'OLI MESRAN 1.5L', 85000, 110000, 'KT-2021-2', 'BOTOL', 'MESRAN', '7', NULL, '5', '100', '0', 'des', '2023-02-04 02:59:07', '2023-02-04 02:59:07');

--
-- Triggers `tblbarang`
--
DELIMITER $$
CREATE TRIGGER `after_insert` AFTER INSERT ON `tblbarang` FOR EACH ROW BEGIN  

INSERT INTO tblpersediaan (kdPersediaan, nmPersediaan, stokPersediaan, satuanPersediaan, ktgPersediaan, lastPrice, salePrice)
VALUES (NEW.kdBarang, NEW.nmBarang, NEW.stkBarang, NEW.satuanBarang, NEW.ktgBarang, NEW.hrgPokok, NEW.hrgJual);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblbbm`
--

CREATE TABLE `tblbbm` (
  `id` bigint UNSIGNED NOT NULL,
  `code_bbm` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_bbm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_meter` int NOT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `sale_price` decimal(13,2) NOT NULL,
  `stokBbm` decimal(13,2) NOT NULL,
  `logo_bbm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbbm`
--

INSERT INTO `tblbbm` (`id`, `code_bbm`, `nama_bbm`, `last_meter`, `last_price`, `sale_price`, `stokBbm`, `logo_bbm`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 12000000, '13900.00', '10000.00', '-120899.00', 'pertamax.png', '2023-01-12 12:56:36', '2023-02-01 22:17:00'),
(2, 'BRG0002', 'PERLITE', 12000000, '9000.00', '14900.00', '-12911.00', 'pertalite.png', '2023-01-12 12:56:36', '2023-01-12 12:56:36'),
(3, 'BRG0003', 'DEX LITE', 234535, '11800.00', '17800.00', '-3099.00', 'dexlite.png', '2023-01-14 08:29:46', '2023-02-02 12:11:55');

--
-- Triggers `tblbbm`
--
DELIMITER $$
CREATE TRIGGER `tblbbm_after insert` AFTER INSERT ON `tblbbm` FOR EACH ROW BEGIN  

INSERT INTO tblpersediaan (kdPersediaan, nmPersediaan, stokPersediaan, satuanPersediaan, ktgPersediaan, lastPrice, salePrice)
VALUES (NEW.code_bbm, NEW.nama_bbm, 0, 'Liter', 'KT-2021-1', NEW.last_price, NEW.last_price);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblbbm_detail`
--

CREATE TABLE `tblbbm_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbiaya`
--

CREATE TABLE `tblbiaya` (
  `id_biaya` bigint NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tglBiaya` datetime NOT NULL,
  `keterangan_biaya` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `r_regu` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbiaya`
--

INSERT INTO `tblbiaya` (`id_biaya`, `kd_trans`, `tglBiaya`, `keterangan_biaya`, `jumlah`, `created_at`, `updated_at`, `r_regu`) VALUES
(7, '20230130A', '2023-01-30 00:00:00', 'makan', '50000.00', '2023-01-30 21:34:35', '2023-01-30 21:34:35', 'A'),
(8, '20230130A', '2023-01-30 00:00:00', 'transport', '750000.00', '2023-01-30 21:34:35', '2023-01-30 21:34:35', 'A'),
(9, '20230130B', '2023-01-30 00:00:00', 'fdgdsg', '4000.00', '2023-01-30 21:37:17', '2023-01-30 21:37:17', 'B'),
(10, '20230130B', '2023-01-30 00:00:00', 'fffff', '5000.00', '2023-01-30 21:37:17', '2023-01-30 21:37:17', 'B'),
(11, '20230131A', '2023-01-31 00:00:00', 'sopir', '75000.00', '2023-01-31 06:02:03', '2023-01-31 06:02:03', 'A'),
(12, '20230131A', '2023-01-31 00:00:00', 'nasi', '50000.00', '2023-01-31 06:02:03', '2023-01-31 06:02:03', 'A'),
(13, '20230131C', '2023-01-31 00:00:00', 'biaya sopir', '75000.00', '2023-01-31 21:41:25', '2023-01-31 21:41:25', 'C'),
(14, '20230204A1', '2023-02-04 00:00:00', 'ffdfd', '205000.00', '2023-02-04 08:57:07', '2023-02-04 08:57:07', 'A'),
(15, '20230202A1', '2023-02-04 00:00:00', 'ffdfd', '205000.00', '2023-02-04 08:58:02', '2023-02-04 08:58:02', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tblgeneral_ledger`
--

CREATE TABLE `tblgeneral_ledger` (
  `idGl` bigint UNSIGNED NOT NULL,
  `kdGl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_rekening` int NOT NULL,
  `tglGl` datetime NOT NULL,
  `debet` decimal(13,2) NOT NULL,
  `kredit` decimal(13,2) NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblheader_aplusan`
--

CREATE TABLE `tblheader_aplusan` (
  `id_aplusan` bigint NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_trans` datetime NOT NULL,
  `r_regu` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_jual` decimal(13,2) NOT NULL,
  `total_kupon` decimal(13,2) NOT NULL,
  `total_biaya` decimal(13,2) NOT NULL,
  `total_link` decimal(13,2) NOT NULL,
  `total_cash` decimal(13,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblheader_aplusan`
--

INSERT INTO `tblheader_aplusan` (`id_aplusan`, `kd_trans`, `tgl_trans`, `r_regu`, `total_jual`, `total_kupon`, `total_biaya`, `total_link`, `total_cash`, `created_at`, `updated_at`) VALUES
(13, '20230204A1', '2023-02-04 00:00:00', 'A', '87390000.00', '250000.00', '205000.00', '250000.00', '86685000.00', '2023-02-04 08:57:07', '2023-02-04 08:57:07'),
(14, '20230202A1', '2023-02-02 00:00:00', 'A', '96040000.00', '250000.00', '205000.00', '250000.00', '95335000.00', '2023-02-04 08:58:02', '2023-02-04 08:58:02'),
(15, '20230204B1', '2023-02-04 00:00:00', 'B', '1716840000.00', '0.00', '0.00', '0.00', '1716840000.00', '2023-02-04 09:56:11', '2023-02-04 09:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblkategori`
--

CREATE TABLE `tblkategori` (
  `id` bigint UNSIGNED NOT NULL,
  `kodeKtg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namaKtg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblkategori`
--

INSERT INTO `tblkategori` (`id`, `kodeKtg`, `namaKtg`, `created_at`, `updated_at`) VALUES
(1, 'KT-2021-1', 'BBM', '2021-03-19 22:40:29', '2022-02-19 06:11:10'),
(2, 'KT-2021-2', 'OLI', '2021-03-19 22:40:36', '2021-03-19 22:40:36'),
(3, 'KT-2021-3', 'GAS', '2023-01-20 12:13:36', '2023-01-20 12:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblkupon`
--

CREATE TABLE `tblkupon` (
  `id` bigint UNSIGNED NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_regu` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tgl_trans` datetime NOT NULL,
  `r_kdPelanggan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblkupon`
--

INSERT INTO `tblkupon` (`id`, `kd_trans`, `r_regu`, `tgl_trans`, `r_kdPelanggan`, `total`, `created_at`, `updated_at`) VALUES
(6, '20230130A', 'A', '2023-01-30 00:00:00', 'PL02022036', '400000.00', '2023-01-30 13:34:35', '2023-01-30 13:34:35'),
(7, '20230130B', 'B', '2023-01-30 00:00:00', 'PL02022036', '40000.00', '2023-01-30 13:37:17', '2023-01-30 13:37:17'),
(8, '20230130B', 'B', '2023-01-30 00:00:00', 'PL02022030', '300000.00', '2023-01-30 13:37:17', '2023-01-30 13:37:17'),
(9, '20230131A', 'A', '2023-01-31 00:00:00', 'PL02022030', '250000.00', '2023-01-30 22:02:03', '2023-01-30 22:02:03'),
(10, '20230131A', 'A', '2023-01-31 00:00:00', 'PL02022031', '500000.00', '2023-01-30 22:02:03', '2023-01-30 22:02:03'),
(11, '20230131C', 'C', '2023-01-31 00:00:00', 'PL02022036', '100000.00', '2023-01-31 13:41:25', '2023-01-31 13:41:25'),
(12, '20230131C', 'C', '2023-01-31 00:00:00', 'PL02022030', '150000.00', '2023-01-31 13:41:25', '2023-01-31 13:41:25'),
(13, '20230204A1', 'A', '2023-02-04 00:00:00', 'PL02022030', '250000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(14, '20230202A1', 'A', '2023-02-04 00:00:00', 'PL02022030', '250000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbllinkaja`
--

CREATE TABLE `tbllinkaja` (
  `id` int NOT NULL,
  `r_bbm` varchar(5) DEFAULT NULL,
  `nm_bbm` varchar(45) NOT NULL,
  `tgl_link` datetime NOT NULL,
  `jumlah_link` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `kd_trans` varchar(45) NOT NULL,
  `r_regu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbllinkaja`
--

INSERT INTO `tbllinkaja` (`id`, `r_bbm`, `nm_bbm`, `tgl_link`, `jumlah_link`, `created_at`, `updated_at`, `kd_trans`, `r_regu`) VALUES
(2, 'tes', 'PERTAMAX', '2023-01-30 00:00:00', '250000.00', '2023-01-30 21:34:35', '2023-01-30 21:34:35', '20230130A', 'A'),
(3, 'tes', 'PERTAMAX', '2023-01-30 00:00:00', '100000.00', '2023-01-30 21:37:17', '2023-01-30 21:37:17', '20230130B', 'B'),
(4, 'tes', 'PERLITE', '2023-01-30 00:00:00', '50000.00', '2023-01-30 21:37:17', '2023-01-30 21:37:17', '20230130B', 'B'),
(5, 'tes', 'PERTAMAX', '2023-01-31 00:00:00', '90000.00', '2023-01-31 21:41:25', '2023-01-31 21:41:25', '20230131C', 'C'),
(6, 'tes', 'PERLITE', '2023-01-31 00:00:00', '75000.00', '2023-01-31 21:41:25', '2023-01-31 21:41:25', '20230131C', 'C'),
(7, 'tes', 'PERTAMAX', '2023-02-04 00:00:00', '250000.00', '2023-02-04 08:57:07', '2023-02-04 08:57:07', '20230204A1', 'A'),
(8, 'tes', 'PERTAMAX', '2023-02-04 00:00:00', '250000.00', '2023-02-04 08:58:02', '2023-02-04 08:58:02', '20230202A1', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tblnosel_detail`
--

CREATE TABLE `tblnosel_detail` (
  `id_nosel` bigint UNSIGNED NOT NULL,
  `r_bbm` int NOT NULL,
  `r_code_bbm` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_nosel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meter_awal` int NOT NULL,
  `meter_akhir` int NOT NULL,
  `harga` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblnosel_detail`
--

INSERT INTO `tblnosel_detail` (`id_nosel`, `r_bbm`, `r_code_bbm`, `nama_nosel`, `meter_awal`, `meter_akhir`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG0001', 'PX 1', 121500, 122000, '14500.00', '2023-01-14 09:54:41', '2023-02-04 01:56:11'),
(2, 1, 'BRG0001', 'PX 2', 12000, 125000, '14500.00', '2023-01-14 09:56:59', '2023-02-04 01:56:11'),
(3, 2, 'BRG0002', 'PL 1', 359000, 360000, '25100.00', '2023-01-14 09:58:16', '2023-02-04 01:56:11'),
(4, 2, 'BRG0002', 'PL 2', 43000, 43000, '14500.00', '2023-01-14 09:56:59', '2023-02-04 00:58:02'),
(5, 1, 'BRG0001', 'PX 3', 17500, 17500, '14500.00', '2023-01-14 09:56:59', '2023-02-04 00:58:02'),
(6, 2, 'BRG0002', 'PL 3', 19200, 19200, '14500.00', '2023-01-14 09:56:59', '2023-02-04 00:58:02'),
(7, 3, 'BRG0003', 'DX 1', 26500, 27000, '17800.00', '2023-01-14 09:58:16', '2023-02-04 01:56:11'),
(8, 3, 'BRG0003', 'DX 2', 277000, 277000, '17800.00', '2023-01-14 09:58:16', '2023-02-04 00:58:02'),
(9, 2, 'BRG0002', 'PL 4', 25000, 27000, '10000.00', '2023-01-14 09:58:16', '2023-02-04 01:56:11'),
(10, 2, 'BRG0002', 'PL 5', 18888, 19000, '14900.00', '2023-01-14 09:56:59', '2023-01-31 13:41:25'),
(11, 1, 'BRG0001', 'PX 4', 23700, 24000, '10000.00', '2023-01-14 09:58:16', '2023-02-04 01:56:11'),
(12, 1, 'BRG0001', 'PX 5', 26100, 27000, '10000.00', '2023-01-14 09:58:16', '2023-02-04 01:56:11'),
(13, 2, 'BRG0002', 'PL 6', 1200, 1500, '12000.00', '2023-02-02 13:04:04', '2023-02-04 01:56:11'),
(14, 2, 'BRG0002', 'PL 7', 1600, 1700, '14900.00', '2023-02-02 13:05:33', '2023-02-04 01:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblopnum`
--

CREATE TABLE `tblopnum` (
  `id` bigint UNSIGNED NOT NULL,
  `kdOpnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tglOpnum` datetime NOT NULL,
  `totalOpnum` decimal(13,2) NOT NULL,
  `userOpnum` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblopnum`
--

INSERT INTO `tblopnum` (`id`, `kdOpnum`, `tglOpnum`, `totalOpnum`, `userOpnum`, `created_at`, `updated_at`) VALUES
(8, 'OP0120231', '2023-01-26 00:00:00', '-2362000.00', '1', '2023-01-26 09:00:31', '2023-01-26 09:00:31'),
(13, 'OP0120232', '2023-01-26 00:00:00', '-1190000.00', '1', '2023-01-26 09:16:21', '2023-01-26 09:16:21'),
(14, 'OP0120233', '2023-01-26 00:00:00', '-1190000.00', '1', '2023-01-26 09:17:06', '2023-01-26 09:17:06'),
(15, 'OP0120234', '2023-01-26 00:00:00', '-1190000.00', '1', '2023-01-26 09:18:30', '2023-01-26 09:18:30'),
(16, 'OP0120235', '2023-01-26 00:00:00', '-1190000.00', '1', '2023-01-26 09:18:54', '2023-01-26 09:18:54'),
(17, 'OP0120236', '2023-01-26 00:00:00', '-928000.00', '1', '2023-01-26 09:20:01', '2023-01-26 09:20:01'),
(18, 'OP0120237', '2023-01-29 00:00:00', '-720000.00', '1', '2023-01-29 01:43:56', '2023-01-29 01:43:56'),
(19, 'OP0120238', '2023-01-31 00:00:00', '-6694114500.00', '1', '2023-01-30 22:15:37', '2023-01-30 22:15:37'),
(20, 'OP0120239', '2023-01-31 00:00:00', '-51000.00', '1', '2023-01-30 22:18:56', '2023-01-30 22:18:56'),
(21, 'OP01202310', '2023-01-31 00:00:00', '-28000.00', '1', '2023-01-30 22:22:11', '2023-01-30 22:22:11'),
(22, 'OP01202311', '2023-01-31 00:00:00', '-42000.00', '1', '2023-01-30 22:24:40', '2023-01-30 22:24:40'),
(23, 'OP01202312', '2023-01-31 00:00:00', '-42000.00', '1', '2023-01-30 22:25:00', '2023-01-30 22:25:00'),
(24, 'OP01202313', '2023-01-31 00:00:00', '-28000.00', '1', '2023-01-30 22:26:42', '2023-01-30 22:26:42'),
(25, 'OP01202314', '2023-01-31 00:00:00', '-14000.00', '1', '2023-01-30 22:28:16', '2023-01-30 22:28:16'),
(26, 'OP01202315', '2023-01-31 00:00:00', '-42000.00', '1', '2023-01-30 22:31:27', '2023-01-30 22:31:27'),
(28, 'OP01202316', '2023-01-31 00:00:00', '-42000.00', '1', '2023-01-30 22:31:47', '2023-01-30 22:31:47'),
(30, 'OP01202317', '2023-01-31 00:00:00', '-220000.00', '1', '2023-01-30 22:32:05', '2023-01-30 22:32:05'),
(31, 'OP01202318', '2023-01-31 00:00:00', '-660000.00', '1', '2023-01-30 22:32:16', '2023-01-30 22:32:16'),
(32, 'OP01202319', '2023-01-31 00:00:00', '-64000.00', '1', '2023-01-30 23:06:31', '2023-01-30 23:06:31'),
(33, 'OP01202320', '2023-01-31 00:00:00', '-1337185600.00', '1', '2023-01-30 23:06:38', '2023-01-30 23:06:38'),
(34, 'OP01202321', '2023-01-31 00:00:00', '-6107350000.00', '1', '2023-01-30 23:06:43', '2023-01-30 23:06:43'),
(35, 'OP01202322', '2023-01-31 00:00:00', '26300.00', '1', '2023-01-30 23:06:53', '2023-01-30 23:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblopnum_detail`
--

CREATE TABLE `tblopnum_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `r_opnum` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_kdPersediaan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmPersediaan` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `selisihOpnum` decimal(13,2) NOT NULL,
  `nilaiOpnum` decimal(13,2) NOT NULL,
  `keteranganOpnum` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblopnum_detail`
--

INSERT INTO `tblopnum_detail` (`id`, `r_opnum`, `r_kdPersediaan`, `nmPersediaan`, `selisihOpnum`, `nilaiOpnum`, `keteranganOpnum`, `created_at`, `updated_at`) VALUES
(7, 'OP0120231', 'BRG0004', 'OLI MESRAN 5L', '-10.00', '-2200000.00', 'rtre', '2023-01-26 09:00:31', '2023-01-26 09:00:31'),
(8, 'OP0120231', 'BRG0005', 'GAS ELPIGI 12KG', '-9.00', '-162000.00', 'try', '2023-01-26 09:00:31', '2023-01-26 09:00:31'),
(9, 'OP0120232', 'BRG0004', 'OLI MESRAN 5L', '-5.00', '-1100000.00', '-', '2023-01-26 09:16:21', '2023-01-26 09:16:21'),
(10, 'OP0120232', 'BRG0005', 'GAS ELPIGI 12KG', '-5.00', '-90000.00', '-', '2023-01-26 09:16:21', '2023-01-26 09:16:21'),
(11, 'OP0120233', 'BRG0004', 'OLI MESRAN 5L', '-5.00', '-1100000.00', '-', '2023-01-26 09:17:06', '2023-01-26 09:17:06'),
(12, 'OP0120233', 'BRG0005', 'GAS ELPIGI 12KG', '-5.00', '-90000.00', '-', '2023-01-26 09:17:06', '2023-01-26 09:17:06'),
(13, 'OP0120234', 'BRG0004', 'OLI MESRAN 5L', '-5.00', '-1100000.00', '-', '2023-01-26 09:18:30', '2023-01-26 09:18:30'),
(14, 'OP0120234', 'BRG0005', 'GAS ELPIGI 12KG', '-5.00', '-90000.00', '-', '2023-01-26 09:18:30', '2023-01-26 09:18:30'),
(15, 'OP0120235', 'BRG0004', 'OLI MESRAN 5L', '-5.00', '-1100000.00', 'hilang', '2023-01-26 09:18:54', '2023-01-26 09:18:54'),
(16, 'OP0120235', 'BRG0005', 'GAS ELPIGI 12KG', '-5.00', '-90000.00', 'kompliment', '2023-01-26 09:18:54', '2023-01-26 09:18:54'),
(17, 'OP0120236', 'BRG0001', 'PERTAMAX', '-65.00', '-910000.00', '-', '2023-01-26 09:20:01', '2023-01-26 09:20:01'),
(18, 'OP0120236', 'BRG0002', 'PERTALITE', '-2.00', '-18000.00', 'kompliment', '2023-01-26 09:20:01', '2023-01-26 09:20:01'),
(19, 'OP0120237', 'BRG0002', 'PERTALITE', '-80.00', '-720000.00', '-', '2023-01-29 01:43:56', '2023-01-29 01:43:56'),
(20, 'OP0120238', 'BRG0001', 'PERTAMAX', '-54944.00', '-769216000.00', '-', '2023-01-30 22:15:37', '2023-01-30 22:15:37'),
(21, 'OP0120238', 'BRG0002', 'PERTALITE', '-639935.00', '-5759415000.00', '-', '2023-01-30 22:15:37', '2023-01-30 22:15:37'),
(22, 'OP0120238', 'BRG0003', 'DEX LITE', '-25459.00', '-165483500.00', '-', '2023-01-30 22:15:37', '2023-01-30 22:15:37'),
(23, 'OP0120239', 'BRG0005', 'GAS ELPIGI 12KG', '-3.00', '-51000.00', '-', '2023-01-30 22:18:56', '2023-01-30 22:18:56'),
(24, 'OP01202310', 'BRG0001', 'PERTAMAX', '-2.00', '-28000.00', '-', '2023-01-30 22:22:11', '2023-01-30 22:22:11'),
(25, 'OP01202311', 'BRG0001', 'PERTAMAX', '-3.00', '-42000.00', '-', '2023-01-30 22:24:40', '2023-01-30 22:24:40'),
(26, 'OP01202312', 'BRG0001', 'PERTAMAX', '-3.00', '-42000.00', '-', '2023-01-30 22:25:00', '2023-01-30 22:25:00'),
(27, 'OP01202313', 'BRG0001', 'PERTAMAX', '-2.00', '-28000.00', '-', '2023-01-30 22:26:42', '2023-01-30 22:26:42'),
(28, 'OP01202314', 'BRG0001', 'PERTAMAX', '-1.00', '-14000.00', '-', '2023-01-30 22:28:16', '2023-01-30 22:28:16'),
(29, 'OP01202315', 'BRG0001', 'PERTAMAX', '-3.00', '-42000.00', '-', '2023-01-30 22:31:27', '2023-01-30 22:31:27'),
(30, 'OP01202316', 'BRG0001', 'PERTAMAX', '-3.00', '-42000.00', '-', '2023-01-30 22:31:47', '2023-01-30 22:31:47'),
(31, 'OP01202317', 'BRG0004', 'OLI MESRAN 5L', '-1.00', '-220000.00', '-', '2023-01-30 22:32:05', '2023-01-30 22:32:05'),
(32, 'OP01202318', 'BRG0004', 'OLI MESRAN 5L', '-3.00', '-660000.00', '-', '2023-01-30 22:32:16', '2023-01-30 22:32:16'),
(33, 'OP01202319', 'BRG0003', 'DEX LITE', '-5.00', '-64000.00', '-', '2023-01-30 23:06:31', '2023-01-30 23:06:31'),
(34, 'OP01202320', 'BRG0001', 'PERTAMAX', '-89744.00', '-1337185600.00', '-', '2023-01-30 23:06:38', '2023-01-30 23:06:38'),
(35, 'OP01202321', 'BRG0002', 'PERLITE', '-610735.00', '-6107350000.00', '-', '2023-01-30 23:06:43', '2023-01-30 23:06:43'),
(36, 'OP01202322', 'BRG0001', 'PERTAMAX', '-1.00', '-14900.00', '-', '2023-01-30 23:06:53', '2023-01-30 23:06:53'),
(37, 'OP01202322', 'BRG0002', 'PERLITE', '-1.00', '-10000.00', '-', '2023-01-30 23:06:53', '2023-01-30 23:06:53'),
(38, 'OP01202322', 'BRG0003', 'DEX LITE', '4.00', '51200.00', '-', '2023-01-30 23:06:53', '2023-01-30 23:06:53');

-- --------------------------------------------------------

--
-- Table structure for table `tblpegawai`
--

CREATE TABLE `tblpegawai` (
  `id` bigint UNSIGNED NOT NULL,
  `kdPegawai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmPegawai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `almtPegawai` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `noTlp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reguPegawai` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpegawai`
--

INSERT INTO `tblpegawai` (`id`, `kdPegawai`, `nmPegawai`, `almtPegawai`, `noTlp`, `reguPegawai`, `created_at`, `updated_at`) VALUES
(1, 'p001', 'rian', 'badung', '09876', 'A', '2023-01-16 23:52:04', '2023-01-16 23:52:04'),
(2, 'p002', 'katak', 'badung', '09876', 'A', '2023-01-16 23:52:04', '2023-01-16 23:52:04'),
(3, 'p003', 'sampi', 'badung', '09876', 'B', '2023-01-16 23:52:04', '2023-01-16 23:52:04'),
(4, 'p004', 'wawan', 'badung', '09876', 'B', '2023-01-16 23:52:04', '2023-01-16 23:52:04'),
(5, 'p004', 'bagus', 'badung', '09876', 'C', '2023-01-16 23:52:04', '2023-01-16 23:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `tblpelanggan`
--

CREATE TABLE `tblpelanggan` (
  `id` bigint UNSIGNED NOT NULL,
  `kdPelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmPelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `almtPelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `noHpPelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rolePelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `emailPelanggan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deposit` decimal(13,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpelanggan`
--

INSERT INTO `tblpelanggan` (`id`, `kdPelanggan`, `nmPelanggan`, `almtPelanggan`, `noHpPelanggan`, `rolePelanggan`, `emailPelanggan`, `path`, `deposit`, `created_at`, `updated_at`) VALUES
(30, 'PL02022030', 'SURFING', '-', '-', '-', '-', 'user-avtar.svg', '-1620000.00', '2022-08-04 21:42:35', '2022-08-04 21:42:35'),
(31, 'PL02022031', 'MIROR', '-', '-', '-', '-', 'user-avtar.svg', '-500000.00', '2022-08-04 21:42:50', '2022-08-04 21:42:50'),
(32, 'PL02022032', 'SMA 1 KUTA', '-', '-', '-', '-', 'user-avtar.svg', '-3000.00', '2022-08-18 04:12:11', '2022-08-18 04:12:11'),
(33, 'PL02022033', 'KUNJA', '-', '-', '-', '-', 'user-avtar.svg', '0.00', '2022-08-18 04:12:32', '2022-08-18 04:12:32'),
(34, 'PL02022034', 'CAFE DELMAR', '-', '-', '-', '-', '-', '0.00', '2023-01-29 13:05:53', '2023-01-29 13:05:53'),
(35, 'PL02022035', 'PETS CONTROL', '-', '-', '-', '-', '-', '-885000.00', '2023-01-29 13:06:57', '2023-01-29 13:06:57'),
(36, 'PL02022036', 'KAYU RAJA', '-', '-', '-', '-', '-', '-3425000.00', '2023-01-29 13:09:28', '2023-01-29 13:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian`
--

CREATE TABLE `tblpembelian` (
  `idPembelian` bigint UNSIGNED NOT NULL,
  `noNota` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tglPembelian` datetime NOT NULL,
  `r_supplier` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subTotal` decimal(13,2) NOT NULL,
  `disc` decimal(13,2) NOT NULL,
  `discPercent` decimal(13,2) NOT NULL,
  `tax` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `term` int NOT NULL,
  `jthTempo` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpembelian`
--

INSERT INTO `tblpembelian` (`idPembelian`, `noNota`, `tglPembelian`, `r_supplier`, `subTotal`, `disc`, `discPercent`, `tax`, `total`, `note`, `term`, `jthTempo`, `created_at`, `updated_at`) VALUES
(27, 'PB2023-1', '2023-01-21 00:00:00', 'SP0002', '206500.00', '0.00', '0.00', '11.00', '206500.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(28, 'PB2023-2', '2023-01-21 00:00:00', 'SP0003', '28462000.00', '0.00', '0.00', '11.00', '28462000.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(29, 'PB2023-3', '2023-01-21 00:00:00', 'SP0002', '279000.00', '0.00', '0.00', '11.00', '279000.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(30, 'PB2023-4', '2023-01-21 00:00:00', 'SP0002', '304000.00', '0.00', '0.00', '11.00', '304000.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(31, 'PB2023-5', '2023-01-21 00:00:00', 'SP0002', '226000.00', '0.00', '0.00', '11.00', '226000.00', NULL, 0, '2023-01-21 00:00:00', '2023-01-20 20:40:09', '2023-01-20 20:40:09'),
(33, 'PB2023-6', '2023-01-22 00:00:00', 'SP0002', '220000.00', '0.00', '0.00', '11.00', '220000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 23:03:49', '2023-01-21 23:03:49'),
(34, 'PB2023-7', '2023-01-22 00:00:00', 'SP0002', '1540000.00', '0.00', '0.00', '11.00', '1540000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 23:04:57', '2023-01-21 23:04:57'),
(36, 'PB2023-8', '2023-01-22 00:00:00', 'SP0002', '1400000.00', '0.00', '0.00', '11.00', '1400000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 23:26:36', '2023-01-21 23:26:36'),
(37, 'PB2023-9', '2023-01-26 00:00:00', 'SP0003', '85000.00', '0.00', '0.00', '11.00', '85000.00', NULL, 0, '2023-01-26 00:00:00', '2023-01-26 12:40:26', '2023-01-26 12:40:26'),
(40, 'PB2023-10', '2023-01-31 00:00:00', 'SP0001', '1120000000.00', '0.00', '0.00', '11.00', '1120000000.00', NULL, 0, '2023-01-31 00:00:00', '2023-01-30 22:12:15', '2023-01-30 22:12:15'),
(41, 'PB2023-11', '2023-02-04 00:00:00', 'SP0001', '2350000.00', '0.00', '0.00', '11.00', '2350000.00', NULL, 0, '2023-02-04 00:00:00', '2023-02-04 03:00:44', '2023-02-04 03:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian_detail`
--

CREATE TABLE `tblpembelian_detail` (
  `idPembelianDetail` bigint UNSIGNED NOT NULL,
  `r_noNota` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kdBarang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hrgBeli` decimal(13,2) NOT NULL,
  `qty` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpembelian_detail`
--

INSERT INTO `tblpembelian_detail` (`idPembelianDetail`, `r_noNota`, `kdBarang`, `nmBarang`, `hrgBeli`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(14, 'PB2023-1', 'BRG0004', 'OLI MESRAN 5L', '200000.00', '1.00', '200000.00', '2023-01-20 19:06:41', '2023-01-20 19:06:41'),
(15, 'PB2023-1', 'BRG0003', 'DEX LITE', '6500.00', '1.00', '6500.00', '2023-01-20 19:06:41', '2023-01-20 19:06:41'),
(16, 'PB2023-2', 'BRG0001', 'PERTAMAX', '14000.00', '133.00', '1862000.00', '2023-01-20 19:09:33', '2023-01-20 19:09:33'),
(17, 'PB2023-2', 'BRG0004', 'OLI MESRAN 5L', '200000.00', '133.00', '26600000.00', '2023-01-20 19:09:33', '2023-01-20 19:09:33'),
(18, 'PB2023-3', 'BRG0002', 'PERTALITE', '9000.00', '18.00', '162000.00', '2023-01-20 20:27:33', '2023-01-20 20:27:33'),
(19, 'PB2023-3', 'BRG0003', 'DEX LITE', '6500.00', '18.00', '117000.00', '2023-01-20 20:27:33', '2023-01-20 20:27:33'),
(20, 'PB2023-4', 'BRG0004', 'OLI MESRAN 5L', '200000.00', '1.00', '200000.00', '2023-01-20 20:29:20', '2023-01-20 20:29:20'),
(21, 'PB2023-4', 'BRG0003', 'DEX LITE', '6500.00', '16.00', '104000.00', '2023-01-20 20:29:20', '2023-01-20 20:29:20'),
(22, 'PB2023-5', 'BRG0004', 'OLI MESRAN 5L', '200000.00', '15.00', '200000.00', '2023-01-20 20:40:09', '2023-01-20 20:40:09'),
(23, 'PB2023-5', 'BRG0003', 'DEX LITE', '6500.00', '4.00', '26000.00', '2023-01-20 20:40:09', '2023-01-20 20:40:09'),
(24, 'PB2023-6', 'BRG0004', 'OLI MESRAN 5L', '220000.00', '1.00', '220000.00', '2023-01-21 23:03:49', '2023-01-21 23:03:49'),
(25, 'PB2023-7', 'BRG0004', 'OLI MESRAN 5L', '220000.00', '7.00', '1540000.00', '2023-01-21 23:04:57', '2023-01-21 23:04:57'),
(26, 'PB2023-8', 'BRG0001', 'PERTAMAX', '14000.00', '100.00', '1400000.00', '2023-01-21 23:26:36', '2023-01-21 23:26:36'),
(27, 'PB2023-9', 'BRG0005', 'GAS ELPIGI 12KG', '17000.00', '5.00', '85000.00', '2023-01-26 12:40:26', '2023-01-26 12:40:26'),
(28, 'PB2023-10', 'BRG0001', 'PERTAMAX', '14000.00', '80000.00', '1120000000.00', '2023-01-30 22:12:15', '2023-01-30 22:12:15'),
(29, 'PB2023-11', 'BRG0007', 'OLI MESRAN 5L', '150000.00', '10.00', '1500000.00', '2023-02-04 03:00:44', '2023-02-04 03:00:44'),
(30, 'PB2023-11', 'BRG0008', 'OLI MESRAN 1.5L', '85000.00', '10.00', '850000.00', '2023-02-04 03:00:44', '2023-02-04 03:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualan`
--

CREATE TABLE `tblpenjualan` (
  `idPenjualan` bigint NOT NULL,
  `noPenjualan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tglPenjualan` datetime NOT NULL,
  `r_pelanggan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subTotalPenjualan` decimal(13,2) NOT NULL,
  `discPenjualan` decimal(13,2) NOT NULL,
  `discPercentP` int NOT NULL,
  `taxPenjualan` decimal(10,2) NOT NULL,
  `totalPenjualan` decimal(13,2) NOT NULL,
  `notePenjualan` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `termPenjualan` int DEFAULT NULL,
  `jthTempo` datetime DEFAULT NULL,
  `typeBayar` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `piutangPenjualan` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpenjualan`
--

INSERT INTO `tblpenjualan` (`idPenjualan`, `noPenjualan`, `tglPenjualan`, `r_pelanggan`, `subTotalPenjualan`, `discPenjualan`, `discPercentP`, `taxPenjualan`, `totalPenjualan`, `notePenjualan`, `termPenjualan`, `jthTempo`, `typeBayar`, `piutangPenjualan`, `created_at`, `updated_at`) VALUES
(1, 'INV2023001', '2023-02-04 00:00:00', 'PL02022030', '330000.00', '0.00', 0, '36300.00', '330000.00', NULL, 0, '2023-02-04 00:00:00', '0', '0.00', '2023-02-04 03:28:38', '2023-02-04 03:28:38'),
(2, 'INV2023002', '2023-02-02 00:00:00', 'PL02022030', '440000.00', '0.00', 0, '48400.00', '440000.00', NULL, 0, '2023-02-04 00:00:00', '0', '0.00', '2023-02-04 03:29:17', '2023-02-04 03:29:17'),
(3, 'INV2023003', '2023-02-03 00:00:00', 'PL02022030', '440000.00', '0.00', 0, '48400.00', '440000.00', NULL, 0, '2023-02-04 00:00:00', '0', '0.00', '2023-02-04 03:29:53', '2023-02-04 03:29:53'),
(4, 'INV2023004', '2023-02-03 00:00:00', 'PL02022030', '250000.00', '0.00', 0, '27500.00', '250000.00', NULL, 0, '2023-02-04 00:00:00', '0', '0.00', '2023-02-04 04:09:18', '2023-02-04 04:09:18'),
(5, 'INV2023005', '2023-02-04 00:00:00', 'PL02022030', '250000.00', '0.00', 0, '27500.00', '250000.00', NULL, 0, '2023-02-04 00:00:00', '0', '0.00', '2023-02-04 04:15:48', '2023-02-04 04:15:48'),
(6, 'INV2023006', '2023-02-04 00:00:00', 'PL02022030', '880000.00', '0.00', 0, '96800.00', '880000.00', NULL, 0, '2023-02-04 00:00:00', '0', '0.00', '2023-02-04 04:16:14', '2023-02-04 04:16:14');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualan_detail`
--

CREATE TABLE `tblpenjualan_detail` (
  `idDetailPenjualan` int NOT NULL,
  `r_noPenjualan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_trans` datetime NOT NULL,
  `r_kdBarang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_nmBarang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kategori_jual` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `hrgJual` decimal(13,2) NOT NULL,
  `qty` int NOT NULL,
  `satuanJual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `totalHpp` decimal(13,2) NOT NULL,
  `totalJual` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpenjualan_detail`
--

INSERT INTO `tblpenjualan_detail` (`idDetailPenjualan`, `r_noPenjualan`, `tgl_trans`, `r_kdBarang`, `r_nmBarang`, `kategori_jual`, `hrgJual`, `qty`, `satuanJual`, `totalHpp`, `totalJual`, `created_at`, `updated_at`) VALUES
(1, 'INV2023001', '2023-02-04 00:00:00', 'BRG0008', 'OLI MESRAN 1.5L', 'KT-2021-2', '110000.00', 1, 'BOTOL', '85000.00', '110000.00', '2023-02-04 03:28:38', '2023-02-04 03:28:38'),
(2, 'INV2023001', '2023-02-04 00:00:00', 'BRG0007', 'OLI MESRAN 5L', 'KT-2021-2', '220000.00', 1, 'BOTOL', '150000.00', '220000.00', '2023-02-04 03:28:38', '2023-02-04 03:28:38'),
(3, 'INV2023002', '2023-02-02 00:00:00', 'BRG0005', 'GAS ELPIGI 12KG', 'KT-2021-3', '220000.00', 2, 'TABUNG', '36000.00', '440000.00', '2023-02-04 03:29:17', '2023-02-04 03:29:17'),
(4, 'INV2023003', '2023-02-03 00:00:00', 'BRG0005', 'GAS ELPIGI 12KG', 'KT-2021-3', '220000.00', 1, 'TABUNG', '18000.00', '220000.00', '2023-02-04 03:29:53', '2023-02-04 03:29:53'),
(5, 'INV2023003', '2023-02-03 00:00:00', 'BRG0007', 'OLI MESRAN 5L', 'KT-2021-2', '220000.00', 1, 'BOTOL', '150000.00', '220000.00', '2023-02-04 03:29:53', '2023-02-04 03:29:53'),
(6, 'INV2023004', '2023-02-03 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '250000.00', 1, 'BOTOL', '220000.00', '250000.00', '2023-02-04 04:09:18', '2023-02-04 04:09:18'),
(7, 'INV2023005', '2023-02-04 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '250000.00', 1, 'BOTOL', '220000.00', '250000.00', '2023-02-04 04:15:48', '2023-02-04 04:15:48'),
(8, 'INV2023006', '2023-02-04 00:00:00', 'BRG0005', 'GAS ELPIGI 12KG', 'KT-2021-3', '220000.00', 4, 'TABUNG', '72000.00', '880000.00', '2023-02-04 04:16:14', '2023-02-04 04:16:14');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan`
--

CREATE TABLE `tblpersediaan` (
  `idPersediaan` bigint UNSIGNED NOT NULL,
  `kdPersediaan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmPersediaan` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stokPersediaan` int NOT NULL,
  `satuanPersediaan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ktgPersediaan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastPrice` decimal(10,2) DEFAULT NULL,
  `salePrice` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpersediaan`
--

INSERT INTO `tblpersediaan` (`idPersediaan`, `kdPersediaan`, `nmPersediaan`, `stokPersediaan`, `satuanPersediaan`, `ktgPersediaan`, `lastPrice`, `salePrice`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', -120899, 'Liter', 'KT-2021-1', '14000.00', '10000.00', '2023-01-19 22:24:13', '2023-01-19 22:24:13'),
(2, 'BRG0002', 'PERTALITE', -12911, 'Liter', 'KT-2021-1', '9000.00', '14900.00', '2023-01-19 22:25:23', '2023-01-19 22:25:23'),
(3, 'BRG0003', 'DEX LITE', -3099, 'Liter', 'KT-2021-1', '6500.00', '17800.00', '2023-01-19 22:26:32', '2023-01-19 22:26:32'),
(4, 'BRG0004', 'OLI MESRAN 5L', 140, 'BOTOL', 'KT-2021-2', '220000.00', '250000.00', '2023-01-20 12:14:45', '2023-01-20 12:14:45'),
(6, 'BRG0005', 'GAS ELPIGI 12KG', 39, 'TABUNG', 'KT-2021-2', '17000.00', '220000.00', NULL, NULL),
(7, 'BRG0006', 'OLI', 0, 'BOTOL', 'KT-2021-2', '20000.00', '40000.00', NULL, NULL),
(8, 'BRG0007', 'OLI MESRAN 5L', 6, 'BOTOL', 'KT-2021-2', '150000.00', '220000.00', NULL, NULL),
(9, 'BRG0008', 'OLI MESRAN 1.5L', 7, 'BOTOL', 'KT-2021-2', '85000.00', '110000.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan_detail`
--

CREATE TABLE `tblpersediaan_detail` (
  `idPersediaanDetail` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblperubahan_hargabbm`
--

CREATE TABLE `tblperubahan_hargabbm` (
  `id_perubahan` bigint NOT NULL,
  `harga_lama` decimal(13,2) NOT NULL,
  `harga_baru` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblperubahan_hargabbm`
--

INSERT INTO `tblperubahan_hargabbm` (`id_perubahan`, `harga_lama`, `harga_baru`, `created_at`, `updated_at`) VALUES
(1, '13900.00', '13000.00', '2023-02-02 06:14:15', '2023-02-02 06:14:15'),
(2, '13900.00', '14000.00', '2023-02-02 06:16:42', '2023-02-02 06:16:42'),
(3, '13900.00', '14500.00', '2023-02-02 06:17:00', '2023-02-02 06:17:00'),
(4, '11800.00', '13800.00', '2023-02-02 06:18:32', '2023-02-02 06:18:32'),
(5, '11800.00', '17000.00', '2023-02-02 20:07:54', '2023-02-02 20:07:54'),
(6, '11800.00', '17800.00', '2023-02-02 20:11:55', '2023-02-02 20:11:55');

-- --------------------------------------------------------

--
-- Table structure for table `tblpo_bbm`
--

CREATE TABLE `tblpo_bbm` (
  `idPembelian` bigint UNSIGNED NOT NULL,
  `no_po` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_po` datetime NOT NULL,
  `r_supplier` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subTotal` decimal(13,2) NOT NULL,
  `disc` decimal(13,2) NOT NULL,
  `discPercent` decimal(13,2) NOT NULL,
  `tax` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `term` int NOT NULL,
  `jthTempo` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpo_detail`
--

CREATE TABLE `tblpo_detail` (
  `idPembelianDetail` bigint UNSIGNED NOT NULL,
  `r_noPo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kdBarang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hrgBeli` decimal(13,2) NOT NULL,
  `qty` decimal(13,2) NOT NULL,
  `qty_recieve` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblprofit`
--

CREATE TABLE `tblprofit` (
  `id_profit` bigint NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_profit` datetime NOT NULL,
  `kdBarang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hpp_beli` decimal(13,2) NOT NULL,
  `qty_laku` decimal(13,2) NOT NULL,
  `total_laku` decimal(13,2) NOT NULL,
  `margin_laku` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblprofit`
--

INSERT INTO `tblprofit` (`id_profit`, `kd_trans`, `tgl_profit`, `kdBarang`, `hpp_beli`, `qty_laku`, `total_laku`, `margin_laku`, `created_at`, `updated_at`) VALUES
(4, '20230204A1', '2023-02-04 00:00:00', 'BRG0001', '19460000.00', '1400.00', '20300000.00', '840000.00', '2023-02-04 08:57:07', '2023-02-04 08:57:07'),
(5, '20230204A1', '2023-02-04 00:00:00', 'BRG0002', '20700000.00', '2300.00', '43950000.00', '23250000.00', '2023-02-04 08:57:07', '2023-02-04 08:57:07'),
(6, '20230204A1', '2023-02-04 00:00:00', 'BRG0003', '15340000.00', '1300.00', '23140000.00', '7800000.00', '2023-02-04 08:57:07', '2023-02-04 08:57:07'),
(7, '20230202A1', '2023-02-02 00:00:00', 'BRG0001', '19460000.00', '1400.00', '20300000.00', '840000.00', '2023-02-04 08:58:02', '2023-02-04 08:58:02'),
(8, '20230202A1', '2023-02-02 00:00:00', 'BRG0002', '26100000.00', '2900.00', '52600000.00', '26500000.00', '2023-02-04 08:58:02', '2023-02-04 08:58:02'),
(9, '20230202A1', '2023-02-02 00:00:00', 'BRG0003', '15340000.00', '1300.00', '23140000.00', '7800000.00', '2023-02-04 08:58:02', '2023-02-04 08:58:02'),
(10, '20230204B1', '2023-02-04 00:00:00', 'BRG0001', '1594330000.00', '114700.00', '1657750000.00', '63420000.00', '2023-02-04 09:56:11', '2023-02-04 09:56:11'),
(11, '20230204B1', '2023-02-04 00:00:00', 'BRG0002', '30600000.00', '3400.00', '50190000.00', '19590000.00', '2023-02-04 09:56:11', '2023-02-04 09:56:11'),
(12, '20230204B1', '2023-02-04 00:00:00', 'BRG0003', '5900000.00', '500.00', '8900000.00', '3000000.00', '2023-02-04 09:56:11', '2023-02-04 09:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblrates`
--

CREATE TABLE `tblrates` (
  `id` bigint UNSIGNED NOT NULL,
  `rateCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rateName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ratePrice` decimal(17,2) NOT NULL,
  `rateStart` datetime NOT NULL,
  `rateEnd` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblrates`
--

INSERT INTO `tblrates` (`id`, `rateCode`, `rateName`, `ratePrice`, `rateStart`, `rateEnd`, `created_at`, `updated_at`) VALUES
(1, 'rt01', 'standart rate', '50.00', '2022-09-03 07:50:37', '2022-09-03 07:50:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblrooms`
--

CREATE TABLE `tblrooms` (
  `id` bigint UNSIGNED NOT NULL,
  `roomCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `roomName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rRoomRate` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `roomDesc` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `roomPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblrooms`
--

INSERT INTO `tblrooms` (`id`, `roomCode`, `roomName`, `rRoomRate`, `roomDesc`, `roomPic`, `created_at`, `updated_at`) VALUES
(1, 'R001', 'Deluxe Room 2', '2', 'Rice terace view with balconi', 'pic1.jpg', NULL, '2022-09-02 15:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `id` bigint UNSIGNED NOT NULL,
  `kdSupplier` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nmSupplier` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `almtSupplier` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tlpSupplier` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `picSupplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsupplier`
--

INSERT INTO `tblsupplier` (`id`, `kdSupplier`, `nmSupplier`, `almtSupplier`, `tlpSupplier`, `picSupplier`, `created_at`, `updated_at`) VALUES
(1, 'SP0001', 'CASH', 'DENPASAR', '08187654', 'MAS', '2023-01-20 13:30:05', '2023-01-20 13:30:05'),
(2, 'SP0002', 'PT BBM NUSANTARA', 'KARANGASEM', '987654', 'OM', '2023-01-20 13:30:48', '2023-01-20 13:30:48'),
(3, 'SP0003', 'PT MIGAS', 'DENPASAR', '787686', 'ANDI', '2023-01-20 13:44:37', '2023-01-20 13:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbltransaksi_nosel`
--

CREATE TABLE `tbltransaksi_nosel` (
  `id` bigint UNSIGNED NOT NULL,
  `r_bbm` int NOT NULL,
  `r_nosel` int NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_regu` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `last_meter` decimal(13,2) DEFAULT NULL,
  `awal_meter` decimal(13,2) NOT NULL,
  `cost_ltr` decimal(13,2) DEFAULT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `total_hpp` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbltransaksi_nosel`
--

INSERT INTO `tbltransaksi_nosel` (`id`, `r_bbm`, `r_nosel`, `kd_trans`, `r_regu`, `tgl_transaksi`, `last_meter`, `awal_meter`, `cost_ltr`, `last_price`, `total`, `total_hpp`, `created_at`, `updated_at`) VALUES
(71, 1, 1, '20230204A1', 'A', '2023-02-04 00:00:00', '121500.00', '121000.00', '500.00', '14500.00', '7250000.00', '6950000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(72, 1, 2, '20230204A1', 'A', '2023-02-04 00:00:00', '12000.00', '11600.00', '400.00', '14500.00', '5800000.00', '5560000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(73, 2, 3, '20230204A1', 'A', '2023-02-04 00:00:00', '359000.00', '358000.00', '1000.00', '25100.00', '25100000.00', '9000000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(74, 2, 4, '20230204A1', 'A', '2023-02-04 00:00:00', '43000.00', '42000.00', '1000.00', '14500.00', '14500000.00', '9000000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(75, 1, 5, '20230204A1', 'A', '2023-02-04 00:00:00', '17500.00', '17000.00', '500.00', '14500.00', '7250000.00', '6950000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(76, 2, 6, '20230204A1', 'A', '2023-02-04 00:00:00', '19200.00', '18900.00', '300.00', '14500.00', '4350000.00', '2700000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(77, 3, 7, '20230204A1', 'A', '2023-02-04 00:00:00', '26500.00', '26200.00', '300.00', '17800.00', '5340000.00', '3540000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(78, 3, 8, '20230204A1', 'A', '2023-02-04 00:00:00', '277000.00', '276000.00', '1000.00', '17800.00', '17800000.00', '11800000.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(79, 2, 9, '20230204A1', 'A', '2023-02-04 00:00:00', '277000.00', '25000.00', '0.00', '10000.00', '0.00', '0.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(80, 2, 10, '20230204A1', 'A', '2023-02-04 00:00:00', '277000.00', '19000.00', '0.00', '14900.00', '0.00', '0.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(81, 1, 11, '20230204A1', 'A', '2023-02-04 00:00:00', '277000.00', '23700.00', '0.00', '10000.00', '0.00', '0.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(82, 1, 12, '20230204A1', 'A', '2023-02-04 00:00:00', '277000.00', '26100.00', '0.00', '10000.00', '0.00', '0.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(83, 2, 13, '20230204A1', 'A', '2023-02-04 00:00:00', '277000.00', '1100.00', '0.00', '12000.00', '0.00', '0.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(84, 2, 14, '20230204A1', 'A', '2023-02-04 00:00:00', '277000.00', '1100.00', '0.00', '14900.00', '0.00', '0.00', '2023-02-04 00:57:07', '2023-02-04 00:57:07'),
(85, 1, 1, '20230202A1', 'A', '2023-02-02 00:00:00', '121500.00', '121000.00', '500.00', '14500.00', '7250000.00', '6950000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(86, 1, 2, '20230202A1', 'A', '2023-02-02 00:00:00', '12000.00', '11600.00', '400.00', '14500.00', '5800000.00', '5560000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(87, 2, 3, '20230202A1', 'A', '2023-02-02 00:00:00', '359000.00', '358000.00', '1000.00', '25100.00', '25100000.00', '9000000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(88, 2, 4, '20230202A1', 'A', '2023-02-02 00:00:00', '43000.00', '42000.00', '1000.00', '14500.00', '14500000.00', '9000000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(89, 1, 5, '20230202A1', 'A', '2023-02-02 00:00:00', '17500.00', '17000.00', '500.00', '14500.00', '7250000.00', '6950000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(90, 2, 6, '20230202A1', 'A', '2023-02-02 00:00:00', '19200.00', '18900.00', '300.00', '14500.00', '4350000.00', '2700000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(91, 3, 7, '20230202A1', 'A', '2023-02-02 00:00:00', '26500.00', '26200.00', '300.00', '17800.00', '5340000.00', '3540000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(92, 3, 8, '20230202A1', 'A', '2023-02-02 00:00:00', '277000.00', '276000.00', '1000.00', '17800.00', '17800000.00', '11800000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(93, 2, 9, '20230202A1', 'A', '2023-02-02 00:00:00', '277000.00', '25000.00', '0.00', '10000.00', '0.00', '0.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(94, 2, 10, '20230202A1', 'A', '2023-02-02 00:00:00', '277000.00', '19000.00', '0.00', '14900.00', '0.00', '0.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(95, 1, 11, '20230202A1', 'A', '2023-02-02 00:00:00', '277000.00', '23700.00', '0.00', '10000.00', '0.00', '0.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(96, 1, 12, '20230202A1', 'A', '2023-02-02 00:00:00', '277000.00', '26100.00', '0.00', '10000.00', '0.00', '0.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(97, 2, 13, '20230202A1', 'A', '2023-02-02 00:00:00', '1200.00', '1100.00', '100.00', '12000.00', '1200000.00', '900000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(98, 2, 14, '20230202A1', 'A', '2023-02-02 00:00:00', '1600.00', '1100.00', '500.00', '14900.00', '7450000.00', '4500000.00', '2023-02-04 00:58:02', '2023-02-04 00:58:02'),
(99, 1, 1, '20230204B1', 'B', '2023-02-04 00:00:00', '122000.00', '121500.00', '500.00', '14500.00', '7250000.00', '6950000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(100, 1, 2, '20230204B1', 'B', '2023-02-04 00:00:00', '125000.00', '12000.00', '113000.00', '14500.00', '1638500000.00', '1570700000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(101, 2, 3, '20230204B1', 'B', '2023-02-04 00:00:00', '360000.00', '359000.00', '1000.00', '25100.00', '25100000.00', '9000000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(102, 2, 4, '20230204B1', 'B', '2023-02-04 00:00:00', '360000.00', '43000.00', '0.00', '14500.00', '0.00', '0.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(103, 1, 5, '20230204B1', 'B', '2023-02-04 00:00:00', '360000.00', '17500.00', '0.00', '14500.00', '0.00', '0.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(104, 2, 6, '20230204B1', 'B', '2023-02-04 00:00:00', '360000.00', '19200.00', '0.00', '14500.00', '0.00', '0.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(105, 3, 7, '20230204B1', 'B', '2023-02-04 00:00:00', '27000.00', '26500.00', '500.00', '17800.00', '8900000.00', '5900000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(106, 3, 8, '20230204B1', 'B', '2023-02-04 00:00:00', '27000.00', '277000.00', '0.00', '17800.00', '0.00', '0.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(107, 2, 9, '20230204B1', 'B', '2023-02-04 00:00:00', '27000.00', '25000.00', '2000.00', '10000.00', '20000000.00', '18000000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(108, 2, 10, '20230204B1', 'B', '2023-02-04 00:00:00', '27000.00', '19000.00', '0.00', '14900.00', '0.00', '0.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(109, 1, 11, '20230204B1', 'B', '2023-02-04 00:00:00', '24000.00', '23700.00', '300.00', '10000.00', '3000000.00', '4170000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(110, 1, 12, '20230204B1', 'B', '2023-02-04 00:00:00', '27000.00', '26100.00', '900.00', '10000.00', '9000000.00', '12510000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(111, 2, 13, '20230204B1', 'B', '2023-02-04 00:00:00', '1500.00', '1200.00', '300.00', '12000.00', '3600000.00', '2700000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11'),
(112, 2, 14, '20230204B1', 'B', '2023-02-04 00:00:00', '1700.00', '1600.00', '100.00', '14900.00', '1490000.00', '900000.00', '2023-02-04 01:56:11', '2023-02-04 01:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2022-06-21 02:08:43', '$2y$10$1M/zZK917.HJrYuNrWF2yued.SVCPw89I5RVZqliW9ndVZAUSmuFu', NULL, '2022-06-21 02:08:43', '2022-06-21 02:08:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `link_acc`
--
ALTER TABLE `link_acc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rekening_anggaran`
--
ALTER TABLE `rekening_anggaran`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indexes for table `tblbarang`
--
ALTER TABLE `tblbarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbbm`
--
ALTER TABLE `tblbbm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbbm_detail`
--
ALTER TABLE `tblbbm_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbiaya`
--
ALTER TABLE `tblbiaya`
  ADD PRIMARY KEY (`id_biaya`);

--
-- Indexes for table `tblgeneral_ledger`
--
ALTER TABLE `tblgeneral_ledger`
  ADD PRIMARY KEY (`idGl`);

--
-- Indexes for table `tblheader_aplusan`
--
ALTER TABLE `tblheader_aplusan`
  ADD PRIMARY KEY (`id_aplusan`),
  ADD UNIQUE KEY `kd_trans` (`kd_trans`);

--
-- Indexes for table `tblkategori`
--
ALTER TABLE `tblkategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblkupon`
--
ALTER TABLE `tblkupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbllinkaja`
--
ALTER TABLE `tbllinkaja`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblnosel_detail`
--
ALTER TABLE `tblnosel_detail`
  ADD PRIMARY KEY (`id_nosel`);

--
-- Indexes for table `tblopnum`
--
ALTER TABLE `tblopnum`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kdOpnum` (`kdOpnum`);

--
-- Indexes for table `tblopnum_detail`
--
ALTER TABLE `tblopnum_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpegawai`
--
ALTER TABLE `tblpegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpelanggan`
--
ALTER TABLE `tblpelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpembelian`
--
ALTER TABLE `tblpembelian`
  ADD PRIMARY KEY (`idPembelian`);

--
-- Indexes for table `tblpembelian_detail`
--
ALTER TABLE `tblpembelian_detail`
  ADD PRIMARY KEY (`idPembelianDetail`);

--
-- Indexes for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  ADD PRIMARY KEY (`idPenjualan`),
  ADD UNIQUE KEY `noPenjualan` (`noPenjualan`);

--
-- Indexes for table `tblpenjualan_detail`
--
ALTER TABLE `tblpenjualan_detail`
  ADD PRIMARY KEY (`idDetailPenjualan`);

--
-- Indexes for table `tblpersediaan`
--
ALTER TABLE `tblpersediaan`
  ADD PRIMARY KEY (`idPersediaan`);

--
-- Indexes for table `tblpersediaan_detail`
--
ALTER TABLE `tblpersediaan_detail`
  ADD PRIMARY KEY (`idPersediaanDetail`);

--
-- Indexes for table `tblperubahan_hargabbm`
--
ALTER TABLE `tblperubahan_hargabbm`
  ADD PRIMARY KEY (`id_perubahan`);

--
-- Indexes for table `tblpo_bbm`
--
ALTER TABLE `tblpo_bbm`
  ADD PRIMARY KEY (`idPembelian`);

--
-- Indexes for table `tblpo_detail`
--
ALTER TABLE `tblpo_detail`
  ADD PRIMARY KEY (`idPembelianDetail`);

--
-- Indexes for table `tblprofit`
--
ALTER TABLE `tblprofit`
  ADD PRIMARY KEY (`id_profit`);

--
-- Indexes for table `tblrates`
--
ALTER TABLE `tblrates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrooms`
--
ALTER TABLE `tblrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltransaksi_nosel`
--
ALTER TABLE `tbltransaksi_nosel`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `link_acc`
--
ALTER TABLE `link_acc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `rekening_anggaran`
--
ALTER TABLE `rekening_anggaran`
  MODIFY `id_rekening` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbarang`
--
ALTER TABLE `tblbarang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblbbm`
--
ALTER TABLE `tblbbm`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblbbm_detail`
--
ALTER TABLE `tblbbm_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbiaya`
--
ALTER TABLE `tblbiaya`
  MODIFY `id_biaya` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblgeneral_ledger`
--
ALTER TABLE `tblgeneral_ledger`
  MODIFY `idGl` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblheader_aplusan`
--
ALTER TABLE `tblheader_aplusan`
  MODIFY `id_aplusan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblkupon`
--
ALTER TABLE `tblkupon`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbllinkaja`
--
ALTER TABLE `tbllinkaja`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblnosel_detail`
--
ALTER TABLE `tblnosel_detail`
  MODIFY `id_nosel` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblopnum`
--
ALTER TABLE `tblopnum`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tblopnum_detail`
--
ALTER TABLE `tblopnum_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tblpegawai`
--
ALTER TABLE `tblpegawai`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpelanggan`
--
ALTER TABLE `tblpelanggan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tblpembelian`
--
ALTER TABLE `tblpembelian`
  MODIFY `idPembelian` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tblpembelian_detail`
--
ALTER TABLE `tblpembelian_detail`
  MODIFY `idPembelianDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  MODIFY `idPenjualan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblpenjualan_detail`
--
ALTER TABLE `tblpenjualan_detail`
  MODIFY `idDetailPenjualan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblpersediaan`
--
ALTER TABLE `tblpersediaan`
  MODIFY `idPersediaan` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblpersediaan_detail`
--
ALTER TABLE `tblpersediaan_detail`
  MODIFY `idPersediaanDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblperubahan_hargabbm`
--
ALTER TABLE `tblperubahan_hargabbm`
  MODIFY `id_perubahan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblpo_bbm`
--
ALTER TABLE `tblpo_bbm`
  MODIFY `idPembelian` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpo_detail`
--
ALTER TABLE `tblpo_detail`
  MODIFY `idPembelianDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblprofit`
--
ALTER TABLE `tblprofit`
  MODIFY `id_profit` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblrates`
--
ALTER TABLE `tblrates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblrooms`
--
ALTER TABLE `tblrooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltransaksi_nosel`
--
ALTER TABLE `tbltransaksi_nosel`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
