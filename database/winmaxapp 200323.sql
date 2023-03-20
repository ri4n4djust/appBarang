-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 07:27 AM
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
(12, '20000', 'KEWAJIBAN', '1', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23100', 'HUTANG PAJAK PPH FINAL', '3', 'D', '23100', 'HUTANG PAJAK PPH FINAL', 'D'),
(13, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21300', 'BIAYA YANG MASIH HARUS DIBAYAR', '3', 'D', '21300', 'BIAYA YANG MASIH HARUS DIBAYAR', 'D'),
(14, '30000', 'EKUITAS', '1', 'H', '32000', 'MODAL', '2', 'H', '32200', 'MODAL YANG DI SETOR', '3', 'D', '32200', 'MODAL YANG DI SETOR', 'D'),
(15, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12100', 'TANAH', '3', 'D', '12100', 'TANAH', 'D'),
(16, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12200', 'GEDUNG DAN BANGUNAN', '3', 'D', '12200', 'GEDUNG DAN BANGUNAN', 'D'),
(17, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12300', 'PERALATAN DAN MESIN', '3', 'D', '12300', 'PERALATAN DAN MESIN', 'D'),
(18, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12400', 'KENDARAAN', '3', 'D', '12400', 'KENDARAAN', 'D'),
(19, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21100', 'HUTANG USAHA', '3', 'D', '21100', 'HUTANG USAHA', 'D'),
(20, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21200', 'PENDAPATAN DITERIMA DIMUKA', '3', 'D', '21200', 'PENDAPATAN DITERIMA DIMUKA', 'D'),
(21, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21400', 'HUTANG LAINNYA', '3', 'D', '21400', 'HUTANG LAINNYA', 'D'),
(22, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21500', 'HUTANG BEBAN', '3', 'D', '21500', 'HUTANG BEBAN', 'D'),
(23, '20000', 'KEWAJIBAN', '1', 'H', '21000', 'KEWAJIBAN JANGKA PENDEK', '2', 'H', '21600', 'HUTANG LAINNYA', '3', 'D', '21600', 'HUTANG LAINNYA', 'D'),
(24, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41200', 'PENJUALAN PERTALITE', '3', 'D', '41200', 'PENJUALAN PERTALITE', 'D'),
(25, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41300', 'PENJUALAN DEXLITE', '3', 'D', '41300', 'PENJUALAN DEXLITE', 'D'),
(26, '40000', 'PENDAPATAN', '1', 'H', '42000', 'SEWA', '2', 'H', '42801', 'SEWA ATM', '3', 'D', '42801', 'SEWA ATM', 'D'),
(27, '40000', 'PENDAPATAN', '1', 'H', '42000', 'SEWA', '2', 'H', '42805', 'DISKON PEMBELIAN', '3', 'D', '42805', 'DISKON PEMBELIAN', 'D'),
(28, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41100', 'PENJUALAN PERTAMAX', '3', 'D', '41100', 'PENJUALAN PERTAMAX', 'D'),
(29, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41400', 'PENJUALAN GAS', '3', 'D', '41400', 'PENJUALAN GAS', 'D'),
(30, '40000', 'PENDAPATAN', '1', 'H', '41000', 'PENJUALAN', '2', 'H', '41500', 'PENJUALAN OLI', '3', 'D', '41500', 'PENJUALAN OLI', 'D'),
(31, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51100', 'HPP PERTAMAX', '3', 'D', '51100', 'HPP PERTAMAX', 'D'),
(32, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52100', 'TEKOR PERTAMAX', '3', 'D', '52100', 'TEKOR PERTAMAX', 'D'),
(33, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51200', 'HPP PERTALITE', '3', 'D', '51200', 'HPP PERTALITE', 'D'),
(34, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51300', 'HPP DEX LITE', '3', 'D', '51300', 'HPP DEX LITE', 'D'),
(35, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51400', 'HPP GAS', '3', 'D', '51400', 'HPP GAS', 'D'),
(36, '50000', 'BIAYA PENJUALAN', '1', 'H', '51000', 'HPP PENJUALAN', '2', 'H', '51500', 'HPP OLI', '3', 'D', '51500', 'HPP OLI', 'D'),
(37, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52200', 'TEKOR PERTALITE', '3', 'D', '52200', 'TEKOR PERTALITE', 'D'),
(38, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52300', 'TEKOR DEX LITE', '3', 'D', '52300', 'TEKOR DEX LITE', 'D'),
(39, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52400', 'TEKOR GAS', '3', 'D', '52400', 'TEKOR GAS', 'D'),
(40, '50000', 'BIAYA PENJUALAN', '1', 'H', '52000', 'TEKOR', '2', 'H', '52500', 'TEKOR OLI', '3', 'D', '52500', 'TEKOR OLI', 'D'),
(41, '30000', 'EKUITAS', '1', 'H', '32000', 'MODAL', '2', 'H', '32300', 'LABA DI TAHAN', '3', 'D', '32300', 'LABA DI TAHAN', 'D'),
(42, '20000', 'KEWAJIBAN', '1', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23200', 'HUTANG PPN', '3', 'H', '23210', 'PPN MASUKAN', 'D'),
(43, '20000', 'KEWAJIBAN', '1', 'H', '23000', 'HUTANG PAJAK', '2', 'H', '23200', 'HUTANG PPN', '3', 'H', '23220', 'PPN KELUARAN', 'D'),
(44, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62203', 'BIAYA MATERAI', 'D'),
(45, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62201', 'BIAYA BANTEN', 'D'),
(46, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62204', 'BIAYA LAIN-LAIN', 'D'),
(47, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11601', 'PERSEDIAAN PERTAMAX', 'D'),
(48, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11602', 'PERSEDIAAN PERTALITE', 'D'),
(49, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11603', 'PERSEDIAAN DEX LITE', 'D'),
(50, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12500', 'AKUMULASI PENYUSUTAN', '3', 'H', '12502', 'AKP. BANGUNAN DAN GEDUNG', 'D'),
(51, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12500', 'AKUMULASI PENYUSUTAN', '3', 'H', '12501', 'AKP. PERALATAN DAN MESIN', 'D'),
(52, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61200', 'BELANJA BARANG DAN JASA', '3', 'H', '61201', 'BELANJA PAKAIAN KARYAWAN', 'D'),
(53, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61200', 'BELANJA BARANG DAN JASA', '3', 'H', '61202', 'BELANJA ASURANSI', 'D'),
(54, '10000', 'HARTA', '1', 'H', '12000', 'ASET TETAP', '2', 'H', '12500', 'AKUMULASI PENYUSUTAN', '3', 'H', '12503', 'AKP. KENDARAAN', 'D'),
(55, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11604', 'PERSEDIAAN GAS', 'D'),
(56, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11600', 'PERSEDIAAN', '3', 'H', '11605', 'PERSEDIAAN OLI', 'D'),
(57, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61200', 'BELANJA BARANG DAN JASA', '3', 'H', '61203', 'BELANJA PEMELIHARAAN', 'D'),
(58, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11100', 'KAS DAN SETARA KAS', '3', 'H', '11110', 'KAS', 'D'),
(59, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11200', 'KAS BANK', '3', 'H', '11210', 'BANK BNI', 'D'),
(60, '60000', 'PENGELUARAN', '1', 'H', '62000', 'BIAYA LAINNYA', '2', 'H', '62200', 'BIAYA LAIN-LAIN', '3', 'H', '62202', 'BIAYA KONSUMSI', 'D'),
(61, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61100', 'BELANJA BEDAN', '3', 'H', '61101', 'BEBAN GAJI', 'D'),
(62, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61100', 'BELANJA BEDAN', '3', 'H', '61102', 'BEBAN LISTRIK DAN AIR', 'D'),
(63, '60000', 'PENGELUARAN', '1', 'H', '61000', 'BELANJA OPERASIONAL', '2', 'H', '61100', 'BELANJA BEDAN', '3', 'H', '61103', 'BEBAN PENYUSUTAN ASET', 'D'),
(64, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11400', 'PERSEDIAAN LAINNYA', '3', 'H', '11401', 'PERSEDIAAN DI BAYAR DIMUKA', 'D'),
(65, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11400', 'PERSEDIAAN LAINNYA', '3', 'H', '11402', 'PERSEDIAAN ATK', 'D'),
(66, '10000', 'HARTA', '1', 'H', '11000', 'ASET LANCAR', '2', 'H', '11400', 'PERSEDIAAN LAINNYA', '3', 'H', '11403', 'PERSEDIAAN MATERAI', 'D');

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
(1, 'GJ000001', 'GJ2303000001', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '95000000.00', 'modal', 'GJ', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 09:21:03', '2023-03-20 09:21:03'),
(2, 'GJ000002', 'KP0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '150000.00', 'Penjualan-Kupon', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 09:22:20', '2023-03-20 09:22:20'),
(3, 'GJ000003', 'KP0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '250000.00', 'Penjualan-Kupon', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 09:22:20', '2023-03-20 09:22:20'),
(13, 'GJ000004', 'PO0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '24000000.00', 'PO-BBM', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 10:23:02', '2023-03-20 10:23:02'),
(14, 'GJ000005', 'PO0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '20600000.00', 'PO-BBM', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 10:23:02', '2023-03-20 10:23:02'),
(15, 'GJ000006', 'PO0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '28400000.00', 'PO-BBM', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 10:23:02', '2023-03-20 10:23:02'),
(16, 'GJ000007', 'BR0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '12000000.00', 'BBM-Datang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 10:30:45', '2023-03-20 10:30:45'),
(17, 'GJ000008', 'BR0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '10300000.00', 'BBM-Datang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 10:30:45', '2023-03-20 10:30:45'),
(18, 'GJ000009', 'BR0320231', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '14200000.00', 'BBM-Datang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 10:30:45', '2023-03-20 10:30:45'),
(39, 'GJ000010', 'PB2023-2', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '54000.00', 'Pembelian-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 11:56:07', '2023-03-20 11:56:07'),
(40, 'GJ000011', 'PB2023-2', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '147000.00', 'Pembelian-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 11:56:07', '2023-03-20 11:56:07'),
(45, 'GJ000012', 'INV20230011', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '22000.00', 'Penjualan-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:11:54', '2023-03-20 12:11:54'),
(46, 'GJ000013', 'INV20230011', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '54000.00', 'Penjualan-Barang', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:11:54', '2023-03-20 12:11:54'),
(47, 'GJ000014', '20230320A43', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1350000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:12:53', '2023-03-20 12:12:53'),
(48, 'GJ000015', '20230320A43', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1300000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:12:53', '2023-03-20 12:12:53'),
(49, 'GJ000016', '20230320A43', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '178000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:12:53', '2023-03-20 12:12:53'),
(51, 'GJ000017', 'GJ2303000001', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '5000.00', 'canang', 'GJ', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:22:56', '2023-03-20 12:22:56'),
(52, 'GJ000018', 'GJ2303000001', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '10000.00', 'kon', 'GJ', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:25:17', '2023-03-20 12:25:17'),
(53, 'GJ000019', 'GJ2303000001', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '150000.00', 'kon', 'GJ', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:26:31', '2023-03-20 12:26:31'),
(54, 'GJ000020', '20230320A57', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1350000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:28:06', '2023-03-20 12:28:06'),
(55, 'GJ000021', '20230320A57', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1300000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:28:06', '2023-03-20 12:28:06'),
(56, 'GJ000022', '20230320A57', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '178000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 12:28:06', '2023-03-20 12:28:06'),
(57, 'GJ000023', '20230320C1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '30000.00', 'Aplusan-kupon', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 14:49:29', '2023-03-20 14:49:29'),
(58, 'GJ000024', '20230320C1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1350000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 14:49:29', '2023-03-20 14:49:29'),
(59, 'GJ000025', '20230320C1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1300000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 14:49:29', '2023-03-20 14:49:29'),
(60, 'GJ000026', '20230320C1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '0.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 14:49:29', '2023-03-20 14:49:29'),
(61, 'GJ000027', '20230320B1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '25000.00', 'Aplusan-kupon', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 15:05:35', '2023-03-20 15:05:35'),
(62, 'GJ000028', '20230320B1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '25000.00', 'Aplusan-kupon', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 15:05:35', '2023-03-20 15:05:35'),
(63, 'GJ000029', '20230320B1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '2700000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 15:05:35', '2023-03-20 15:05:35'),
(64, 'GJ000030', '20230320B1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1300000.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 15:05:35', '2023-03-20 15:05:35'),
(65, 'GJ000031', '20230320B1', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '0.00', 'Aplusan', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 15:05:35', '2023-03-20 15:05:35'),
(69, 'GJ000032', 'BY2303000001', '0', 99999, 1, 'general_ledger', '2023-03-20 00:00:00', '1000000.00', 'service', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'user', 'uerr', '2023-03-20 15:23:40', '2023-03-20 15:23:40');

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
(1, '11110', '33345000.00'),
(2, '32200', '-95000000.00'),
(3, '21200', '-320000.00'),
(4, '11401', '36500000.00'),
(5, '11601', '6000000.00'),
(6, '11602', '6180000.00'),
(7, '11603', '13916000.00'),
(8, '11604', '32000.00'),
(9, '11605', '93000.00'),
(10, '41400', '22000.00'),
(11, '51400', '18000.00'),
(12, '32300', '-746000.00'),
(13, '41500', '54000.00'),
(14, '51500', '49000.00'),
(15, '51100', '6000000.00'),
(16, '41100', '6670000.00'),
(17, '51200', '4120000.00'),
(18, '41200', '5200000.00'),
(19, '51300', '284000.00'),
(20, '41300', '356000.00'),
(21, '62201', '5000.00'),
(22, '62202', '10000.00'),
(23, '61101', '150000.00'),
(24, '62204', '1000000.00'),
(25, '38100', '23938000.00'),
(26, '38999', NULL);

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
(1, 'GJ000001', 11110, '95000000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 08:21:03', '2023-03-20 08:21:03'),
(2, 'GJ000001', 32200, '0.00', '95000000.00', 'Jurnal-Umum', 0, '2023-03-20 08:21:03', '2023-03-20 08:21:03'),
(3, 'GJ000002', 11110, '150000.00', '0.00', 'Penjualan-Kupon', 0, '2023-03-20 08:22:20', '2023-03-20 08:22:20'),
(4, 'GJ000002', 21200, '0.00', '150000.00', 'Penjualan-Kupon', 0, '2023-03-20 08:22:20', '2023-03-20 08:22:20'),
(5, 'GJ000003', 11110, '250000.00', '0.00', 'Penjualan-Kupon', 0, '2023-03-20 08:22:20', '2023-03-20 08:22:20'),
(6, 'GJ000003', 21200, '0.00', '250000.00', 'Penjualan-Kupon', 0, '2023-03-20 08:22:20', '2023-03-20 08:22:20'),
(44, 'GJ000004', 11401, '24000000.00', '0.00', 'PO-BBM', 0, '2023-03-20 09:23:02', '2023-03-20 09:23:02'),
(45, 'GJ000004', 11110, '0.00', '24000000.00', 'PO-BBM', 0, '2023-03-20 09:23:02', '2023-03-20 09:23:02'),
(46, 'GJ000005', 11401, '20600000.00', '0.00', 'PO-BBM', 0, '2023-03-20 09:23:02', '2023-03-20 09:23:02'),
(47, 'GJ000005', 11110, '0.00', '20600000.00', 'PO-BBM', 0, '2023-03-20 09:23:02', '2023-03-20 09:23:02'),
(48, 'GJ000006', 11401, '28400000.00', '0.00', 'PO-BBM', 0, '2023-03-20 09:23:02', '2023-03-20 09:23:02'),
(49, 'GJ000006', 11110, '0.00', '28400000.00', 'PO-BBM', 0, '2023-03-20 09:23:02', '2023-03-20 09:23:02'),
(50, 'GJ000007', 11601, '12000000.00', '0.00', 'BBM-Datang', 0, '2023-03-20 09:30:45', '2023-03-20 09:30:45'),
(51, 'GJ000007', 11401, '0.00', '12000000.00', 'BBM-Datang', 0, '2023-03-20 09:30:45', '2023-03-20 09:30:45'),
(52, 'GJ000008', 11602, '10300000.00', '0.00', 'BBM-Datang', 0, '2023-03-20 09:30:45', '2023-03-20 09:30:45'),
(53, 'GJ000008', 11401, '0.00', '10300000.00', 'BBM-Datang', 0, '2023-03-20 09:30:45', '2023-03-20 09:30:45'),
(54, 'GJ000009', 11603, '14200000.00', '0.00', 'BBM-Datang', 0, '2023-03-20 09:30:45', '2023-03-20 09:30:45'),
(55, 'GJ000009', 11401, '0.00', '14200000.00', 'BBM-Datang', 0, '2023-03-20 09:30:45', '2023-03-20 09:30:45'),
(150, 'GJ000010', 11604, '54000.00', '0.00', 'Pembelian-Barang', 0, '2023-03-20 10:56:07', '2023-03-20 10:56:07'),
(151, 'GJ000010', 11110, '0.00', '54000.00', 'Pembelian-Barang', 0, '2023-03-20 10:56:07', '2023-03-20 10:56:07'),
(152, 'GJ000011', 11605, '147000.00', '0.00', 'Pembelian-Barang', 0, '2023-03-20 10:56:07', '2023-03-20 10:56:07'),
(153, 'GJ000011', 11110, '0.00', '147000.00', 'Pembelian-Barang', 0, '2023-03-20 10:56:07', '2023-03-20 10:56:07'),
(174, 'GJ000012', 41400, '22000.00', '0.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(175, 'GJ000012', 11110, '26000.00', '0.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(176, 'GJ000012', 11604, '0.00', '22000.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(177, 'GJ000012', 51400, '18000.00', '0.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(178, 'GJ000012', 32300, '0.00', '4000.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(179, 'GJ000013', 41500, '54000.00', '0.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(180, 'GJ000013', 11110, '59000.00', '0.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(181, 'GJ000013', 11605, '0.00', '54000.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(182, 'GJ000013', 51500, '49000.00', '0.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(183, 'GJ000013', 32300, '0.00', '5000.00', 'Penjualan-Barang', 0, '2023-03-20 11:11:54', '2023-03-20 11:11:54'),
(184, 'GJ000014', 11110, '1350000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(185, 'GJ000014', 51100, '1200000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(186, 'GJ000014', 41100, '1350000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(187, 'GJ000014', 11601, '0.00', '1200000.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(188, 'GJ000014', 32300, '0.00', '150000.00', 'Aplusan-Laba', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(189, 'GJ000015', 11110, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(190, 'GJ000015', 51200, '1030000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(191, 'GJ000015', 41200, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(192, 'GJ000015', 11602, '0.00', '1030000.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(193, 'GJ000015', 32300, '0.00', '270000.00', 'Aplusan-Laba', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(194, 'GJ000016', 11110, '178000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(195, 'GJ000016', 51300, '142000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(196, 'GJ000016', 41300, '178000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(197, 'GJ000016', 11603, '0.00', '142000.00', 'Aplusan', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(198, 'GJ000016', 32300, '0.00', '36000.00', 'Aplusan-Laba', 0, '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(201, 'GJ000017', 62201, '5000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 11:22:56', '2023-03-20 11:22:56'),
(202, 'GJ000017', 11110, '0.00', '5000.00', 'Jurnal-Umum', 0, '2023-03-20 11:22:56', '2023-03-20 12:23:45'),
(203, 'GJ000017', 32300, '5000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 11:22:56', '2023-03-20 11:22:56'),
(204, 'GJ000018', 62202, '10000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 11:25:17', '2023-03-20 11:25:17'),
(205, 'GJ000018', 11110, '0.00', '10000.00', 'Jurnal-Umum', 0, '2023-03-20 11:25:17', '2023-03-20 11:25:17'),
(206, 'GJ000018', 32300, '10000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 11:25:17', '2023-03-20 11:25:17'),
(207, 'GJ000019', 61101, '150000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 11:26:31', '2023-03-20 11:26:31'),
(208, 'GJ000019', 11110, '0.00', '150000.00', 'Jurnal-Umum', 0, '2023-03-20 11:26:31', '2023-03-20 11:26:31'),
(209, 'GJ000019', 32300, '150000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 11:26:31', '2023-03-20 11:26:31'),
(210, 'GJ000020', 11110, '1350000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(211, 'GJ000020', 51100, '1200000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(212, 'GJ000020', 41100, '1350000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(213, 'GJ000020', 11601, '0.00', '1200000.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(214, 'GJ000020', 32300, '0.00', '150000.00', 'Aplusan-Laba', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(215, 'GJ000021', 11110, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(216, 'GJ000021', 51200, '1030000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(217, 'GJ000021', 41200, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(218, 'GJ000021', 11602, '0.00', '1030000.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(219, 'GJ000021', 32300, '0.00', '270000.00', 'Aplusan-Laba', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(220, 'GJ000022', 11110, '178000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(221, 'GJ000022', 51300, '142000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(222, 'GJ000022', 41300, '178000.00', '0.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(223, 'GJ000022', 11603, '0.00', '142000.00', 'Aplusan', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(224, 'GJ000022', 32300, '0.00', '36000.00', 'Aplusan-Laba', 0, '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(225, 'GJ000023', 21200, '30000.00', '0.00', 'Aplusan-kupon', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(226, 'GJ000023', 41100, '0.00', '30000.00', 'Aplusan-kupon', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(227, 'GJ000023', 11110, '0.00', '30000.00', 'Aplusan-kupon', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(228, 'GJ000024', 11110, '1350000.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(229, 'GJ000024', 51100, '1200000.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(230, 'GJ000024', 41100, '1350000.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(231, 'GJ000024', 11601, '0.00', '1200000.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(232, 'GJ000024', 32300, '0.00', '150000.00', 'Aplusan-Laba', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(233, 'GJ000025', 11110, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(234, 'GJ000025', 51200, '1030000.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(235, 'GJ000025', 41200, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(236, 'GJ000025', 11602, '0.00', '1030000.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(237, 'GJ000025', 32300, '0.00', '270000.00', 'Aplusan-Laba', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(238, 'GJ000026', 11110, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(239, 'GJ000026', 51300, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(240, 'GJ000026', 41300, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(241, 'GJ000026', 11603, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(242, 'GJ000026', 32300, '0.00', '0.00', 'Aplusan-Laba', 0, '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(243, 'GJ000027', 21200, '25000.00', '0.00', 'Aplusan-kupon', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(244, 'GJ000027', 41100, '0.00', '25000.00', 'Aplusan-kupon', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(245, 'GJ000027', 11110, '0.00', '25000.00', 'Aplusan-kupon', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(246, 'GJ000028', 21200, '25000.00', '0.00', 'Aplusan-kupon', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(247, 'GJ000028', 41100, '0.00', '25000.00', 'Aplusan-kupon', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(248, 'GJ000028', 11110, '0.00', '25000.00', 'Aplusan-kupon', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(249, 'GJ000029', 11110, '2700000.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(250, 'GJ000029', 51100, '2400000.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(251, 'GJ000029', 41100, '2700000.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(252, 'GJ000029', 11601, '0.00', '2400000.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(253, 'GJ000029', 32300, '0.00', '300000.00', 'Aplusan-Laba', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(254, 'GJ000030', 11110, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(255, 'GJ000030', 51200, '1030000.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(256, 'GJ000030', 41200, '1300000.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(257, 'GJ000030', 11602, '0.00', '1030000.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(258, 'GJ000030', 32300, '0.00', '270000.00', 'Aplusan-Laba', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(259, 'GJ000031', 11110, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(260, 'GJ000031', 51300, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(261, 'GJ000031', 41300, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(262, 'GJ000031', 11603, '0.00', '0.00', 'Aplusan', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(263, 'GJ000031', 32300, '0.00', '0.00', 'Aplusan-Laba', 0, '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(266, 'GJ000032', 62204, '1000000.00', '0.00', 'Trans-biaya', 0, '2023-03-20 14:23:40', '2023-03-20 14:23:40'),
(267, 'GJ000032', 11110, '0.00', '1000000.00', 'Trans-biaya', 0, '2023-03-20 14:23:40', '2023-03-20 14:23:40'),
(268, 'GJ000032', 32300, '1000000.00', '0.00', 'Jurnal-Umum', 0, '2023-03-20 14:23:40', '2023-03-20 14:23:40');

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
(1, '11110', '33345000.00'),
(2, '32200', '-95000000.00'),
(3, '21200', '-320000.00'),
(4, '11401', '36500000.00'),
(5, '11601', '6000000.00'),
(6, '11602', '6180000.00'),
(7, '11603', '13916000.00'),
(8, '11604', '32000.00'),
(9, '11605', '93000.00'),
(10, '41400', '22000.00'),
(11, '51400', '18000.00'),
(12, '32300', '-746000.00'),
(13, '41500', '54000.00'),
(14, '51500', '49000.00'),
(15, '51100', '6000000.00'),
(16, '41100', '6670000.00'),
(17, '51200', '4120000.00'),
(18, '41200', '5200000.00'),
(19, '51300', '284000.00'),
(20, '41300', '356000.00'),
(21, '62201', '5000.00'),
(22, '62202', '10000.00'),
(23, '61101', '150000.00'),
(24, '62204', '1000000.00'),
(25, '38100', '0.00'),
(26, '38999', '0.00');

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
('2022080118', 23100, 3, 23000, 'HUTANG PAJAK PPH FINAL', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080119', 23200, 3, 23000, 'HUTANG PPN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('202208012', 21300, 3, 21000, 'BIAYA YANG MASIH HARUS DIBAYAR', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080120', 32200, 3, 32000, 'MODAL YANG DI SETOR', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51'),
('2022080131', 11600, 3, 11000, 'PERSEDIAAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:52'),
('2022080132', 12100, 3, 12000, 'TANAH', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080133', 12200, 3, 12000, 'GEDUNG DAN BANGUNAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080134', 12300, 3, 12000, 'PERALATAN DAN MESIN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080135', 12400, 3, 12000, 'KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080136', 12500, 3, 12000, 'AKUMULASI PENYUSUTAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:52'),
('2022080138', 21100, 3, 21000, 'HUTANG USAHA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080139', 21200, 3, 21000, 'PENDAPATAN DITERIMA DIMUKA', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:52'),
('2022080140', 21400, 3, 21000, 'HUTANG LAINNYA', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:52'),
('2022080141', 21500, 3, 21000, 'HUTANG BEBAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080142', 21600, 3, 21000, 'HUTANG LAINNYA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
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
('20230319123851', 11400, 3, 11000, 'PERSEDIAAN LAINNYA', 'H', '0.00', 'JK', '1', '0', '1', '2023-03-19 20:38:51');

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
('202208011', 21300, 3, 21300, 'BIAYA YANG MASIH HARUS DIBAYAR', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:22'),
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
('2022080150', 21400, 3, 21400, 'HUTANG LAINNYA', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:23'),
('2022080151', 21500, 3, 21500, 'HUTANG BEBAN', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080152', 21600, 3, 21600, 'HUTANG LAINNYA', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080153', 41200, 3, 41200, 'PENJUALAN PERTALITE', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:23'),
('2022080154', 41300, 3, 41300, 'PENJUALAN DEXLITE', 'B', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:52:23'),
('2022080158', 42801, 3, 42801, 'SEWA ATM', 'B', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:52:23'),
('2022080162', 42805, 3, 42805, 'DISKON PEMBELIAN', 'B', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080163', 61201, 4, 61200, 'BELANJA PAKAIAN KARYAWAN', 'D', '0.00', 'JK', 'c', '0', '1', '2023-03-14 06:48:12'),
('2022080164', 61202, 4, 61200, 'BELANJA ASURANSI', 'D', '0.00', 'JK', 'c', '0', '1', '2023-03-18 08:52:25'),
('2022080183', 61301, 4, 61300, 'BELANJA ALAT LISTRIK DAN ELEKTRONIK', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('20221208032333', 12503, 4, 12500, 'AKP. KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-08 11:23:34'),
('20221212034801', 11604, 4, 11600, 'PERSEDIAAN GAS', 'D', '0.00', 'JK', 'd', '0', '1', '2022-12-12 11:48:02'),
('20221212034848', 11605, 4, 11600, 'PERSEDIAAN OLI', 'D', '0.00', 'JK', 'c', '0', '1', '2022-12-12 11:48:49'),
('20221212060252', 61203, 4, 61200, 'BELANJA PEMELIHARAAN', 'D', '0.00', 'JK', 'c', '0', '1', '2023-03-18 12:08:42'),
('20221212062447', 61304, 4, 61300, 'BELANJA PENGISIAN TABUNG GAS', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:24:48'),
('20221212063053', 61308, 4, 61300, 'BELANJA PERALATAN PERLENGKAPAN PERIJINAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:30:54'),
('20221213050949', 61309, 4, 61300, 'BELANJA PERAWATAN KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-13 13:09:51'),
('20230201021743', 11110, 4, 11100, 'KAS', 'D', '0.00', 'JK', 'c', '0', '1', '2023-02-01 09:17:43'),
('20230201022303', 11210, 4, 11200, 'BANK BNI', 'D', '0.00', 'JK', 'c', '0', '1', '2023-02-01 09:23:03'),
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
('20230319124245', 11403, 4, 11400, 'PERSEDIAAN MATERAI', 'D', '0.00', 'JK', '2', '0', '1', '2023-03-19 20:42:45');

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
(48, 'App\\Models\\User', 1, 'ApiToken', 'e215c3c67a9beccd0b1ab0fe6ea25a5eb8675d0590f46669193fe41885c4e664', '[\"*\"]', NULL, '2023-01-28 13:39:25', '2023-01-28 13:39:25');

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
(2, 'BRG0004', 'GAS ELPIGI 3KG', 18000, 22000, 'KT-2021-3', 'TABUNG', 'ELPIGI', '-1', NULL, '5', '200', '1', 'gas', '41400', '51400', '11604', '52400', NULL, NULL),
(3, 'BRG0005', 'GAS ELPIGI 12KG', 120000, 150000, 'KT-2021-3', 'TABUNG', 'ELPIGI', '4', NULL, '5', '200', '1', 'Tabung gas elipgi', '41400', '51400', '11604', '52400', '2023-01-23 00:04:44', '2023-01-23 00:04:44'),
(4, 'BRG0006', 'OLI', 49000, 54000, 'KT-2021-2', 'BOTOL', 'Mesran', '-4', NULL, '2', '10', '0', 'des', '41500', '51500', '11605', '52500', '2023-02-03 13:26:02', '2023-02-03 13:26:02'),
(5, 'BRG0007', 'OLI MESRAN 5L', 150000, 220000, 'KT-2021-2', 'BOTOL', 'MESRAN', '2', NULL, '5', '100', '0', 'des', '41500', '51500', '11605', '52500', '2023-02-04 02:58:44', '2023-02-04 02:58:44'),
(6, 'BRG0008', 'OLI MESRAN 1.5L', 85000, 110000, 'KT-2021-2', 'BOTOL', 'MESRAN', '0', NULL, '5', '100', '0', 'des', '41500', '51500', '11605', '52500', '2023-02-04 02:59:07', '2023-02-04 02:59:07');

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
  `stokBbm` decimal(13,2) NOT NULL,
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

INSERT INTO `tblbbm` (`id`, `code_bbm`, `nama_bbm`, `last_meter`, `last_price`, `sale_price`, `stokBbm`, `logo_bbm`, `accid`, `accid_hpp`, `accid_persediaan`, `accid_biaya`, `created_at`, `updated_at`) VALUES
(1, 'BRG0001', 'PERTAMAX', 12000000, '12000.00', '13500.00', '10985.00', 'pertamax.png', '41100', '51100', '11601', '52100', '2023-01-12 12:56:36', '2023-03-17 04:36:07'),
(2, 'BRG0002', 'PERLITE', 12000000, '10300.00', '13000.00', '7187.00', 'pertalite.png', '41200', '51200', '11602', '52200', '2023-01-12 12:56:36', '2023-03-17 04:20:56'),
(3, 'BRG0003', 'DEX LITE', 234535, '14200.00', '17800.00', '4220.00', 'dexlite.png', '41300', '51300', '11603', '52300', '2023-01-14 08:29:46', '2023-02-02 12:11:55');

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

--
-- Dumping data for table `tblbiaya`
--

INSERT INTO `tblbiaya` (`id_biaya`, `kd_trans`, `tglBiaya`, `keterangan_biaya`, `jumlah`, `accid`, `created_at`, `updated_at`, `r_regu`) VALUES
(1, 'BY2303000001', '2023-03-20 00:00:00', 'service', '1000000.00', '62204', '2023-03-20 00:00:00', '2023-03-20 14:19:33', 'Z'),
(4, 'BY2303000001', '2023-03-20 00:00:00', 'service', '1000000.00', '62204', '2023-03-20 00:00:00', '2023-03-20 14:23:40', 'Z');

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
(1, '20230320A1', '2023-03-20 00:00:00', 'A', '1325000.00', '60000.00', '0.00', '0.00', '1265000.00', '2023-03-20 08:23:36', '2023-03-20 08:23:36'),
(2, '20230320A15', '2023-03-20 00:00:00', 'A', '1730000.00', '60000.00', '0.00', '0.00', '1670000.00', '2023-03-20 08:28:57', '2023-03-20 08:28:57'),
(3, '20230320A29', '2023-03-20 00:00:00', 'A', '1570000.00', '0.00', '0.00', '0.00', '1570000.00', '2023-03-20 09:35:35', '2023-03-20 09:35:35'),
(4, '20230320A43', '2023-03-20 00:00:00', 'A', '2828000.00', '0.00', '0.00', '0.00', '2828000.00', '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(5, '20230320A57', '2023-03-20 00:00:00', 'A', '2828000.00', '0.00', '0.00', '0.00', '2828000.00', '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(6, '20230320C1', '2023-03-20 00:00:00', 'C', '2650000.00', '60000.00', '0.00', '0.00', '2590000.00', '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(7, '20230320B1', '2023-03-20 00:00:00', 'B', '4000000.00', '100000.00', '0.00', '0.00', '3900000.00', '2023-03-20 14:05:35', '2023-03-20 14:05:35');

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

--
-- Dumping data for table `tblkupon`
--

INSERT INTO `tblkupon` (`id`, `kd_trans`, `r_regu`, `tgl_trans`, `r_kdPelanggan`, `total`, `created_at`, `updated_at`) VALUES
(1, '20230320A1', 'A', '2023-03-20 00:00:00', 'PL02022036', '30000.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(2, '20230320A15', 'A', '2023-03-20 00:00:00', 'PL02022036', '30000.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(3, '20230320C1', 'C', '2023-03-20 00:00:00', 'PL02022036', '30000.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(4, '20230320B1', 'B', '2023-03-20 00:00:00', 'PL02022036', '25000.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(5, '20230320B1', 'B', '2023-03-20 00:00:00', 'PL02022035', '25000.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35');

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
  `harga` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblnosel_detail`
--

INSERT INTO `tblnosel_detail` (`id_nosel`, `r_bbm`, `r_code_bbm`, `nama_nosel`, `meter_awal`, `meter_akhir`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG0001', 'PX 1', 2300, 2300, '13500.00', '2023-01-14 09:54:41', '2023-03-20 06:05:35'),
(2, 1, 'BRG0001', 'PX 2', 700, 800, '13500.00', '2023-01-14 09:56:59', '2023-03-20 06:05:35'),
(3, 2, 'BRG0002', 'PL 1', 1100, 1100, '13000.00', '2023-01-14 09:58:16', '2023-03-20 06:05:35'),
(4, 2, 'BRG0002', 'PL 2', 1100, 1200, '13000.00', '2023-01-14 09:56:59', '2023-03-20 06:05:35'),
(5, 1, 'BRG0001', 'PX 3', 700, 800, '13500.00', '2023-01-14 09:56:59', '2023-03-20 06:05:35'),
(6, 2, 'BRG0002', 'PL 3', 200, 200, '13000.00', '2023-01-14 09:56:59', '2023-03-20 06:05:35'),
(7, 3, 'BRG0003', 'DX 1', 820, 820, '17800.00', '2023-01-14 09:58:16', '2023-03-20 06:05:35'),
(8, 3, 'BRG0003', 'DX 2', 100, 100, '17800.00', '2023-01-14 09:58:16', '2023-03-20 06:05:35'),
(9, 2, 'BRG0002', 'PL 4', 0, 0, '13000.00', '2023-01-14 09:58:16', '2023-03-20 06:05:35'),
(10, 2, 'BRG0002', 'PL 5', 0, 0, '13000.00', '2023-01-14 09:56:59', '2023-03-20 06:05:35'),
(11, 1, 'BRG0001', 'PX 4', 0, 0, '13500.00', '2023-01-14 09:58:16', '2023-03-20 06:05:35'),
(12, 1, 'BRG0001', 'PX 5', 0, 0, '13500.00', '2023-01-14 09:58:16', '2023-03-20 06:05:35'),
(13, 2, 'BRG0002', 'PL 6', 0, 0, '13000.00', '2023-02-02 13:04:04', '2023-03-20 06:05:35'),
(14, 2, 'BRG0002', 'PL 7', 0, 0, '13000.00', '2023-02-02 13:05:33', '2023-03-20 06:05:35');

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
(30, 'PL02022030', 'SURFING', '-', '-', '-', '-', 'user-avtar.svg', '-1620000.00', '2022-08-04 21:42:35', '2022-08-04 21:42:35'),
(31, 'PL02022031', 'MIROR', '-', '-', '-', '-', 'user-avtar.svg', '-500000.00', '2022-08-04 21:42:50', '2022-08-04 21:42:50'),
(32, 'PL02022032', 'SMA 1 KUTA', '-', '-', '-', '-', 'user-avtar.svg', '-3000.00', '2022-08-18 04:12:11', '2022-08-18 04:12:11'),
(33, 'PL02022033', 'KUNJA', '-', '-', '-', '-', 'user-avtar.svg', '0.00', '2022-08-18 04:12:32', '2022-08-18 04:12:32'),
(34, 'PL02022034', 'CAFE DELMAR', '-', '-', '-', '-', '-', '0.00', '2023-01-29 13:05:53', '2023-01-29 13:05:53'),
(35, 'PL02022035', 'PETS CONTROL', '-', '-', '-', '-', '-', '-1160000.00', '2023-01-29 13:06:57', '2023-01-29 13:06:57'),
(36, 'PL02022036', 'KAYU RAJA', '-', '-', '-', '-', '-', '-5180000.00', '2023-01-29 13:09:28', '2023-01-29 13:09:28');

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
(1, 'PB2023-1', '2023-03-20 00:00:00', 'SP0001', '335000.00', '0.00', '0.00', '11.00', '0.00', '335000.00', NULL, 0, '2023-03-20 00:00:00', '2023-03-20 01:49:20', '2023-03-20 01:49:20'),
(2, 'PB2023-2', '2023-03-20 00:00:00', 'SP0002', '201000.00', '0.00', '0.00', '11.00', '0.00', '201000.00', NULL, 0, '2023-03-20 00:00:00', '2023-03-20 02:56:07', '2023-03-20 02:56:07');

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
(1, 'PB2023-1', 'BRG0004', 'GAS ELPIGI 3KG', '18000.00', '5.00', '90000.00', '2023-03-20 01:49:20', '2023-03-20 01:49:20'),
(2, 'PB2023-1', 'BRG0006', 'OLI', '49000.00', '5.00', '245000.00', '2023-03-20 01:49:20', '2023-03-20 01:49:20'),
(3, 'PB2023-2', 'BRG0004', 'GAS ELPIGI 3KG', '18000.00', '3.00', '54000.00', '2023-03-20 02:56:07', '2023-03-20 02:56:07'),
(4, 'PB2023-2', 'BRG0006', 'OLI', '49000.00', '3.00', '147000.00', '2023-03-20 02:56:07', '2023-03-20 02:56:07');

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
(1, 'INV2023001', '2023-03-20 00:00:00', 'PL02022030', '62000.00', '0.00', 0, '6820.00', '62000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 01:37:33', '2023-03-20 01:37:33'),
(2, 'INV2023002', '2023-03-20 00:00:00', 'PL02022031', '62000.00', '0.00', 0, '6820.00', '62000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 01:50:27', '2023-03-20 01:50:27'),
(3, 'INV2023003', '2023-03-20 00:00:00', 'PL02022031', '62000.00', '0.00', 0, '6820.00', '62000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 02:06:07', '2023-03-20 02:06:07'),
(4, 'INV2023004', '2023-03-20 00:00:00', 'PL02022031', '62000.00', '0.00', 0, '6820.00', '62000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 02:15:19', '2023-03-20 02:15:19'),
(5, 'INV2023005', '2023-03-20 00:00:00', 'PL02022031', '62000.00', '0.00', 0, '6820.00', '62000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 02:24:03', '2023-03-20 02:24:03'),
(6, 'INV2023006', '2023-03-20 00:00:00', 'PL02022030', '62000.00', '0.00', 0, '6820.00', '62000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 02:28:21', '2023-03-20 02:28:21'),
(7, 'INV2023007', '2023-03-20 00:00:00', 'PL02022030', '40000.00', '0.00', 0, '4400.00', '40000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 02:34:07', '2023-03-20 02:34:07'),
(8, 'INV2023008', '2023-03-20 00:00:00', 'PL02022030', '76000.00', '0.00', 0, '8360.00', '76000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 02:45:21', '2023-03-20 02:45:21'),
(9, 'INV2023009', '2023-03-20 00:00:00', 'PL02022030', '76000.00', '0.00', 0, '8360.00', '76000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 02:56:52', '2023-03-20 02:56:52'),
(10, 'INV20230010', '2023-03-20 00:00:00', 'PL02022030', '76000.00', '0.00', 0, '8360.00', '76000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 03:08:02', '2023-03-20 03:08:02'),
(11, 'INV20230011', '2023-03-20 00:00:00', 'PL02022031', '76000.00', '0.00', 0, '8360.00', '76000.00', NULL, 0, '2023-03-20 00:00:00', '0', '0.00', '2023-03-20 03:11:54', '2023-03-20 03:11:54');

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
(1, 'KP0320231', '2023-03-20 00:00:00', 'PL02022036', '150000.00', '2023-03-19 16:00:00', '2023-03-20 00:22:20'),
(2, 'KP0320231', '2023-03-20 00:00:00', 'PL02022034', '250000.00', '2023-03-19 16:00:00', '2023-03-20 00:22:20');

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
(1, 'INV2023001', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 01:37:33', '2023-03-20 01:37:33'),
(2, 'INV2023001', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '40000.00', 1, 'BOTOL', '49000.00', '40000.00', '2023-03-20 01:37:33', '2023-03-20 01:37:33'),
(3, 'INV2023002', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 01:50:27', '2023-03-20 01:50:27'),
(4, 'INV2023002', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '40000.00', 1, 'BOTOL', '49000.00', '40000.00', '2023-03-20 01:50:27', '2023-03-20 01:50:27'),
(5, 'INV2023003', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 02:06:07', '2023-03-20 02:06:07'),
(6, 'INV2023003', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '40000.00', 1, 'BOTOL', '49000.00', '40000.00', '2023-03-20 02:06:07', '2023-03-20 02:06:07'),
(7, 'INV2023004', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 02:15:19', '2023-03-20 02:15:19'),
(8, 'INV2023004', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '40000.00', 1, 'BOTOL', '49000.00', '40000.00', '2023-03-20 02:15:19', '2023-03-20 02:15:19'),
(9, 'INV2023005', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 02:24:03', '2023-03-20 02:24:03'),
(10, 'INV2023005', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '40000.00', 1, 'BOTOL', '49000.00', '40000.00', '2023-03-20 02:24:03', '2023-03-20 02:24:03'),
(11, 'INV2023006', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 02:28:21', '2023-03-20 02:28:21'),
(12, 'INV2023006', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '40000.00', 1, 'BOTOL', '49000.00', '40000.00', '2023-03-20 02:28:21', '2023-03-20 02:28:21'),
(13, 'INV2023007', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '40000.00', 1, 'BOTOL', '49000.00', '40000.00', '2023-03-20 02:34:07', '2023-03-20 02:34:07'),
(14, 'INV2023008', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 02:45:21', '2023-03-20 02:45:21'),
(15, 'INV2023008', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '54000.00', 1, 'BOTOL', '49000.00', '54000.00', '2023-03-20 02:45:21', '2023-03-20 02:45:21'),
(16, 'INV2023009', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 02:56:52', '2023-03-20 02:56:52'),
(17, 'INV2023009', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '54000.00', 1, 'BOTOL', '49000.00', '54000.00', '2023-03-20 02:56:52', '2023-03-20 02:56:52'),
(18, 'INV20230010', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 03:08:02', '2023-03-20 03:08:02'),
(19, 'INV20230010', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '54000.00', 1, 'BOTOL', '49000.00', '54000.00', '2023-03-20 03:08:02', '2023-03-20 03:08:02'),
(20, 'INV20230011', '2023-03-20 00:00:00', 'BRG0004', 'GAS ELPIGI 3KG', 'KT-2021-3', '22000.00', 1, 'TABUNG', '18000.00', '22000.00', '2023-03-20 03:11:54', '2023-03-20 03:11:54'),
(21, 'INV20230011', '2023-03-20 00:00:00', 'BRG0006', 'OLI', 'KT-2021-2', '54000.00', 1, 'BOTOL', '49000.00', '54000.00', '2023-03-20 03:11:54', '2023-03-20 03:11:54');

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
(1, 'BRG0001', 'PERTAMAX', 14985, 'Liter', 'KT-2021-1', '12000.00', '13500.00', '2023-01-19 22:24:13', '2023-01-19 22:24:13'),
(2, 'BRG0002', 'PERTALITE', 11187, 'Liter', 'KT-2021-1', '10300.00', '13000.00', '2023-01-19 22:25:23', '2023-01-19 22:25:23'),
(3, 'BRG0003', 'DEX LITE', 9220, 'Liter', 'KT-2021-1', '14200.00', '17800.00', '2023-01-19 22:26:32', '2023-01-19 22:26:32'),
(4, 'BRG0004', 'GAS ELPIGI 3KG', -1, 'TABUNG', 'KT-2021-3', '18000.00', '22000.00', '2023-01-20 12:14:45', '2023-01-20 12:14:45'),
(6, 'BRG0005', 'GAS ELPIGI 12KG', 4, 'TABUNG', 'KT-2021-3', '120000.00', '150000.00', NULL, NULL),
(7, 'BRG0006', 'OLI', -4, 'BOTOL', 'KT-2021-2', '49000.00', '54000.00', NULL, NULL),
(8, 'BRG0007', 'OLI MESRAN 5L', 2, 'BOTOL', 'KT-2021-2', '150000.00', '220000.00', NULL, NULL),
(9, 'BRG0008', 'OLI MESRAN 1.5L', 0, 'BOTOL', 'KT-2021-2', '85000.00', '110000.00', NULL, NULL);

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
(1, 'PO0320231', '12124', '2023-03-20 00:00:00', 'SP0001', '73000000.00', '0.00', '0.00', '11.00', '154000.00', '73154000.00', NULL, 0, '2023-03-20 00:00:00', '2023-03-20 01:23:02', '2023-03-20 01:23:02');

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
  `total` decimal(13,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblpobbm_detail`
--

INSERT INTO `tblpobbm_detail` (`idPoDetail`, `r_noPo`, `kdBarang`, `nmBarang`, `hrgBeli`, `qty`, `qty_recieve`, `total`, `created_at`, `updated_at`) VALUES
(1, 'PO0320231', 'BRG0001', 'PERTAMAX', '12000.00', '2000.00', '1000.00', '24000000.00', '2023-03-20 01:23:02', '2023-03-20 01:23:02'),
(2, 'PO0320231', 'BRG0002', 'PERLITE', '10300.00', '2000.00', '1000.00', '20600000.00', '2023-03-20 01:23:02', '2023-03-20 01:23:02'),
(3, 'PO0320231', 'BRG0003', 'DEX LITE', '14200.00', '2000.00', '1000.00', '28400000.00', '2023-03-20 01:23:02', '2023-03-20 01:23:02');

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
(1, '20230320A1', '2023-03-20 00:00:00', 'BRG0001', '560000.00', '50.00', '675000.00', '115000.00', '2023-03-20 08:23:36', '2023-03-20 08:23:36'),
(2, '20230320A1', '2023-03-20 00:00:00', 'BRG0002', '445000.00', '50.00', '650000.00', '205000.00', '2023-03-20 08:23:36', '2023-03-20 08:23:36'),
(3, '20230320A1', '2023-03-20 00:00:00', 'BRG0003', '0.00', '0.00', '0.00', '0.00', '2023-03-20 08:23:36', '2023-03-20 08:23:36'),
(4, '20230320A15', '2023-03-20 00:00:00', 'BRG0001', '896000.00', '80.00', '1080000.00', '184000.00', '2023-03-20 08:28:57', '2023-03-20 08:28:57'),
(5, '20230320A15', '2023-03-20 00:00:00', 'BRG0002', '445000.00', '50.00', '650000.00', '205000.00', '2023-03-20 08:28:57', '2023-03-20 08:28:57'),
(6, '20230320A15', '2023-03-20 00:00:00', 'BRG0003', '0.00', '0.00', '0.00', '0.00', '2023-03-20 08:28:57', '2023-03-20 08:28:57'),
(7, '20230320A29', '2023-03-20 00:00:00', 'BRG0001', '240000.00', '20.00', '270000.00', '30000.00', '2023-03-20 09:35:35', '2023-03-20 09:35:35'),
(8, '20230320A29', '2023-03-20 00:00:00', 'BRG0002', '1030000.00', '100.00', '1300000.00', '270000.00', '2023-03-20 09:35:35', '2023-03-20 09:35:35'),
(9, '20230320A29', '2023-03-20 00:00:00', 'BRG0003', '0.00', '0.00', '0.00', '0.00', '2023-03-20 09:35:35', '2023-03-20 09:35:35'),
(10, '20230320A43', '2023-03-20 00:00:00', 'BRG0001', '1200000.00', '100.00', '1350000.00', '150000.00', '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(11, '20230320A43', '2023-03-20 00:00:00', 'BRG0002', '1030000.00', '100.00', '1300000.00', '270000.00', '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(12, '20230320A43', '2023-03-20 00:00:00', 'BRG0003', '142000.00', '10.00', '178000.00', '36000.00', '2023-03-20 11:12:53', '2023-03-20 11:12:53'),
(13, '20230320A57', '2023-03-20 00:00:00', 'BRG0001', '1200000.00', '100.00', '1350000.00', '150000.00', '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(14, '20230320A57', '2023-03-20 00:00:00', 'BRG0002', '1030000.00', '100.00', '1300000.00', '270000.00', '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(15, '20230320A57', '2023-03-20 00:00:00', 'BRG0003', '142000.00', '10.00', '178000.00', '36000.00', '2023-03-20 11:28:06', '2023-03-20 11:28:06'),
(16, '20230320C1', '2023-03-20 00:00:00', 'BRG0001', '1200000.00', '100.00', '1350000.00', '150000.00', '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(17, '20230320C1', '2023-03-20 00:00:00', 'BRG0002', '1030000.00', '100.00', '1300000.00', '270000.00', '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(18, '20230320C1', '2023-03-20 00:00:00', 'BRG0003', '0.00', '0.00', '0.00', '0.00', '2023-03-20 13:49:29', '2023-03-20 13:49:29'),
(19, '20230320B1', '2023-03-20 00:00:00', 'BRG0001', '2400000.00', '200.00', '2700000.00', '300000.00', '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(20, '20230320B1', '2023-03-20 00:00:00', 'BRG0002', '1030000.00', '100.00', '1300000.00', '270000.00', '2023-03-20 14:05:35', '2023-03-20 14:05:35'),
(21, '20230320B1', '2023-03-20 00:00:00', 'BRG0003', '0.00', '0.00', '0.00', '0.00', '2023-03-20 14:05:35', '2023-03-20 14:05:35');

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
-- Table structure for table `tblterimabbm`
--

CREATE TABLE `tblterimabbm` (
  `id` bigint NOT NULL,
  `kd_terima` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `no_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_terima` datetime NOT NULL,
  `kd_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblterimabbm`
--

INSERT INTO `tblterimabbm` (`id`, `kd_terima`, `no_po`, `tgl_terima`, `kd_supplier`, `created_at`, `updated_at`) VALUES
(1, 'BR0320231', 'PO0320231', '2023-03-20 00:00:00', 'SP0001', '2023-03-20 09:30:45', '2023-03-20 09:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `tblterimabbm_detail`
--

CREATE TABLE `tblterimabbm_detail` (
  `id_detail` bigint NOT NULL,
  `r_kdterima` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `r_nopo` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl_terima` datetime NOT NULL,
  `kd_barang` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `qty_terima` decimal(13,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tblterimabbm_detail`
--

INSERT INTO `tblterimabbm_detail` (`id_detail`, `r_kdterima`, `r_nopo`, `tgl_terima`, `kd_barang`, `qty_terima`, `created_at`, `updated_at`) VALUES
(1, 'BR0320231', 'PO0320231', '2023-03-20 00:00:00', 'BRG0001', '1000.00', '2023-03-20 00:00:00', '2023-03-20 09:30:45'),
(2, 'BR0320231', 'PO0320231', '2023-03-20 00:00:00', 'BRG0002', '1000.00', '2023-03-20 00:00:00', '2023-03-20 09:30:45'),
(3, 'BR0320231', 'PO0320231', '2023-03-20 00:00:00', 'BRG0003', '1000.00', '2023-03-20 00:00:00', '2023-03-20 09:30:45');

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

INSERT INTO `tbltransaksi_nosel` (`id`, `r_bbm`, `r_nosel`, `kd_trans`, `r_regu`, `tgl_transaksi`, `last_meter`, `awal_meter`, `cost_ltr`, `last_price`, `total`, `total_hpp`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '20230320A1', 'A', '2023-03-20 00:00:00', '1900.00', '1850.00', '50.00', '13500.00', '675000.00', '560000.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(2, 1, 2, '20230320A1', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(3, 2, 3, '20230320A1', 'A', '2023-03-20 00:00:00', '750.00', '750.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(4, 2, 4, '20230320A1', 'A', '2023-03-20 00:00:00', '1000.00', '950.00', '50.00', '13000.00', '650000.00', '445000.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(5, 1, 5, '20230320A1', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(6, 2, 6, '20230320A1', 'A', '2023-03-20 00:00:00', '200.00', '200.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(7, 3, 7, '20230320A1', 'A', '2023-03-20 00:00:00', '800.00', '800.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(8, 3, 8, '20230320A1', 'A', '2023-03-20 00:00:00', '100.00', '100.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(9, 2, 9, '20230320A1', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(10, 2, 10, '20230320A1', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(11, 1, 11, '20230320A1', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(12, 1, 12, '20230320A1', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(13, 2, 13, '20230320A1', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(14, 2, 14, '20230320A1', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:23:36', '2023-03-20 00:23:36'),
(15, 1, 1, '20230320A15', 'A', '2023-03-20 00:00:00', '1980.00', '1900.00', '80.00', '13500.00', '1080000.00', '896000.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(16, 1, 2, '20230320A15', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(17, 2, 3, '20230320A15', 'A', '2023-03-20 00:00:00', '800.00', '750.00', '50.00', '13000.00', '650000.00', '445000.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(18, 2, 4, '20230320A15', 'A', '2023-03-20 00:00:00', '1000.00', '1000.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(19, 1, 5, '20230320A15', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(20, 2, 6, '20230320A15', 'A', '2023-03-20 00:00:00', '200.00', '200.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(21, 3, 7, '20230320A15', 'A', '2023-03-20 00:00:00', '800.00', '800.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(22, 3, 8, '20230320A15', 'A', '2023-03-20 00:00:00', '100.00', '100.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(23, 2, 9, '20230320A15', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(24, 2, 10, '20230320A15', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(25, 1, 11, '20230320A15', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(26, 1, 12, '20230320A15', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(27, 2, 13, '20230320A15', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(28, 2, 14, '20230320A15', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 00:28:57', '2023-03-20 00:28:57'),
(29, 1, 1, '20230320A29', 'A', '2023-03-20 00:00:00', '2000.00', '1980.00', '20.00', '13500.00', '270000.00', '240000.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(30, 1, 2, '20230320A29', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(31, 2, 3, '20230320A29', 'A', '2023-03-20 00:00:00', '900.00', '800.00', '100.00', '13000.00', '1300000.00', '1030000.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(32, 2, 4, '20230320A29', 'A', '2023-03-20 00:00:00', '1000.00', '1000.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(33, 1, 5, '20230320A29', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(34, 2, 6, '20230320A29', 'A', '2023-03-20 00:00:00', '200.00', '200.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(35, 3, 7, '20230320A29', 'A', '2023-03-20 00:00:00', '800.00', '800.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(36, 3, 8, '20230320A29', 'A', '2023-03-20 00:00:00', '100.00', '100.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(37, 2, 9, '20230320A29', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(38, 2, 10, '20230320A29', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(39, 1, 11, '20230320A29', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(40, 1, 12, '20230320A29', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(41, 2, 13, '20230320A29', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(42, 2, 14, '20230320A29', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 01:35:35', '2023-03-20 01:35:35'),
(43, 1, 1, '20230320A43', 'A', '2023-03-20 00:00:00', '2100.00', '2000.00', '100.00', '13500.00', '1350000.00', '1200000.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(44, 1, 2, '20230320A43', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(45, 2, 3, '20230320A43', 'A', '2023-03-20 00:00:00', '1000.00', '900.00', '100.00', '13000.00', '1300000.00', '1030000.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(46, 2, 4, '20230320A43', 'A', '2023-03-20 00:00:00', '1000.00', '1000.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(47, 1, 5, '20230320A43', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(48, 2, 6, '20230320A43', 'A', '2023-03-20 00:00:00', '200.00', '200.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(49, 3, 7, '20230320A43', 'A', '2023-03-20 00:00:00', '810.00', '800.00', '10.00', '17800.00', '178000.00', '142000.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(50, 3, 8, '20230320A43', 'A', '2023-03-20 00:00:00', '100.00', '100.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(51, 2, 9, '20230320A43', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(52, 2, 10, '20230320A43', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(53, 1, 11, '20230320A43', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(54, 1, 12, '20230320A43', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(55, 2, 13, '20230320A43', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(56, 2, 14, '20230320A43', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:12:53', '2023-03-20 03:12:53'),
(57, 1, 1, '20230320A57', 'A', '2023-03-20 00:00:00', '2200.00', '2100.00', '100.00', '13500.00', '1350000.00', '1200000.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(58, 1, 2, '20230320A57', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(59, 2, 3, '20230320A57', 'A', '2023-03-20 00:00:00', '1100.00', '1000.00', '100.00', '13000.00', '1300000.00', '1030000.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(60, 2, 4, '20230320A57', 'A', '2023-03-20 00:00:00', '1000.00', '1000.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(61, 1, 5, '20230320A57', 'A', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(62, 2, 6, '20230320A57', 'A', '2023-03-20 00:00:00', '200.00', '200.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(63, 3, 7, '20230320A57', 'A', '2023-03-20 00:00:00', '820.00', '810.00', '10.00', '17800.00', '178000.00', '142000.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(64, 3, 8, '20230320A57', 'A', '2023-03-20 00:00:00', '100.00', '100.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(65, 2, 9, '20230320A57', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(66, 2, 10, '20230320A57', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(67, 1, 11, '20230320A57', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(68, 1, 12, '20230320A57', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(69, 2, 13, '20230320A57', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(70, 2, 14, '20230320A57', 'A', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 03:28:06', '2023-03-20 03:28:06'),
(71, 1, 1, '20230320C1', 'C', '2023-03-20 00:00:00', '2300.00', '2200.00', '100.00', '13500.00', '1350000.00', '1200000.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(72, 1, 2, '20230320C1', 'C', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(73, 2, 3, '20230320C1', 'C', '2023-03-20 00:00:00', '1100.00', '1100.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(74, 2, 4, '20230320C1', 'C', '2023-03-20 00:00:00', '1100.00', '1000.00', '100.00', '13000.00', '1300000.00', '1030000.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(75, 1, 5, '20230320C1', 'C', '2023-03-20 00:00:00', '700.00', '700.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(76, 2, 6, '20230320C1', 'C', '2023-03-20 00:00:00', '200.00', '200.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(77, 3, 7, '20230320C1', 'C', '2023-03-20 00:00:00', '820.00', '820.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(78, 3, 8, '20230320C1', 'C', '2023-03-20 00:00:00', '100.00', '100.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(79, 2, 9, '20230320C1', 'C', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(80, 2, 10, '20230320C1', 'C', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(81, 1, 11, '20230320C1', 'C', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(82, 1, 12, '20230320C1', 'C', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(83, 2, 13, '20230320C1', 'C', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(84, 2, 14, '20230320C1', 'C', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 05:49:29', '2023-03-20 05:49:29'),
(85, 1, 1, '20230320B1', 'B', '2023-03-20 00:00:00', '2300.00', '2300.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(86, 1, 2, '20230320B1', 'B', '2023-03-20 00:00:00', '800.00', '700.00', '100.00', '13500.00', '1350000.00', '1200000.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(87, 2, 3, '20230320B1', 'B', '2023-03-20 00:00:00', '1100.00', '1100.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(88, 2, 4, '20230320B1', 'B', '2023-03-20 00:00:00', '1200.00', '1100.00', '100.00', '13000.00', '1300000.00', '1030000.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(89, 1, 5, '20230320B1', 'B', '2023-03-20 00:00:00', '800.00', '700.00', '100.00', '13500.00', '1350000.00', '1200000.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(90, 2, 6, '20230320B1', 'B', '2023-03-20 00:00:00', '200.00', '200.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(91, 3, 7, '20230320B1', 'B', '2023-03-20 00:00:00', '820.00', '820.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(92, 3, 8, '20230320B1', 'B', '2023-03-20 00:00:00', '100.00', '100.00', '0.00', '17800.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(93, 2, 9, '20230320B1', 'B', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(94, 2, 10, '20230320B1', 'B', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(95, 1, 11, '20230320B1', 'B', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(96, 1, 12, '20230320B1', 'B', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13500.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(97, 2, 13, '20230320B1', 'B', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35'),
(98, 2, 14, '20230320B1', 'B', '2023-03-20 00:00:00', '0.00', '0.00', '0.00', '13000.00', '0.00', '0.00', '2023-03-20 06:05:35', '2023-03-20 06:05:35');

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
-- Indexes for table `tblsupplier`
--
ALTER TABLE `tblsupplier`
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
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `gl`
--
ALTER TABLE `gl`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `gl_detail`
--
ALTER TABLE `gl_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

--
-- AUTO_INCREMENT for table `gl_lr`
--
ALTER TABLE `gl_lr`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id_biaya` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblheader_aplusan`
--
ALTER TABLE `tblheader_aplusan`
  MODIFY `id_aplusan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblkategori`
--
ALTER TABLE `tblkategori`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblkupon`
--
ALTER TABLE `tblkupon`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbllinkaja`
--
ALTER TABLE `tbllinkaja`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

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
  MODIFY `idPembelian` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpembelian_detail`
--
ALTER TABLE `tblpembelian_detail`
  MODIFY `idPembelianDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpenjualan`
--
ALTER TABLE `tblpenjualan`
  MODIFY `idPenjualan` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblpenjualankupon`
--
ALTER TABLE `tblpenjualankupon`
  MODIFY `idPenjualanKupon` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpenjualan_detail`
--
ALTER TABLE `tblpenjualan_detail`
  MODIFY `idDetailPenjualan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  MODIFY `id_perubahan` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblpobbm`
--
ALTER TABLE `tblpobbm`
  MODIFY `idPo` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpobbm_detail`
--
ALTER TABLE `tblpobbm_detail`
  MODIFY `idPoDetail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblprofit`
--
ALTER TABLE `tblprofit`
  MODIFY `id_profit` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `tblterimabbm`
--
ALTER TABLE `tblterimabbm`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblterimabbm_detail`
--
ALTER TABLE `tblterimabbm_detail`
  MODIFY `id_detail` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltransaksi_nosel`
--
ALTER TABLE `tbltransaksi_nosel`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
