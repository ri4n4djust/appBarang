-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 22, 2023 at 04:07 AM
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
  `connection` mediumtext NOT NULL,
  `queue` mediumtext NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_acc`
--

CREATE TABLE `link_acc` (
  `id` int NOT NULL,
  `acc_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(15, '2023_01_18_173900_create_pembelian_details_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `abilities` mediumtext,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'ApiToken', '20c4ff4fddebc932ff8b59832171fb03e57302334d55d0ce6a24daaff5385b44', '[\"*\"]', NULL, '2023-01-21 10:59:41', '2023-01-21 10:59:41'),
(2, 'App\\Models\\User', 1, 'ApiToken', 'fdfd2079dabd38afd54d2525a81aa693c734fc59709919d0fb6e7fa930f9ec33', '[\"*\"]', NULL, '2023-01-21 11:19:51', '2023-01-21 11:19:51');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_anggaran`
--

CREATE TABLE `rekening_anggaran` (
  `id_rekening` int NOT NULL,
  `nomor_rekening` varchar(20) NOT NULL,
  `nama_rekening` varchar(225) NOT NULL,
  `anggaran` decimal(12,2) NOT NULL DEFAULT '0.00',
  `parent_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `view_level` int NOT NULL DEFAULT '0',
  `tipe` varchar(1) NOT NULL DEFAULT 'D',
  `rlocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tahun_anggaran` int NOT NULL DEFAULT '2022',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `stsBarang` mediumtext NOT NULL,
  `deskripsi` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblbarang`
--

INSERT INTO `tblbarang` (`id`, `kdBarang`, `nmBarang`, `hrgPokok`, `hrgJual`, `ktgBarang`, `satuanBarang`, `merek`, `stkBarang`, `stkSatuan`, `qtyMin`, `qtyMax`, `stsBarang`, `deskripsi`, `created_at`, `updated_at`) VALUES
(2, 'BRG0004', 'OLI MESRAN 5L', 220000, 250000, 'KT-2021-2', 'BOTOL', 'MESRAN', '160', NULL, '5', '200', '', 'oli mesin', NULL, NULL);

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
  `code_bbm` varchar(10) NOT NULL,
  `nama_bbm` varchar(255) NOT NULL,
  `last_meter` int NOT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `sale_price` decimal(13,2) NOT NULL,
  `logo_bbm` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblbbm`
--

INSERT INTO `tblbbm` (`id`, `code_bbm`, `nama_bbm`, `last_meter`, `last_price`, `sale_price`, `logo_bbm`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 12000000, '14900.00', '14900.00', 'pertamax.png', '2023-01-12 12:56:36', '2023-01-12 12:56:36'),
(2, 'BRG0002', 'PERLITE', 12000000, '10000.00', '10000.00', 'pertalite.png', '2023-01-12 12:56:36', '2023-01-12 12:56:36'),
(3, 'BRG0003', 'DEX LITE', 234535, '12800.00', '12800.00', 'dexlite.png', '2023-01-14 08:29:46', '2023-01-14 08:29:46');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblkategori`
--

INSERT INTO `tblkategori` (`id`, `kodeKtg`, `namaKtg`, `created_at`, `updated_at`) VALUES
(1, 'KT-2021-1', 'BBM', '2021-03-19 22:40:29', '2022-02-19 06:11:10'),
(2, 'KT-2021-2', 'OLI', '2021-03-19 22:40:36', '2021-03-19 22:40:36'),
(3, 'KT-2021-3', 'GAS', '2023-01-20 12:13:36', '2023-01-20 12:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblnosel_detail`
--

CREATE TABLE `tblnosel_detail` (
  `id_nosel` bigint UNSIGNED NOT NULL,
  `r_bbm` int NOT NULL,
  `r_code_bbm` varchar(20) NOT NULL,
  `nama_nosel` varchar(50) NOT NULL,
  `meter_awal` int NOT NULL,
  `meter_akhir` int NOT NULL,
  `harga` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblnosel_detail`
--

INSERT INTO `tblnosel_detail` (`id_nosel`, `r_bbm`, `r_code_bbm`, `nama_nosel`, `meter_awal`, `meter_akhir`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG0001', 'nosel 1', 85300, 85500, '14900.00', '2023-01-14 09:54:41', '2023-01-22 01:34:04'),
(2, 1, 'BRG0001', 'nosel 2', 6500, 7000, '14900.00', '2023-01-14 09:56:59', '2023-01-22 01:45:42'),
(3, 2, 'BRG0002', 'nosel 1', 23500, 24000, '10000.00', '2023-01-14 09:58:16', '2023-01-21 23:48:07'),
(4, 1, 'BRG0001', 'nosel 3', 26000, 26500, '14900.00', '2023-01-14 09:56:59', '2023-01-16 21:06:50'),
(5, 1, 'BRG0001', 'nosel 4', 12000, 12500, '14900.00', '2023-01-14 09:56:59', '2023-01-16 13:53:22'),
(6, 1, 'BRG0001', 'nosel 5', 15500, 16000, '14900.00', '2023-01-14 09:56:59', '2023-01-16 07:56:20'),
(7, 2, 'BRG0002', 'nosel 2', 23500, 24000, '10000.00', '2023-01-14 09:58:16', '2023-01-22 00:21:26'),
(8, 2, 'BRG0002', 'nosel 3', 21000, 22000, '10000.00', '2023-01-14 09:58:16', '2023-01-16 22:37:59'),
(9, 2, 'BRG0002', 'nosel 4', 21000, 22000, '10000.00', '2023-01-14 09:58:16', '2023-01-16 22:37:59'),
(10, 1, 'BRG0001', 'nosel 6', 15500, 16000, '14900.00', '2023-01-14 09:56:59', '2023-01-16 07:56:20'),
(11, 2, 'BRG0002', 'nosel 5', 21000, 22000, '10000.00', '2023-01-14 09:58:16', '2023-01-16 22:37:59'),
(12, 2, 'BRG0002', 'nosel 6', 21000, 22000, '10000.00', '2023-01-14 09:58:16', '2023-01-16 22:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `tblpegawai`
--

CREATE TABLE `tblpegawai` (
  `id` bigint UNSIGNED NOT NULL,
  `kdPegawai` varchar(10) NOT NULL,
  `nmPegawai` varchar(255) NOT NULL,
  `almtPegawai` text NOT NULL,
  `noTlp` varchar(20) NOT NULL,
  `reguPegawai` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `noNota` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tglPembelian` datetime NOT NULL,
  `r_supplier` varchar(9) NOT NULL,
  `subTotal` decimal(13,2) NOT NULL,
  `disc` int NOT NULL,
  `discPercent` int NOT NULL,
  `tax` int NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `term` int NOT NULL,
  `jthTempo` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblpembelian`
--

INSERT INTO `tblpembelian` (`idPembelian`, `noNota`, `tglPembelian`, `r_supplier`, `subTotal`, `disc`, `discPercent`, `tax`, `total`, `note`, `term`, `jthTempo`, `created_at`, `updated_at`) VALUES
(27, 'PB2023-1', '2023-01-21 00:00:00', 'SP0002', '206500.00', 0, 0, 11, '206500.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(28, 'PB2023-2', '2023-01-21 00:00:00', 'SP0003', '28462000.00', 0, 0, 11, '28462000.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(29, 'PB2023-3', '2023-01-21 00:00:00', 'SP0002', '279000.00', 0, 0, 11, '279000.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(30, 'PB2023-4', '2023-01-21 00:00:00', 'SP0002', '304000.00', 0, 0, 11, '304000.00', NULL, 0, '2023-01-21 00:00:00', NULL, NULL),
(31, 'PB2023-5', '2023-01-21 00:00:00', 'SP0002', '226000.00', 0, 0, 11, '226000.00', NULL, 0, '2023-01-21 00:00:00', '2023-01-20 20:40:09', '2023-01-20 20:40:09'),
(33, 'PB2023-6', '2023-01-22 00:00:00', 'SP0002', '220000.00', 0, 0, 11, '220000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 23:03:49', '2023-01-21 23:03:49'),
(34, 'PB2023-7', '2023-01-22 00:00:00', 'SP0002', '1540000.00', 0, 0, 11, '1540000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 23:04:57', '2023-01-21 23:04:57'),
(36, 'PB2023-8', '2023-01-22 00:00:00', 'SP0002', '1400000.00', 0, 0, 11, '1400000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 23:26:36', '2023-01-21 23:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian_detail`
--

CREATE TABLE `tblpembelian_detail` (
  `idPembelianDetail` bigint UNSIGNED NOT NULL,
  `r_noNota` varchar(20) NOT NULL,
  `kdBarang` varchar(10) NOT NULL,
  `nmBarang` varchar(255) NOT NULL,
  `hrgBeli` decimal(13,2) NOT NULL,
  `qty` int NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblpembelian_detail`
--

INSERT INTO `tblpembelian_detail` (`idPembelianDetail`, `r_noNota`, `kdBarang`, `nmBarang`, `hrgBeli`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(14, 'PB2023-1', 'BRG0004', 'OLI MESRAN 5L', '200000.00', 1, '200000.00', '2023-01-20 19:06:41', '2023-01-20 19:06:41'),
(15, 'PB2023-1', 'BRG0003', 'DEX LITE', '6500.00', 1, '6500.00', '2023-01-20 19:06:41', '2023-01-20 19:06:41'),
(16, 'PB2023-2', 'BRG0001', 'PERTAMAX', '14000.00', 133, '1862000.00', '2023-01-20 19:09:33', '2023-01-20 19:09:33'),
(17, 'PB2023-2', 'BRG0004', 'OLI MESRAN 5L', '200000.00', 133, '26600000.00', '2023-01-20 19:09:33', '2023-01-20 19:09:33'),
(18, 'PB2023-3', 'BRG0002', 'PERTALITE', '9000.00', 18, '162000.00', '2023-01-20 20:27:33', '2023-01-20 20:27:33'),
(19, 'PB2023-3', 'BRG0003', 'DEX LITE', '6500.00', 18, '117000.00', '2023-01-20 20:27:33', '2023-01-20 20:27:33'),
(20, 'PB2023-4', 'BRG0004', 'OLI MESRAN 5L', '200000.00', 1, '200000.00', '2023-01-20 20:29:20', '2023-01-20 20:29:20'),
(21, 'PB2023-4', 'BRG0003', 'DEX LITE', '6500.00', 16, '104000.00', '2023-01-20 20:29:20', '2023-01-20 20:29:20'),
(22, 'PB2023-5', 'BRG0004', 'OLI MESRAN 5L', '200000.00', 15, '200000.00', '2023-01-20 20:40:09', '2023-01-20 20:40:09'),
(23, 'PB2023-5', 'BRG0003', 'DEX LITE', '6500.00', 4, '26000.00', '2023-01-20 20:40:09', '2023-01-20 20:40:09'),
(24, 'PB2023-6', 'BRG0004', 'OLI MESRAN 5L', '220000.00', 1, '220000.00', '2023-01-21 23:03:49', '2023-01-21 23:03:49'),
(25, 'PB2023-7', 'BRG0004', 'OLI MESRAN 5L', '220000.00', 7, '1540000.00', '2023-01-21 23:04:57', '2023-01-21 23:04:57'),
(26, 'PB2023-8', 'BRG0001', 'PERTAMAX', '14000.00', 100, '1400000.00', '2023-01-21 23:26:36', '2023-01-21 23:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualan`
--

CREATE TABLE `tblpenjualan` (
  `idPenjualan` bigint NOT NULL,
  `noPenjualan` varchar(20) NOT NULL,
  `tglPenjualan` datetime NOT NULL,
  `r_pelanggan` varchar(20) NOT NULL,
  `subTotalPenjualan` decimal(13,2) NOT NULL,
  `discPenjualan` decimal(13,2) NOT NULL,
  `discPercentP` int NOT NULL,
  `taxPenjualan` int NOT NULL,
  `totalPenjualan` decimal(13,2) NOT NULL,
  `notePenjualan` varchar(225) DEFAULT NULL,
  `termPenjualan` int DEFAULT NULL,
  `jthTempo` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblpenjualan`
--

INSERT INTO `tblpenjualan` (`idPenjualan`, `noPenjualan`, `tglPenjualan`, `r_pelanggan`, `subTotalPenjualan`, `discPenjualan`, `discPercentP`, `taxPenjualan`, `totalPenjualan`, `notePenjualan`, `termPenjualan`, `jthTempo`, `created_at`, `updated_at`) VALUES
(4, 'INV2023001', '2023-01-22 00:00:00', 'PL02022033', '250000.00', '0.00', 0, 11, '250000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 22:51:44', '2023-01-21 22:51:44'),
(5, 'INV2023002', '2023-01-22 00:00:00', 'PL02022031', '250000.00', '0.00', 0, 11, '250000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 22:55:50', '2023-01-21 22:55:50'),
(6, 'INV2023003', '2023-01-21 00:00:00', 'PL02022032', '250000.00', '0.00', 0, 11, '250000.00', NULL, 1, '2023-01-28 00:00:00', '2023-01-21 22:58:52', '2023-01-21 22:58:52'),
(7, 'INV2023004', '2023-01-22 00:00:00', 'PL02022032', '2500000.00', '125000.00', 5, 11, '2500000.00', NULL, 0, '2023-01-22 00:00:00', '2023-01-21 22:59:51', '2023-01-21 22:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualan_detail`
--

CREATE TABLE `tblpenjualan_detail` (
  `idDetailPenjualan` int NOT NULL,
  `r_noPenjualan` varchar(20) NOT NULL,
  `r_kdBarang` varchar(20) NOT NULL,
  `r_nmBarang` varchar(50) NOT NULL,
  `hrgJual` decimal(13,2) NOT NULL,
  `qty` int NOT NULL,
  `satuanJual` varchar(50) NOT NULL,
  `totalJual` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblpenjualan_detail`
--

INSERT INTO `tblpenjualan_detail` (`idDetailPenjualan`, `r_noPenjualan`, `r_kdBarang`, `r_nmBarang`, `hrgJual`, `qty`, `satuanJual`, `totalJual`, `created_at`, `updated_at`) VALUES
(1, 'INV2023001', 'BRG0004', 'OLI MESRAN 5L', '250000.00', 1, 'BOTOL', '250000.00', '2023-01-21 22:51:44', '2023-01-21 22:51:44'),
(2, 'INV2023002', 'BRG0004', 'OLI MESRAN 5L', '250000.00', 2, 'BOTOL', '250000.00', '2023-01-21 22:55:50', '2023-01-21 22:55:50'),
(3, 'INV2023003', 'BRG0004', 'OLI MESRAN 5L', '250000.00', 1, 'BOTOL', '250000.00', '2023-01-21 22:58:53', '2023-01-21 22:58:53'),
(4, 'INV2023004', 'BRG0004', 'OLI MESRAN 5L', '250000.00', 10, 'BOTOL', '2500000.00', '2023-01-21 22:59:51', '2023-01-21 22:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan`
--

CREATE TABLE `tblpersediaan` (
  `idPersediaan` bigint UNSIGNED NOT NULL,
  `kdPersediaan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nmPersediaan` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stokPersediaan` int NOT NULL,
  `satuanPersediaan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ktgPersediaan` varchar(20) NOT NULL,
  `lastPrice` decimal(10,2) DEFAULT NULL,
  `salePrice` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tblpersediaan`
--

INSERT INTO `tblpersediaan` (`idPersediaan`, `kdPersediaan`, `nmPersediaan`, `stokPersediaan`, `satuanPersediaan`, `ktgPersediaan`, `lastPrice`, `salePrice`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 835, 'Liter', 'KT-2021-1', '14000.00', '14900.00', '2023-01-19 22:24:13', '2023-01-19 22:24:13'),
(2, 'BRG0002', 'PERTALITE', 4018, 'Liter', 'KT-2021-1', '9000.00', '10000.00', '2023-01-19 22:25:23', '2023-01-19 22:25:23'),
(3, 'BRG0003', 'DEX LITE', 4541, 'Liter', 'KT-2021-1', '6500.00', '8000.00', '2023-01-19 22:26:32', '2023-01-19 22:26:32'),
(4, 'BRG0004', 'OLI MESRAN 5L', 160, 'BOTOL', 'KT-2021-2', '220000.00', '250000.00', '2023-01-20 12:14:45', '2023-01-20 12:14:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan_detail`
--

CREATE TABLE `tblpersediaan_detail` (
  `idPersediaanDetail` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblrates`
--

CREATE TABLE `tblrates` (
  `id` bigint UNSIGNED NOT NULL,
  `rateCode` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rateName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ratePrice` decimal(17,2) NOT NULL,
  `rateStart` datetime NOT NULL,
  `rateEnd` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `roomDesc` mediumtext NOT NULL,
  `roomPic` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `kdSupplier` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nmSupplier` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `almtSupplier` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tlpSupplier` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `picSupplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `kd_trans` varchar(20) NOT NULL,
  `r_regu` varchar(5) NOT NULL DEFAULT '0',
  `tgl_transaksi` datetime NOT NULL,
  `cost_ltr` int NOT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `last_meter` int NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbltransaksi_nosel`
--

INSERT INTO `tbltransaksi_nosel` (`id`, `r_bbm`, `r_nosel`, `kd_trans`, `r_regu`, `tgl_transaksi`, `cost_ltr`, `last_price`, `last_meter`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '11202301221', 'A', '2023-01-22 00:00:00', 100, '14900.00', 85200, '1490000.00', '2023-01-22 01:02:06', '2023-01-22 01:02:06'),
(2, 1, 2, '12202301221', 'A', '2023-01-22 00:00:00', 500, '14900.00', 6500, '7450000.00', '2023-01-22 01:18:29', '2023-01-22 01:18:29'),
(3, 1, 1, '11202301222', 'A', '2023-01-22 00:00:00', 100, '14900.00', 85300, '1490000.00', '2023-01-22 01:33:27', '2023-01-22 01:33:27'),
(4, 1, 1, '11202301223', 'A', '2023-01-22 00:00:00', 200, '14900.00', 85500, '2980000.00', '2023-01-22 01:34:04', '2023-01-22 01:34:04'),
(5, 1, 2, '12202301222', 'A', '2023-01-22 00:00:00', 500, '14900.00', 7000, '7450000.00', '2023-01-22 01:45:42', '2023-01-22 01:45:42');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indexes for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  ADD PRIMARY KEY (`idPenjualan`);

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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rekening_anggaran`
--
ALTER TABLE `rekening_anggaran`
  MODIFY `id_rekening` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblbarang`
--
ALTER TABLE `tblbarang`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblnosel_detail`
--
ALTER TABLE `tblnosel_detail`
  MODIFY `id_nosel` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `idPembelian` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tblpembelian_detail`
--
ALTER TABLE `tblpembelian_detail`
  MODIFY `idPembelianDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  MODIFY `idPenjualan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblpenjualan_detail`
--
ALTER TABLE `tblpenjualan_detail`
  MODIFY `idDetailPenjualan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpersediaan`
--
ALTER TABLE `tblpersediaan`
  MODIFY `idPersediaan` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltransaksi_nosel`
--
ALTER TABLE `tbltransaksi_nosel`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
