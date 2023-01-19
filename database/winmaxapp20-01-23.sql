-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 20, 2023 at 12:50 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.25

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
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(16, '2023_01_20_051650_create_suppliers_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'ApiToken', '51b4a33a61bde0bc251e75ada5e9baf2273341822ebcb8d36f58642e00bb9cc4', '[\"*\"]', NULL, '2022-06-20 18:34:53', '2022-06-20 18:34:53'),
(2, 'App\\Models\\User', 1, 'ApiToken', '68667b0f4b759cd12b1cd214bfb61e45a0fe436f1a4174044d7b20ee7c3ba33c', '[\"*\"]', NULL, '2022-06-27 20:30:35', '2022-06-27 20:30:35'),
(3, 'App\\Models\\User', 1, 'ApiToken', '8d082d86f7095d65009221693c3876284999fedc76d78d411e5efad612064530', '[\"*\"]', NULL, '2022-06-28 18:06:31', '2022-06-28 18:06:31'),
(4, 'App\\Models\\User', 1, 'ApiToken', '292ee024ba9a5940a52d18c24c0e26924521a9ec207eaec3061478ebdfbdaa07', '[\"*\"]', '2022-06-28 18:15:47', '2022-06-28 18:15:30', '2022-06-28 18:15:47'),
(5, 'App\\Models\\User', 1, 'ApiToken', '6737024200b3aafc04c1bff360cbe37d7dac5f02adb7785f53a620a0b936feb3', '[\"*\"]', NULL, '2022-06-28 18:17:05', '2022-06-28 18:17:05'),
(6, 'App\\Models\\User', 1, 'ApiToken', '00f18600fd0a914a45ea9dbe4fc49a7921c206e2acbc76b50d5b95d3b97b78dc', '[\"*\"]', NULL, '2022-06-28 19:20:03', '2022-06-28 19:20:03'),
(7, 'App\\Models\\User', 1, 'ApiToken', 'cd531eccc9a24e3763c14cbe7e0e2e2320bfe949052687327fc7a4f918a45f30', '[\"*\"]', NULL, '2022-06-28 19:25:03', '2022-06-28 19:25:03'),
(8, 'App\\Models\\User', 1, 'ApiToken', '44377c7901b6f90a9bb591ea0abd2b6588c16ddc41550002040cd845f7c9046f', '[\"*\"]', NULL, '2022-06-28 19:27:21', '2022-06-28 19:27:21'),
(9, 'App\\Models\\User', 1, 'ApiToken', '2b7af0566c32f96705427519b8c000ebbe44cbb963ce4d923ae50adeaf53e03a', '[\"*\"]', NULL, '2022-06-28 19:33:54', '2022-06-28 19:33:54'),
(10, 'App\\Models\\User', 1, 'ApiToken', 'f61850abd60fbe5038803e284d47545d8eaf6305f298761bf1e7a0e53f616ce0', '[\"*\"]', NULL, '2022-06-28 19:37:24', '2022-06-28 19:37:24'),
(11, 'App\\Models\\User', 1, 'ApiToken', 'b57ae1542f55fe4835abdeec821f8655f977d761c1840b29429afa436bcd267e', '[\"*\"]', NULL, '2022-06-28 19:37:44', '2022-06-28 19:37:44'),
(12, 'App\\Models\\User', 1, 'ApiToken', 'd4934674f91c50447ab193afcdce5f13239fd9bfd10cc014f48cbad1c0e16a05', '[\"*\"]', NULL, '2022-06-28 19:38:17', '2022-06-28 19:38:17'),
(13, 'App\\Models\\User', 1, 'ApiToken', '9b860e2b8f957b357d6a162c9ce77cef922794d453c88469abab0c25f6d559ad', '[\"*\"]', NULL, '2022-06-28 19:39:47', '2022-06-28 19:39:47'),
(14, 'App\\Models\\User', 1, 'ApiToken', 'bf0a54ac6f864d03488ee2b6543c3805fd0de2de604a9f3e40197d97425b56bb', '[\"*\"]', NULL, '2022-06-28 19:40:40', '2022-06-28 19:40:40'),
(15, 'App\\Models\\User', 1, 'ApiToken', '05dba54b4d534b46cebd086aea4a3c48c2fd5fc111c0f896ceb958d77aa92626', '[\"*\"]', NULL, '2022-06-28 19:57:33', '2022-06-28 19:57:33'),
(16, 'App\\Models\\User', 1, 'ApiToken', '10fce6b196288e7ab8e4353daadb0e27d3786343cb4aca2d0185ceb5f938c951', '[\"*\"]', NULL, '2022-06-28 20:01:42', '2022-06-28 20:01:42'),
(17, 'App\\Models\\User', 1, 'ApiToken', 'bbc630dceed6822de4ac321ae26071abdd4f35de1fe42f8fc124d3c840b64172', '[\"*\"]', NULL, '2022-06-28 20:02:09', '2022-06-28 20:02:09'),
(18, 'App\\Models\\User', 1, 'ApiToken', 'bcb630123a72a9e04724c24e93de7187570976ee68c4d29c6652992319647ab2', '[\"*\"]', NULL, '2022-06-28 20:02:52', '2022-06-28 20:02:52'),
(19, 'App\\Models\\User', 1, 'ApiToken', 'f5123ea1db2d684bfc284bb3425f5d2519f06d905170377ba0e98bd3183d6c6b', '[\"*\"]', NULL, '2022-06-28 20:31:24', '2022-06-28 20:31:24'),
(20, 'App\\Models\\User', 1, 'ApiToken', '31c9801e04d1fd38f9c027ebccffbdfba06166eb8fe03478919d7eb359c8924a', '[\"*\"]', NULL, '2022-06-28 20:33:54', '2022-06-28 20:33:54'),
(21, 'App\\Models\\User', 1, 'ApiToken', '71cfd3e67d18018c44c35a3824bed91ae43eef60e7979ab63bb070404c4f14b3', '[\"*\"]', NULL, '2022-06-29 17:00:32', '2022-06-29 17:00:32'),
(22, 'App\\Models\\User', 1, 'ApiToken', '706d3c3ef5aa1245c640005de991162917ceb9056d13d7a8b4b735828d89f2df', '[\"*\"]', NULL, '2022-06-29 17:03:22', '2022-06-29 17:03:22'),
(23, 'App\\Models\\User', 1, 'ApiToken', '2e17047901fe670891fe8073291611f81252346e1104b49556cda3ef9b8fd6f8', '[\"*\"]', NULL, '2022-06-29 17:06:05', '2022-06-29 17:06:05'),
(24, 'App\\Models\\User', 1, 'ApiToken', '063285343d9b75af3ace7872b575b13f7faf6bbb687ce2a480cc93dc2e8d8a86', '[\"*\"]', NULL, '2022-06-29 17:08:39', '2022-06-29 17:08:39'),
(25, 'App\\Models\\User', 1, 'ApiToken', '3e4b14529088aed66e5688a3828063378ea34a7876b10f84bf5ae7d7ba1dce56', '[\"*\"]', NULL, '2022-06-29 17:11:16', '2022-06-29 17:11:16'),
(26, 'App\\Models\\User', 1, 'ApiToken', '1ee28cf443c1b9b5a3246b19c5888dd1b211f89d79b0edcf0e551f550805799f', '[\"*\"]', NULL, '2022-06-29 17:11:50', '2022-06-29 17:11:50'),
(27, 'App\\Models\\User', 1, 'ApiToken', 'a5e691e68a0cde7442bb798bc8346285c85718ffc9c974f051a762ab747ec389', '[\"*\"]', NULL, '2022-06-29 17:12:05', '2022-06-29 17:12:05'),
(28, 'App\\Models\\User', 1, 'ApiToken', '28fc9ef4ac27dfb9b616d3d4098f11f223401dc6d63f6bf283bf1d4932861388', '[\"*\"]', NULL, '2022-06-29 17:13:11', '2022-06-29 17:13:11'),
(29, 'App\\Models\\User', 1, 'ApiToken', '9dacb3e68a8aeb3a29adaeeda7be996316d65c63e17e7352d4d2b27ea4a09c4d', '[\"*\"]', NULL, '2022-06-29 17:13:59', '2022-06-29 17:13:59'),
(30, 'App\\Models\\User', 1, 'ApiToken', '17c2cee19851dd5714043953cbc618659651c6ce919fe1b9d4b6d6a4d23c74f9', '[\"*\"]', NULL, '2022-06-29 17:18:53', '2022-06-29 17:18:53'),
(31, 'App\\Models\\User', 1, 'ApiToken', 'ff9f600a8e3f4c71b0e4dc68fafb5c4d178f973e50487b7f7838a187eb453e16', '[\"*\"]', NULL, '2022-06-29 17:20:37', '2022-06-29 17:20:37'),
(32, 'App\\Models\\User', 1, 'ApiToken', 'b935d74e78e0a10f98f959442941205246dcaa31ac4c45a22ca2f42b6ab19ff9', '[\"*\"]', NULL, '2022-06-29 17:22:25', '2022-06-29 17:22:25'),
(33, 'App\\Models\\User', 1, 'ApiToken', '2c963ffea926ff1409aab72e8754487ba7a306dfe7cb51264cb475663aa349fc', '[\"*\"]', NULL, '2022-06-29 17:23:27', '2022-06-29 17:23:27'),
(34, 'App\\Models\\User', 1, 'ApiToken', '91b1968d244de84311bbabc9528bdcd9c3a5ef7f69df2d348d9387ebb991ed55', '[\"*\"]', NULL, '2022-06-29 17:23:47', '2022-06-29 17:23:47'),
(35, 'App\\Models\\User', 1, 'ApiToken', 'd911c2c35b6798eb6956b0010fd9a95b277d004f01609ec613c476d966aebdc2', '[\"*\"]', NULL, '2022-06-29 17:27:41', '2022-06-29 17:27:41'),
(36, 'App\\Models\\User', 1, 'ApiToken', 'cbcdbe0a0cc915b71acf57d7f4bfabbb391ea3ba1fa42a7c0d5344fa8841d786', '[\"*\"]', NULL, '2022-06-29 17:45:39', '2022-06-29 17:45:39'),
(37, 'App\\Models\\User', 1, 'ApiToken', 'fe8f7192b284c79f75ab816a85605fdaa5a894c44a638b43e79de987bc8f95a0', '[\"*\"]', NULL, '2022-06-29 18:01:07', '2022-06-29 18:01:07'),
(38, 'App\\Models\\User', 1, 'ApiToken', '6018a2992ad3d33bc3f37430df294556c1e96025237bdef2913b219e1c77dcf0', '[\"*\"]', NULL, '2022-06-29 18:24:17', '2022-06-29 18:24:17'),
(39, 'App\\Models\\User', 1, 'ApiToken', '7421b99d9c68f121abcdbbc8057d891cc799e671dcc3e59a9d65f4339899a1f8', '[\"*\"]', NULL, '2022-06-29 23:37:58', '2022-06-29 23:37:58'),
(40, 'App\\Models\\User', 1, 'ApiToken', 'd4ca1c34fea4c2f97d2bb5ef22b0e962a692fcdf0605d300e11928f5a2a8aeec', '[\"*\"]', NULL, '2022-06-30 17:09:19', '2022-06-30 17:09:19'),
(41, 'App\\Models\\User', 1, 'ApiToken', 'c6f6263262e7d6678a94e00fa61bc1dad60a8166c4362127381c77230e19e43d', '[\"*\"]', NULL, '2022-06-30 18:20:54', '2022-06-30 18:20:54'),
(42, 'App\\Models\\User', 1, 'ApiToken', 'd3f84f0bf564396a8b8e61b9a90d54735590f7515f27ef04c55321956fc33f96', '[\"*\"]', NULL, '2022-06-30 18:22:56', '2022-06-30 18:22:56'),
(43, 'App\\Models\\User', 1, 'ApiToken', '1f6dd04ac3a0e129e7d3fbbc8ce194a9343f4fbdbf12eb426f69c9d6c5d35d06', '[\"*\"]', NULL, '2022-06-30 18:28:35', '2022-06-30 18:28:35'),
(44, 'App\\Models\\User', 1, 'ApiToken', '0e1be010f0b96400ba3a8a044135da8489806cb74519de31ec085ebb4c5f742e', '[\"*\"]', NULL, '2022-06-30 18:32:02', '2022-06-30 18:32:02'),
(45, 'App\\Models\\User', 1, 'ApiToken', 'deaf7237dd5b6fbd72acb47a39cac4ebbe8ea4684ab8b14dfc65e7743921dd59', '[\"*\"]', NULL, '2022-06-30 18:35:11', '2022-06-30 18:35:11'),
(46, 'App\\Models\\User', 1, 'ApiToken', '470d0fd257f553390ec6f78ac8dd5c024b07dab07a3e3f2353844ae5d5ac681e', '[\"*\"]', '2022-06-30 18:59:52', '2022-06-30 18:59:32', '2022-06-30 18:59:52'),
(47, 'App\\Models\\User', 1, 'ApiToken', '5ad534e15bb96bbb5e67626c4513e8f5e1dd91b0330673026cef82156f9876c3', '[\"*\"]', NULL, '2022-06-30 19:00:09', '2022-06-30 19:00:09'),
(48, 'App\\Models\\User', 1, 'ApiToken', '8d40798df3d87e9409c08ad6eb3d9c097018de441ec2534c33058c8f4c545bc2', '[\"*\"]', NULL, '2022-06-30 19:10:03', '2022-06-30 19:10:03'),
(49, 'App\\Models\\User', 1, 'ApiToken', '0c61ff7d86fd7bc1757ba90dd0da6739eb0ebd8e0122604602b070d6382eeecc', '[\"*\"]', NULL, '2022-06-30 23:30:18', '2022-06-30 23:30:18'),
(50, 'App\\Models\\User', 1, 'ApiToken', 'fbfb5ace7377c8cb5cc38951977f557f3b7da583b45b890fd1fd33044e242d8b', '[\"*\"]', NULL, '2022-06-30 23:31:09', '2022-06-30 23:31:09'),
(51, 'App\\Models\\User', 1, 'ApiToken', 'a4950d81f31d54336150b862b991777ff9fd1113f2799309b1e2676d8fad4e04', '[\"*\"]', NULL, '2022-06-30 23:37:45', '2022-06-30 23:37:45'),
(52, 'App\\Models\\User', 1, 'ApiToken', 'c7babe8d1aab9c3b16a6d56892d6bcc28d3f8cb211e20abb10cf6f37a9eada93', '[\"*\"]', NULL, '2022-07-01 00:10:18', '2022-07-01 00:10:18'),
(53, 'App\\Models\\User', 1, 'ApiToken', '5299fe9af809576782c0a717d957b22a8a4a951c84f97cad8edaf3267fdd3d5d', '[\"*\"]', NULL, '2022-07-01 00:15:31', '2022-07-01 00:15:31'),
(54, 'App\\Models\\User', 1, 'ApiToken', '4e06b776add9638e3afc742f4d26fbc6b7a269563955526656c51c4ef495efad', '[\"*\"]', NULL, '2022-07-01 00:18:04', '2022-07-01 00:18:04'),
(55, 'App\\Models\\User', 1, 'ApiToken', 'b194ffd4308cc6fb408f850058600a992b60f822f3fbd21bfe170b38ef545b29', '[\"*\"]', NULL, '2022-07-01 00:21:57', '2022-07-01 00:21:57'),
(56, 'App\\Models\\User', 1, 'ApiToken', 'd41743d1f079fcdb03332539f9ce5231cfc4bd8df845498fcbad40bbe85e77b7', '[\"*\"]', NULL, '2022-07-01 00:23:06', '2022-07-01 00:23:06'),
(57, 'App\\Models\\User', 1, 'ApiToken', 'c56eeb5b8c98d48b9757b21ab0b1361c0a8e54574bfdc52c1914bbc0f38ab90d', '[\"*\"]', NULL, '2022-07-01 00:23:56', '2022-07-01 00:23:56'),
(58, 'App\\Models\\User', 1, 'ApiToken', 'bde834c10f21b5243e276ac597f4f4a8970d82288cd4a743dfceeb42526af6ae', '[\"*\"]', NULL, '2022-07-01 00:27:11', '2022-07-01 00:27:11'),
(59, 'App\\Models\\User', 1, 'ApiToken', '0e04b7344f3376ce630e3aae20195c3029d5a08fe1ae6fd9be5110ef19cb19bb', '[\"*\"]', NULL, '2022-07-01 00:29:42', '2022-07-01 00:29:42'),
(60, 'App\\Models\\User', 1, 'ApiToken', '0faea30eefb98c35096e36e307777e2aa1beb45be22d37cb959c36313d8889d8', '[\"*\"]', NULL, '2022-07-01 00:30:41', '2022-07-01 00:30:41'),
(61, 'App\\Models\\User', 1, 'ApiToken', 'a7f82db340893dfbb477fc6a467026cae51653485358d96e717b288fa905a767', '[\"*\"]', NULL, '2022-07-01 00:31:54', '2022-07-01 00:31:54'),
(62, 'App\\Models\\User', 1, 'ApiToken', '07c1fb48e6cd53596fcece07b48c32f3630a1ec39e52921e8896b20cf7746f78', '[\"*\"]', NULL, '2022-07-01 00:34:24', '2022-07-01 00:34:24'),
(63, 'App\\Models\\User', 1, 'ApiToken', '7bc0481659cc20e6e1e0154adfcab47552c1f6b8390a7e9090a2a7973bf95157', '[\"*\"]', NULL, '2022-07-01 00:36:00', '2022-07-01 00:36:00'),
(64, 'App\\Models\\User', 1, 'ApiToken', '7a89a08b5d0cb48edd0f2f9dac18219e4f9d930849bf64d6a3d9999b05fdce12', '[\"*\"]', NULL, '2022-07-01 00:37:27', '2022-07-01 00:37:27'),
(65, 'App\\Models\\User', 1, 'ApiToken', '1dbaea6e4784fd1887c0a0dfa61bbf4b70f842255322d4b15f57bf1303741cd8', '[\"*\"]', NULL, '2022-07-01 00:38:41', '2022-07-01 00:38:41'),
(66, 'App\\Models\\User', 1, 'ApiToken', 'e79c27db5c0deaa5040ea26776d0877337468726eb6276caf66620c531b39125', '[\"*\"]', NULL, '2022-07-01 00:42:11', '2022-07-01 00:42:11'),
(67, 'App\\Models\\User', 1, 'ApiToken', '4bd241405a3dcf1ad34df716bd0f6ce4b0d21377fafe6112418c1a5c1a7cc0ea', '[\"*\"]', NULL, '2022-07-01 00:44:13', '2022-07-01 00:44:13'),
(68, 'App\\Models\\User', 1, 'ApiToken', 'a2a9d22afc8beb506a89c0109f58d9627ea767b2cc877c64098bd0c6fa816675', '[\"*\"]', NULL, '2022-07-01 00:48:20', '2022-07-01 00:48:20'),
(69, 'App\\Models\\User', 1, 'ApiToken', '4ca541a16d5a4e1ac1abe45221ebb6f73adfee937fb9c0190f9e5971ba7ce362', '[\"*\"]', NULL, '2022-07-01 00:49:14', '2022-07-01 00:49:14'),
(70, 'App\\Models\\User', 1, 'ApiToken', 'f2c54a3fc9654a168147cd21dd83234004798198e10c88cd6aa39fdd5b2ed764', '[\"*\"]', NULL, '2022-07-01 00:53:24', '2022-07-01 00:53:24'),
(71, 'App\\Models\\User', 1, 'ApiToken', '26a111af27906103aa8f51d15d06287c2fa901220011092de6697a9f28183d91', '[\"*\"]', NULL, '2022-07-01 00:55:30', '2022-07-01 00:55:30'),
(72, 'App\\Models\\User', 1, 'ApiToken', '0813c070532a965b2fc2743af46276e4ef7bc3e15c4196cfeeb2ff4d11f2a687', '[\"*\"]', NULL, '2022-07-01 00:57:01', '2022-07-01 00:57:01'),
(73, 'App\\Models\\User', 1, 'ApiToken', '195416443bd3c55efcab74d2c0e9b549303da8d0766effb524bd6a241bacae5d', '[\"*\"]', NULL, '2022-07-01 01:02:32', '2022-07-01 01:02:32'),
(74, 'App\\Models\\User', 1, 'ApiToken', '639e30defeb27d47f4b66e32b78d12b16483efad8294f5224ab804272a64339c', '[\"*\"]', NULL, '2022-07-01 01:06:01', '2022-07-01 01:06:01'),
(75, 'App\\Models\\User', 1, 'ApiToken', '1307d83901ea5c80732b63a151550a2be36ce21d78966dfda45fd475bd57a03c', '[\"*\"]', NULL, '2022-07-01 01:10:25', '2022-07-01 01:10:25'),
(76, 'App\\Models\\User', 1, 'ApiToken', 'd8450cec19085eba066506b2e299f8b4bb863ebd5f0dd8589e09f08defeff152', '[\"*\"]', NULL, '2022-07-01 17:24:19', '2022-07-01 17:24:19'),
(77, 'App\\Models\\User', 1, 'ApiToken', '0160b64316b0185f655c9e2d0aa69d7b25ef8dd266ebfca16b1407835c052889', '[\"*\"]', NULL, '2022-07-01 17:30:26', '2022-07-01 17:30:26'),
(78, 'App\\Models\\User', 1, 'ApiToken', 'b22a53c49ac54185f0637aaea97c7c85c0b38760349eb3971fbc4920dc608f45', '[\"*\"]', NULL, '2022-07-01 17:42:31', '2022-07-01 17:42:31'),
(79, 'App\\Models\\User', 1, 'ApiToken', '6df3f86e80e3bdd2a102a4fcb240bf3572d9923f1d0056372e582b123b51684f', '[\"*\"]', NULL, '2022-07-01 17:49:01', '2022-07-01 17:49:01'),
(80, 'App\\Models\\User', 1, 'ApiToken', '438e984d1284f9028c586cf3a516a1feeeeefc0840f541a3de1116544fbd8da6', '[\"*\"]', NULL, '2022-07-01 17:49:26', '2022-07-01 17:49:26'),
(81, 'App\\Models\\User', 1, 'ApiToken', 'ab074f4201312c355880b315cc54c43e022aa4d78a3affcec009ed1e7cf42ee2', '[\"*\"]', NULL, '2022-07-01 17:51:45', '2022-07-01 17:51:45'),
(82, 'App\\Models\\User', 1, 'ApiToken', 'e00a63a56e2a51e94839ec2f86ea77aa7acac1cd32d5ce4a38930852370cad10', '[\"*\"]', NULL, '2022-07-01 18:09:34', '2022-07-01 18:09:34'),
(83, 'App\\Models\\User', 1, 'ApiToken', '62f0d7bfa41517a67166e608d60296a3f65a8b2452cf950717b93922d623f25d', '[\"*\"]', NULL, '2022-07-01 18:11:54', '2022-07-01 18:11:54'),
(84, 'App\\Models\\User', 1, 'ApiToken', '34db30f09b7326cf0a6e68e9f089774f723078027992fe28ea4cb603a913cb68', '[\"*\"]', NULL, '2022-07-01 18:12:48', '2022-07-01 18:12:48'),
(85, 'App\\Models\\User', 1, 'ApiToken', 'e8f78018bdbb805bfc395c8dc61946fe8da1905d9c050012bc1786ff4862976e', '[\"*\"]', NULL, '2022-07-01 18:47:14', '2022-07-01 18:47:14'),
(86, 'App\\Models\\User', 1, 'ApiToken', '7e7c9ef6f0529e2f414950eeacfb463c1fb652d77312b0ae33ec44236bf737c4', '[\"*\"]', NULL, '2022-07-01 18:49:16', '2022-07-01 18:49:16'),
(87, 'App\\Models\\User', 1, 'ApiToken', 'eeefa8a623f51c83092cb542b75242e2ae8be24dd0e9b6b18c7bf5cc8abc2850', '[\"*\"]', NULL, '2022-07-01 18:50:32', '2022-07-01 18:50:32'),
(88, 'App\\Models\\User', 1, 'ApiToken', '0ebae9bb97e64ffb00878312cfb96a4b4a1d972f8409bebe14c8fefb3c9bc991', '[\"*\"]', NULL, '2022-07-01 18:50:56', '2022-07-01 18:50:56'),
(89, 'App\\Models\\User', 1, 'ApiToken', '03197bc8f7630cc0b111ccd95a7e21b8ae3c966f973f73a29d453be1c3e43aa5', '[\"*\"]', NULL, '2022-07-01 18:51:54', '2022-07-01 18:51:54'),
(90, 'App\\Models\\User', 1, 'ApiToken', 'dce16e56c4f76156beabce18ef9eb8ccdd6236e0f54b9fac53927cd005720e56', '[\"*\"]', NULL, '2022-07-11 04:00:27', '2022-07-11 04:00:27'),
(91, 'App\\Models\\User', 1, 'ApiToken', 'bb5251840a65e6d341bd90c2c393be67fad62cdfbd242677ef95688656e86c39', '[\"*\"]', NULL, '2022-07-11 04:19:52', '2022-07-11 04:19:52'),
(92, 'App\\Models\\User', 1, 'ApiToken', 'bddd93f2f5e74c6ca62f4c1bace04b69c949d661057636d30b34616a01beae06', '[\"*\"]', NULL, '2022-07-11 04:23:45', '2022-07-11 04:23:45'),
(93, 'App\\Models\\User', 1, 'ApiToken', 'c61faaa7e892e241a082ca0017c08a4bdd90f242647dbc83451c7e1943a716ee', '[\"*\"]', NULL, '2022-07-11 04:24:06', '2022-07-11 04:24:06'),
(94, 'App\\Models\\User', 1, 'ApiToken', '6bc0d7a7a56fccc949bfbeeea48667e118eec2267a2c7aac282a1ed20a247bd3', '[\"*\"]', NULL, '2022-07-11 04:49:06', '2022-07-11 04:49:06'),
(95, 'App\\Models\\User', 1, 'ApiToken', '60f3cc791c5d2c93d0ddeba1aee370eb0f81b846b57e926990dafe7b518bae4f', '[\"*\"]', NULL, '2022-07-15 03:28:32', '2022-07-15 03:28:32'),
(96, 'App\\Models\\User', 1, 'ApiToken', 'f5d4716617f6ba10fd559ed0e8fa71a1a74d26efe0b2f4b37fb9014dc9ff6532', '[\"*\"]', NULL, '2022-07-15 03:34:51', '2022-07-15 03:34:51'),
(97, 'App\\Models\\User', 1, 'ApiToken', '699519d3a86848aa629105366debaa543095bed9e96c32ae621af0df9b2f7a05', '[\"*\"]', NULL, '2022-07-15 03:37:46', '2022-07-15 03:37:46'),
(98, 'App\\Models\\User', 1, 'ApiToken', '86aef398ed1d36e528b9adf4bcc4baf76b0acdc81d36fb893e2db75f4782452e', '[\"*\"]', NULL, '2022-07-15 04:28:20', '2022-07-15 04:28:20'),
(99, 'App\\Models\\User', 1, 'ApiToken', '3b6e1f2a56f4c7c95e7c80e4b7d2d2f0d1dad6fc9066ccf886a985f8d5d58d54', '[\"*\"]', NULL, '2022-07-15 05:20:30', '2022-07-15 05:20:30'),
(100, 'App\\Models\\User', 1, 'ApiToken', '79f6c89f94165133c169916a3c4032322f882cb2632d5e9e99a6ebaba090136b', '[\"*\"]', NULL, '2022-07-15 05:23:15', '2022-07-15 05:23:15'),
(101, 'App\\Models\\User', 1, 'ApiToken', '9ce64d76fbe7f947114c559f98cf7ee22784539d3e7e25a952fe92f4d4e0eaf2', '[\"*\"]', NULL, '2022-07-15 05:32:13', '2022-07-15 05:32:13'),
(102, 'App\\Models\\User', 1, 'ApiToken', 'b40ca8b43b362c23bbd146499bbfd5ea9b451af92d3adb98a2f29cf56d20a0c5', '[\"*\"]', NULL, '2022-07-15 05:35:21', '2022-07-15 05:35:21'),
(103, 'App\\Models\\User', 1, 'ApiToken', 'bbf6148cb370047b5b130a4bad9d46f5036c96bb54bb44aa1c19787c77566a8e', '[\"*\"]', NULL, '2022-07-15 05:35:51', '2022-07-15 05:35:51'),
(104, 'App\\Models\\User', 1, 'ApiToken', 'a306907118307d4e401e58dfe99e713212909ee117e4bb543f63b043df5ff92f', '[\"*\"]', NULL, '2022-07-15 15:38:27', '2022-07-15 15:38:27'),
(105, 'App\\Models\\User', 1, 'ApiToken', 'c6791cf3130831e27ef44ec69b3891e644e8760fe1f25a6fa1022d6a4c677c12', '[\"*\"]', NULL, '2022-07-15 15:39:03', '2022-07-15 15:39:03'),
(106, 'App\\Models\\User', 1, 'ApiToken', '8f62ed0ca29165976e4845900d243fe49a8b1d76615fb0a0cd422e9931ba47eb', '[\"*\"]', NULL, '2022-07-15 15:53:12', '2022-07-15 15:53:12'),
(107, 'App\\Models\\User', 1, 'ApiToken', '035a8633659ada0636a3ca1e77a55ec6e7f19493bec34579f8bf88db169af1f3', '[\"*\"]', NULL, '2022-07-15 15:55:38', '2022-07-15 15:55:38'),
(108, 'App\\Models\\User', 1, 'ApiToken', 'ed9dc195e01b7100e0ef4ce92aeec30087d5f6c1edc89dfa1539b38c215ae5fe', '[\"*\"]', NULL, '2022-08-01 16:13:49', '2022-08-01 16:13:49'),
(109, 'App\\Models\\User', 1, 'ApiToken', '750777b2d217c465b7e3c1d3e686ac168c931ff3eda996e32b5d5c304cabe01d', '[\"*\"]', NULL, '2022-08-02 15:27:13', '2022-08-02 15:27:13'),
(110, 'App\\Models\\User', 1, 'ApiToken', '924c528905a664798d32abee9ab5e6bcd80b756aa87ad15ca99f91618d3485bd', '[\"*\"]', NULL, '2022-08-03 15:22:29', '2022-08-03 15:22:29'),
(111, 'App\\Models\\User', 1, 'ApiToken', '63db64058db6260c57bc48fb78e1d7b1bbe7cab484c3d55c36e18e4ca47358ab', '[\"*\"]', NULL, '2022-08-18 04:10:41', '2022-08-18 04:10:41'),
(112, 'App\\Models\\User', 1, 'ApiToken', 'fda30c92d64e90afbadb184dc3b29f5f790fffea01eddd3af8c9bd19e5f80e54', '[\"*\"]', NULL, '2022-08-31 03:22:22', '2022-08-31 03:22:22'),
(113, 'App\\Models\\User', 1, 'ApiToken', '72bb34a38bea3a0dc05ba6d5871c0d96374feb103b871b36c1b6a9c1d325f150', '[\"*\"]', NULL, '2023-01-12 01:02:44', '2023-01-12 01:02:44'),
(114, 'App\\Models\\User', 1, 'ApiToken', 'b500909787a84ba89af7f8f4c981ef05ded6ceb2924c201999b6c9943dbd89c2', '[\"*\"]', NULL, '2023-01-15 00:32:29', '2023-01-15 00:32:29');

-- --------------------------------------------------------

--
-- Table structure for table `tblbarang`
--

CREATE TABLE `tblbarang` (
  `id` bigint UNSIGNED NOT NULL,
  `kdBarang` varchar(255) NOT NULL,
  `nmBarang` varchar(255) NOT NULL,
  `hrgPokok` double NOT NULL,
  `hrgJual` double NOT NULL,
  `ktgBarang` char(255) NOT NULL,
  `satuanBarang` char(255) NOT NULL,
  `merek` char(255) NOT NULL,
  `stkBarang` char(255) NOT NULL,
  `stkSatuan` char(255) DEFAULT NULL,
  `qtyMin` char(255) NOT NULL,
  `qtyMax` char(255) NOT NULL,
  `stsBarang` text NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tblbarang`
--

INSERT INTO `tblbarang` (`id`, `kdBarang`, `nmBarang`, `hrgPokok`, `hrgJual`, `ktgBarang`, `satuanBarang`, `merek`, `stkBarang`, `stkSatuan`, `qtyMin`, `qtyMax`, `stsBarang`, `deskripsi`, `created_at`, `updated_at`) VALUES
(2, 'BRG0004', 'OLI MESRAN 5L', 200000, 250000, 'KT-2021-2', 'BOTOL', 'MESRAN', '10', NULL, '5', '200', '', 'oli mesin', NULL, NULL);

--
-- Triggers `tblbarang`
--
DELIMITER $$
CREATE TRIGGER `after_insert` AFTER INSERT ON `tblbarang` FOR EACH ROW BEGIN  

INSERT INTO tblpersediaan (kdPersediaan, nmPersediaan, stokPersediaan, satuanPersediaan, lastPrice, salePrice)
VALUES (NEW.kdBarang, NEW.nmBarang, NEW.stkBarang, NEW.satuanBarang, NEW.hrgPokok, NEW.hrgJual);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblbbm`
--

CREATE TABLE `tblbbm` (
  `id` bigint UNSIGNED NOT NULL,
  `code_bbm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_bbm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_meter` int NOT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `logo_bbm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblbbm`
--

INSERT INTO `tblbbm` (`id`, `code_bbm`, `nama_bbm`, `last_meter`, `last_price`, `logo_bbm`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 12000000, '14900.00', 'pertamax.png', '2023-01-12 12:56:36', '2023-01-12 12:56:36'),
(2, 'BRG0002', 'PERLITE', 12000000, '10000.00', 'pertalite.png', '2023-01-12 12:56:36', '2023-01-12 12:56:36'),
(3, 'BRG0003', 'DEX LITE', 234535, '12800.00', 'dexlite.png', '2023-01-14 08:29:46', '2023-01-14 08:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `tblbbm_detail`
--

CREATE TABLE `tblbbm_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblkategori`
--

CREATE TABLE `tblkategori` (
  `id` bigint UNSIGNED NOT NULL,
  `kodeKtg` varchar(255) NOT NULL,
  `namaKtg` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tblkategori`
--

INSERT INTO `tblkategori` (`id`, `kodeKtg`, `namaKtg`, `created_at`, `updated_at`) VALUES
(1, 'KT-2021-1', 'BBM', '2021-03-19 22:40:29', '2022-02-19 06:11:10'),
(2, 'KT-2021-2', 'OLI', '2021-03-19 22:40:36', '2021-03-19 22:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblnosel_detail`
--

CREATE TABLE `tblnosel_detail` (
  `id_nosel` bigint UNSIGNED NOT NULL,
  `r_bbm` int NOT NULL,
  `nama_nosel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meter_awal` int NOT NULL,
  `meter_akhir` int NOT NULL,
  `harga` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblnosel_detail`
--

INSERT INTO `tblnosel_detail` (`id_nosel`, `r_bbm`, `nama_nosel`, `meter_awal`, `meter_akhir`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'nosel 1', 83000, 85000, '14900.00', '2023-01-14 09:54:41', '2023-01-16 13:29:27'),
(2, 1, 'nosel 2', 5200, 5500, '14900.00', '2023-01-14 09:56:59', '2023-01-17 09:43:19'),
(3, 2, 'nosel 1', 23000, 23500, '10000.00', '2023-01-14 09:58:16', '2023-01-16 22:37:59'),
(4, 1, 'nosel 3', 26000, 26500, '14900.00', '2023-01-14 09:56:59', '2023-01-16 21:06:50'),
(5, 1, 'nosel 4', 12000, 12500, '14900.00', '2023-01-14 09:56:59', '2023-01-16 13:53:22'),
(6, 1, 'nosel 5', 15500, 16000, '14900.00', '2023-01-14 09:56:59', '2023-01-16 07:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `tblpegawai`
--

CREATE TABLE `tblpegawai` (
  `id` bigint UNSIGNED NOT NULL,
  `kdPegawai` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmPegawai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `almtPegawai` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `noTlp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reguPegawai` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `kdPelanggan` varchar(255) NOT NULL,
  `nmPelanggan` varchar(255) NOT NULL,
  `almtPelanggan` varchar(255) NOT NULL,
  `noHpPelanggan` varchar(255) NOT NULL,
  `rolePelanggan` varchar(255) DEFAULT NULL,
  `emailPelanggan` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tblpelanggan`
--

INSERT INTO `tblpelanggan` (`id`, `kdPelanggan`, `nmPelanggan`, `almtPelanggan`, `noHpPelanggan`, `rolePelanggan`, `emailPelanggan`, `path`, `created_at`, `updated_at`) VALUES
(30, 'PL02022030', 'dsf', 'fsdf', 'fsdf', 'fsdf', 'fdsf', 'user-avtar.svg', '2022-08-04 21:42:35', '2022-08-04 21:42:35'),
(31, 'PL02022031', 'cscd', 'scdsc', 'csdc', 'cscs', 'csc', 'user-avtar.svg', '2022-08-04 21:42:50', '2022-08-04 21:42:50'),
(32, 'PL02022032', 'sdf', 'fsdf', 'sdf', 'fsdf', 'sf', 'user-avtar.svg', '2022-08-18 04:12:11', '2022-08-18 04:12:11'),
(33, 'PL02022033', 'aaa', 'aaa', 'aa', 'aa', 'aa', 'user-avtar.svg', '2022-08-18 04:12:32', '2022-08-18 04:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian`
--

CREATE TABLE `tblpembelian` (
  `idPembelian` bigint UNSIGNED NOT NULL,
  `noNota` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglPembelian` datetime NOT NULL,
  `r_supplier` int NOT NULL,
  `subTotal` decimal(13,2) NOT NULL,
  `disc` int NOT NULL,
  `discPercent` int NOT NULL,
  `tax` int NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `term` int NOT NULL,
  `jthTempo` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpembelian`
--

INSERT INTO `tblpembelian` (`idPembelian`, `noNota`, `tglPembelian`, `r_supplier`, `subTotal`, `disc`, `discPercent`, `tax`, `total`, `note`, `term`, `jthTempo`, `created_at`, `updated_at`) VALUES
(23, '222', '2023-01-20 00:00:00', 111, '200000.00', 111, 111, 111, '111.00', '111', 111, '2023-01-20 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian_detail`
--

CREATE TABLE `tblpembelian_detail` (
  `idPembelianDetail` bigint UNSIGNED NOT NULL,
  `r_noNota` int NOT NULL,
  `kdBarang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmBarang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hrgBeli` decimal(13,2) NOT NULL,
  `qty` int NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpembelian_detail`
--

INSERT INTO `tblpembelian_detail` (`idPembelianDetail`, `r_noNota`, `kdBarang`, `nmBarang`, `hrgBeli`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(1, 123, 'DB-2021-16', 'Kepala Ikan', '33999.00', 1, '33999.00', NULL, NULL),
(2, 123, 'DB-2021-17', 'Mujair', '32777.00', 1, '32777.00', NULL, NULL),
(3, 333, 'DB-2021-16', 'Kepala Ikan', '33999.00', 1, '33999.00', NULL, NULL),
(4, 333, 'DB-2021-17', 'Mujair', '32777.00', 1, '32777.00', NULL, NULL),
(5, 333, 'DB-2021-16', 'Kepala Ikan', '33999.00', 1, '33999.00', '2023-01-19 21:05:32', '2023-01-19 21:05:32'),
(6, 333, 'DB-2021-17', 'Mujair', '32777.00', 1, '32777.00', '2023-01-19 21:05:32', '2023-01-19 21:05:32'),
(7, 222, 'BRG0004', 'OLI MESRAN 5L', '200000.00', 4, '200000.00', '2023-01-19 22:48:42', '2023-01-19 22:48:42');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan`
--

CREATE TABLE `tblpersediaan` (
  `idPersediaan` bigint UNSIGNED NOT NULL,
  `kdPersediaan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nmPersediaan` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stokPersediaan` int NOT NULL,
  `satuanPersediaan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastPrice` int DEFAULT NULL,
  `salePrice` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tblpersediaan`
--

INSERT INTO `tblpersediaan` (`idPersediaan`, `kdPersediaan`, `nmPersediaan`, `stokPersediaan`, `satuanPersediaan`, `lastPrice`, `salePrice`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 2000, 'liter', 14000, 14900, '2023-01-19 22:24:13', '2023-01-19 22:24:13'),
(2, 'BRG0002', 'PERTALITE', 5000, 'liter', 9000, 10000, '2023-01-19 22:25:23', '2023-01-19 22:25:23'),
(3, 'BRG0003', 'DEX LITE', 4500, 'liter', 6500, 8000, '2023-01-19 22:26:32', '2023-01-19 22:26:32'),
(4, 'BRG0004', 'OLI MESRAN 5L', 14, 'BOTOL', 200000, 250000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan_detail`
--

CREATE TABLE `tblpersediaan_detail` (
  `idPersediaanDetail` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrates`
--

CREATE TABLE `tblrates` (
  `id` bigint UNSIGNED NOT NULL,
  `rateCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ratePrice` decimal(17,2) NOT NULL,
  `rateStart` datetime NOT NULL,
  `rateEnd` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `roomCode` varchar(20) NOT NULL,
  `roomName` varchar(50) NOT NULL,
  `rRoomRate` varchar(5) NOT NULL,
  `roomDesc` text NOT NULL,
  `roomPic` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbltransaksi_nosel`
--

CREATE TABLE `tbltransaksi_nosel` (
  `id` bigint UNSIGNED NOT NULL,
  `r_bbm` int NOT NULL,
  `r_nosel` int NOT NULL,
  `r_regu` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `tgl_transaksi` datetime NOT NULL,
  `cost_ltr` int NOT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `last_meter` int NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbltransaksi_nosel`
--

INSERT INTO `tbltransaksi_nosel` (`id`, `r_bbm`, `r_nosel`, `r_regu`, `tgl_transaksi`, `cost_ltr`, `last_price`, `last_meter`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0', '2023-01-16 00:00:00', 1000, '14900.00', 79000, '14900000.00', '2023-01-16 07:35:42', '2023-01-16 07:35:42'),
(2, 1, 2, '0', '2023-01-16 00:00:00', 5000, '14900.00', 45000, '74500000.00', '2023-01-16 07:35:59', '2023-01-16 07:35:59'),
(3, 1, 2, '0', '2023-01-16 00:00:00', 1000, '14900.00', 46000, '14900000.00', '2023-01-16 07:40:39', '2023-01-16 07:40:39'),
(4, 1, 1, '0', '2023-01-16 00:00:00', 1000, '14900.00', 80000, '14900000.00', '2023-01-16 07:40:55', '2023-01-16 07:40:55'),
(5, 1, 4, '0', '2023-01-16 00:00:00', 2000, '14900.00', 22000, '29800000.00', '2023-01-16 07:41:20', '2023-01-16 07:41:20'),
(6, 1, 4, '0', '2023-01-16 00:00:00', 1000, '14900.00', 23000, '14900000.00', '2023-01-16 07:43:28', '2023-01-16 07:43:28'),
(7, 1, 2, '0', '2023-01-16 00:00:00', 1000, '14900.00', 47000, '14900000.00', '2023-01-16 07:44:33', '2023-01-16 07:44:33'),
(8, 1, 2, '0', '2023-01-16 00:00:00', 1000, '14900.00', 48000, '14900000.00', '2023-01-16 07:45:59', '2023-01-16 07:45:59'),
(9, 1, 1, '0', '2023-01-16 00:00:00', 1000, '14900.00', 81000, '14900000.00', '2023-01-16 07:48:11', '2023-01-16 07:48:11'),
(10, 1, 1, '0', '2023-01-16 00:00:00', 1000, '14900.00', 82000, '14900000.00', '2023-01-16 07:48:37', '2023-01-16 07:48:37'),
(11, 1, 1, '0', '2023-01-16 00:00:00', 1000, '14900.00', 83000, '14900000.00', '2023-01-16 07:49:37', '2023-01-16 07:49:37'),
(12, 1, 6, '0', '2023-01-16 00:00:00', 500, '14900.00', 15500, '7450000.00', '2023-01-16 07:52:36', '2023-01-16 07:52:36'),
(13, 1, 2, '0', '2023-01-16 00:00:00', 1000, '14900.00', 49000, '14900000.00', '2023-01-16 07:54:35', '2023-01-16 07:54:35'),
(14, 1, 2, '0', '2023-01-16 00:00:00', 1000, '14900.00', 50000, '14900000.00', '2023-01-16 07:55:40', '2023-01-16 07:55:40'),
(15, 2, 3, '0', '2023-01-16 00:00:00', 1000, '10000.00', 23000, '10000000.00', '2023-01-16 07:56:02', '2023-01-16 07:56:02'),
(16, 1, 6, '0', '2023-01-16 00:00:00', 500, '14900.00', 16000, '7450000.00', '2023-01-16 07:56:20', '2023-01-16 07:56:20'),
(17, 1, 1, '0', '2023-01-16 00:00:00', 2000, '14900.00', 85000, '29800000.00', '2023-01-16 13:29:27', '2023-01-16 13:29:27'),
(18, 1, 4, '0', '2023-01-16 00:00:00', 2000, '14900.00', 25000, '29800000.00', '2023-01-16 13:36:11', '2023-01-16 13:36:11'),
(19, 1, 5, '0', '2023-01-16 00:00:00', 1000, '14900.00', 11000, '14900000.00', '2023-01-16 13:48:38', '2023-01-16 13:48:38'),
(20, 1, 5, '0', '2023-01-16 00:00:00', 1000, '14900.00', 12000, '14900000.00', '2023-01-16 13:52:33', '2023-01-16 13:52:33'),
(21, 1, 5, '0', '2023-01-15 00:00:00', 500, '14900.00', 12500, '7450000.00', '2023-01-16 13:53:22', '2023-01-16 13:53:22'),
(22, 1, 4, '0', '2023-01-16 00:00:00', 500, '14900.00', 25500, '7450000.00', '2023-01-16 21:01:22', '2023-01-16 21:01:22'),
(23, 1, 4, '0', '2023-01-16 00:00:00', 500, '14900.00', 26000, '7450000.00', '2023-01-16 21:06:04', '2023-01-16 21:06:04'),
(24, 1, 4, '0', '2023-01-17 00:00:00', 500, '14900.00', 26500, '7450000.00', '2023-01-16 21:06:50', '2023-01-16 21:06:50'),
(25, 1, 2, '0', '2023-01-17 00:00:00', -44800, '14900.00', 5200, '-667520000.00', '2023-01-16 22:37:30', '2023-01-16 22:37:30'),
(26, 2, 3, '0', '2023-01-17 00:00:00', 500, '10000.00', 23500, '5000000.00', '2023-01-16 22:37:59', '2023-01-16 22:37:59'),
(27, 1, 2, 'A', '2023-01-17 00:00:00', 300, '14900.00', 5500, '4470000.00', '2023-01-17 09:43:19', '2023-01-17 09:43:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '2022-06-21 02:08:43', '$2y$10$1M/zZK917.HJrYuNrWF2yued.SVCPw89I5RVZqliW9ndVZAUSmuFu', NULL, '2022-06-21 02:08:43', '2022-06-21 02:08:43');

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
-- Indexes for table `tblkategori`
--
ALTER TABLE `tblkategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblnosel_detail`
--
ALTER TABLE `tblnosel_detail`
  ADD PRIMARY KEY (`id_nosel`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `tblbarang`
--
ALTER TABLE `tblbarang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblbbm`
--
ALTER TABLE `tblbbm`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblbbm_detail`
--
ALTER TABLE `tblbbm_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblnosel_detail`
--
ALTER TABLE `tblnosel_detail`
  MODIFY `id_nosel` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblpegawai`
--
ALTER TABLE `tblpegawai`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpelanggan`
--
ALTER TABLE `tblpelanggan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tblpembelian`
--
ALTER TABLE `tblpembelian`
  MODIFY `idPembelian` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tblpembelian_detail`
--
ALTER TABLE `tblpembelian_detail`
  MODIFY `idPembelianDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblpersediaan`
--
ALTER TABLE `tblpersediaan`
  MODIFY `idPersediaan` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpersediaan_detail`
--
ALTER TABLE `tblpersediaan_detail`
  MODIFY `idPersediaanDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltransaksi_nosel`
--
ALTER TABLE `tbltransaksi_nosel`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
