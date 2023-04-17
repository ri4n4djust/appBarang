-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2023 at 01:53 AM
-- Server version: 8.0.32
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
-- Table structure for table `coa`
--

CREATE TABLE `coa` (
  `id` int UNSIGNED NOT NULL,
  `idparent1` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent1` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent1level` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent1type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idparent2` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent2` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent2level` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent2type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idparent3` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent3` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent3level` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent3type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acc_id` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atype` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coa`
--

INSERT INTO `coa` (`id`, `idparent1`, `parent1`, `parent1level`, `parent1type`, `idparent2`, `parent2`, `parent2level`, `parent2type`, `idparent3`, `parent3`, `parent3level`, `parent3type`, `acc_id`, `name`, `atype`) VALUES
(1, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11000', 'ASET LANCAR', '2', 'H', '11000', 'ASET LANCAR', 'H'),
(2, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61000', 'BELANJA OPERASIONAL', 'H'),
(3, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12000', 'ASET TETAP', '2', 'H', '12000', 'ASET TETAP', 'H'),
(4, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62000', 'BIAYA LAINNYA', 'H'),
(5, '20000', 'KEWAJIBAN', '1', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23000', 'HUTANG PAJAK', 'H'),
(6, '30000', 'EKUITAS', '1', 'H', '32000', 'MODAL', '2', 'H', '32000', 'MODAL', '2', 'H', '32000', 'MODAL', 'H'),
(7, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', 'H'),
(8, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41000', 'PENJUALAN', '2', 'H', '41000', 'PENJUALAN', 'H'),
(9, '40000', 'PENDAPATAN', '1', 'H', '42000', 'SEWA', '2', 'H', '42000', 'SEWA', '2', 'H', '42000', 'SEWA', 'H'),
(10, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51000', 'HPP PENJUALAN', 'H'),
(11, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52000', 'TEKOR', '2', 'H', '52000', 'TEKOR', 'H'),
(12, '20000', 'KEWAJIBAN', '1', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23100', 'HUTANG PAJAK PPH FINAL PS 4 AYAT 2', '3', 'D', '23100', 'HUTANG PAJAK PPH FINAL PS 4 AYAT 2', 'D'),
(13, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21300', 'HUTANG LAINNYA', '3', 'D', '21300', 'HUTANG LAINNYA', 'D'),
(14, '30000', 'EKUITAS', '1', 'H', '32000', 'MODAL', '2', 'H', '32200', 'MODAL YANG DI SETOR', '3', 'D', '32200', 'MODAL YANG DI SETOR', 'D'),
(15, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12100', 'TANAH', '3', 'D', '12100', 'TANAH', 'D'),
(16, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12200', 'GEDUNG DAN BANGUNAN', '3', 'D', '12200', 'GEDUNG DAN BANGUNAN', 'D'),
(17, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12300', 'PERALATAN DAN MESIN', '3', 'D', '12300', 'PERALATAN DAN MESIN', 'D'),
(18, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12400', 'KENDARAAN', '3', 'D', '12400', 'KENDARAAN', 'D'),
(19, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21100', 'HUTANG USAHA', '3', 'D', '21100', 'HUTANG USAHA', 'D'),
(20, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21200', 'PENDAPATAN DITERIMA DIMUKA', '3', 'D', '21200', 'PENDAPATAN DITERIMA DIMUKA', 'D'),
(21, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21400', 'BIAYA YANG MASIH HARUS DIBAYAR', '3', 'D', '21400', 'BIAYA YANG MASIH HARUS DIBAYAR', 'D'),
(22, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21500', 'HUTANG BEBAN', '3', 'D', '21500', 'HUTANG BEBAN', 'D'),
(23, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41200', 'PENJUALAN PERTALITE', '3', 'D', '41200', 'PENJUALAN PERTALITE', 'D'),
(24, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41300', 'PENJUALAN DEXLITE', '3', 'D', '41300', 'PENJUALAN DEXLITE', 'D'),
(25, '40000', 'PENDAPATAN', '1', 'H', '42000', 'SEWA', '2', 'H', '42801', 'SEWA ATM', '3', 'D', '42801', 'SEWA ATM', 'D'),
(26, '40000', 'PENDAPATAN', '1', 'H', '42000', 'SEWA', '2', 'H', '42805', 'DISKON PEMBELIAN', '3', 'D', '42805', 'DISKON PEMBELIAN', 'D'),
(27, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41100', 'PENJUALAN PERTAMAX', '3', 'D', '41100', 'PENJUALAN PERTAMAX', 'D'),
(28, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41400', 'PENJUALAN GAS', '3', 'D', '41400', 'PENJUALAN GAS', 'D'),
(29, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41500', 'PENJUALAN OLI', '3', 'D', '41500', 'PENJUALAN OLI', 'D'),
(30, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51100', 'HPP PERTAMAX', '3', 'D', '51100', 'HPP PERTAMAX', 'D'),
(31, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52100', 'TEKOR PERTAMAX', '3', 'D', '52100', 'TEKOR PERTAMAX', 'D'),
(32, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51200', 'HPP PERTALITE', '3', 'D', '51200', 'HPP PERTALITE', 'D'),
(33, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51300', 'HPP DEX LITE', '3', 'D', '51300', 'HPP DEX LITE', 'D'),
(34, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51400', 'HPP GAS', '3', 'D', '51400', 'HPP GAS', 'D'),
(35, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51500', 'HPP OLI', '3', 'D', '51500', 'HPP OLI', 'D'),
(36, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52200', 'TEKOR PERTALITE', '3', 'D', '52200', 'TEKOR PERTALITE', 'D'),
(37, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52300', 'TEKOR DEX LITE', '3', 'D', '52300', 'TEKOR DEX LITE', 'D'),
(38, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52400', 'TEKOR GAS', '3', 'D', '52400', 'TEKOR GAS', 'D'),
(39, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52500', 'TEKOR OLI', '3', 'D', '52500', 'TEKOR OLI', 'D'),
(40, '30000', 'EKUITAS', '1', 'H', '32000', 'MODAL', '2', 'H', '32300', 'LABA DI TAHAN', '3', 'D', '32300', 'LABA DI TAHAN', 'D'),
(41, '30000', 'EKUITAS', '1', 'H', '32000', 'MODAL', '2', 'H', '32400', 'DEVIDEN', '3', 'D', '32400', 'DEVIDEN', 'D'),
(42, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62100', 'PAJAK BBM PPH 22', '3', 'D', '62100', 'PAJAK BBM PPH 22', 'D'),
(43, '20000', 'KEWAJIBAN', '1', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23200', 'HUTANG PPN', '3', 'H', '23210', 'PPN MASUKAN', 'D'),
(44, '20000', 'KEWAJIBAN', '1', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23200', 'HUTANG PPN', '3', 'H', '23220', 'PPN KELUARAN', 'D'),
(45, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62203', 'BIAYA MATERAI', 'D'),
(46, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62201', 'BIAYA BANTEN', 'D'),
(47, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62204', 'BIAYA LAIN-LAIN', 'D'),
(48, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11601', 'PERSEDIAAN PERTAMAX', 'D'),
(49, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11602', 'PERSEDIAAN PERTALITE', 'D'),
(50, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11603', 'PERSEDIAAN DEX LITE', 'D'),
(51, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12500', 'AKUMULASI PENYUSUTAN', '3', 'H', '12502', 'AKP. BANGUNAN DAN GEDUNG', 'D'),
(52, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12500', 'AKUMULASI PENYUSUTAN', '3', 'H', '12501', 'AKP. PERALATAN DAN MESIN', 'D'),
(53, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61200', 'BELANJA BARANG DAN JASA', '3', 'H', '61201', 'BELANJA PAKAIAN KARYAWAN', 'D'),
(54, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61200', 'BELANJA BARANG DAN JASA', '3', 'H', '61202', 'BELANJA ASURANSI', 'D'),
(55, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12500', 'AKUMULASI PENYUSUTAN', '3', 'H', '12503', 'AKP. KENDARAAN', 'D'),
(56, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11604', 'PERSEDIAAN GAS', 'D'),
(57, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11605', 'PERSEDIAAN OLI', 'D'),
(58, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61200', 'BELANJA BARANG DAN JASA', '3', 'H', '61203', 'BELANJA PEMELIHARAAN', 'D'),
(59, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11100', 'KAS DAN SETARA KAS', '3', 'H', '11110', 'KAS', 'D'),
(60, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11200', 'KAS BANK', '3', 'H', '11210', 'BANK MANDIRI', 'D'),
(61, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62202', 'BIAYA KONSUMSI', 'D'),
(62, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61100', 'BELANJA BEDAN', '3', 'H', '61101', 'BEBAN GAJI', 'D'),
(63, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61100', 'BELANJA BEDAN', '3', 'H', '61102', 'BEBAN LISTRIK DAN AIR', 'D'),
(64, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61100', 'BELANJA BEDAN', '3', 'H', '61103', 'BEBAN PENYUSUTAN ASET', 'D'),
(65, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11400', 'PERSEDIAAN LAINNYA', '3', 'H', '11401', 'PERSEDIAAN DI BAYAR DIMUKA', 'D'),
(66, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11400', 'PERSEDIAAN LAINNYA', '3', 'H', '11402', 'PERSEDIAAN ATK', 'D'),
(67, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11400', 'PERSEDIAAN LAINNYA', '3', 'H', '11403', 'PERSEDIAAN MATERAI', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `connection` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `queue` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `payload` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `exception` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_ledger`
--

CREATE TABLE `general_ledger` (
  `id` int NOT NULL,
  `notrans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `order_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `invoice_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `r_anggaran` int NOT NULL,
  `sumber_anggaran` tinyint NOT NULL DEFAULT '1' COMMENT '0 = silpa, 1 = hibah',
  `tabel_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_trans` decimal(15,2) NOT NULL DEFAULT '0.00',
  `memo` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `jurnal` varchar(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rlocation` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `comp_loc` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `loctrf_from` varchar(3) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `loctrf_to` varchar(3) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `pay_notrans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `return_notrans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0',
  `trigered` int NOT NULL DEFAULT '0',
  `void_flag` int NOT NULL DEFAULT '0',
  `extdata_flag` int NOT NULL DEFAULT '0',
  `us_create` varchar(18) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `us_update` varchar(18) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_udpate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `general_ledger`
--

INSERT INTO `general_ledger` (`id`, `notrans`, `order_no`, `invoice_no`, `r_anggaran`, `sumber_anggaran`, `tabel_trans`, `tgl`, `total_trans`, `memo`, `jurnal`, `rlocation`, `comp_loc`, `loctrf_from`, `loctrf_to`, `pay_notrans`, `return_notrans`, `trigered`, `void_flag`, `extdata_flag`, `us_create`, `us_update`, `date_create`, `date_udpate`) VALUES
(1, 'GJ000001', 'GJ23041', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '150000000.00', 'modal', 'GJ', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:20:45', '2023-04-15 10:20:45'),
(2, 'GJ000002', 'PO0420231', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '99200000.00', 'PO-BBM', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(3, 'GJ000003', 'PO0420231', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '77120000.00', 'PO-BBM', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(4, 'GJ000004', 'PO0420231', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '386000.00', 'PPH-PO-BBM', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(5, 'GJ000005', 'BR0420231', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '99200000.00', 'BBM-Datang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:21:56', '2023-04-15 10:21:56'),
(6, 'GJ000006', 'BR0420231', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '77120000.00', 'BBM-Datang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:21:56', '2023-04-15 10:21:56'),
(7, 'GJ000007', 'KP0420231', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '800000.00', 'Penjualan-Kupon', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:24:03', '2023-04-15 10:24:03'),
(8, 'GJ000008', 'KP0420231', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '700000.00', 'Penjualan-Kupon', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 10:24:03', '2023-04-15 10:24:03'),
(38, 'GJ000009', '20230415A1', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '4144000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(39, 'GJ000010', '20230415A1', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '2606100.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(40, 'GJ000011', '20230415A1', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '0.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(41, 'GJ000012', '20230415A1', '0', 99999, 1, 'general_ledger', '2023-04-15 00:00:00', '0.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(42, 'GJ000013', '20230416A1', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '286000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(43, 'GJ000014', '20230416A1', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '0.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(44, 'GJ000015', '20230416A1', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '0.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(45, 'GJ000016', '20230416A1', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '0.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(69, 'GJ000017', 'PB2023-1', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '320000.00', 'Pembelian-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(70, 'GJ000018', 'PB2023-1', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '1696000.00', 'Pembelian-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(71, 'GJ000019', 'INV2023003', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '36000.00', 'Penjualan-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(72, 'GJ000020', 'INV2023003', '0', 99999, 1, 'general_ledger', '2023-04-16 00:00:00', '220000.00', 'Penjualan-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(73, 'GJ000021', 'INV2023004', '0', 99999, 1, 'general_ledger', '2023-04-18 00:00:00', '36000.00', 'Penjualan-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(74, 'GJ000022', 'INV2023004', '0', 99999, 1, 'general_ledger', '2023-04-18 00:00:00', '220000.00', 'Penjualan-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-04-16 14:09:58', '2023-04-16 14:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `gl`
--

CREATE TABLE `gl` (
  `id` int UNSIGNED NOT NULL,
  `acc_id` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `amount` decimal(15,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gl`
--

INSERT INTO `gl` (`id`, `acc_id`, `amount`) VALUES
(1, '38100', '0.00'),
(2, '38999', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gl_detail`
--

CREATE TABLE `gl_detail` (
  `id` int NOT NULL,
  `rgl` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `acc_id` int NOT NULL,
  `debet` decimal(13,2) NOT NULL,
  `kredit` decimal(13,2) NOT NULL,
  `trans_detail` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `void_flag` int NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_udpate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `gl_detail`
--

INSERT INTO `gl_detail` (`id`, `rgl`, `acc_id`, `debet`, `kredit`, `trans_detail`, `void_flag`, `date_create`, `date_udpate`) VALUES
(1, 'GJ000001', 11110, '150000000.00', '0.00', 'Jurnal-Umum', 0, '2023-04-15 10:20:45', '2023-04-15 10:20:45'),
(2, 'GJ000001', 32200, '0.00', '150000000.00', 'Jurnal-Umum', 0, '2023-04-15 10:20:45', '2023-04-15 10:20:45'),
(3, 'GJ000002', 11401, '99200000.00', '0.00', 'PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(4, 'GJ000002', 11110, '0.00', '99200000.00', 'PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(5, 'GJ000003', 11401, '77120000.00', '0.00', 'PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(6, 'GJ000003', 11110, '0.00', '77120000.00', 'PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(7, 'GJ000004', 62100, '0.00', '386000.00', 'PPH-PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(8, 'GJ000004', 11110, '0.00', '386000.00', 'PPH-PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(9, 'GJ000004', 32300, '386000.00', '0.00', 'PPH-PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(10, 'GJ000004', 11110, '38600.00', '0.00', 'Trans-biaya', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(11, 'GJ000004', 23100, '0.00', '38600.00', 'PPH-PO-BBM', 0, '2023-04-15 10:21:35', '2023-04-15 10:21:35'),
(12, 'GJ000005', 11601, '99200000.00', '0.00', 'BBM-Datang', 0, '2023-04-15 10:21:56', '2023-04-15 10:21:56'),
(13, 'GJ000005', 11401, '0.00', '99200000.00', 'BBM-Datang', 0, '2023-04-15 10:21:56', '2023-04-15 10:21:56'),
(14, 'GJ000006', 11602, '77120000.00', '0.00', 'BBM-Datang', 0, '2023-04-15 10:21:56', '2023-04-15 10:21:56'),
(15, 'GJ000006', 11401, '0.00', '77120000.00', 'BBM-Datang', 0, '2023-04-15 10:21:56', '2023-04-15 10:21:56'),
(16, 'GJ000007', 11110, '800000.00', '0.00', 'Penjualan-Kupon', 0, '2023-04-15 10:24:03', '2023-04-15 10:24:03'),
(17, 'GJ000007', 21200, '0.00', '800000.00', 'Penjualan-Kupon', 0, '2023-04-15 10:24:03', '2023-04-15 10:24:03'),
(18, 'GJ000008', 11110, '700000.00', '0.00', 'Penjualan-Kupon', 0, '2023-04-15 10:24:03', '2023-04-15 10:24:03'),
(19, 'GJ000008', 21200, '0.00', '700000.00', 'Penjualan-Kupon', 0, '2023-04-15 10:24:03', '2023-04-15 10:24:03'),
(169, 'GJ000009', 11110, '4144000.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(170, 'GJ000009', 51100, '3472000.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(171, 'GJ000009', 41100, '4144000.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(172, 'GJ000009', 11601, '0.00', '3472000.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(173, 'GJ000009', 32300, '0.00', '672000.00', 'Aplusan-Laba', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(174, 'GJ000009', 11601, '0.00', '67200.00', 'Aplusan-pph22', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(175, 'GJ000009', 23100, '67200.00', '0.00', 'Aplusan-pph22', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(176, 'GJ000010', 11110, '2606100.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(177, 'GJ000010', 51200, '2111160.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(178, 'GJ000010', 41200, '2606100.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(179, 'GJ000010', 11602, '0.00', '2111160.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(180, 'GJ000010', 32300, '0.00', '494940.00', 'Aplusan-Laba', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(181, 'GJ000010', 11602, '0.00', '49494.00', 'Aplusan-pph22', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(182, 'GJ000010', 23100, '49494.00', '0.00', 'Aplusan-pph22', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(183, 'GJ000011', 11110, '0.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(184, 'GJ000011', 51300, '0.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(185, 'GJ000011', 41300, '0.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(186, 'GJ000011', 11603, '0.00', '0.00', 'Aplusan', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(187, 'GJ000011', 32300, '0.00', '0.00', 'Aplusan-Laba', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(188, 'GJ000011', 11603, '0.00', '0.00', 'Aplusan-pph22', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(189, 'GJ000011', 23100, '0.00', '0.00', 'Aplusan-pph22', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(190, 'GJ000012', 23100, '0.00', '0.00', 'Aplusan-pph22Net', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(191, 'GJ000012', 11110, '0.00', '0.00', 'Aplusan-LabaNet', 0, '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(192, 'GJ000013', 11110, '286000.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(193, 'GJ000013', 51100, '236000.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(194, 'GJ000013', 41100, '286000.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(195, 'GJ000013', 11601, '0.00', '236000.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(196, 'GJ000013', 32300, '0.00', '50000.00', 'Aplusan-Laba', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(197, 'GJ000013', 11601, '0.00', '5000.00', 'Aplusan-pph22', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(198, 'GJ000013', 23100, '5000.00', '0.00', 'Aplusan-pph22', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(199, 'GJ000014', 11110, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(200, 'GJ000014', 51200, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(201, 'GJ000014', 41200, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(202, 'GJ000014', 11602, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(203, 'GJ000014', 32300, '0.00', '0.00', 'Aplusan-Laba', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(204, 'GJ000014', 11602, '0.00', '0.00', 'Aplusan-pph22', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(205, 'GJ000014', 23100, '0.00', '0.00', 'Aplusan-pph22', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(206, 'GJ000015', 11110, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(207, 'GJ000015', 51300, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(208, 'GJ000015', 41300, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(209, 'GJ000015', 11603, '0.00', '0.00', 'Aplusan', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(210, 'GJ000015', 32300, '0.00', '0.00', 'Aplusan-Laba', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(211, 'GJ000015', 11603, '0.00', '0.00', 'Aplusan-pph22', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(212, 'GJ000015', 23100, '0.00', '0.00', 'Aplusan-pph22', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(213, 'GJ000016', 23100, '0.00', '0.00', 'Aplusan-pph22Net', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(214, 'GJ000016', 11110, '0.00', '0.00', 'Aplusan-LabaNet', 0, '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(321, 'GJ000017', 11604, '320000.00', '0.00', 'Pembelian-Barang', 0, '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(322, 'GJ000017', 11110, '0.00', '320000.00', 'Pembelian-Barang', 0, '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(323, 'GJ000018', 11604, '1696000.00', '0.00', 'Pembelian-Barang', 0, '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(324, 'GJ000018', 11110, '0.00', '1696000.00', 'Pembelian-Barang', 0, '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(325, 'GJ000019', 41400, '36000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(326, 'GJ000019', 11110, '40000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(327, 'GJ000019', 11604, '0.00', '36000.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(328, 'GJ000019', 51400, '32000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(329, 'GJ000019', 32300, '0.00', '4000.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(330, 'GJ000019', 11110, '0.00', '400.00', 'Penjualan-pph22', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(331, 'GJ000019', 23100, '400.00', '0.00', 'Penjualan-pph22', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(332, 'GJ000020', 41400, '220000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(333, 'GJ000020', 11110, '228000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(334, 'GJ000020', 11604, '0.00', '220000.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(335, 'GJ000020', 51400, '212000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(336, 'GJ000020', 32300, '0.00', '8000.00', 'Penjualan-Barang', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(337, 'GJ000020', 11110, '0.00', '800.00', 'Penjualan-pph22', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(338, 'GJ000020', 23100, '800.00', '0.00', 'Penjualan-pph22', 0, '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(339, 'GJ000021', 41400, '36000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(340, 'GJ000021', 11110, '40000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(341, 'GJ000021', 11604, '0.00', '36000.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(342, 'GJ000021', 51400, '32000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(343, 'GJ000021', 32300, '0.00', '4000.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(344, 'GJ000021', 11110, '0.00', '400.00', 'Penjualan-pph22', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(345, 'GJ000021', 23100, '400.00', '0.00', 'Penjualan-pph22', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(346, 'GJ000022', 41400, '220000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(347, 'GJ000022', 11110, '228000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(348, 'GJ000022', 11604, '0.00', '220000.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(349, 'GJ000022', 51400, '212000.00', '0.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(350, 'GJ000022', 32300, '0.00', '8000.00', 'Penjualan-Barang', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(351, 'GJ000022', 11110, '0.00', '800.00', 'Penjualan-pph22', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(352, 'GJ000022', 23100, '800.00', '0.00', 'Penjualan-pph22', 0, '2023-04-16 14:09:58', '2023-04-16 14:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `gl_lr`
--

CREATE TABLE `gl_lr` (
  `id` int UNSIGNED NOT NULL,
  `acc_id` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `amount` decimal(15,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gl_lr`
--

INSERT INTO `gl_lr` (`id`, `acc_id`, `amount`) VALUES
(1, '38100', '0.00'),
(2, '38999', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `level1`
--

CREATE TABLE `level1` (
  `id` char(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `atype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `jtype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `trigered` varchar(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `active` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `level1`
--

INSERT INTO `level1` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('202208011', 10000, 1, 0, 'HARTA', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208012', 20000, 1, 0, 'KEWAJIBAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208013', 30000, 1, 0, 'EKUITAS', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208014', 40000, 1, 0, 'PENDAPATAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208015', 50000, 1, 0, 'BIAYA PENJUALAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208016', 60000, 1, 0, 'PENGELUARAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `level2`
--

CREATE TABLE `level2` (
  `id` char(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `atype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `jtype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `trigered` varchar(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `active` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `level2`
--

INSERT INTO `level2` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('202208011', 11000, 2, 10000, 'ASET LANCAR', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('2022080110', 61000, 2, 60000, 'BELANJA OPERASIONAL', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:35'),
('2022080114', 12000, 2, 10000, 'ASET TETAP', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('2022080115', 62000, 2, 60000, 'BIAYA LAINNYA', 'H', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:51:35'),
('2022080116', 23000, 2, 20000, 'HUTANG PAJAK', 'H', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:51:35'),
('2022080117', 32000, 2, 30000, 'MODAL', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:35'),
('202208012', 21000, 2, 20000, 'KEWAJIBAN JANGKA PENDEK', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('202208016', 41000, 2, 40000, 'PENJUALAN', 'H', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:35'),
('202208017', 42000, 2, 40000, 'SEWA', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:35'),
('202208018', 51000, 2, 50000, 'HPP PENJUALAN', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:35'),
('20230215', 52000, 2, 50000, 'TEKOR', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `level3`
--

CREATE TABLE `level3` (
  `id` char(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `atype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `jtype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `trigered` varchar(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `active` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `level3`
--

INSERT INTO `level3` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('2022080111', 12000, 2, 12000, 'ASET TETAP', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080114', 61200, 3, 61000, 'BELANJA BARANG DAN JASA', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:51'),
('2022080117', 62200, 3, 62000, 'BIAYA LAIN-LAIN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('2022080118', 23100, 3, 23000, 'HUTANG PAJAK PPH FINAL PS 4 AYAT 2', 'D', '0.00', 'JK', '2', '0', '1', '2023-04-08 10:32:58'),
('2022080119', 23200, 3, 23000, 'HUTANG PPN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('202208012', 21300, 3, 21000, 'HUTANG LAINNYA', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51'),
('2022080120', 32200, 3, 32000, 'MODAL YANG DI SETOR', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51'),
('2022080131', 11600, 3, 11000, 'PERSEDIAAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:52'),
('2022080132', 12100, 3, 12000, 'TANAH', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080133', 12200, 3, 12000, 'GEDUNG DAN BANGUNAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080134', 12300, 3, 12000, 'PERALATAN DAN MESIN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080135', 12400, 3, 12000, 'KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080136', 12500, 3, 12000, 'AKUMULASI PENYUSUTAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:52'),
('2022080138', 21100, 3, 21000, 'HUTANG USAHA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080139', 21200, 3, 21000, 'PENDAPATAN DITERIMA DIMUKA', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:52'),
('2022080140', 21400, 3, 21000, 'BIAYA YANG MASIH HARUS DIBAYAR', 'D', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:51:52'),
('2022080141', 21500, 3, 21000, 'HUTANG BEBAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080143', 41200, 3, 41000, 'PENJUALAN PERTALITE', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:52'),
('2022080144', 41300, 3, 41000, 'PENJUALAN DEXLITE', 'D', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:51:52'),
('2022080148', 42801, 3, 42000, 'SEWA ATM', 'D', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:51:52'),
('2022080152', 42805, 3, 42000, 'DISKON PEMBELIAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('202208016', 41100, 3, 41000, 'PENJUALAN PERTAMAX', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51'),
('20220830033326', 23700, 3, 23000, 'HUTANG JANGKA PAJANG', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-30 11:33:26'),
('20230201021633', 11100, 3, 11000, 'KAS DAN SETARA KAS', 'H', '0.00', 'JK', '1', '0', '1', '2023-02-01 09:16:33'),
('20230201022212', 11200, 3, 11000, 'KAS BANK', 'H', '0.00', 'JK', '1', '0', '1', '2023-02-01 09:22:13'),
('20230308232318', 41400, 3, 41000, 'PENJUALAN GAS', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 07:23:18'),
('20230308232336', 41500, 3, 41000, 'PENJUALAN OLI', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 07:23:36'),
('20230309024556', 51100, 3, 51000, 'HPP PERTAMAX', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:45:56'),
('20230309024751', 52100, 3, 52000, 'TEKOR PERTAMAX', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:47:51'),
('20230309024829', 51200, 3, 51000, 'HPP PERTALITE', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:48:29'),
('20230309024844', 51300, 3, 51000, 'HPP DEX LITE', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:48:44'),
('20230309024859', 51400, 3, 51000, 'HPP GAS', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:48:59'),
('20230309024913', 51500, 3, 51000, 'HPP OLI', 'D', '0.00', 'JK', 'd', '0', '1', '2023-03-09 10:49:13'),
('20230309024938', 52200, 3, 52000, 'TEKOR PERTALITE', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:49:38'),
('20230309025000', 52300, 3, 52000, 'TEKOR DEX LITE', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:50:00'),
('20230309025126', 52400, 3, 52000, 'TEKOR GAS', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:51:26'),
('20230309025140', 52500, 3, 52000, 'TEKOR OLI', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:51:40'),
('20230319035428', 61100, 3, 61000, 'BELANJA BEDAN', 'H', '0.00', 'JK', '1', '0', '1', '2023-03-19 11:54:28'),
('20230319123411', 32300, 3, 32000, 'LABA DI TAHAN', 'D', '0.00', 'JK', 'd', '0', '1', '2023-03-19 20:34:11'),
('20230319123851', 11400, 3, 11000, 'PERSEDIAAN LAINNYA', 'H', '0.00', 'JK', '1', '0', '1', '2023-03-19 20:38:51'),
('20230408034512', 32400, 3, 32000, 'DEVIDEN', 'D', '0.00', 'JK', '2', '0', '1', '2023-04-08 11:45:12'),
('20230408035308', 62100, 3, 62000, 'PAJAK BBM PPH 22', 'D', '0.00', 'JK', '2', '0', '1', '2023-04-08 11:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `level4`
--

CREATE TABLE `level4` (
  `id` char(30) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `atype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `jtype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `trigered` varchar(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `active` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `level4`
--

INSERT INTO `level4` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('202208011', 21300, 3, 21300, 'HUTANG LAINNYA', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:22'),
('2022080110', 12000, 2, 12000, 'ASET TETAP', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:22'),
('2022080114', 23100, 3, 23100, 'HUTANG PAJAK PPH FINAL', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:22'),
('2022080115', 23210, 4, 23200, 'PPN MASUKAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:22'),
('2022080116', 23220, 4, 23200, 'PPN KELUARAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:22'),
('2022080117', 32200, 3, 32200, 'MODAL YANG DI SETOR', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:22'),
('2022080121', 62203, 4, 62200, 'BIAYA MATERAI', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080123', 62201, 4, 62200, 'BIAYA BANTEN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080126', 62204, 4, 62200, 'BIAYA LAIN-LAIN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080138', 11601, 4, 11600, 'PERSEDIAAN PERTAMAX', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:23'),
('2022080139', 11602, 4, 11600, 'PERSEDIAAN PERTALITE', 'D', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:52:23'),
('2022080140', 11603, 4, 11600, 'PERSEDIAAN DEX LITE', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:23'),
('2022080141', 12100, 3, 12100, 'TANAH', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080142', 12200, 3, 12200, 'GEDUNG DAN BANGUNAN', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080143', 12300, 3, 12300, 'PERALATAN DAN MESIN', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080144', 12400, 3, 12400, 'KENDARAAN', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080145', 12502, 4, 12500, 'AKP. BANGUNAN DAN GEDUNG', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080146', 12501, 4, 12500, 'AKP. PERALATAN DAN MESIN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080148', 21100, 3, 21100, 'HUTANG USAHA', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080149', 21200, 3, 21200, 'PENDAPATAN DITERIMA DIMUKA', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:23'),
('202208015', 41100, 3, 41100, 'PENJUALAN PERTAMAX', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:22'),
('2022080150', 21400, 3, 21400, 'BIAYA YANG MASIH HARUS DIBAYAR', 'B', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:52:23'),
('2022080151', 21500, 3, 21500, 'HUTANG BEBAN', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080153', 41200, 3, 41200, 'PENJUALAN PERTALITE', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:23'),
('2022080154', 41300, 3, 41300, 'PENJUALAN DEXLITE', 'B', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:52:23'),
('2022080158', 42801, 3, 42801, 'SEWA ATM', 'B', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:52:23'),
('2022080162', 42805, 3, 42805, 'DISKON PEMBELIAN', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080163', 61201, 4, 61200, 'BELANJA PAKAIAN KARYAWAN', 'D', '0.00', 'JK', 'c', '0', '1', '2023-03-14 06:48:12'),
('2022080164', 61202, 4, 61200, 'BELANJA ASURANSI', 'D', '0.00', 'JK', 'c', '0', '1', '2023-03-18 08:52:25'),
('20221208032333', 12503, 4, 12500, 'AKP. KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-08 11:23:34'),
('20221212034801', 11604, 4, 11600, 'PERSEDIAAN GAS', 'D', '0.00', 'JK', 'd', '0', '1', '2022-12-12 11:48:02'),
('20221212034848', 11605, 4, 11600, 'PERSEDIAAN OLI', 'D', '0.00', 'JK', 'c', '0', '1', '2022-12-12 11:48:49'),
('20221212060252', 61203, 4, 61200, 'BELANJA PEMELIHARAAN', 'D', '0.00', 'JK', 'c', '0', '1', '2023-03-18 12:08:42'),
('20230201021743', 11110, 4, 11100, 'KAS', 'D', '0.00', 'JK', 'c', '0', '1', '2023-02-01 09:17:43'),
('20230201022303', 11210, 4, 11200, 'BANK MANDIRI', 'D', '0.00', 'JK', 'c', '0', '1', '2023-03-24 16:36:49'),
('20230201023837', 62202, 4, 62200, 'BIAYA KONSUMSI', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-01 09:38:37'),
('20230308232318', 41400, 3, 41000, 'PENJUALAN GAS', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 07:23:18'),
('20230308232336', 41500, 3, 41000, 'PENJUALAN OLI', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 07:23:36'),
('20230309024556', 51100, 3, 51000, 'HPP PERTAMAX', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:45:56'),
('20230309024751', 52100, 3, 52000, 'TEKOR PERTAMAX', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:47:51'),
('20230309024829', 51200, 3, 51000, 'HPP PERTALITE', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:48:29'),
('20230309024844', 51300, 3, 51000, 'HPP DEX LITE', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:48:44'),
('20230309024859', 51400, 3, 51000, 'HPP GAS', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:48:59'),
('20230309024913', 51500, 3, 51000, 'HPP OLI', 'B', '0.00', 'JK', 'd', '0', '1', '2023-03-09 10:49:13'),
('20230309024938', 52200, 3, 52000, 'TEKOR PERTALITE', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:49:38'),
('20230309025000', 52300, 3, 52000, 'TEKOR DEX LITE', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:50:00'),
('20230309025126', 52400, 3, 52000, 'TEKOR GAS', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:51:26'),
('20230309025140', 52500, 3, 52000, 'TEKOR OLI', 'B', '0.00', 'JK', '2', '0', '1', '2023-03-09 10:51:40'),
('20230319035520', 61101, 4, 61100, 'BEBAN GAJI', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-19 11:55:20'),
('20230319035700', 61102, 4, 61100, 'BEBAN LISTRIK DAN AIR', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-19 11:57:00'),
('20230319040056', 61103, 4, 61100, 'BEBAN PENYUSUTAN ASET', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-19 12:00:56'),
('20230319123411', 32300, 3, 32000, 'LABA DI TAHAN', 'B', '0.00', 'JK', 'd', '0', '1', '2023-03-19 20:34:11'),
('20230319124033', 11401, 4, 11400, 'PERSEDIAAN DI BAYAR DIMUKA', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-19 20:40:33'),
('20230319124153', 11402, 4, 11400, 'PERSEDIAAN ATK', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-19 20:41:53'),
('20230319124245', 11403, 4, 11400, 'PERSEDIAAN MATERAI', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-19 20:42:45'),
('20230408034512', 32400, 3, 32000, 'DEVIDEN', 'B', '0.00', 'JK', '2', '0', '1', '2023-04-08 11:45:12'),
('20230408035308', 62100, 3, 62000, 'PAJAK BBM PPH 22', 'B', '0.00', 'JK', '2', '0', '1', '2023-04-08 11:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `abilities` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
(48, 'App\\Models\\User', 1, 'ApiToken', 'e215c3c67a9beccd0b1ab0fe6ea25a5eb8675d0590f46669193fe41885c4e664', '[\"*\"]', NULL, '2023-01-28 13:39:25', '2023-01-28 13:39:25'),
(49, 'App\\Models\\User', 1, 'ApiToken', '578e8c0b2fb4014271a2f2353fb693433eede3952051ddf7f05324cba73085f9', '[\"*\"]', '2023-04-12 06:38:05', '2023-04-11 22:07:15', '2023-04-12 06:38:05'),
(50, 'App\\Models\\User', 1, 'ApiToken', '608a0c3804a44df517a055e13570e6c43bda2d58bf658af54e9e338f6c9a8016', '[\"*\"]', NULL, '2023-04-11 22:12:56', '2023-04-11 22:12:56'),
(51, 'App\\Models\\User', 1, 'ApiToken', 'b90c4ab61a6fc9a033e2a89342882ea3eefcf52828c08a5f8bbadc7773c284e8', '[\"*\"]', NULL, '2023-04-11 22:16:51', '2023-04-11 22:16:51'),
(52, 'App\\Models\\User', 1, 'ApiToken', '53fc50e59d5c98aa05412690b5b5b9a7e523979d23140048be6168c0b3d75d88', '[\"*\"]', NULL, '2023-04-11 22:25:55', '2023-04-11 22:25:55'),
(53, 'App\\Models\\User', 1, 'ApiToken', 'f0dd7081b3e7fb378d9faeb0ae5275964a46548dca0aa1e9af5b81d2a6ca8134', '[\"*\"]', NULL, '2023-04-12 03:30:32', '2023-04-12 03:30:32'),
(54, 'App\\Models\\User', 1, 'ApiToken', '661ce0d0616493d1c24fda1393701df8520f6df419b96b36d9a54d371a144077', '[\"*\"]', NULL, '2023-04-12 03:33:35', '2023-04-12 03:33:35'),
(55, 'App\\Models\\User', 1, 'ApiToken', 'd93e5a81319ddd0db6ca7cc3aa9303c93e216d63dc9bfefe73464cc00fd3ae25', '[\"*\"]', NULL, '2023-04-12 03:39:18', '2023-04-12 03:39:18'),
(56, 'App\\Models\\User', 1, 'ApiToken', 'd08a4b4b1ba75e71c4883ed3067c57443f9657a5d59e5aa7276155791b53b6dd', '[\"*\"]', NULL, '2023-04-12 06:01:34', '2023-04-12 06:01:34'),
(57, 'App\\Models\\User', 1, 'ApiToken', '67851f85938f6520d679dea560cbd7ea7aa208e488e8d1fa86b847973a389067', '[\"*\"]', NULL, '2023-04-12 06:03:20', '2023-04-12 06:03:20'),
(58, 'App\\Models\\User', 1, 'ApiToken', '060adbbae3df6599f547067d3d4e7d92244443aa855b6f5bfb36d9b95b8db3b8', '[\"*\"]', NULL, '2023-04-12 06:08:06', '2023-04-12 06:08:06'),
(59, 'App\\Models\\User', 1, 'ApiToken', '3f61206b2b62393147d990d4af81088d49e771cd119ee135739cf34071b7c4f1', '[\"*\"]', NULL, '2023-04-12 06:15:16', '2023-04-12 06:15:16'),
(60, 'App\\Models\\User', 1, 'ApiToken', 'a6fd04a8a3a0876bd21c09ad1418ac60c84c5b325941b361d8e13743ab01b20e', '[\"*\"]', NULL, '2023-04-12 06:16:19', '2023-04-12 06:16:19'),
(61, 'App\\Models\\User', 1, 'ApiToken', '36970aedccbaf9326260f4bea6a64cb5c75d8901f40765bdd263c8d2c7ef3671', '[\"*\"]', NULL, '2023-04-12 06:18:43', '2023-04-12 06:18:43'),
(62, 'App\\Models\\User', 1, 'ApiToken', 'aaf906dd7a6bd8b3667a456081119c335888353f7e01daec3181677886a1f07c', '[\"*\"]', NULL, '2023-04-12 06:21:04', '2023-04-12 06:21:04'),
(63, 'App\\Models\\User', 1, 'ApiToken', '943f90b70b486ca8185f095a304caf9588163c0da5ec27fc3f24ed2411280ba0', '[\"*\"]', NULL, '2023-04-12 06:39:00', '2023-04-12 06:39:00'),
(64, 'App\\Models\\User', 1, 'ApiToken', '4acfb51e3269c42907135238665a470bc95ba58a33a1e14d65eb9597c753a966', '[\"*\"]', NULL, '2023-04-12 06:52:29', '2023-04-12 06:52:29'),
(65, 'App\\Models\\User', 1, 'ApiToken', 'f8721489ca2c4c990d396cec30a7d7c1ab7fb9d62162a3f7c973003e0aeb6fab', '[\"*\"]', NULL, '2023-04-12 06:57:49', '2023-04-12 06:57:49'),
(66, 'App\\Models\\User', 1, 'ApiToken', 'b0be05a0a870a03fbd705ab32476dbef6530c56e3bdc2d978fb29ed55b68abc4', '[\"*\"]', '2023-04-12 07:14:37', '2023-04-12 07:11:15', '2023-04-12 07:14:37'),
(67, 'App\\Models\\User', 1, 'ApiToken', '6ddd0ac72261d6fac9eb15f9c483f5ac48281222672e978441712878b943326f', '[\"*\"]', '2023-04-12 07:15:14', '2023-04-12 07:14:53', '2023-04-12 07:15:14'),
(68, 'App\\Models\\User', 1, 'ApiToken', 'dc2d0ec8a70d4468fa116a8d50ac7811538a6cc7e7be5c08736b2c7211ce8ca3', '[\"*\"]', '2023-04-12 07:45:16', '2023-04-12 07:36:35', '2023-04-12 07:45:16'),
(69, 'App\\Models\\User', 1, 'ApiToken', '73bba247108a3dd4ee71c3c2217f3037ace77dd101cbfb49f7492b6653d45c4c', '[\"*\"]', '2023-04-12 07:57:44', '2023-04-12 07:45:28', '2023-04-12 07:57:44'),
(70, 'App\\Models\\User', 1, 'ApiToken', 'ef1d4cc93cf72c49bc5b947071f858fbc650e2318fa9bc6f58b309e5374a8943', '[\"*\"]', '2023-04-12 09:01:37', '2023-04-12 07:57:57', '2023-04-12 09:01:37'),
(71, 'App\\Models\\User', 1, 'ApiToken', 'a0d4da1474c797e156a10ae5edd689e9b9e7aa4bd9ac79ab915d37944e120250', '[\"*\"]', '2023-04-12 09:03:35', '2023-04-12 09:01:49', '2023-04-12 09:03:35'),
(72, 'App\\Models\\User', 1, 'ApiToken', 'f146aacef36aac77d80312b770e3e9405bdbc6628a12f73be55cc73b05d17870', '[\"*\"]', '2023-04-12 09:21:08', '2023-04-12 09:05:17', '2023-04-12 09:21:08'),
(73, 'App\\Models\\User', 1, 'ApiToken', 'a2448c2e3a6dde0944e00a3e7bb9eee594137919f55c10d6088db4e051ba5d3f', '[\"*\"]', '2023-04-12 09:59:53', '2023-04-12 09:21:25', '2023-04-12 09:59:53'),
(74, 'App\\Models\\User', 1, 'ApiToken', '17c136914f119a4e3d0dcb4c4e8371261250f6eed5c2c9af9251ea299073936b', '[\"*\"]', '2023-04-12 10:01:37', '2023-04-12 10:00:21', '2023-04-12 10:01:37'),
(75, 'App\\Models\\User', 1, 'ApiToken', 'e2688e8076e22d003ca2e2993097473f670ece7713d8d4b4785fc7e2a8e357d0', '[\"*\"]', '2023-04-12 10:04:00', '2023-04-12 10:03:59', '2023-04-12 10:04:00'),
(76, 'App\\Models\\User', 1, 'ApiToken', 'a520afcc45903b63366594854b88147788620dd09dd21d43b6a1325445a985e0', '[\"*\"]', '2023-04-14 00:00:39', '2023-04-12 10:04:19', '2023-04-14 00:00:39'),
(77, 'App\\Models\\User', 1, 'ApiToken', '24a8b811956eaa88cf972a409c3151268dfbad6cac053eda921fc972ad6365cc', '[\"*\"]', '2023-04-16 12:36:26', '2023-04-14 14:39:21', '2023-04-16 12:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_anggaran`
--

CREATE TABLE `rekening_anggaran` (
  `id_rekening` int NOT NULL,
  `nomor_rekening` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nama_rekening` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `anggaran` decimal(12,2) NOT NULL DEFAULT '0.00',
  `parent_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `view_level` int NOT NULL DEFAULT '0',
  `tipe` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'D',
  `rlocation` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tahun_anggaran` int NOT NULL DEFAULT '2022',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_create` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `user_update` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbarang`
--

CREATE TABLE `tblbarang` (
  `id` bigint UNSIGNED NOT NULL,
  `kdBarang` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hrgPokok` double NOT NULL,
  `hrgJual` double NOT NULL,
  `ktgBarang` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `satuanBarang` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `merek` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `stkBarang` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `stkSatuan` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `qtyMin` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `qtyMax` char(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `stsBarang` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `deskripsi` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid_hpp` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid_persediaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid_biaya` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblbarang`
--

INSERT INTO `tblbarang` (`id`, `kdBarang`, `nmBarang`, `hrgPokok`, `hrgJual`, `ktgBarang`, `satuanBarang`, `merek`, `stkBarang`, `stkSatuan`, `qtyMin`, `qtyMax`, `stsBarang`, `deskripsi`, `accid`, `accid_hpp`, `accid_persediaan`, `accid_biaya`, `created_at`, `updated_at`) VALUES
(2, 'BRG0004', 'TURBO', 17000, 23000, 'KT-2021-5', 'TABUNG', 'BRIGHT', '-1', NULL, '5', '200', '1', 'gas', '41400', '51400', '11604', '52400', NULL, NULL),
(3, 'BRG0005', 'BRIGHT GAS 12KG', 212000, 220000, 'KT-2021-3', 'TABUNG', 'BRIGHT', '6', NULL, '5', '200', '1', 'Tabung gas elipgi', '41400', '51400', '11604', '52400', '2023-01-23 00:04:44', '2023-01-23 00:04:44'),
(4, 'BRG0006', 'BRIGHT GAS 5,5KG', 110000, 130000, 'KT-2021-3', 'TABUNG', 'BRIGHT', '-1', NULL, '2', '10', '0', 'des', '41400', '51400', '11604', '52400', '2023-02-03 13:26:02', '2023-02-03 13:26:02'),
(5, 'BRG0007', 'ELPIGI GAS 3KG', 16000, 18000, 'KT-2021-3', 'TABUNG', 'ELPIGI', '16', NULL, '5', '100', '0', 'des', '41400', '51400', '11604', '52400', '2023-02-04 02:58:44', '2023-02-04 02:58:44'),
(6, 'BRG0008', 'OLI MESRAN 1.5L', 80000, 110000, 'KT-2021-2', 'BOTOL', 'MESRAN', '0', NULL, '5', '100', '0', 'des', '41500', '51500', '11605', '52500', '2023-02-04 02:59:07', '2023-02-04 02:59:07');

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
  `code_bbm` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nama_bbm` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `last_meter` int NOT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `sale_price` decimal(13,2) NOT NULL,
  `stokBbm_old` decimal(13,2) NOT NULL,
  `logo_bbm` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid_hpp` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid_persediaan` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid_biaya` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblbbm`
--

INSERT INTO `tblbbm` (`id`, `code_bbm`, `nama_bbm`, `last_meter`, `last_price`, `sale_price`, `stokBbm_old`, `logo_bbm`, `accid`, `accid_hpp`, `accid_persediaan`, `accid_biaya`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 0, '11600.00', '14200.00', '-2880.00', 'pertamax.png', '41100', '51100', '11601', '52100', '2023-01-12 12:56:36', '2023-04-16 00:20:30'),
(2, 'BRG0002', 'PERLITE', 0, '9000.00', '11000.00', '-5599.00', 'pertalite.png', '41200', '51200', '11602', '52200', '2023-01-12 12:56:36', '2023-04-16 00:12:29'),
(3, 'BRG0003', 'DEX LITE', 0, '14000.00', '17800.00', '-2395.00', 'dexlite.png', '41300', '51300', '11603', '52300', '2023-01-14 08:29:46', '2023-03-21 06:02:27');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblbiaya`
--

CREATE TABLE `tblbiaya` (
  `id_biaya` bigint NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tglBiaya` datetime NOT NULL,
  `keterangan_biaya` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `jumlah` decimal(13,2) NOT NULL,
  `accid` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `r_regu` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblheader_aplusan`
--

CREATE TABLE `tblheader_aplusan` (
  `id_aplusan` bigint NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_trans` datetime NOT NULL,
  `r_regu` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `total_jual` decimal(13,2) NOT NULL,
  `total_kupon` decimal(13,2) NOT NULL,
  `total_biaya` decimal(13,2) NOT NULL,
  `total_link` decimal(13,2) NOT NULL,
  `total_cash` decimal(13,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblheader_aplusan`
--

INSERT INTO `tblheader_aplusan` (`id_aplusan`, `kd_trans`, `tgl_trans`, `r_regu`, `total_jual`, `total_kupon`, `total_biaya`, `total_link`, `total_cash`, `created_at`, `updated_at`) VALUES
(7, '20230415A1', '2023-04-15 10:10:55', 'A', '6750100.00', '0.00', '0.00', '0.00', '6750100.00', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(8, '20230416A1', '2023-04-16 08:19:21', 'A', '286000.00', '0.00', '0.00', '0.00', '286000.00', '2023-04-16 08:19:21', '2023-04-16 08:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `tblinventaris`
--

CREATE TABLE `tblinventaris` (
  `id_inventaris` int NOT NULL,
  `kode_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `kode_pengadaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `nama_inventaris` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `group_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `accid_akum` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tahun_pembuatan` date NOT NULL,
  `tahun_perakitan` date NOT NULL,
  `merek` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `warna` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `umur_ekonomis` int NOT NULL COMMENT 'tahun',
  `nilai_inventaris` decimal(13,2) DEFAULT NULL,
  `qty_inventaris` decimal(13,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblinventaris`
--

INSERT INTO `tblinventaris` (`id_inventaris`, `kode_inventaris`, `kode_pengadaan`, `nama_inventaris`, `group_inventaris`, `accid_akum`, `tahun_pembuatan`, `tahun_perakitan`, `merek`, `warna`, `umur_ekonomis`, `nilai_inventaris`, `qty_inventaris`, `created_at`, `updated_at`) VALUES
(3, 'INV0320231', 'PGA0420231', 'Motor Vario', '12400', '12503', '2008-01-02', '2008-01-01', 'Honda', 'Hitam', 5, '3000000.00', '1.00', '2023-03-28 06:19:52', '2023-03-28 06:19:52'),
(4, 'INV03202332', 'PGA0420231', 'Mobil', '12400', '12503', '2020-01-02', '2020-01-01', 'TOYODA', 'PTUH', 10, '60000000.00', '5.00', '2023-03-28 06:21:28', '2023-03-28 06:21:28'),
(5, 'INV032023333', 'PGA0420231', 'pompa', '12300', '12501', '2012-01-01', '2012-01-01', 'sp', 'hitam', 10, '2000000.00', '1.00', '2023-03-29 06:09:45', '2023-03-29 06:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblinventaris_pengadaan`
--

CREATE TABLE `tblinventaris_pengadaan` (
  `id_pengadaan` int NOT NULL,
  `pengadaan_sysno` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `pengadaan_docno` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_spk` date NOT NULL,
  `memo` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `total` decimal(13,2) NOT NULL,
  `supplier_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinventaris_pengadaan_detail`
--

CREATE TABLE `tblinventaris_pengadaan_detail` (
  `id_pengadaan_detail` int NOT NULL,
  `rsysno_pengadaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rkode_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rkode_pengadaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `kode_pengadaan_detail` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `qty` decimal(11,2) NOT NULL DEFAULT '0.00',
  `harga_perolehan` decimal(11,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinventaris_penyusutan`
--

CREATE TABLE `tblinventaris_penyusutan` (
  `id_penyusutan` int NOT NULL,
  `penyusutan_sysno` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `penyusutan_docno` varchar(25) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_penyusutan` datetime NOT NULL,
  `memo_penyusutan` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblinventaris_penyusutan_detail`
--

CREATE TABLE `tblinventaris_penyusutan_detail` (
  `id_penyusutan_detail` int NOT NULL,
  `rsysno_penyusutan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rkode_inventaris` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_penyusutan` datetime NOT NULL,
  `jumlah_penyusutan` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblkartu_stok`
--

CREATE TABLE `tblkartu_stok` (
  `id` bigint NOT NULL,
  `r_notrans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `kd_barang` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tgl` datetime NOT NULL,
  `stok_awal` decimal(10,2) NOT NULL,
  `unit_beli` decimal(10,2) NOT NULL,
  `total_beli` decimal(10,2) NOT NULL,
  `unit_jual` decimal(10,2) NOT NULL,
  `total_jual` decimal(10,2) NOT NULL,
  `stok_akhir` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblkartu_stok`
--

INSERT INTO `tblkartu_stok` (`id`, `r_notrans`, `kd_barang`, `tgl`, `stok_awal`, `unit_beli`, `total_beli`, `unit_jual`, `total_jual`, `stok_akhir`, `created_at`, `updated_at`) VALUES
(24, 'PB2023-1', 'BRG0007', '2023-04-16 00:00:00', '0.00', '20.00', '320000.00', '0.00', '0.00', '20.00', '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(25, 'PB2023-1', 'BRG0005', '2023-04-16 00:00:00', '0.00', '8.00', '1696000.00', '0.00', '0.00', '8.00', '2023-04-16 13:32:11', '2023-04-16 13:32:11'),
(26, 'INV2023003', 'BRG0007', '2023-04-16 00:00:00', '20.00', '0.00', '0.00', '2.00', '36000.00', '18.00', '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(27, 'INV2023003', 'BRG0005', '2023-04-16 00:00:00', '8.00', '0.00', '0.00', '1.00', '220000.00', '7.00', '2023-04-16 13:34:43', '2023-04-16 13:34:43'),
(28, 'INV2023004', 'BRG0007', '2023-04-18 00:00:00', '18.00', '0.00', '0.00', '2.00', '36000.00', '16.00', '2023-04-16 14:09:58', '2023-04-16 14:09:58'),
(29, 'INV2023004', 'BRG0005', '2023-04-18 00:00:00', '7.00', '0.00', '0.00', '1.00', '220000.00', '6.00', '2023-04-16 14:09:58', '2023-04-16 14:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblkategori`
--

CREATE TABLE `tblkategori` (
  `id` bigint UNSIGNED NOT NULL,
  `kodeKtg` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `namaKtg` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
  `kd_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_regu` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tgl_trans` datetime NOT NULL,
  `r_kdPelanggan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbllinkaja`
--

CREATE TABLE `tbllinkaja` (
  `id` int NOT NULL,
  `r_bbm` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `nm_bbm` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_link` datetime NOT NULL,
  `jumlah_link` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `kd_trans` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_regu` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbllinkaja`
--

INSERT INTO `tbllinkaja` (`id`, `r_bbm`, `nm_bbm`, `tgl_link`, `jumlah_link`, `created_at`, `updated_at`, `kd_trans`, `r_regu`) VALUES
(2, 'tes', 'PERTAMAX', '2023-04-15 00:00:00', '10000.00', '2023-04-15 10:27:55', '2023-04-15 10:27:55', '20230415C1', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `tblnosel_detail`
--

CREATE TABLE `tblnosel_detail` (
  `id_nosel` bigint UNSIGNED NOT NULL,
  `r_bbm` int NOT NULL,
  `r_code_bbm` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nama_nosel` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `meter_awal` int NOT NULL,
  `meter_akhir` int NOT NULL,
  `tera` decimal(10,0) NOT NULL DEFAULT '0',
  `harga` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblnosel_detail`
--

INSERT INTO `tblnosel_detail` (`id_nosel`, `r_bbm`, `r_code_bbm`, `nama_nosel`, `meter_awal`, `meter_akhir`, `tera`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG0001', 'PX 1', 12876547, 12876547, '0', '14200.00', '2023-01-14 09:54:41', '2023-04-16 00:19:21'),
(2, 1, 'BRG0001', 'PX 2', 5100, 5120, '0', '14200.00', '2023-01-14 09:56:59', '2023-04-16 00:19:21'),
(3, 2, 'BRG0002', 'PL 1', 5750, 5750, '0', '11000.00', '2023-01-14 09:58:16', '2023-04-16 00:19:21'),
(4, 2, 'BRG0002', 'PL 2', 2950, 2950, '0', '11000.00', '2023-01-14 09:56:59', '2023-04-16 00:19:21'),
(5, 1, 'BRG0001', 'PX 3', 2000, 2000, '0', '14200.00', '2023-01-14 09:56:59', '2023-04-16 00:19:21'),
(6, 2, 'BRG0002', 'PL 3', 950, 950, '0', '11000.00', '2023-01-14 09:56:59', '2023-04-16 00:19:21'),
(7, 3, 'BRG0003', 'DX 1', 2900, 2900, '0', '17800.00', '2023-01-14 09:58:16', '2023-04-16 00:19:21'),
(8, 3, 'BRG0003', 'DX 2', 1950, 1950, '0', '17800.00', '2023-01-14 09:58:16', '2023-04-16 00:19:21'),
(9, 2, 'BRG0002', 'PL 4', 4200, 4200, '0', '11000.00', '2023-01-14 09:58:16', '2023-04-16 00:19:21'),
(10, 2, 'BRG0002', 'PL 5', 350, 350, '0', '11000.00', '2023-01-14 09:56:59', '2023-04-16 00:19:21'),
(11, 1, 'BRG0001', 'PX 4', 300, 300, '0', '14200.00', '2023-01-14 09:58:16', '2023-04-16 00:19:21'),
(12, 1, 'BRG0001', 'PX 5', 100, 100, '0', '14200.00', '2023-01-14 09:58:16', '2023-04-16 00:19:21'),
(13, 2, 'BRG0002', 'PL 6', 202, 202, '0', '11000.00', '2023-02-02 13:04:04', '2023-04-16 00:19:21'),
(14, 2, 'BRG0002', 'PL 7', 302, 302, '0', '11000.00', '2023-02-02 13:05:33', '2023-04-16 00:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `tblopnum`
--

CREATE TABLE `tblopnum` (
  `id` bigint UNSIGNED NOT NULL,
  `kdOpnum` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tglOpnum` datetime NOT NULL,
  `totalOpnum` decimal(13,2) NOT NULL,
  `userOpnum` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblopnum_detail`
--

CREATE TABLE `tblopnum_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `r_opnum` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_kdPersediaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmPersediaan` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `selisihOpnum` decimal(13,2) NOT NULL,
  `nilaiOpnum` decimal(13,2) NOT NULL,
  `keteranganOpnum` text CHARACTER SET latin1 COLLATE latin1_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpegawai`
--

CREATE TABLE `tblpegawai` (
  `id` bigint UNSIGNED NOT NULL,
  `kdPegawai` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmPegawai` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `almtPegawai` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `noTlp` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `reguPegawai` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'A',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
  `kdPelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmPelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `almtPelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `noHpPelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rolePelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `emailPelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `path` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `deposit` decimal(13,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpelanggan`
--

INSERT INTO `tblpelanggan` (`id`, `kdPelanggan`, `nmPelanggan`, `almtPelanggan`, `noHpPelanggan`, `rolePelanggan`, `emailPelanggan`, `path`, `deposit`, `created_at`, `updated_at`) VALUES
(30, 'PL02022030', 'SURFING', '-', '-', '-', '-', 'user-avtar.svg', '-2160000.00', '2022-08-04 21:42:35', '2022-08-04 21:42:35'),
(31, 'PL02022031', 'MIROR', '-', '-', '-', '-', 'user-avtar.svg', '0.00', '2022-08-04 21:42:50', '2022-08-04 21:42:50'),
(32, 'PL02022032', 'SMA 1 KUTA', '-', '-', '-', '-', 'user-avtar.svg', '0.00', '2022-08-18 04:12:11', '2022-08-18 04:12:11'),
(33, 'PL02022033', 'KUNJA', '-', '-', '-', '-', 'user-avtar.svg', '0.00', '2022-08-18 04:12:32', '2022-08-18 04:12:32'),
(34, 'PL02022034', 'CAFE DELMAR', '-', '-', '-', '-', '-', '0.00', '2023-01-29 13:05:53', '2023-01-29 13:05:53'),
(35, 'PL02022035', 'PETS CONTROL', '-', '-', '-', '-', '-', '0.00', '2023-01-29 13:06:57', '2023-01-29 13:06:57'),
(36, 'PL02022036', 'KAYU RAJA', '-', '-', '-', '-', '-', '-60000.00', '2023-01-29 13:09:28', '2023-01-29 13:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian`
--

CREATE TABLE `tblpembelian` (
  `idPembelian` bigint UNSIGNED NOT NULL,
  `noNota` varchar(9) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tglPembelian` datetime NOT NULL,
  `r_supplier` varchar(9) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subTotal` decimal(13,2) NOT NULL,
  `disc` decimal(13,2) NOT NULL,
  `discPercent` decimal(13,2) NOT NULL,
  `tax` decimal(13,2) NOT NULL,
  `pph` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `note` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `term` int NOT NULL,
  `jthTempo` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpembelian`
--

INSERT INTO `tblpembelian` (`idPembelian`, `noNota`, `tglPembelian`, `r_supplier`, `subTotal`, `disc`, `discPercent`, `tax`, `pph`, `total`, `note`, `term`, `jthTempo`, `created_at`, `updated_at`) VALUES
(10, 'PB2023-1', '2023-04-16 00:00:00', 'SP0001', '2016000.00', '0.00', '0.00', '11.00', '0.00', '2016000.00', NULL, 0, '2023-04-16 00:00:00', '2023-04-16 05:32:11', '2023-04-16 05:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblpembelian_detail`
--

CREATE TABLE `tblpembelian_detail` (
  `idPembelianDetail` bigint UNSIGNED NOT NULL,
  `r_noNota` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `kdBarang` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hrgBeli` decimal(13,2) NOT NULL,
  `qty` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpembelian_detail`
--

INSERT INTO `tblpembelian_detail` (`idPembelianDetail`, `r_noNota`, `kdBarang`, `nmBarang`, `hrgBeli`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(12, 'PB2023-1', 'BRG0007', 'ELPIGI GAS 3KG', '16000.00', '20.00', '320000.00', '2023-04-16 05:32:11', '2023-04-16 05:32:11'),
(13, 'PB2023-1', 'BRG0005', 'BRIGHT GAS 12KG', '212000.00', '8.00', '1696000.00', '2023-04-16 05:32:11', '2023-04-16 05:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualan`
--

CREATE TABLE `tblpenjualan` (
  `idPenjualan` bigint NOT NULL,
  `noPenjualan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tglPenjualan` datetime NOT NULL,
  `r_pelanggan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subTotalPenjualan` decimal(13,2) NOT NULL,
  `discPenjualan` decimal(13,2) NOT NULL,
  `discPercentP` int NOT NULL,
  `taxPenjualan` decimal(10,2) NOT NULL,
  `totalPenjualan` decimal(13,2) NOT NULL,
  `notePenjualan` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `termPenjualan` int DEFAULT NULL,
  `jthTempo` datetime DEFAULT NULL,
  `typeBayar` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `piutangPenjualan` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpenjualan`
--

INSERT INTO `tblpenjualan` (`idPenjualan`, `noPenjualan`, `tglPenjualan`, `r_pelanggan`, `subTotalPenjualan`, `discPenjualan`, `discPercentP`, `taxPenjualan`, `totalPenjualan`, `notePenjualan`, `termPenjualan`, `jthTempo`, `typeBayar`, `piutangPenjualan`, `created_at`, `updated_at`) VALUES
(8, 'INV2023003', '2023-04-16 00:00:00', 'PL02022030', '256000.00', '0.00', 0, '28160.00', '256000.00', NULL, 0, '2023-04-17 00:00:00', '0', '0.00', '2023-04-16 05:34:43', '2023-04-16 05:34:43'),
(9, 'INV2023004', '2023-04-18 00:00:00', 'PL02022031', '256000.00', '0.00', 0, '28160.00', '256000.00', NULL, 0, '2023-04-16 00:00:00', '0', '0.00', '2023-04-16 06:09:58', '2023-04-16 06:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualankupon`
--

CREATE TABLE `tblpenjualankupon` (
  `idPenjualanKupon` bigint NOT NULL,
  `noPenjualanKupon` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tglPenjualanKupon` datetime NOT NULL,
  `r_pelanggan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `totalPenjualanKupon` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpenjualankupon`
--

INSERT INTO `tblpenjualankupon` (`idPenjualanKupon`, `noPenjualanKupon`, `tglPenjualanKupon`, `r_pelanggan`, `totalPenjualanKupon`, `created_at`, `updated_at`) VALUES
(1, 'KP0420231', '2023-04-15 00:00:00', 'PL02022036', '800000.00', '2023-04-14 16:00:00', '2023-04-15 02:24:03'),
(2, 'KP0420231', '2023-04-15 00:00:00', 'PL02022030', '700000.00', '2023-04-14 16:00:00', '2023-04-15 02:24:03');

-- --------------------------------------------------------

--
-- Table structure for table `tblpenjualan_detail`
--

CREATE TABLE `tblpenjualan_detail` (
  `idDetailPenjualan` int NOT NULL,
  `r_noPenjualan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_trans` datetime NOT NULL,
  `r_kdBarang` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_nmBarang` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `kategori_jual` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hrgJual` decimal(13,2) NOT NULL,
  `qty` int NOT NULL,
  `satuanJual` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `totalHpp` decimal(13,2) NOT NULL,
  `totalJual` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpenjualan_detail`
--

INSERT INTO `tblpenjualan_detail` (`idDetailPenjualan`, `r_noPenjualan`, `tgl_trans`, `r_kdBarang`, `r_nmBarang`, `kategori_jual`, `hrgJual`, `qty`, `satuanJual`, `totalHpp`, `totalJual`, `created_at`, `updated_at`) VALUES
(13, 'INV2023003', '2023-04-16 00:00:00', 'BRG0007', 'ELPIGI GAS 3KG', 'KT-2021-3', '18000.00', 2, 'TABUNG', '32000.00', '36000.00', '2023-04-16 05:34:43', '2023-04-16 05:34:43'),
(14, 'INV2023003', '2023-04-16 00:00:00', 'BRG0005', 'BRIGHT GAS 12KG', 'KT-2021-3', '220000.00', 1, 'TABUNG', '212000.00', '220000.00', '2023-04-16 05:34:43', '2023-04-16 05:34:43'),
(15, 'INV2023004', '2023-04-18 00:00:00', 'BRG0007', 'ELPIGI GAS 3KG', 'KT-2021-3', '18000.00', 2, 'TABUNG', '32000.00', '36000.00', '2023-04-16 06:09:58', '2023-04-16 06:09:58'),
(16, 'INV2023004', '2023-04-18 00:00:00', 'BRG0005', 'BRIGHT GAS 12KG', 'KT-2021-3', '220000.00', 1, 'TABUNG', '212000.00', '220000.00', '2023-04-16 06:09:58', '2023-04-16 06:09:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan`
--

CREATE TABLE `tblpersediaan` (
  `idPersediaan` bigint UNSIGNED NOT NULL,
  `kdPersediaan` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmPersediaan` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `stokPersediaan` int NOT NULL,
  `satuanPersediaan` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `ktgPersediaan` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `lastPrice` decimal(10,2) DEFAULT NULL,
  `salePrice` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpersediaan`
--

INSERT INTO `tblpersediaan` (`idPersediaan`, `kdPersediaan`, `nmPersediaan`, `stokPersediaan`, `satuanPersediaan`, `ktgPersediaan`, `lastPrice`, `salePrice`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 7700, 'Liter', 'KT-2021-1', '11600.00', '14200.00', '2023-01-19 22:24:13', '2023-01-19 22:24:13'),
(2, 'BRG0002', 'PERTALITE', 7781, 'Liter', 'KT-2021-1', '9000.00', '11000.00', '2023-01-19 22:25:23', '2023-01-19 22:25:23'),
(3, 'BRG0003', 'DEX LITE', 0, 'Liter', 'KT-2021-1', '0.00', '17800.00', '2023-01-19 22:26:32', '2023-01-19 22:26:32'),
(4, 'BRG0004', 'TURBO', 0, 'TABUNG', 'KT-2021-5', '0.00', '0.00', '2023-01-20 12:14:45', '2023-01-20 12:14:45'),
(6, 'BRG0005', 'BRIGHT GAS 12KG', 6, 'TABUNG', 'KT-2021-3', '212000.00', '220000.00', NULL, NULL),
(7, 'BRG0006', 'BRIGHT GAS 5,5KG', 0, 'TABUNG', 'KT-2021-3', '110000.00', '130000.00', NULL, NULL),
(8, 'BRG0007', 'ELPIGI GAS 3KG', 16, 'TABUNG', 'KT-2021-3', '16000.00', '18000.00', NULL, NULL),
(9, 'BRG0008', 'OLI MESRAN 1.5L', 0, 'BOTOL', 'KT-2021-2', '0.00', '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblpersediaan_detail`
--

CREATE TABLE `tblpersediaan_detail` (
  `idPersediaanDetail` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblperubahan_hargabbm`
--

CREATE TABLE `tblperubahan_hargabbm` (
  `id_perubahan` bigint NOT NULL,
  `code_bbm` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `harga_pokok_lama` decimal(10,2) NOT NULL,
  `harga_pokok_baru` decimal(10,2) NOT NULL,
  `harga_lama` decimal(13,2) NOT NULL,
  `harga_baru` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblperubahan_hargabbm`
--

INSERT INTO `tblperubahan_hargabbm` (`id_perubahan`, `code_bbm`, `harga_pokok_lama`, `harga_pokok_baru`, `harga_lama`, `harga_baru`, `created_at`, `updated_at`) VALUES
(7, 'BRG0001', '12000.00', '11800.00', '14400.00', '14300.00', '2023-04-16 08:16:48', '2023-04-16 08:16:48'),
(9, 'BRG0001', '11600.00', '11600.00', '14200.00', '14200.00', '2023-04-16 08:20:30', '2023-04-16 08:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblpobbm`
--

CREATE TABLE `tblpobbm` (
  `idPo` bigint UNSIGNED NOT NULL,
  `no_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_po` datetime NOT NULL,
  `r_supplier` varchar(9) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `subTotal` decimal(13,2) NOT NULL,
  `disc` decimal(13,2) NOT NULL,
  `discPercent` decimal(13,2) NOT NULL,
  `tax` decimal(13,2) NOT NULL,
  `pph` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `note` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `term` int NOT NULL,
  `jthTempo` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpobbm`
--

INSERT INTO `tblpobbm` (`idPo`, `no_po`, `no_so`, `tgl_po`, `r_supplier`, `subTotal`, `disc`, `discPercent`, `tax`, `pph`, `total`, `note`, `term`, `jthTempo`, `created_at`, `updated_at`) VALUES
(1, 'PO0420231', '12129384389348', '2023-04-15 00:00:00', 'SP0001', '176320000.00', '0.00', '0.00', '11.00', '386000.00', '176706000.00', NULL, 0, '2023-04-15 00:00:00', '2023-04-15 02:21:35', '2023-04-15 02:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `tblpobbm_detail`
--

CREATE TABLE `tblpobbm_detail` (
  `idPoDetail` bigint UNSIGNED NOT NULL,
  `r_noPo` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `kdBarang` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmBarang` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hrgBeli` decimal(13,2) NOT NULL,
  `qty` decimal(13,2) NOT NULL,
  `qty_recieve` decimal(13,2) NOT NULL,
  `pph` decimal(13,2) NOT NULL,
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpobbm_detail`
--

INSERT INTO `tblpobbm_detail` (`idPoDetail`, `r_noPo`, `kdBarang`, `nmBarang`, `hrgBeli`, `qty`, `qty_recieve`, `pph`, `total`, `created_at`, `updated_at`) VALUES
(1, 'PO0420231', 'BRG0001', 'PERTAMAX', '12400.00', '8000.00', '8000.00', '210000.00', '99410000.00', '2023-04-15 02:21:35', '2023-04-15 02:21:35'),
(2, 'PO0420231', 'BRG0002', 'PERLITE', '9640.00', '8000.00', '8000.00', '176000.00', '77296000.00', '2023-04-15 02:21:35', '2023-04-15 02:21:35');

-- --------------------------------------------------------

--
-- Table structure for table `tblprofit`
--

CREATE TABLE `tblprofit` (
  `id_profit` bigint NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_profit` datetime NOT NULL,
  `kdBarang` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hpp_beli` decimal(13,2) NOT NULL,
  `qty_laku` decimal(13,2) NOT NULL,
  `total_laku` decimal(13,2) NOT NULL,
  `margin_laku` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblprofit`
--

INSERT INTO `tblprofit` (`id_profit`, `kd_trans`, `tgl_profit`, `kdBarang`, `hpp_beli`, `qty_laku`, `total_laku`, `margin_laku`, `created_at`, `updated_at`) VALUES
(19, '20230415A1', '2023-04-15 00:00:00', 'BRG0001', '3472000.00', '280.00', '4144000.00', '672000.00', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(20, '20230415A1', '2023-04-15 00:00:00', 'BRG0002', '2111160.00', '219.00', '2606100.00', '494940.00', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(21, '20230415A1', '2023-04-15 00:00:00', 'BRG0003', '0.00', '0.00', '0.00', '0.00', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(22, '20230416A1', '2023-04-16 00:00:00', 'BRG0001', '236000.00', '20.00', '286000.00', '50000.00', '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(23, '20230416A1', '2023-04-16 00:00:00', 'BRG0002', '0.00', '0.00', '0.00', '0.00', '2023-04-16 08:19:21', '2023-04-16 08:19:21'),
(24, '20230416A1', '2023-04-16 00:00:00', 'BRG0003', '0.00', '0.00', '0.00', '0.00', '2023-04-16 08:19:21', '2023-04-16 08:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `tblrates`
--

CREATE TABLE `tblrates` (
  `id` bigint UNSIGNED NOT NULL,
  `rateCode` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rateName` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `ratePrice` decimal(17,2) NOT NULL,
  `rateStart` datetime NOT NULL,
  `rateEnd` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
  `roomCode` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `roomName` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rRoomRate` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `roomDesc` mediumtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `roomPic` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblrooms`
--

INSERT INTO `tblrooms` (`id`, `roomCode`, `roomName`, `rRoomRate`, `roomDesc`, `roomPic`, `created_at`, `updated_at`) VALUES
(1, 'R001', 'Deluxe Room 2', '2', 'Rice terace view with balconi', 'pic1.jpg', NULL, '2022-09-02 15:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `tblstokbbm_hpp`
--

CREATE TABLE `tblstokbbm_hpp` (
  `id` bigint NOT NULL,
  `r_perubahan` int NOT NULL,
  `r_bbm` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `tgl_stok` datetime NOT NULL,
  `stok` decimal(10,2) NOT NULL,
  `h_pokok` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblstokbbm_hpp`
--

INSERT INTO `tblstokbbm_hpp` (`id`, `r_perubahan`, `r_bbm`, `tgl_stok`, `stok`, `h_pokok`, `created_at`, `updated_at`) VALUES
(4, 7, 'BRG0001', '2023-04-16 00:00:00', '7720.00', '12000.00', '2023-04-16 08:16:48', '2023-04-16 08:16:48'),
(6, 9, 'BRG0001', '2023-04-17 00:00:00', '7700.00', '11600.00', '2023-04-16 08:20:30', '2023-04-16 08:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblsupplier`
--

CREATE TABLE `tblsupplier` (
  `id` bigint UNSIGNED NOT NULL,
  `kdSupplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nmSupplier` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `almtSupplier` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tlpSupplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `picSupplier` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblsupplier`
--

INSERT INTO `tblsupplier` (`id`, `kdSupplier`, `nmSupplier`, `almtSupplier`, `tlpSupplier`, `picSupplier`, `created_at`, `updated_at`) VALUES
(1, 'SP0001', 'CASH', 'DENPASAR', '08187654', 'MAS', '2023-01-20 13:30:05', '2023-01-20 13:30:05'),
(2, 'SP0002', 'PT BBM NUSANTARA', 'KARANGASEM', '987654', 'OM', '2023-01-20 13:30:48', '2023-01-20 13:30:48'),
(3, 'SP0003', 'PT MIGAS', 'DENPASAR', '787686', 'ANDI', '2023-01-20 13:44:37', '2023-01-20 13:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbltera_detail`
--

CREATE TABLE `tbltera_detail` (
  `id` int NOT NULL,
  `no_tera` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `r_notrans` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_nosel` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_bbm` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `nama_bbm` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_tera` datetime NOT NULL,
  `jumlah_tera` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbltera_detail`
--

INSERT INTO `tbltera_detail` (`id`, `no_tera`, `r_notrans`, `r_nosel`, `r_bbm`, `nama_bbm`, `tgl_tera`, `jumlah_tera`, `created_at`, `updated_at`) VALUES
(43, 'TR000001', '20230415A1', '2', '1', 'BBM', '2023-04-15 00:00:00', '20.00', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(44, 'TR000002', '20230415A1', '3', '2', 'BBM', '2023-04-15 00:00:00', '30.00', '2023-04-15 22:10:55', '2023-04-15 22:10:55'),
(45, 'TR000003', '20230415A1', '4', '2', 'BBM', '2023-04-15 00:00:00', '1.00', '2023-04-15 22:10:55', '2023-04-15 22:10:55');

-- --------------------------------------------------------

--
-- Table structure for table `tblterimabbm`
--

CREATE TABLE `tblterimabbm` (
  `id` bigint NOT NULL,
  `kd_terima` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `no_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_terima` datetime NOT NULL,
  `kd_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblterimabbm`
--

INSERT INTO `tblterimabbm` (`id`, `kd_terima`, `no_po`, `no_so`, `tgl_terima`, `kd_supplier`, `created_at`, `updated_at`) VALUES
(1, 'BR0420231', 'PO0420231', '12129384389348', '2023-04-15 00:00:00', 'SP0001', '2023-04-15 10:21:56', '2023-04-15 10:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblterimabbm_detail`
--

CREATE TABLE `tblterimabbm_detail` (
  `id_detail` bigint NOT NULL,
  `r_kdterima` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_nopo` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_noso` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_terima` datetime NOT NULL,
  `kd_barang` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `qty_terima` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblterimabbm_detail`
--

INSERT INTO `tblterimabbm_detail` (`id_detail`, `r_kdterima`, `r_nopo`, `r_noso`, `tgl_terima`, `kd_barang`, `qty_terima`, `created_at`, `updated_at`) VALUES
(1, 'BR0420231', 'PO0420231', '12129384389348', '2023-04-15 00:00:00', 'BRG0001', '8000.00', '2023-04-15 00:00:00', '2023-04-15 10:21:56'),
(2, 'BR0420231', 'PO0420231', '12129384389348', '2023-04-15 00:00:00', 'BRG0002', '8000.00', '2023-04-15 00:00:00', '2023-04-15 10:21:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbltransaksi_nosel`
--

CREATE TABLE `tbltransaksi_nosel` (
  `id` bigint UNSIGNED NOT NULL,
  `r_bbm` int NOT NULL,
  `r_nosel` int NOT NULL,
  `kd_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_regu` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `last_meter` decimal(13,2) DEFAULT NULL,
  `awal_meter` decimal(13,2) NOT NULL,
  `tera` decimal(10,0) NOT NULL DEFAULT '0',
  `cost_ltr` decimal(13,2) DEFAULT NULL,
  `last_price` decimal(13,2) NOT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `total_hpp` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbltransaksi_nosel`
--

INSERT INTO `tbltransaksi_nosel` (`id`, `r_bbm`, `r_nosel`, `kd_trans`, `r_regu`, `tgl_transaksi`, `last_meter`, `awal_meter`, `tera`, `cost_ltr`, `last_price`, `total`, `total_hpp`, `created_at`, `updated_at`) VALUES
(85, 1, 1, '20230415A1', 'A', '2023-04-15 00:00:00', '12876547.00', '12876547.00', '0', '0.00', '14800.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(86, 1, 2, '20230415A1', 'A', '2023-04-15 00:00:00', '5100.00', '4900.00', '20', '180.00', '14800.00', '2664000.00', '2232000.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(87, 2, 3, '20230415A1', 'A', '2023-04-15 00:00:00', '5750.00', '5600.00', '30', '120.00', '11900.00', '1428000.00', '1156800.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(88, 2, 4, '20230415A1', 'A', '2023-04-15 00:00:00', '2950.00', '2900.00', '1', '49.00', '11900.00', '583100.00', '472360.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(89, 1, 5, '20230415A1', 'A', '2023-04-15 00:00:00', '2000.00', '1900.00', '0', '100.00', '14800.00', '1480000.00', '1240000.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(90, 2, 6, '20230415A1', 'A', '2023-04-15 00:00:00', '950.00', '900.00', '0', '50.00', '11900.00', '595000.00', '482000.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(91, 3, 7, '20230415A1', 'A', '2023-04-15 00:00:00', '2900.00', '2900.00', '0', '0.00', '17800.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(92, 3, 8, '20230415A1', 'A', '2023-04-15 00:00:00', '1950.00', '1950.00', '0', '0.00', '17800.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(93, 2, 9, '20230415A1', 'A', '2023-04-15 00:00:00', '4200.00', '4200.00', '0', '0.00', '11900.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(94, 2, 10, '20230415A1', 'A', '2023-04-15 00:00:00', '350.00', '350.00', '0', '0.00', '11900.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(95, 1, 11, '20230415A1', 'A', '2023-04-15 00:00:00', '300.00', '300.00', '0', '0.00', '14800.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(96, 1, 12, '20230415A1', 'A', '2023-04-15 00:00:00', '100.00', '100.00', '0', '0.00', '14800.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(97, 2, 13, '20230415A1', 'A', '2023-04-15 00:00:00', '202.00', '202.00', '0', '0.00', '11900.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(98, 2, 14, '20230415A1', 'A', '2023-04-15 00:00:00', '302.00', '302.00', '0', '0.00', '11900.00', '0.00', '0.00', '2023-04-15 14:10:55', '2023-04-15 14:10:55'),
(99, 1, 1, '20230416A1', 'A', '2023-04-16 00:00:00', '12876547.00', '12876547.00', '0', '0.00', '14300.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(100, 1, 2, '20230416A1', 'A', '2023-04-16 00:00:00', '5120.00', '5100.00', '0', '20.00', '14300.00', '286000.00', '236000.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(101, 2, 3, '20230416A1', 'A', '2023-04-16 00:00:00', '5750.00', '5750.00', '0', '0.00', '11000.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(102, 2, 4, '20230416A1', 'A', '2023-04-16 00:00:00', '2950.00', '2950.00', '0', '0.00', '11000.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(103, 1, 5, '20230416A1', 'A', '2023-04-16 00:00:00', '2000.00', '2000.00', '0', '0.00', '14300.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(104, 2, 6, '20230416A1', 'A', '2023-04-16 00:00:00', '950.00', '950.00', '0', '0.00', '11000.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(105, 3, 7, '20230416A1', 'A', '2023-04-16 00:00:00', '2900.00', '2900.00', '0', '0.00', '17800.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(106, 3, 8, '20230416A1', 'A', '2023-04-16 00:00:00', '1950.00', '1950.00', '0', '0.00', '17800.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(107, 2, 9, '20230416A1', 'A', '2023-04-16 00:00:00', '4200.00', '4200.00', '0', '0.00', '11000.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(108, 2, 10, '20230416A1', 'A', '2023-04-16 00:00:00', '350.00', '350.00', '0', '0.00', '11000.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(109, 1, 11, '20230416A1', 'A', '2023-04-16 00:00:00', '300.00', '300.00', '0', '0.00', '14300.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(110, 1, 12, '20230416A1', 'A', '2023-04-16 00:00:00', '100.00', '100.00', '0', '0.00', '14300.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(111, 2, 13, '20230416A1', 'A', '2023-04-16 00:00:00', '202.00', '202.00', '0', '0.00', '11000.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21'),
(112, 2, 14, '20230416A1', 'A', '2023-04-16 00:00:00', '302.00', '302.00', '0', '0.00', '11000.00', '0.00', '0.00', '2023-04-16 00:19:21', '2023-04-16 00:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2022-06-21 02:08:43', '$2y$10$1M/zZK917.HJrYuNrWF2yued.SVCPw89I5RVZqliW9ndVZAUSmuFu', NULL, '2022-06-21 02:08:43', '2022-06-21 02:08:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coa`
--
ALTER TABLE `coa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_ledger`
--
ALTER TABLE `general_ledger`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `notrans` (`notrans`),
  ADD KEY `jurnal` (`jurnal`),
  ADD KEY `us_create` (`us_create`),
  ADD KEY `us_update` (`us_update`),
  ADD KEY `pay_notrans` (`pay_notrans`),
  ADD KEY `return_notrans` (`return_notrans`),
  ADD KEY `date_create` (`date_create`),
  ADD KEY `r_anggaran` (`r_anggaran`);

--
-- Indexes for table `gl`
--
ALTER TABLE `gl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gl_detail`
--
ALTER TABLE `gl_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `r_general` (`rgl`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `gl_lr`
--
ALTER TABLE `gl_lr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level1`
--
ALTER TABLE `level1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `level2`
--
ALTER TABLE `level2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_id_2` (`acc_id`),
  ADD KEY `id` (`id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `level3`
--
ALTER TABLE `level3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `level4`
--
ALTER TABLE `level4`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `acc_id_2` (`acc_id`),
  ADD KEY `id` (`id`),
  ADD KEY `acc_id` (`acc_id`);

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
-- Indexes for table `tblheader_aplusan`
--
ALTER TABLE `tblheader_aplusan`
  ADD PRIMARY KEY (`id_aplusan`),
  ADD UNIQUE KEY `kd_trans` (`kd_trans`);

--
-- Indexes for table `tblinventaris`
--
ALTER TABLE `tblinventaris`
  ADD PRIMARY KEY (`id_inventaris`),
  ADD UNIQUE KEY `kode_inventaris_3` (`kode_inventaris`),
  ADD KEY `kode_inventaris` (`kode_inventaris`),
  ADD KEY `kode_inventaris_2` (`kode_inventaris`),
  ADD KEY `kode_pengadaan` (`kode_pengadaan`);

--
-- Indexes for table `tblinventaris_pengadaan`
--
ALTER TABLE `tblinventaris_pengadaan`
  ADD PRIMARY KEY (`id_pengadaan`),
  ADD UNIQUE KEY `pengadaan_sysno_UNIQUE` (`pengadaan_sysno`),
  ADD UNIQUE KEY `pengadaan_docno_UNIQUE` (`pengadaan_docno`),
  ADD KEY `pengadaan_sysno` (`pengadaan_sysno`);

--
-- Indexes for table `tblinventaris_pengadaan_detail`
--
ALTER TABLE `tblinventaris_pengadaan_detail`
  ADD PRIMARY KEY (`id_pengadaan_detail`),
  ADD KEY `rsysno_pengadaan` (`rsysno_pengadaan`),
  ADD KEY `rkode_inventaris` (`rkode_inventaris`);

--
-- Indexes for table `tblinventaris_penyusutan`
--
ALTER TABLE `tblinventaris_penyusutan`
  ADD PRIMARY KEY (`id_penyusutan`),
  ADD KEY `penyusutan_sysno` (`penyusutan_sysno`);

--
-- Indexes for table `tblinventaris_penyusutan_detail`
--
ALTER TABLE `tblinventaris_penyusutan_detail`
  ADD PRIMARY KEY (`id_penyusutan_detail`),
  ADD KEY `rsysno_penyusutan` (`rsysno_penyusutan`);

--
-- Indexes for table `tblkartu_stok`
--
ALTER TABLE `tblkartu_stok`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `tblpenjualankupon`
--
ALTER TABLE `tblpenjualankupon`
  ADD PRIMARY KEY (`idPenjualanKupon`);

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
-- Indexes for table `tblpobbm`
--
ALTER TABLE `tblpobbm`
  ADD PRIMARY KEY (`idPo`);

--
-- Indexes for table `tblpobbm_detail`
--
ALTER TABLE `tblpobbm_detail`
  ADD PRIMARY KEY (`idPoDetail`);

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
-- Indexes for table `tblstokbbm_hpp`
--
ALTER TABLE `tblstokbbm_hpp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltera_detail`
--
ALTER TABLE `tbltera_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblterimabbm`
--
ALTER TABLE `tblterimabbm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblterimabbm_detail`
--
ALTER TABLE `tblterimabbm_detail`
  ADD PRIMARY KEY (`id_detail`);

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
-- AUTO_INCREMENT for table `coa`
--
ALTER TABLE `coa`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `gl`
--
ALTER TABLE `gl`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gl_detail`
--
ALTER TABLE `gl_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT for table `gl_lr`
--
ALTER TABLE `gl_lr`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
  MODIFY `id_biaya` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblheader_aplusan`
--
ALTER TABLE `tblheader_aplusan`
  MODIFY `id_aplusan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblinventaris`
--
ALTER TABLE `tblinventaris`
  MODIFY `id_inventaris` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblinventaris_pengadaan`
--
ALTER TABLE `tblinventaris_pengadaan`
  MODIFY `id_pengadaan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblinventaris_pengadaan_detail`
--
ALTER TABLE `tblinventaris_pengadaan_detail`
  MODIFY `id_pengadaan_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblinventaris_penyusutan`
--
ALTER TABLE `tblinventaris_penyusutan`
  MODIFY `id_penyusutan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tblinventaris_penyusutan_detail`
--
ALTER TABLE `tblinventaris_penyusutan_detail`
  MODIFY `id_penyusutan_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tblkartu_stok`
--
ALTER TABLE `tblkartu_stok`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblkupon`
--
ALTER TABLE `tblkupon`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbllinkaja`
--
ALTER TABLE `tbllinkaja`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblnosel_detail`
--
ALTER TABLE `tblnosel_detail`
  MODIFY `id_nosel` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblopnum`
--
ALTER TABLE `tblopnum`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblopnum_detail`
--
ALTER TABLE `tblopnum_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `idPembelian` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblpembelian_detail`
--
ALTER TABLE `tblpembelian_detail`
  MODIFY `idPembelianDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  MODIFY `idPenjualan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblpenjualankupon`
--
ALTER TABLE `tblpenjualankupon`
  MODIFY `idPenjualanKupon` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpenjualan_detail`
--
ALTER TABLE `tblpenjualan_detail`
  MODIFY `idDetailPenjualan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id_perubahan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblpobbm`
--
ALTER TABLE `tblpobbm`
  MODIFY `idPo` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpobbm_detail`
--
ALTER TABLE `tblpobbm_detail`
  MODIFY `idPoDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblprofit`
--
ALTER TABLE `tblprofit`
  MODIFY `id_profit` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
-- AUTO_INCREMENT for table `tblstokbbm_hpp`
--
ALTER TABLE `tblstokbbm_hpp`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltera_detail`
--
ALTER TABLE `tbltera_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tblterimabbm`
--
ALTER TABLE `tblterimabbm`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblterimabbm_detail`
--
ALTER TABLE `tblterimabbm_detail`
  MODIFY `id_detail` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
