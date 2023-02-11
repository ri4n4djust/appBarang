-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 11, 2023 at 01:06 AM
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
-- Database: `siapmi`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`hexadigi`@`localhost` PROCEDURE `spCreateKodeGroup` (IN `pDealer` VARCHAR(4), IN `pFiskalYear` INT(4))  NO SQL BEGIN
  INSERT INTO nomor_group(
    dealer, fiskal_year, number
  ) SELECT
        pDealer
      , pFiskalYear
      , 1+COALESCE(MAX(number),0) as nomer 
    FROM nomor_group 
    WHERE 
        dealer=pDealer;
  SET @id = LAST_INSERT_ID();
  SELECT CONCAT(i.dealer, RIGHT(concat('000',i.number),3)) nomor_group, i.* from nomor_group i WHERE id_nomor_group = @id;
END$$

CREATE DEFINER=`hexadigi`@`localhost` PROCEDURE `spCreateKodeJabatan` (IN `pDealer` VARCHAR(4), IN `pFiskalYear` INT(4))  NO SQL BEGIN
  INSERT INTO nomor_jabatan(
    dealer, fiskal_year, number
  ) SELECT
        pDealer
      , pFiskalYear
      , 1+COALESCE(MAX(number),0) as nomer 
    FROM nomor_jabatan
    WHERE 
        dealer=pDealer;
  SET @id = LAST_INSERT_ID();
  SELECT CONCAT(i.dealer, RIGHT(concat('000',i.number),3)) nomor_jabatan, i.* from nomor_jabatan i WHERE id_nomor_jabatan = @id;
END$$

CREATE DEFINER=`hexadigi`@`localhost` PROCEDURE `spCreateKodeStaff` (IN `pDealer` VARCHAR(4), IN `pFiskalYear` INT(4))  NO SQL BEGIN
  INSERT INTO nomor_staff(
    dealer, fiskal_year, number
  ) SELECT
        pDealer
      , pFiskalYear
      , 1+COALESCE(MAX(number),0) as nomor 
    FROM nomor_staff 
    WHERE 
        dealer=pDealer;
  SET @id = LAST_INSERT_ID();
  SELECT CONCAT(i.dealer, RIGHT(concat('000',i.number),3)) nomor_staff, i.* from nomor_staff i WHERE id_nomor_staff = @id;
END$$

CREATE DEFINER=`hexadigi`@`localhost` PROCEDURE `spCreateKodeType` (IN `pDealer` VARCHAR(4), IN `pFiskalYear` INT(4))  NO SQL BEGIN
  INSERT INTO nomor_type(
    dealer, fiskal_year, number
  ) SELECT
        pDealer
      , pFiskalYear
      , 1+COALESCE(MAX(number),0) as nomor 
    FROM nomor_type 
    WHERE 
        dealer=pDealer;
  SET @id = LAST_INSERT_ID();
  SELECT CONCAT(i.dealer, RIGHT(concat('000',i.number),3)) nomor_type, i.* from nomor_type i WHERE id_nomor_type = @id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accuser`
--

CREATE TABLE `accuser` (
  `id` int NOT NULL,
  `user_id` varchar(15) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `user_email` varchar(200) NOT NULL,
  `rlevel` varchar(5) DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_create` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `accuser`
--

INSERT INTO `accuser` (`id`, `user_id`, `nama`, `user_name`, `password`, `user_email`, `rlevel`, `location`, `date_create`) VALUES
(1, 'US001', 'Widiartana', 'widigent', '$2y$10$YOPedxGR13gCAi0skbhRqO57.ynRUvOZ4BlhggzfLf7Ycqt69WcF.', 'hexadigital.bali@gmail.com', 'po000', '01020,11020', '2022-02-25 03:22:57'),
(2, 'US002', 'Admin UTD', 'admin.utd', '$2y$10$YOPedxGR13gCAi0skbhRqO57.ynRUvOZ4BlhggzfLf7Ycqt69WcF.', 'widigent@gmail.com', 'pos00', '11020', '2022-02-25 03:22:57'),
(3, 'US003', 'Admin MARKAS', 'admin.pmi', '$2y$10$YOPedxGR13gCAi0skbhRqO57.ynRUvOZ4BlhggzfLf7Ycqt69WcF.', 'widigent.coder@gmail.com', 'pos00', '01020', '2022-02-25 03:22:57'),
(7, 'US004', 'Logistik MARKAS', 'logistik.pmi', '$2y$10$YOPedxGR13gCAi0skbhRqO57.ynRUvOZ4BlhggzfLf7Ycqt69WcF.', 'pmibadung@gmail.com', 'pos00', '01020', '2022-02-25 03:22:57'),
(9, 'US005', 'Logistik UTD', 'logistik.utd', '$2y$10$YOPedxGR13gCAi0skbhRqO57.ynRUvOZ4BlhggzfLf7Ycqt69WcF.', 'logistik.utd@gmail.com', 'pos00', '11020', '2022-02-25 03:22:57'),
(10, 'US006', 'Kadek Indrawati', 'keuangan', '$2y$10$YOPedxGR13gCAi0skbhRqO57.ynRUvOZ4BlhggzfLf7Ycqt69WcF.', 'indrawati@gmail.com', 'po000', '01020,11020', '2022-02-25 03:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `acc_setup`
--

CREATE TABLE `acc_setup` (
  `id` int NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `nilai` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc_setup`
--

INSERT INTO `acc_setup` (`id`, `jenis`, `nilai`) VALUES
(1, 'conversion_date', '2022-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `bahasa`
--

CREATE TABLE `bahasa` (
  `id` int NOT NULL,
  `bahasa` varchar(20) NOT NULL,
  `r_label` int NOT NULL,
  `text` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahasa`
--

INSERT INTO `bahasa` (`id`, `bahasa`, `r_label`, `text`) VALUES
(5, 'english', 1, 'Master'),
(6, 'english', 3, 'Service'),
(7, 'english', 6, 'Report'),
(8, 'english', 8, 'Account'),
(9, 'english', 9, 'Card File'),
(10, 'english', 10, 'General Transaction'),
(11, 'english', 11, 'Accounting'),
(12, 'english', 12, 'Inventory & Equipment'),
(13, 'english', 13, 'Inventory Transaction'),
(14, 'english', 14, 'General Jurnal'),
(15, 'english', 15, 'Expenses'),
(16, 'english', 16, 'General'),
(17, 'english', 17, 'Service Report'),
(18, 'english', 23, 'Assets'),
(19, 'english', 24, 'Liability'),
(20, 'english', 25, 'Equity'),
(21, 'english', 26, 'Income'),
(22, 'english', 27, 'Cost Of Service'),
(23, 'english', 28, 'Expense'),
(24, 'english', 29, 'Other Income'),
(25, 'english', 30, 'Other Expense'),
(26, 'english', 31, 'Supplier'),
(27, 'english', 32, 'Customer'),
(28, 'english', 33, 'UNIT PMI'),
(29, 'english', 34, 'Purchase Order'),
(30, 'english', 35, 'Purchase'),
(31, 'english', 36, 'Purchase Register'),
(32, 'english', 37, 'Supplier Payment'),
(33, 'english', 38, 'Purchase Journal'),
(34, 'english', 40, 'Service Order'),
(35, 'english', 42, 'Service Register'),
(36, 'english', 43, 'Customer Payment'),
(37, 'english', 44, 'Service Journal'),
(38, 'english', 45, 'Ageing Receivable'),
(39, 'english', 46, 'Items'),
(40, 'english', 47, 'Harves'),
(41, 'english', 49, 'Opnum'),
(42, 'english', 50, 'Transfer In'),
(43, 'english', 51, 'Transfer Out'),
(44, 'english', 52, 'Register In'),
(45, 'english', 53, 'Register Out'),
(46, 'english', 54, 'Inventory Journal'),
(47, 'english', 55, 'Journal Entry'),
(48, 'english', 56, 'Cash Flow'),
(49, 'english', 57, 'Programs &Activities'),
(50, 'english', 58, 'Register'),
(51, 'english', 59, 'Payment'),
(55, 'english', 63, 'Revenue'),
(57, 'english', 65, 'Service Statement'),
(58, 'english', 66, 'Customer Balance'),
(59, 'english', 67, 'Paid Service'),
(60, 'english', 68, 'Balance Sheet'),
(61, 'english', 69, 'Profit & Lost'),
(62, 'english', 70, 'Ledger'),
(68, 'indonesia', 1, 'Master'),
(69, 'indonesia', 3, 'Pelayanan'),
(70, 'indonesia', 6, 'Laporan'),
(71, 'indonesia', 8, 'Rekening'),
(72, 'indonesia', 9, 'Kartu Nama'),
(73, 'indonesia', 10, 'Transaksi Umum'),
(74, 'indonesia', 11, 'Akuntansi'),
(75, 'indonesia', 12, 'Persediaan & Inventaris'),
(76, 'indonesia', 13, 'Transaksi Persediaan'),
(77, 'indonesia', 14, 'Jurnal Umum'),
(78, 'indonesia', 15, 'Beban'),
(79, 'indonesia', 16, 'Umum'),
(80, 'indonesia', 17, 'Laporan Pelayanan'),
(81, 'indonesia', 23, 'Aktiva'),
(82, 'indonesia', 24, 'Kewajiban'),
(83, 'indonesia', 25, 'Modal'),
(84, 'indonesia', 26, 'Pendapatan'),
(85, 'indonesia', 27, 'Biaya Pelayanan'),
(86, 'indonesia', 28, 'Biaya'),
(87, 'indonesia', 29, 'Penghasilan Lain'),
(88, 'indonesia', 30, 'Biaya Lainnya'),
(89, 'indonesia', 31, 'Pemasok'),
(90, 'indonesia', 32, 'Pelanggan'),
(91, 'indonesia', 33, 'UNIT PMI'),
(92, 'indonesia', 34, 'Pesanan Pembelian'),
(93, 'indonesia', 35, 'Pembelian'),
(94, 'indonesia', 36, 'Daftar Pembelian'),
(95, 'indonesia', 37, 'Bayar Pemasok'),
(96, 'indonesia', 38, 'Jurnal Pembelian'),
(97, 'indonesia', 40, 'Order Pelayanan'),
(98, 'indonesia', 42, 'Daftar Pelayanan'),
(99, 'indonesia', 43, 'Pelanggan Bayar'),
(100, 'indonesia', 44, 'Jurnal Pelayanan'),
(101, 'indonesia', 45, 'Umur Piutang'),
(102, 'indonesia', 46, 'Item'),
(103, 'indonesia', 47, 'Panen'),
(104, 'indonesia', 49, 'Opnum'),
(105, 'indonesia', 50, 'Transfer Masuk'),
(106, 'indonesia', 51, 'Transfer Keluar'),
(107, 'indonesia', 52, 'Daftar Masuk'),
(108, 'indonesia', 53, 'Daftar Keluar'),
(109, 'indonesia', 54, 'Jurnal Persediaan'),
(110, 'indonesia', 55, 'Entri Jurnal'),
(111, 'indonesia', 56, 'Arus Kas'),
(112, 'indonesia', 57, 'Program &Kegiatan'),
(113, 'indonesia', 58, 'Daftar'),
(114, 'indonesia', 59, 'Pembayaran'),
(118, 'indonesia', 63, 'Pendapatan'),
(120, 'indonesia', 65, 'Nota Pelayanan'),
(121, 'indonesia', 66, 'Saldo Pelanggan'),
(122, 'indonesia', 67, 'Pelayanan Lunas'),
(123, 'indonesia', 68, 'Neraca Keuangan'),
(124, 'indonesia', 69, 'Laba/Rugi'),
(125, 'indonesia', 70, 'Buku Besar'),
(126, 'indonesia', 71, 'Master'),
(127, 'english', 71, 'Master'),
(128, 'indonesia', 86, 'Master Barang'),
(129, 'english', 86, 'Master Item'),
(132, 'indonesia', 74, 'Neraca'),
(133, 'english', 74, 'Balance Sheet'),
(134, 'indonesia', 75, 'Rugi Laba'),
(135, 'english', 75, 'Profit &Loss'),
(136, 'indonesia', 76, 'Card File'),
(137, 'english', 76, 'Card File'),
(138, 'indonesia', 77, 'Karyawan'),
(139, 'english', 77, 'Employee'),
(140, 'indonesia', 78, 'Service Person'),
(141, 'english', 78, 'Service Person'),
(146, 'indonesia', 81, 'Master Model'),
(147, 'english', 81, 'Model Master'),
(148, 'indonesia', 82, 'Master Variant'),
(149, 'english', 82, 'Variant Master'),
(150, 'indonesia', 83, 'Master Color'),
(151, 'english', 83, 'Color Master'),
(156, 'indonesia', 89, '<br>Produksi'),
(158, 'indonesia', 90, 'WO Invoice'),
(159, 'english', 90, 'WO Invoice'),
(160, 'indonesia', 91, 'WO Register'),
(161, 'english', 91, 'WO Register'),
(162, 'indonesia', 88, 'Produksi'),
(163, 'english', 89, '<br>Productions'),
(164, 'indonesia', 93, 'Transaksi'),
(165, 'english', 93, 'Transactions'),
(166, 'indonesia', 94, 'Laporan Produksi'),
(167, 'english', 94, 'Production Report'),
(168, 'english', 88, 'Productions'),
(169, 'indonesia', 96, 'WO Allocation'),
(170, 'english', 96, 'WO Allocation'),
(171, 'indonesia', 97, 'Daftar Produksi'),
(172, 'english', 97, 'Production Register'),
(173, 'indonesia', 98, 'WOInv Export'),
(174, 'english', 98, 'WOInv Export'),
(175, 'indonesia', 99, 'Pajak'),
(176, 'english', 99, 'Tax'),
(177, 'indonesia', 100, 'Export eFaktur'),
(178, 'english', 100, 'Export eFaktur'),
(179, 'indonesia', 101, 'Jurnal Produksi'),
(180, 'english', 101, 'Production Jurnal'),
(181, 'indonesia', 105, 'Tambah Baru'),
(182, 'english', 105, 'Add New'),
(183, 'indonesia', 103, 'Tutup'),
(184, 'english', 103, 'Close'),
(187, 'indonesia', 106, 'Simpan Opnum'),
(188, 'english', 106, 'Save Opnum'),
(189, 'english', 107, 'Address'),
(190, 'indonesia', 107, 'Alamat'),
(193, 'english', 109, 'Master Item'),
(194, 'indonesia', 109, 'Master Barang'),
(195, 'english', 110, 'No'),
(196, 'indonesia', 110, 'No'),
(197, 'english', 111, 'Action'),
(198, 'indonesia', 111, 'Aksi'),
(199, 'english', 113, 'Code Item'),
(200, 'indonesia', 113, 'Kode Barang'),
(201, 'english', 114, 'Item Name'),
(202, 'indonesia', 114, 'Nama Barang'),
(203, 'english', 115, 'Item Group'),
(204, 'indonesia', 115, 'Grup Barang'),
(205, 'english', 116, 'Last Price'),
(206, 'indonesia', 116, 'Harga Terbaru'),
(215, 'english', 121, 'Brand'),
(216, 'indonesia', 121, 'Merek'),
(219, 'english', 123, 'Supplier'),
(220, 'indonesia', 123, 'Pemasok'),
(221, 'english', 124, 'Sale Unit'),
(222, 'indonesia', 124, 'Satuan Penjualan'),
(223, 'english', 125, 'Min Stock'),
(224, 'indonesia', 125, 'Stok Minimal'),
(225, 'english', 126, 'Save'),
(226, 'indonesia', 126, 'Simpan'),
(227, 'english', 127, 'Cancel'),
(228, 'indonesia', 127, 'Batal'),
(229, 'english', 128, 'Update'),
(230, 'indonesia', 128, 'Perbaharui'),
(231, 'english', 129, 'Form'),
(232, 'indonesia', 129, 'Formulir'),
(233, 'english', 130, 'Item Data'),
(234, 'indonesia', 130, 'Data Barang'),
(235, 'english', 131, 'Code'),
(236, 'indonesia', 131, 'Kode'),
(237, 'english', 132, 'Item Name'),
(238, 'indonesia', 132, 'Nama Barang'),
(239, 'english', 133, 'Brand'),
(240, 'indonesia', 133, 'Merek'),
(241, 'english', 134, 'Item Group'),
(242, 'indonesia', 134, 'Grup Barang'),
(243, 'english', 135, 'Sales Unit'),
(244, 'indonesia', 135, 'Unit Penjualan'),
(245, 'english', 136, 'Min Stock'),
(246, 'indonesia', 136, 'Stok Minimum'),
(247, 'english', 137, 'Purchase Price'),
(248, 'indonesia', 137, 'Harga Beli'),
(249, 'english', 138, 'Selling Price'),
(250, 'indonesia', 138, 'Harga Jual'),
(251, 'english', 139, 'Supplier'),
(252, 'indonesia', 139, 'Pemasok'),
(253, 'english', 140, 'Entry Item Name'),
(254, 'indonesia', 140, 'Masukan Nama Barang'),
(255, 'english', 141, 'Entry Min Stock'),
(256, 'indonesia', 141, 'Masukan Stok Min'),
(257, 'english', 142, 'Entry Last Price'),
(258, 'indonesia', 142, 'Masukan Harga Terbaru'),
(259, 'english', 143, 'Entry Brand Code'),
(260, 'indonesia', 143, 'Masukan Kode Merek'),
(261, 'english', 144, 'Brand Name'),
(262, 'indonesia', 144, 'Nama Merek'),
(263, 'english', 145, 'Entry Supplier Code'),
(264, 'indonesia', 145, 'Masukan Kode Pemasok'),
(265, 'english', 146, 'Entry Supplier Name'),
(266, 'indonesia', 146, 'Masukan Nama Pemasok'),
(267, 'english', 148, 'Add Brand'),
(268, 'indonesia', 148, 'Tambah Merk'),
(269, 'english', 149, 'Close'),
(270, 'indonesia', 149, 'Tutup'),
(271, 'english', 150, 'Search Brand'),
(272, 'indonesia', 150, 'Cari Data Merk'),
(275, 'english', 153, 'Showing'),
(276, 'indonesia', 153, 'Menampilkan'),
(277, 'english', 154, 'records'),
(278, 'indonesia', 154, 'data'),
(279, 'english', 155, 'No Records - Sorry'),
(280, 'indonesia', 155, 'Tidak ada data - Maaf'),
(281, 'english', 156, 'Showing page'),
(282, 'indonesia', 156, 'Menampilkan halaman'),
(283, 'english', 157, 'of'),
(284, 'indonesia', 157, 'dari'),
(285, 'english', 158, 'No data recorded'),
(286, 'indonesia', 158, 'Tidak ada data'),
(287, 'english', 159, 'filtered from'),
(288, 'indonesia', 159, 'difilter dari'),
(289, 'english', 160, 'total records'),
(290, 'indonesia', 160, 'total data'),
(293, 'english', 162, 'Action'),
(294, 'indonesia', 162, 'Aksi'),
(299, 'english', 165, 'Brand Code'),
(300, 'indonesia', 165, 'Kode Merk'),
(301, 'english', 166, 'Brand Name'),
(302, 'indonesia', 166, 'Nama Merk'),
(303, 'english', 167, 'Supplier Code'),
(304, 'indonesia', 167, 'Kode Pemasok'),
(305, 'english', 168, 'Supplier Name'),
(306, 'indonesia', 168, 'Nama Pemasok'),
(307, 'english', 169, 'Supplier Address'),
(308, 'indonesia', 169, 'Alamat Pemasok'),
(309, 'english', 170, 'SYSTEM DATE'),
(310, 'indonesia', 170, 'TANGGAL SISTEM'),
(311, 'english', 171, 'USER ONLINE'),
(312, 'indonesia', 171, 'PENGGUNA ONLINE'),
(313, 'english', 172, 'TRANSACTION DATE'),
(314, 'indonesia', 172, 'TANGGAL TRANSAKSI'),
(315, 'english', 173, 'REPORT DATE'),
(316, 'indonesia', 173, 'TANGGAL LAPORAN'),
(317, 'english', 174, 'From'),
(318, 'indonesia', 174, 'Dari'),
(319, 'english', 175, 'To'),
(320, 'indonesia', 175, 'Smpai'),
(321, 'english', 176, 'Master Supplier'),
(322, 'indonesia', 176, 'Master Pemasok'),
(323, 'english', 177, 'Add New'),
(324, 'indonesia', 177, 'Tambah Baru'),
(325, 'english', 178, 'List Supplier'),
(326, 'indonesia', 178, 'Daftar Pemasok'),
(327, 'english', 179, 'Print Supplier'),
(328, 'indonesia', 179, 'Cetak Pemasok'),
(329, 'english', 181, 'Close Preview'),
(330, 'indonesia', 181, 'Tutup Preview'),
(331, 'english', 182, 'Update'),
(332, 'indonesia', 182, 'Perbaharui'),
(333, 'english', 183, 'Cancel'),
(334, 'indonesia', 183, 'Batal'),
(335, 'english', 184, 'Close'),
(336, 'indonesia', 184, 'Tutup'),
(337, 'english', 185, 'Save'),
(338, 'indonesia', 185, 'Simpan'),
(339, 'english', 186, 'No'),
(340, 'indonesia', 186, 'No'),
(341, 'english', 187, 'Action'),
(342, 'indonesia', 187, 'Aksi'),
(345, 'english', 189, 'Code'),
(346, 'indonesia', 189, 'Kode'),
(347, 'english', 190, 'Name'),
(348, 'indonesia', 190, 'Nama'),
(353, 'english', 193, 'Address1'),
(354, 'indonesia', 193, 'Alamat1'),
(355, 'english', 194, 'Address2'),
(356, 'indonesia', 194, 'Alamat2'),
(357, 'english', 195, 'Contact Person'),
(358, 'indonesia', 195, 'Nomor Kontak'),
(359, 'english', 196, 'City'),
(360, 'indonesia', 196, 'Kota'),
(361, 'english', 197, 'Post Code'),
(362, 'indonesia', 197, 'Kode Pos'),
(363, 'english', 198, 'Email'),
(364, 'indonesia', 198, 'Surel'),
(365, 'english', 199, 'Phone1'),
(366, 'indonesia', 199, 'Telepon1'),
(367, 'english', 200, 'Phone2'),
(368, 'indonesia', 200, 'Telepon2'),
(369, 'english', 201, 'Code'),
(370, 'indonesia', 201, 'Kode'),
(371, 'english', 202, 'Name'),
(372, 'indonesia', 202, 'Nama'),
(373, 'english', 203, 'Contact Person'),
(374, 'indonesia', 203, 'Nomor Kontak'),
(375, 'english', 204, 'Phone No1'),
(376, 'indonesia', 204, 'No Telepon1'),
(377, 'english', 205, 'Phone No2'),
(378, 'indonesia', 205, 'No Telepon2'),
(379, 'english', 206, 'Term of Payment'),
(380, 'indonesia', 206, 'Metode Pembayaran'),
(381, 'english', 207, 'Email'),
(382, 'indonesia', 207, 'Surel'),
(383, 'english', 208, 'Address1'),
(384, 'indonesia', 208, 'Alamat1'),
(385, 'english', 209, 'Address2'),
(386, 'indonesia', 209, 'Alamat2'),
(389, 'english', 211, 'Post'),
(390, 'indonesia', 211, 'Pos'),
(391, 'english', 212, 'Add Suplier'),
(392, 'indonesia', 212, 'Tambah Pemasok'),
(393, 'english', 213, 'Search Supplier Records'),
(394, 'indonesia', 213, 'Cari Data Pemasok'),
(395, 'english', 214, 'Add Brand Record'),
(396, 'indonesia', 214, 'Tambah Data Merek'),
(397, 'english', 215, 'Code'),
(398, 'indonesia', 215, 'Kode'),
(399, 'english', 216, 'Brand'),
(400, 'indonesia', 216, 'Merk'),
(401, 'english', 217, 'Add Supplier'),
(402, 'indonesia', 217, 'Tambah Pemasok'),
(403, 'english', 219, 'Code'),
(404, 'indonesia', 219, 'Kode'),
(405, 'english', 220, 'Name'),
(406, 'indonesia', 220, 'Nama'),
(407, 'english', 221, 'Contact Person'),
(408, 'indonesia', 221, 'Nomor Kontak'),
(409, 'english', 222, 'Phone1'),
(410, 'indonesia', 222, 'Telepon1'),
(411, 'english', 223, 'Phone2'),
(412, 'indonesia', 223, 'Telepon2'),
(413, 'english', 224, 'Email'),
(414, 'indonesia', 224, 'Surel'),
(415, 'english', 225, 'Address1'),
(416, 'indonesia', 225, 'Alamat1'),
(417, 'english', 226, 'City'),
(418, 'indonesia', 226, 'Kota'),
(419, 'english', 227, 'Address2'),
(420, 'indonesia', 227, 'Alamat2'),
(421, 'english', 228, 'City2'),
(422, 'indonesia', 228, 'Kota2'),
(423, 'english', 229, 'Term of Payment'),
(424, 'indonesia', 229, 'Metode Pembayaran'),
(425, 'english', 230, 'Post'),
(426, 'indonesia', 230, 'Pos'),
(427, 'english', 231, 'List Items'),
(428, 'indonesia', 231, 'Daftar Barang'),
(431, 'english', 233, 'Entry Supplier Code'),
(432, 'indonesia', 233, 'Masukan Kode Pemasok'),
(433, 'english', 234, 'Entry Name'),
(434, 'indonesia', 234, 'Silahkan Masukan Nama'),
(435, 'english', 235, 'Entry Supplier Code'),
(436, 'indonesia', 235, 'Masukan Kode Pemasok'),
(437, 'english', 236, 'Entry Brand Name'),
(438, 'indonesia', 236, 'Masukan Nama Merk'),
(439, 'english', 237, 'Entry Contact Person'),
(440, 'indonesia', 237, 'Silahkan Masukan Nomor Kontak'),
(441, 'english', 238, 'Entry Phone Number1'),
(442, 'indonesia', 238, 'Silahkan Masukan No Telepon1'),
(443, 'english', 239, 'Entry Phone Number2'),
(444, 'indonesia', 239, 'Silahkan Masukan No Telepon2'),
(445, 'english', 240, 'Entry Email'),
(446, 'indonesia', 240, 'Silahkan Masukan Surel'),
(447, 'english', 241, 'Entry Address1'),
(448, 'indonesia', 241, 'Silahkan Masukan Alamat1'),
(449, 'english', 242, 'Entry City 1'),
(450, 'indonesia', 242, 'Silahkan Masukan Kota  1'),
(451, 'english', 244, 'Entry Address 2'),
(452, 'indonesia', 244, 'Silahkan Masukan Alamat 2'),
(453, 'english', 245, 'Entry City 2'),
(454, 'indonesia', 245, 'Silahkan Masukan Kota 2'),
(455, 'english', 246, 'Entry Term of Payment'),
(456, 'indonesia', 246, 'Masukan Metode Pembayaran'),
(457, 'english', 247, 'Entry Post Code'),
(458, 'indonesia', 247, 'Masukan Kode Pos'),
(459, 'english', 249, 'Entry Name'),
(460, 'indonesia', 249, 'Silahkan Masukan Nama'),
(469, 'english', 253, 'Entry Contact Person'),
(470, 'indonesia', 253, 'Masukan Nomor Kontak'),
(471, 'english', 254, 'Entry Phone Number1'),
(472, 'indonesia', 254, 'Masukan No Telepon1'),
(473, 'english', 256, 'Entry Phone Number2'),
(474, 'indonesia', 256, 'Masukan No Telepon2'),
(475, 'english', 257, 'Entry Email'),
(476, 'indonesia', 257, 'Masukan Surel'),
(477, 'english', 258, 'Entry Term of Payment'),
(478, 'indonesia', 258, 'Masukan Metode Pembayaran'),
(479, 'english', 259, 'Entry Address1'),
(480, 'indonesia', 259, 'Silahkan Masukan Alamat1'),
(481, 'english', 260, 'Entry city1'),
(482, 'indonesia', 260, 'Silahkan Masukan Kota1'),
(483, 'english', 261, 'Entry City2'),
(484, 'indonesia', 261, 'Silahkan Masukan Kota2'),
(485, 'english', 262, 'Entry Address2'),
(486, 'indonesia', 262, 'Silahkan Masukan Alamat2'),
(487, 'english', 263, 'Entry Post Code'),
(488, 'indonesia', 263, 'Silahkan Masukan Kode Pos'),
(489, 'english', 264, 'City1'),
(490, 'indonesia', 264, 'Kota1'),
(491, 'english', 265, 'City2'),
(492, 'indonesia', 265, 'Kota2'),
(495, 'english', 267, ''),
(496, 'indonesia', 267, ''),
(497, 'english', 268, 'Po SysNo#'),
(498, 'indonesia', 268, 'Pp SisNo#'),
(499, 'english', 269, 'Date'),
(500, 'indonesia', 269, 'Dari'),
(501, 'english', 270, 'Due'),
(502, 'indonesia', 270, 'Sampai'),
(503, 'english', 271, 'Supplier'),
(504, 'indonesia', 271, 'Pemasok'),
(505, 'english', 272, 'Address'),
(506, 'indonesia', 272, 'Alamat'),
(507, 'english', 273, 'Phone'),
(508, 'indonesia', 273, 'Telepon'),
(513, 'english', 276, 'Find Supplier'),
(514, 'indonesia', 276, 'Temukan Pemasok'),
(515, 'english', 277, 'Search Supplier Records'),
(516, 'indonesia', 277, 'Cari Data Pemasok'),
(523, 'english', 281, 'Search'),
(524, 'indonesia', 281, 'Cari'),
(527, 'english', 283, 'Close Search'),
(528, 'indonesia', 283, 'Tutup Pencaharian'),
(529, 'english', 284, 'Print'),
(530, 'indonesia', 284, 'Cetak'),
(531, 'english', 285, 'Close Print'),
(532, 'indonesia', 285, 'Tutup Cetak'),
(533, 'english', 286, 'No'),
(534, 'indonesia', 286, 'No'),
(535, 'english', 287, 'Item Code'),
(536, 'indonesia', 287, 'Kode Barang'),
(537, 'english', 288, 'Description'),
(538, 'indonesia', 288, 'Deskripsi'),
(539, 'english', 289, 'Qty'),
(540, 'indonesia', 289, 'Qty'),
(541, 'english', 290, 'Unit'),
(542, 'indonesia', 290, 'Satuan'),
(543, 'english', 291, 'Unit Price'),
(544, 'indonesia', 291, 'Harga Satuan'),
(545, 'english', 292, 'Discount'),
(546, 'indonesia', 292, 'Diskon'),
(547, 'english', 293, 'Sub Total'),
(548, 'indonesia', 293, 'Sub Total'),
(549, 'english', 294, 'Entry Master Item Records'),
(550, 'indonesia', 294, 'Masukan Data Master Item'),
(553, 'english', 296, 'Item Code'),
(554, 'indonesia', 296, 'Kode Barang'),
(555, 'english', 297, 'Item Class'),
(556, 'indonesia', 297, 'Kelas Barang'),
(559, 'english', 299, 'Item Unit'),
(560, 'indonesia', 299, 'Satuan Barang'),
(561, 'english', 300, 'Item Name'),
(562, 'indonesia', 300, 'Nama Barang'),
(565, 'english', 302, 'Selling Price'),
(566, 'indonesia', 302, 'Harga Jual'),
(567, 'english', 303, 'Purchase Price'),
(568, 'indonesia', 303, 'Harga Beli'),
(569, 'english', 304, 'Supplier'),
(570, 'indonesia', 304, 'Pemasok'),
(573, 'english', 306, 'Empty Records, entry on Sales Order first!'),
(574, 'indonesia', 306, 'Data Kosong, masukan pada Pesanan Penjualan dahulu'),
(575, 'english', 307, 'Search Records'),
(576, 'indonesia', 307, 'Cari Data'),
(579, 'english', 309, 'Entry Item Name'),
(580, 'indonesia', 309, 'Masukan Nama Barang'),
(581, 'english', 310, 'Entry Item Code'),
(582, 'indonesia', 310, 'Masukan Kode Barang'),
(583, 'english', 311, 'Entry Purchase Price'),
(584, 'indonesia', 311, 'Masukan Harga Beli'),
(585, 'english', 312, 'Entry Selling Price'),
(586, 'indonesia', 312, 'Masukan Harga Jual'),
(587, 'english', 313, 'Entry Supplier Name'),
(588, 'indonesia', 313, 'Masukan Nama Pemasok'),
(591, 'english', 315, 'Action'),
(592, 'indonesia', 315, 'Aksi'),
(593, 'english', 316, 'Supplier'),
(594, 'indonesia', 316, 'Pemasok'),
(597, 'english', 318, 'F2 on Itm Code / Descp to entry new item'),
(598, 'indonesia', 318, 'F2 pd Kode Barang / Desk untk masukan barang baru'),
(603, 'english', 321, 'Transaction'),
(604, 'indonesia', 321, 'Transaksi'),
(607, 'english', 323, 'Sub Total Discount'),
(608, 'indonesia', 323, 'Sub Total Diskon'),
(613, 'english', 326, 'SubTotal Before Disc'),
(614, 'indonesia', 326, 'SubTotal Sblm Diskon'),
(615, 'english', 327, 'SubTotal After DIsc'),
(616, 'indonesia', 327, 'SubTotal Stlh Diskon'),
(619, 'english', 329, 'Search Supplier Records'),
(620, 'indonesia', 329, 'Cari Data Pemasok'),
(621, 'english', 330, 'C.Code'),
(622, 'indonesia', 330, 'Kode P.'),
(623, 'english', 331, 'Customer'),
(624, 'indonesia', 331, 'Pelanggan'),
(625, 'english', 332, 'Address'),
(626, 'indonesia', 332, 'Alamat'),
(627, 'english', 333, 'C.Code'),
(628, 'indonesia', 333, 'Kode P.'),
(629, 'english', 334, 'Customer'),
(630, 'indonesia', 334, 'Pelanggan'),
(631, 'english', 335, 'Address'),
(632, 'indonesia', 335, 'Alamat'),
(633, 'english', 336, 'Search PO Transaction Record'),
(634, 'indonesia', 336, 'Cari Data Transaksi PP'),
(635, 'english', 337, 'Supplier'),
(636, 'indonesia', 337, 'Pemasok'),
(637, 'english', 338, 'Branch'),
(638, 'indonesia', 338, 'Cabang'),
(639, 'english', 339, 'Date'),
(640, 'indonesia', 339, 'Dari'),
(641, 'english', 340, 'Due'),
(642, 'indonesia', 340, 'Sampai'),
(643, 'english', 341, 'Supplier'),
(644, 'indonesia', 341, 'Pemasok'),
(645, 'english', 342, 'Address'),
(646, 'indonesia', 342, 'Alamat'),
(647, 'english', 343, 'Phone'),
(648, 'indonesia', 343, 'Telepon'),
(649, 'english', 344, 'PURCHASE FORM'),
(650, 'indonesia', 344, 'FORM PEMBELIAN'),
(655, 'english', 347, 'Print'),
(656, 'indonesia', 347, 'Cetak'),
(657, 'english', 348, 'Close Print'),
(658, 'indonesia', 348, 'Tutup Cetak'),
(659, 'english', 349, 'Find Supplier'),
(660, 'indonesia', 349, 'Temukan Pemasok'),
(661, 'english', 350, 'Action'),
(662, 'indonesia', 350, 'Aksi'),
(663, 'english', 351, 'Supplier'),
(664, 'indonesia', 351, 'Pemasok'),
(665, 'english', 352, 'Item Code'),
(666, 'indonesia', 352, 'Kode Barang'),
(667, 'english', 353, 'Description'),
(668, 'indonesia', 353, 'Deskripsi'),
(669, 'english', 354, 'Unit'),
(670, 'indonesia', 354, 'Satuan'),
(671, 'english', 355, 'Unit Price'),
(672, 'indonesia', 355, 'Harga Satuan'),
(673, 'english', 356, 'Discount'),
(674, 'indonesia', 356, 'Diskon'),
(675, 'english', 357, 'Sales Price'),
(676, 'indonesia', 357, 'Harga Jual'),
(677, 'english', 358, 'Find Po Sysno'),
(678, 'indonesia', 358, 'Temukan PO Sysno'),
(679, 'english', 359, 'Transaction'),
(680, 'indonesia', 359, 'Transaksi'),
(681, 'english', 360, 'Transaction Detail'),
(682, 'indonesia', 360, 'Detail Transaksi'),
(683, 'english', 361, 'Sub Total Discout'),
(684, 'indonesia', 361, 'Sub Total Diskon'),
(685, 'english', 362, 'Paid'),
(686, 'indonesia', 362, 'Bayar'),
(689, 'english', 364, 'SubTotal After Disc'),
(690, 'indonesia', 364, 'SubTotal Stlh Diskon'),
(691, 'english', 365, 'SubTotal Before Disc'),
(692, 'indonesia', 365, 'SubTotal Sblm Diskon'),
(695, 'english', 367, 'Master Customer'),
(696, 'indonesia', 367, 'Master Pelanggan'),
(697, 'english', 372, 'Add New'),
(698, 'indonesia', 372, 'Tambah Baru'),
(699, 'english', 373, 'List Customer'),
(700, 'indonesia', 373, 'Daftar Pelanggan'),
(701, 'english', 374, 'Action'),
(702, 'indonesia', 374, 'Aksi'),
(703, 'english', 375, 'Code'),
(704, 'indonesia', 375, 'Kode'),
(705, 'english', 376, 'Name'),
(706, 'indonesia', 376, 'Nama'),
(711, 'english', 379, 'Address1'),
(712, 'indonesia', 379, 'Alamat1'),
(713, 'english', 380, 'Address2'),
(714, 'indonesia', 380, 'Alamat2'),
(715, 'english', 381, 'City1'),
(716, 'indonesia', 381, 'Kota1'),
(717, 'english', 382, 'City2'),
(718, 'indonesia', 382, 'Kota2'),
(719, 'english', 383, 'Phone1'),
(720, 'indonesia', 383, 'Telepon1'),
(721, 'english', 384, 'Phone2'),
(722, 'indonesia', 384, 'Telepon2'),
(723, 'english', 385, 'Email'),
(724, 'indonesia', 385, 'Surel'),
(727, 'english', 387, 'Type'),
(728, 'indonesia', 387, 'Tipe'),
(729, 'english', 388, 'Credit Max'),
(730, 'indonesia', 388, 'Kredit Max'),
(731, 'english', 389, 'Contact C'),
(732, 'indonesia', 389, 'Kontak P'),
(733, 'english', 390, 'Customer Code'),
(734, 'indonesia', 390, 'Kode Pelanggan'),
(737, 'english', 392, 'Customer Type'),
(738, 'indonesia', 392, 'Tipe Pelanggan'),
(739, 'english', 393, 'Company'),
(740, 'indonesia', 393, 'Perusahaan'),
(741, 'english', 394, 'Professional'),
(742, 'indonesia', 394, 'Profesional'),
(743, 'english', 395, 'Customer Name'),
(744, 'indonesia', 395, 'Nama Pelanggan'),
(745, 'english', 396, 'Contact Person'),
(746, 'indonesia', 396, 'Nomor Kontak'),
(749, 'english', 398, 'Phone No2'),
(750, 'indonesia', 398, 'No Telepon2'),
(751, 'english', 399, 'Phone No1'),
(752, 'indonesia', 399, 'No Telepon1'),
(753, 'english', 400, 'Email'),
(754, 'indonesia', 400, 'Surel'),
(755, 'english', 401, 'Maximum Credit'),
(756, 'indonesia', 401, 'Kredit Maksimum'),
(757, 'english', 402, 'Term of Payment'),
(758, 'indonesia', 402, 'Metode Pembayaran'),
(759, 'english', 403, 'Address1'),
(760, 'indonesia', 403, 'Alamat1'),
(761, 'english', 404, 'Address2'),
(762, 'indonesia', 404, 'Alamat2'),
(763, 'english', 405, 'City1'),
(764, 'indonesia', 405, 'Kota1'),
(765, 'english', 406, 'City2'),
(766, 'indonesia', 406, 'Kota2'),
(767, 'english', 407, 'Area'),
(768, 'indonesia', 407, 'Daerah'),
(769, 'english', 408, 'Day'),
(770, 'indonesia', 408, 'Hari'),
(771, 'english', 409, 'Entry Customer Code'),
(772, 'indonesia', 409, 'Masukan Kode Pelanggan'),
(773, 'english', 410, 'Customer Name'),
(774, 'indonesia', 410, 'Nama Pelanggan'),
(775, 'english', 411, 'Entry Contact Person'),
(776, 'indonesia', 411, 'Masukan Nomor Kontak'),
(777, 'english', 412, 'Entry Phone No1'),
(778, 'indonesia', 412, 'Masukan No Telepon1'),
(779, 'english', 413, 'Entry Phone No2'),
(780, 'indonesia', 413, 'Masukan No Telepon2'),
(781, 'english', 414, 'Entry Fax No'),
(782, 'indonesia', 414, 'Masukan No Fax'),
(783, 'english', 415, 'Entry Email'),
(784, 'indonesia', 415, 'Masukan Alamat Surel'),
(785, 'english', 416, 'Entry Term of Payment'),
(786, 'indonesia', 416, 'Masukan Metode Pembayaran'),
(789, 'english', 418, 'Entry Address1'),
(790, 'indonesia', 418, 'Masukan Alamat1'),
(791, 'english', 419, 'Entry Address2'),
(792, 'indonesia', 419, 'Masukan Alamat2'),
(793, 'english', 420, 'Entry City1'),
(794, 'indonesia', 420, 'Masukan Kota1'),
(795, 'english', 421, 'Entry City2'),
(796, 'indonesia', 421, 'Masukan Kota2'),
(797, 'english', 422, 'Entry Area'),
(798, 'indonesia', 422, 'Masukan Daerah'),
(799, 'english', 423, 'Production Register'),
(800, 'indonesia', 423, 'Daftar Produksi'),
(805, 'english', 426, 'Reload'),
(806, 'indonesia', 426, 'Memuat Ulang'),
(807, 'english', 427, 'Print Preview'),
(808, 'indonesia', 427, 'Preview Cetak'),
(809, 'english', 428, 'Close Preview'),
(810, 'indonesia', 428, 'Tutup Preview'),
(811, 'english', 429, 'Export Data'),
(812, 'indonesia', 429, 'Ekspor Data'),
(813, 'english', 430, 'Global Search Here'),
(814, 'indonesia', 430, 'Pencarian Global Disini'),
(815, 'english', 431, 'Customer Name'),
(816, 'indonesia', 431, 'Nama Pelanggan'),
(817, 'english', 432, 'Customer Code'),
(818, 'indonesia', 432, 'Kode Pelanggan'),
(819, 'english', 433, 'Action'),
(820, 'indonesia', 433, 'Aksi'),
(821, 'english', 434, 'ID Type'),
(822, 'indonesia', 434, 'Tipe ID'),
(823, 'english', 435, 'ID No'),
(824, 'indonesia', 435, 'No ID'),
(825, 'english', 436, 'Address'),
(826, 'indonesia', 436, 'Alamat'),
(827, 'english', 437, 'Dealer Refcode'),
(828, 'indonesia', 437, 'Kode Ref Dealer'),
(829, 'english', 438, 'Prod Date'),
(830, 'indonesia', 438, 'Tanggal Prod'),
(835, 'english', 441, 'Prod Items'),
(836, 'indonesia', 441, '	Barang Prod'),
(837, 'english', 442, 'Item Description'),
(838, 'indonesia', 442, 'Deskripsi Barang'),
(839, 'english', 443, 'Production Qty'),
(840, 'indonesia', 443, 'Qty Produksi'),
(843, 'english', 445, 'Prod Memo'),
(844, 'indonesia', 445, 'Memo Prod'),
(847, 'english', 448, 'PRODUCTION'),
(848, 'indonesia', 448, 'PRODUKSI'),
(849, 'english', 449, 'Search Production Records'),
(850, 'indonesia', 449, 'Cari Data Produksi'),
(853, 'english', 451, 'Date'),
(854, 'indonesia', 451, 'Tanggal'),
(857, 'english', 453, 'Search Item Records'),
(858, 'indonesia', 453, 'Cari Data Barang'),
(859, 'english', 454, 'Item Code'),
(860, 'indonesia', 454, 'Kode Barang'),
(861, 'english', 455, 'Item Name'),
(862, 'indonesia', 455, 'Nama Barang'),
(863, 'english', 456, 'Item Group'),
(864, 'indonesia', 456, 'Grup Barang'),
(867, 'english', 458, 'Selling Price'),
(868, 'indonesia', 458, 'Harga Jual'),
(869, 'english', 459, 'Min Stock'),
(870, 'indonesia', 459, 'Stok Min'),
(871, 'english', 460, 'Find Production Item Code'),
(872, 'indonesia', 460, 'Temukan Kode Barang Produksi'),
(873, 'english', 461, 'Item Code'),
(874, 'indonesia', 461, 'Kode Barang'),
(875, 'english', 462, 'Description'),
(876, 'indonesia', 462, 'Deskripsi'),
(877, 'english', 463, 'Supply'),
(878, 'indonesia', 463, 'Pasokan'),
(879, 'english', 464, 'Unit'),
(880, 'indonesia', 464, 'Satuan'),
(881, 'english', 465, 'Unit Price'),
(882, 'indonesia', 465, 'Harga Satuan'),
(889, 'english', 469, 'SERVICE'),
(890, 'indonesia', 469, 'PELAYANAN'),
(897, 'english', 473, 'SERVICE ORDER'),
(898, 'indonesia', 473, 'PESANAN PELAYANAN'),
(901, 'english', 475, 'Term Date'),
(902, 'indonesia', 475, 'Term Dari'),
(905, 'english', 477, 'Due'),
(906, 'indonesia', 477, 'Smpai'),
(907, 'english', 478, 'Trans. Type'),
(908, 'indonesia', 478, 'Tipe Trans.'),
(909, 'english', 479, 'SO Date'),
(910, 'indonesia', 479, 'Tanggal SO'),
(911, 'english', 480, 'Customer'),
(912, 'indonesia', 480, 'Pelanggan'),
(913, 'english', 481, 'Address'),
(914, 'indonesia', 481, 'Alamat'),
(915, 'english', 482, 'Print'),
(916, 'indonesia', 482, 'Cetak'),
(917, 'english', 483, 'Close Print'),
(918, 'indonesia', 483, 'Tutup Cetak'),
(919, 'english', 484, 'Item Code'),
(920, 'indonesia', 484, 'Kode Barang'),
(921, 'english', 485, 'Description'),
(922, 'indonesia', 485, 'Deskripsi'),
(923, 'english', 486, 'Unit'),
(924, 'indonesia', 486, 'Satuan'),
(925, 'english', 487, 'Unit Price'),
(926, 'indonesia', 487, 'Harga Satuan'),
(927, 'english', 488, 'Discount'),
(928, 'indonesia', 488, 'Diskon'),
(929, 'english', 489, 'Customer'),
(930, 'indonesia', 489, 'Pelanggan'),
(931, 'english', 490, 'Sales Person'),
(932, 'indonesia', 490, 'Pramuniaga'),
(933, 'english', 491, 'Address'),
(934, 'indonesia', 491, 'Alamat'),
(935, 'english', 492, 'Transaction#'),
(936, 'indonesia', 492, 'Transaksi'),
(937, 'english', 493, 'Sub Total Discount'),
(938, 'indonesia', 493, 'Sub Total Diskon'),
(939, 'english', 494, 'Print'),
(940, 'indonesia', 494, 'Cetak'),
(941, 'english', 495, 'Close Print'),
(942, 'indonesia', 495, 'Tutup Cetak'),
(943, 'english', 496, 'SubTotal Before Disc'),
(944, 'indonesia', 496, 'SubTotal Sblm Disk'),
(945, 'english', 497, 'SubTotal After Disc'),
(946, 'indonesia', 497, 'SubTotal Stlh Disk'),
(949, 'english', 499, 'Search Customer Records'),
(950, 'indonesia', 499, 'Cari Data Pelanggan'),
(955, 'english', 502, 'Customer'),
(956, 'indonesia', 502, 'Pelanggan'),
(957, 'english', 503, 'Address'),
(958, 'indonesia', 503, 'Alamat'),
(961, 'english', 505, 'Customer'),
(962, 'indonesia', 505, 'Pelanggan'),
(963, 'english', 506, 'C.Cod'),
(964, 'indonesia', 506, 'Kode P.'),
(965, 'english', 507, 'Branch'),
(966, 'indonesia', 507, 'Cabang'),
(967, 'english', 508, 'Search Customer Records'),
(968, 'indonesia', 508, 'Cari Data Pelanggan'),
(969, 'english', 509, 'Address'),
(970, 'indonesia', 509, 'Alamat'),
(971, 'english', 510, 'Find Customer'),
(972, 'indonesia', 510, 'Temukan Pelanggan'),
(973, 'english', 511, 'Item Code'),
(974, 'indonesia', 511, 'Kode Barang'),
(975, 'english', 512, 'Description'),
(976, 'indonesia', 512, 'Deskripsi'),
(977, 'english', 513, 'Unit'),
(978, 'indonesia', 513, 'Satuan'),
(979, 'english', 514, 'Unit Price'),
(980, 'indonesia', 514, 'Harga Satuan'),
(981, 'english', 515, 'Discount'),
(982, 'indonesia', 515, 'Diskon'),
(983, 'english', 516, 'Credit'),
(984, 'indonesia', 516, 'Kredit'),
(985, 'english', 517, 'Sales Person'),
(986, 'indonesia', 517, 'Pramuniaga'),
(987, 'english', 519, 'Transaction'),
(988, 'indonesia', 519, 'Transaksi'),
(991, 'english', 521, 'Sub Total Before Disc'),
(992, 'indonesia', 521, 'Sub Total Sblm Diskon'),
(993, 'english', 522, 'Sub Total After DIsc'),
(994, 'indonesia', 522, 'Sub Total Stlh Diskon'),
(995, 'english', 523, 'Sub Total Discount'),
(996, 'indonesia', 523, 'Sub Total Diskon'),
(999, 'english', 525, 'Reload'),
(1000, 'indonesia', 525, 'Memuat Ulang'),
(1001, 'english', 526, 'Print Preview'),
(1002, 'indonesia', 526, 'Preview Cetak'),
(1003, 'english', 527, 'Close Preview'),
(1004, 'indonesia', 527, 'Tutup Preview'),
(1005, 'english', 528, 'Export Register'),
(1006, 'indonesia', 528, 'Ekspor Regristrasi'),
(1007, 'english', 529, 'Delivery PO'),
(1008, 'indonesia', 529, 'Pengiriman PO'),
(1009, 'english', 530, 'Supplier'),
(1010, 'indonesia', 530, 'Pemasok'),
(1011, 'english', 531, 'Discount'),
(1012, 'indonesia', 531, 'Diskon'),
(1013, 'english', 532, 'Find SO Docno'),
(1014, 'indonesia', 532, 'Temukan SO Docno'),
(1015, 'english', 533, 'Find Customer'),
(1016, 'indonesia', 533, 'Temukan Pelanggan'),
(1017, 'english', 534, 'Reload'),
(1018, 'indonesia', 534, 'Memuat Ulang'),
(1019, 'english', 535, 'Print Preview'),
(1020, 'indonesia', 535, 'Preview Cetak'),
(1021, 'english', 536, 'Close Preview'),
(1022, 'indonesia', 536, 'Tutup Cetak'),
(1023, 'english', 537, 'Export Regrister'),
(1024, 'indonesia', 537, 'Ekspor Regristrasi'),
(1025, 'english', 538, 'List Items'),
(1026, 'indonesia', 538, 'Daftar Barang'),
(1029, 'english', 540, 'Bill Name'),
(1030, 'indonesia', 540, 'Nama Bill'),
(1031, 'english', 541, 'Discount'),
(1032, 'indonesia', 541, 'Diskon'),
(1033, 'english', 542, 'Payment'),
(1034, 'indonesia', 542, 'Pembayaran'),
(1035, 'english', 543, 'Vat Name'),
(1036, 'indonesia', 543, 'Nama Vat'),
(1037, 'english', 544, 'Purchase Register'),
(1038, 'indonesia', 544, 'Registrasi Pembelian'),
(1039, 'english', 545, 'Service Register'),
(1040, 'indonesia', 545, 'Registrasi Pelayanan'),
(1041, 'english', 546, 'Inventory Opnum'),
(1042, 'indonesia', 546, 'Inventaris Opnum'),
(1043, 'english', 547, 'List Items'),
(1044, 'indonesia', 547, 'Daftar Barang'),
(1045, 'english', 548, 'Item Code'),
(1046, 'indonesia', 548, 'Kode Barang'),
(1047, 'english', 549, 'Item Name'),
(1048, 'indonesia', 549, 'Nama Barang'),
(1049, 'english', 550, 'Item Group'),
(1050, 'indonesia', 550, 'Grup Barang'),
(1051, 'english', 551, 'Brand'),
(1052, 'indonesia', 551, 'Merk'),
(1053, 'english', 552, 'Unit'),
(1054, 'indonesia', 552, 'Satuan'),
(1055, 'english', 553, 'Branch'),
(1056, 'indonesia', 553, 'Cabang'),
(1057, 'english', 554, 'Stock'),
(1058, 'indonesia', 554, 'Stok'),
(1059, 'english', 555, 'Counted'),
(1060, 'indonesia', 555, 'Terhitung'),
(1063, 'english', 557, 'Action'),
(1064, 'indonesia', 557, 'Aksi'),
(1067, 'english', 559, 'Production DocNo'),
(1068, 'indonesia', 559, 'DocNo Produksi'),
(1069, 'english', 560, 'Production SysNo'),
(1070, 'indonesia', 560, 'SysNo Produksi'),
(1071, 'english', 561, 'Production Memo'),
(1072, 'indonesia', 561, 'Memo Produksi'),
(1073, 'english', 562, 'Production Date'),
(1074, 'indonesia', 562, 'Tanggal Produksi'),
(1075, 'english', 563, 'Inv Date'),
(1076, 'indonesia', 563, 'Tanggal Inv'),
(1077, 'english', 564, 'Bill Name'),
(1078, 'indonesia', 564, 'Nama Bill'),
(1085, 'english', 569, 'ASSETS'),
(1086, 'indonesia', 569, 'HARTA'),
(1089, 'english', 571, 'ASSETS CHART OF ACCOUNT'),
(1090, 'indonesia', 571, 'BAGAN AKUN HARTA'),
(1091, 'english', 573, 'LIABILITY'),
(1092, 'indonesia', 573, 'KEWAJIBAN'),
(1093, 'english', 574, 'EQUITY'),
(1094, 'indonesia', 574, 'EKUITAS'),
(1095, 'english', 575, 'LIABILITY CHART OF ACCOUNT'),
(1096, 'indonesia', 575, 'BAGAN AKUN KEWAJIBAN'),
(1097, 'english', 576, 'EQUITY CHART OF ACCOUNT'),
(1098, 'indonesia', 576, 'BAGAN AKUN EKUITAS'),
(1101, 'english', 578, 'Account Group'),
(1102, 'indonesia', 578, 'Kelompok Akun'),
(1103, 'english', 579, 'Sub Group'),
(1104, 'indonesia', 579, 'Sub Kelompok'),
(1105, 'english', 580, 'Account Type'),
(1106, 'indonesia', 580, 'Tipe Akun'),
(1107, 'english', 581, 'Header Account'),
(1108, 'indonesia', 581, 'Header Akun'),
(1111, 'english', 583, 'Detail Account'),
(1112, 'indonesia', 583, 'Akun Detail'),
(1113, 'english', 584, 'Payment Account Details'),
(1114, 'indonesia', 584, 'Akun Pembayaran Detail'),
(1117, 'english', 586, 'Account Number'),
(1118, 'indonesia', 586, 'Nomor Akun'),
(1119, 'english', 587, 'Account Name'),
(1120, 'indonesia', 587, 'Nama Akun'),
(1121, 'english', 588, 'Opening Balance'),
(1122, 'indonesia', 588, 'Saldo Awal'),
(1123, 'english', 589, 'Print'),
(1124, 'indonesia', 589, 'Cetak'),
(1125, 'english', 590, 'Delete'),
(1126, 'indonesia', 590, 'Hapus'),
(1127, 'english', 591, 'Reset'),
(1128, 'indonesia', 591, 'Reset'),
(1129, 'english', 592, 'Reload'),
(1130, 'indonesia', 592, 'Memuat Ulang'),
(1133, 'english', 594, 'List Items'),
(1134, 'indonesia', 594, 'Daftar Barang'),
(1135, 'english', 595, 'Print Preview'),
(1136, 'indonesia', 595, 'Preview Cetak'),
(1137, 'english', 595, 'Print Preview'),
(1138, 'indonesia', 595, 'Preview Cetak'),
(1139, 'english', 596, 'Close Preview'),
(1140, 'indonesia', 596, 'Tutup Preview'),
(1141, 'english', 597, 'Export Register'),
(1142, 'indonesia', 597, 'Ekspor Daftar'),
(1143, 'english', 598, 'Production SysNo'),
(1144, 'indonesia', 598, 'SysNo Produksi'),
(1145, 'english', 599, 'Production Date'),
(1146, 'indonesia', 599, 'Tanggal Produksi'),
(1147, 'english', 600, 'Production DocNo'),
(1148, 'indonesia', 600, 'DocNo Produksi'),
(1149, 'english', 601, 'Item Code'),
(1150, 'indonesia', 601, 'Kode Barang'),
(1151, 'english', 602, 'Item Name'),
(1152, 'indonesia', 602, 'Nama Barang'),
(1153, 'english', 603, 'Production Qty'),
(1154, 'indonesia', 603, 'Qty Produksi'),
(1155, 'english', 604, 'Production Memo'),
(1156, 'indonesia', 604, 'Memo Produksi'),
(1157, 'english', 605, 'Global search here'),
(1158, 'indonesia', 605, 'Pencarian global disini'),
(1163, 'english', 608, 'Inventory Detail'),
(1164, 'indonesia', 608, 'Detail Inventaris'),
(1165, 'english', 609, 'List Items'),
(1166, 'indonesia', 609, 'Daftar Barang'),
(1167, 'english', 610, 'Global search here'),
(1168, 'indonesia', 610, 'Pencarian global disini'),
(1171, 'english', 612, 'Item Code'),
(1172, 'indonesia', 612, 'Kode Barang'),
(1173, 'english', 613, 'Item Name'),
(1174, 'indonesia', 613, 'Nama Barang'),
(1175, 'english', 614, 'Item Group'),
(1176, 'indonesia', 614, 'Grup Barang'),
(1177, 'english', 615, 'Brand'),
(1178, 'indonesia', 615, 'Merk'),
(1179, 'english', 616, 'Sales Unit'),
(1180, 'indonesia', 616, 'Satuan Penjualan'),
(1183, 'english', 618, 'Sales Price'),
(1184, 'indonesia', 618, 'Harga Jual'),
(1185, 'english', 619, 'Branch'),
(1186, 'indonesia', 619, 'Cabang'),
(1187, 'english', 620, 'Stock'),
(1188, 'indonesia', 620, 'Stok'),
(1189, 'english', 621, 'Allocations'),
(1190, 'indonesia', 621, 'Alokasi'),
(1191, 'english', 622, 'Available'),
(1192, 'indonesia', 622, 'Ketersediaan'),
(1197, 'english', 625, 'Inventory Items'),
(1198, 'indonesia', 625, 'Barang Inventaris'),
(1199, 'english', 626, 'list Items'),
(1200, 'indonesia', 626, 'Daftar Barang'),
(1201, 'english', 627, 'Item Code'),
(1202, 'indonesia', 627, 'Kode Barang'),
(1203, 'english', 628, 'Item Name'),
(1204, 'indonesia', 628, 'Nama Barang'),
(1205, 'english', 629, 'Item Group'),
(1206, 'indonesia', 629, 'Grup Barang'),
(1207, 'english', 630, 'Brand'),
(1208, 'indonesia', 630, 'Merk'),
(1211, 'english', 632, 'Selling Price'),
(1212, 'indonesia', 632, 'Harga Jual'),
(1213, 'english', 633, 'Buy Price'),
(1214, 'indonesia', 633, 'Harga Beli'),
(1215, 'english', 634, 'Supplier'),
(1216, 'indonesia', 634, 'Pemasok'),
(1219, 'english', 636, 'Raw Material Used'),
(1220, 'indonesia', 636, 'Bahan Baku Yang Dipakai'),
(1221, 'english', 637, 'Min Stock'),
(1222, 'indonesia', 637, 'Stok Min'),
(1223, 'english', 638, 'Sale Unit'),
(1224, 'indonesia', 638, 'Satuan Penjualan'),
(1225, 'english', 639, 'Min Stock'),
(1226, 'indonesia', 639, 'Stok Min'),
(1229, 'english', 642, 'INCOME CHART OF ACCOUNT'),
(1230, 'indonesia', 642, 'BAGAN AKUN PENDAPATAN'),
(1231, 'english', 643, 'INCOME'),
(1232, 'indonesia', 643, 'PENDAPATAN'),
(1233, 'english', 644, 'SERVICE EXPENSE'),
(1234, 'indonesia', 644, 'BIAYA PELAYANAN'),
(1235, 'english', 645, 'SERVICE EXPENSE CHART OF ACCOUNT'),
(1236, 'indonesia', 645, 'BAGAN AKUN BIAYA PELAYANAN'),
(1237, 'english', 646, 'EXPENSE'),
(1238, 'indonesia', 646, 'BIAYA'),
(1239, 'english', 647, 'EXPENSE CHART OF ACCOUNT'),
(1240, 'indonesia', 647, 'BAGAN AKUN BIAYA'),
(1243, 'english', 649, 'OTHER INCOME'),
(1244, 'indonesia', 649, 'PENERIMAAN LAIN'),
(1245, 'english', 650, 'OTHER INCOME CHART OF ACCOUNT'),
(1246, 'indonesia', 650, 'BAGAN AKUN PENERIMAAN LAIN'),
(1249, 'english', 652, 'OTHER EXPENSE'),
(1250, 'indonesia', 652, 'BIAYA LAIN'),
(1251, 'english', 653, 'OTHER EXPENSE CHART OF ACCOUNT'),
(1252, 'indonesia', 653, 'BAGAN AKUN BIAYA LAIN'),
(1253, 'english', 654, 'Unbalance'),
(1254, 'indonesia', 654, 'Selisih'),
(1255, 'english', 655, 'Production Journal'),
(1256, 'indonesia', 655, 'Jurnal Produski'),
(1259, 'english', 657, 'Service Register'),
(1260, 'indonesia', 657, 'Daftar Pelayanan'),
(1263, 'english', 659, 'Purchase Register'),
(1264, 'indonesia', 659, 'Daftar Pembelian'),
(1265, 'english', 660, 'PURCHASE ORDER'),
(1266, 'indonesia', 660, 'ORDER PEMBELIAN'),
(1267, 'english', 661, 'Counted'),
(1268, 'indonesia', 661, 'Terhitung'),
(1269, 'english', 662, 'Master Equipment'),
(1270, 'indonesia', 662, 'Master Inventaris'),
(1271, 'english', 663, 'Budget Account'),
(1272, 'indonesia', 663, 'Rekening Anggaran'),
(1273, 'english', 664, 'Equipment Procurement'),
(1274, 'indonesia', 664, 'Pengadaan Inventaris'),
(1275, 'english', 665, 'Equipment Depreciation'),
(1276, 'indonesia', 665, 'Penyusutan Inventaris'),
(1277, 'english', 666, 'Inventory'),
(1278, 'indonesia', 666, 'Persediaan'),
(1283, 'english', 670, 'Acc Budget'),
(1284, 'indonesia', 670, 'Rek Anggaran'),
(1285, 'english', 671, 'Entry Budget Account'),
(1286, 'indonesia', 671, 'Input Rekening Anggaran'),
(1287, 'english', 672, 'Search Budget Account'),
(1288, 'indonesia', 672, 'Cari Data Anggaran'),
(1289, 'english', 673, 'Budget Code'),
(1290, 'indonesia', 673, 'Kode Rekening'),
(1291, 'english', 674, 'Budget Description'),
(1292, 'indonesia', 674, 'Uraian Anggaran'),
(1293, 'english', 675, 'Budget Amount'),
(1294, 'indonesia', 675, 'Nilai Anggaran'),
(1295, 'english', 676, '<br>Retailing'),
(1296, 'indonesia', 675, '<br>Retailing'),
(1297, 'english', 677, 'Budget Description'),
(1298, 'indonesia', 677, 'Deskrispi Anggaran'),
(1299, 'english', 678, 'Budget Account'),
(1300, 'indonesia', 678, 'Nomor Rekening'),
(1303, 'english', 680, 'ACCOUNT'),
(1304, 'indonesia', 680, 'KODE'),
(1305, 'english', 681, 'DESCRIPTIONS'),
(1306, 'indonesia', 681, 'URAIAN'),
(1309, 'english', 683, 'BUDGET'),
(1310, 'indonesia', 683, 'ANGGARAN'),
(1311, 'english', 684, 'Acc Budget'),
(1312, 'indonesia', 684, 'Anggaran'),
(1313, 'english', 685, 'Entry Acc Budget'),
(1314, 'indonesia', 685, 'Input Rekening Anggaran'),
(1315, 'indonesia', 676, '<br>Retailing'),
(1316, 'english', 686, 'Master Equipment'),
(1317, 'indonesia', 686, 'Master Inventaris'),
(1318, 'english', 687, 'Add'),
(1319, 'indonesia', 687, 'Tambahkan'),
(1320, 'english', 688, 'Master Equipment'),
(1321, 'indonesia', 688, 'Master Inventaris'),
(1322, 'english', 689, 'Equipment Code'),
(1323, 'indonesia', 689, 'Code Inventaris'),
(1324, 'english', 690, 'Equipment Name'),
(1325, 'indonesia', 690, 'Nama Inventaris'),
(1326, 'english', 691, 'Brand'),
(1327, 'indonesia', 691, 'Merk'),
(1328, 'english', 692, 'GROUP'),
(1329, 'indonesia', 692, 'GRUP'),
(1330, 'english', 693, 'Economic Life'),
(1331, 'indonesia', 693, 'Umur Ekonomis'),
(1332, 'english', 694, 'Production Date'),
(1333, 'indonesia', 694, 'Tahun Pembuatan'),
(1334, 'english', 695, 'Assambly Date'),
(1335, 'indonesia', 695, 'Tahun Perakitan'),
(1336, 'english', 696, 'Color'),
(1337, 'indonesia', 696, 'Warna'),
(1338, 'english', 697, 'Inggridient'),
(1339, 'indonesia', 697, 'Bahan'),
(1340, 'english', 698, 'Add Brand'),
(1341, 'indonesia', 698, 'Tambahkan Merk'),
(1342, 'english', 699, 'Equipment Data'),
(1343, 'indonesia', 699, 'Data Inventaris'),
(1344, 'english', 700, 'Search Brand'),
(1345, 'indonesia', 700, 'Cari Merk'),
(1346, 'english', 701, 'Action'),
(1347, 'indonesia', 701, 'Aksi'),
(1348, 'english', 702, 'Brand Code'),
(1349, 'indonesia', 702, 'Code Merk'),
(1350, 'english', 703, 'Brand Name'),
(1351, 'indonesia', 703, 'Nama Merk'),
(1352, 'english', 704, 'Entry Equipment Name'),
(1353, 'indonesia', 704, 'Masukan Nama Inventaris'),
(1356, 'english', 706, 'Entry Brand Code'),
(1357, 'indonesia', 706, 'Masukan Kode Barang'),
(1358, 'english', 707, 'Brand Name'),
(1359, 'indonesia', 707, 'Nama Merk'),
(1364, 'english', 710, 'RETAILING'),
(1365, 'indonesia', 710, 'RETAIL'),
(1366, 'english', 711, 'Retailing Date'),
(1367, 'indonesia', 711, 'Tanggal Retail'),
(1372, 'english', 714, 'Retail Items'),
(1373, 'indonesia', 714, 'Barang Ritel'),
(1374, 'english', 715, 'Retail Description'),
(1375, 'indonesia', 715, 'Diskripsi Ritel'),
(1376, 'english', 716, 'Retail Qty'),
(1377, 'indonesia', 716, 'Qty Ritel'),
(1378, 'english', 717, 'Retail Memo'),
(1379, 'indonesia', 717, 'Memo Ritel'),
(1380, 'english', 718, 'Search Retail Records'),
(1381, 'indonesia', 718, 'Cari Data Ritel'),
(1382, 'english', 719, 'Date'),
(1383, 'indonesia', 719, 'Tanggal'),
(1384, 'english', 720, 'Search Items Record'),
(1385, 'indonesia', 720, 'Cari Data Barang'),
(1386, 'english', 721, 'Item Code'),
(1387, 'indonesia', 721, 'Kode Barang'),
(1388, 'english', 722, 'Item Name'),
(1389, 'indonesia', 722, 'Nama Barang'),
(1390, 'english', 723, 'Item Group'),
(1391, 'indonesia', 723, 'Grup Barang'),
(1392, 'english', 724, 'Retail Price'),
(1393, 'indonesia', 724, 'Harga Retail'),
(1394, 'english', 725, 'Selling Price'),
(1395, 'indonesia', 725, 'Harga Jual'),
(1396, 'english', 726, 'Min Stock'),
(1397, 'indonesia', 726, 'Stok Min'),
(1398, 'english', 727, 'Raw Material Used'),
(1399, 'indonesia', 727, 'Bahan Baku Yang Dipakai'),
(1400, 'english', 728, 'Item Code'),
(1401, 'indonesia', 728, 'Kode Barang'),
(1402, 'english', 729, 'Description'),
(1403, 'indonesia', 729, 'Deskripsi'),
(1406, 'english', 731, 'Supply'),
(1407, 'indonesia', 731, 'Pasokan'),
(1408, 'english', 732, 'Unit'),
(1409, 'indonesia', 732, 'Satuan'),
(1410, 'english', 733, 'Unit Price'),
(1411, 'indonesia', 733, 'Harga Satuan'),
(1412, 'english', 734, 'Find Retailing Item Code'),
(1413, 'indonesia', 734, 'Temukan Kode Barang Retail'),
(1414, 'english', 736, 'Item Name'),
(1415, 'indonesia', 736, 'Nama Barang'),
(1416, 'english', 737, 'Retail Qty'),
(1417, 'indonesia', 737, 'Qty Ritel'),
(1418, 'english', 738, 'Retail Memo'),
(1419, 'indonesia', 738, 'Memo Ritel'),
(1420, 'english', 739, 'Retail Date'),
(1421, 'indonesia', 739, 'Tanggal Ritel'),
(1422, 'english', 740, 'Action'),
(1423, 'indonesia', 740, 'Aksi'),
(1424, 'english', 741, 'Retail SysNo'),
(1425, 'indonesia', 741, 'Ritel SysNo'),
(1426, 'english', 742, 'Retail DocNo'),
(1427, 'indonesia', 742, 'Ritel DocNo'),
(1428, 'english', 743, 'EQUIPMENT PROCUREMENT'),
(1429, 'indonesia', 743, 'PENGADAAN INVENTARIS'),
(1430, 'english', 744, 'EP DATE'),
(1431, 'indonesia', 744, 'TANGGAL EP'),
(1432, 'english', 745, 'Date SPK'),
(1433, 'indonesia', 745, 'Tanggal SPK'),
(1434, 'english', 746, 'Acc Budget'),
(1435, 'indonesia', 746, 'Rek Anggaran'),
(1436, 'english', 747, 'Supplier'),
(1437, 'indonesia', 747, 'Pemasok'),
(1438, 'english', 748, 'Find Supplier'),
(1439, 'indonesia', 748, 'Temukan Pemasok'),
(1440, 'english', 749, 'Address'),
(1441, 'indonesia', 749, 'Alamat'),
(1444, 'english', 751, 'Print'),
(1445, 'indonesia', 751, 'Cetak'),
(1446, 'english', 752, 'Close Print'),
(1447, 'indonesia', 752, 'Tutup Cetak'),
(1448, 'english', 753, 'Search Budget Account'),
(1449, 'indonesia', 753, 'Cari Data Anggaran'),
(1450, 'english', 754, 'Search Budget Account'),
(1451, 'indonesia', 754, 'Cari Data Rekening'),
(1452, 'english', 755, 'Search Budget Account'),
(1453, 'indonesia', 755, 'Cari Data Anggaran'),
(1462, 'english', 760, 'Search Supplier Records'),
(1463, 'indonesia', 760, 'Cari Data Pemasok'),
(1466, 'english', 762, 'Supplier Code'),
(1467, 'indonesia', 762, 'Kode Pemasok'),
(1468, 'english', 764, 'Supplier'),
(1469, 'indonesia', 764, 'Pemasok'),
(1470, 'english', 765, 'Address'),
(1471, 'indonesia', 765, 'Alamat'),
(1472, 'english', 766, 'Budget Code'),
(1473, 'indonesia', 766, 'Kode Rekening'),
(1474, 'english', 767, 'Budget Description'),
(1475, 'indonesia', 767, 'Uraian Anggaran'),
(1476, 'english', 768, 'Budget Ammount'),
(1477, 'indonesia', 768, 'Jumlah Anggaran'),
(1478, 'english', 770, 'Item Code'),
(1479, 'indonesia', 770, 'Kode Barang'),
(1480, 'english', 771, 'Description'),
(1481, 'indonesia', 771, 'Deskripsi'),
(1482, 'english', 772, 'Unit'),
(1483, 'indonesia', 772, 'Satuan'),
(1484, 'english', 773, 'Unit Price'),
(1485, 'indonesia', 773, 'Harga Satuan'),
(1488, 'english', 779, 'Discount'),
(1489, 'indonesia', 779, 'Diskon'),
(1490, 'english', 780, 'SPK Date'),
(1491, 'indonesia', 780, 'Tanggal SPK'),
(1492, 'english', 781, 'Action'),
(1493, 'indonesia', 781, 'Aksi'),
(1494, 'english', 782, 'Budget Year'),
(1495, 'indonesia', 782, 'Tahun Anggaran'),
(1496, 'english', 783, 'Budget'),
(1497, 'indonesia', 783, 'Anggaran'),
(1498, 'english', 784, 'Branch'),
(1499, 'indonesia', 784, 'Cabang'),
(1500, 'english', 785, 'Partner'),
(1501, 'indonesia', 785, 'Rekanan'),
(1502, 'english', 786, 'Entry Budget Account'),
(1503, 'indonesia', 786, 'Input Rekening Anggaran'),
(1504, 'english', 787, 'Transaction'),
(1505, 'indonesia', 787, 'Transaksi'),
(1506, 'english', 788, 'F2 on Itm Code / Descp to entry new item'),
(1507, 'indonesia', 788, ' F2 pd Kode Barang / Desk untk masukan barang baru'),
(1510, 'english', 790, 'Sub Total Discount'),
(1511, 'indonesia', 790, 'Sub Total Diskon'),
(1512, 'english', 791, 'SubTotal Before Disc'),
(1513, 'indonesia', 791, 'SubTotal Sblm Diskon'),
(1514, 'english', 792, 'SubTotal After Disc'),
(1515, 'indonesia', 792, 'SubTotal Stlh Diskon'),
(1516, 'english', 793, 'JOURNAL ENTRY'),
(1517, 'indonesia', 793, 'ENTRI JURNAL'),
(1520, 'english', 795, 'Journal Date'),
(1521, 'indonesia', 795, 'Tanggal Jurnal'),
(1522, 'english', 796, 'Account Number'),
(1523, 'indonesia', 796, 'Nomor Akun'),
(1524, 'english', 797, 'Account Name'),
(1525, 'indonesia', 797, 'Nama Akun'),
(1526, 'english', 798, 'Credit'),
(1527, 'indonesia', 798, 'Kredit'),
(1528, 'english', 799, 'Action'),
(1529, 'indonesia', 799, 'Aksi'),
(1530, 'english', 800, 'Journal SysNo'),
(1531, 'indonesia', 800, 'SysNo Jurnal'),
(1532, 'english', 801, 'Journal DocNo'),
(1533, 'indonesia', 801, 'DocNo Jurnal'),
(1534, 'english', 802, 'Item Code'),
(1535, 'indonesia', 802, 'Kode Barang'),
(1536, 'english', 803, 'Item Name'),
(1537, 'indonesia', 803, 'Nama Barang'),
(1538, 'english', 804, 'Journal Qty'),
(1539, 'indonesia', 804, 'Qty Jurnal'),
(1540, 'english', 805, 'Journal Memo'),
(1541, 'indonesia', 805, 'Memo Jurnal'),
(1542, 'english', 806, 'Journal Date'),
(1543, 'indonesia', 806, 'Tgl Jurnal'),
(1544, 'english', 807, 'Credit Total'),
(1545, 'indonesia', 807, 'Total Kredit'),
(1546, 'english', 808, 'Journal SysNO'),
(1547, 'indonesia', 808, 'Jurnal SysNo'),
(1548, 'english', 809, 'Journal DocNo'),
(1549, 'indonesia', 809, 'Jurnal DocNo'),
(1552, 'english', 811, 'Action'),
(1553, 'indonesia', 811, 'Aksi'),
(1554, 'english', 812, 'Journal Date '),
(1555, 'indonesia', 812, 'Tgl Jurnal'),
(1568, 'english', 820, 'Balance Sheet'),
(1569, 'indonesia', 820, 'Neraca'),
(1570, 'english', 821, 'Reload'),
(1571, 'indonesia', 821, 'Memuat Ulang'),
(1572, 'english', 822, 'Print Preview'),
(1573, 'indonesia', 822, 'Preview Cetak'),
(1574, 'english', 823, 'Close Preview'),
(1575, 'indonesia', 823, 'Tutup Preview'),
(1578, 'english', 825, 'Profit & Lost'),
(1579, 'indonesia', 825, 'Laba Rugi'),
(1580, 'english', 826, 'Reload'),
(1581, 'indonesia', 826, 'Memuat Ulang'),
(1582, 'english', 827, 'Print Preview'),
(1583, 'indonesia', 827, 'Preview Cetak'),
(1584, 'english', 828, 'Close Preview'),
(1585, 'indonesia', 828, 'Tutup Preview'),
(1586, 'english', 829, 'Budget Account'),
(1587, 'indonesia', 829, 'Rek Anggaran'),
(1588, 'english', 830, 'Transaction No'),
(1589, 'indonesia', 830, 'No Transaksi'),
(1590, 'english', 831, 'Journal No'),
(1591, 'indonesia', 831, 'No Jurnal'),
(1592, 'english', 832, 'Date'),
(1593, 'indonesia', 832, 'Tanggal'),
(1594, 'english', 833, 'Total Amount'),
(1595, 'indonesia', 833, 'Total Trans'),
(1596, 'english', 834, 'Memo'),
(1597, 'indonesia', 834, 'Memo'),
(1598, 'english', 835, 'Location'),
(1599, 'indonesia', 835, 'Lokasi'),
(1600, 'english', 836, 'Edit Budget'),
(1601, 'indonesia', 836, 'Edit Anggaran'),
(1602, 'english', 837, 'Save Budget');
INSERT INTO `bahasa` (`id`, `bahasa`, `r_label`, `text`) VALUES
(1603, 'indonesia', 837, 'Simpan Anggaran'),
(1604, 'english', 838, 'Cost On Sales Account'),
(1605, 'indonesia', 838, 'Rekening HPP'),
(1606, 'english', 839, 'Account for Inventory'),
(1607, 'indonesia', 839, 'Rekening Persediaan'),
(1608, 'english', 840, 'Account for Sales'),
(1609, 'indonesia', 840, 'Rekening Penjualan'),
(1612, 'english', 842, 'Cost Acc'),
(1613, 'indonesia', 842, 'Rek HPP'),
(1614, 'english', 843, 'Inventory Acc'),
(1615, 'indonesia', 843, 'Rek Persediaan'),
(1616, 'english', 844, 'Sales Acc'),
(1617, 'indonesia', 844, 'Rek Penjualan'),
(1618, 'english', 845, 'Balance Sheet'),
(1619, 'indonesia', 845, 'Neraca Keuangan'),
(1620, 'english', 846, 'WARNING'),
(1621, 'indonesia', 846, 'PERINGATAN'),
(1622, 'english', 847, 'Reload'),
(1623, 'indonesia', 847, 'Memuat Ulang');

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `cabang_id` int NOT NULL,
  `cabang_code` char(2) NOT NULL,
  `cabang_lokasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_code` char(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `customer_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `alamat1` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `alamat2` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `kota1` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `kota2` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `idno` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `idtype` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `telepon1` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `telepon2` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `kontak` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `tax_address1` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_address2` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_address3` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_citycode` varchar(5) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_cityname` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_subdistrict_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_regdate` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `tax_regno` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_pkpreg_date` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `tax_pkpreg_no` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_village_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_village_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_province_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_province_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tax_zipcode` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `vat_address1` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_address2` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_address3` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_cityname` varchar(35) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_kppcode` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_regdate` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `vat_regno` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_pkpdate` datetime NOT NULL DEFAULT '1999-01-01 00:00:00',
  `vat_pkpno` varchar(30) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_pkptype` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_province_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_subdistrict_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_trxcode` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_village_name` varchar(35) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `vat_zipcode` char(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `area` varchar(6) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `rcustomer_type` char(2) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '00',
  `top` decimal(10,0) DEFAULT '0',
  `max_kredit` decimal(10,0) DEFAULT '0',
  `extdata_flag` tinyint NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_code`, `customer_name`, `alamat1`, `alamat2`, `kota1`, `kota2`, `idno`, `idtype`, `telepon1`, `telepon2`, `fax`, `email`, `kontak`, `tax_address1`, `tax_address2`, `tax_address3`, `tax_citycode`, `tax_cityname`, `tax_subdistrict_name`, `tax_name`, `tax_regdate`, `tax_regno`, `tax_pkpreg_date`, `tax_pkpreg_no`, `tax_village_code`, `tax_village_name`, `tax_province_code`, `tax_province_name`, `tax_zipcode`, `vat_name`, `vat_address1`, `vat_address2`, `vat_address3`, `vat_cityname`, `vat_kppcode`, `vat_regdate`, `vat_regno`, `vat_pkpdate`, `vat_pkpno`, `vat_pkptype`, `vat_province_name`, `vat_subdistrict_name`, `vat_trxcode`, `vat_village_name`, `vat_zipcode`, `area`, `rcustomer_type`, `top`, `max_kredit`, `extdata_flag`, `date_create`) VALUES
(64431, 'CO2000011-040', 'ONLINE', 'INDONESIA', '', '', 'Jakarta Timur', 'O000000000000000', 'KTP', '', '', '', '', '', 'INDONESIA', '', '', NULL, NULL, NULL, 'ONLINE', '1999-01-01 00:00:00', 'O000000000000000', '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 'ONLINE', 'INDONESIA', '', '', NULL, NULL, '1999-01-01 00:00:00', 'O000000000000000', '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '99', '0', '0', 1, '2020-09-17 14:57:17'),
(121346, 'RSDM', 'Rumah Sakit Daerah Mangusada', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2', '0', '0', 0, '2022-08-31 13:21:04'),
(121347, 'RSGM', 'Rumah Sakit Garba Med', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:21:40'),
(121348, 'RSMT', 'Rumah Sakit Murni Teguh', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:22:00'),
(121349, 'RSKI', 'Rumah Sakit Kasih Ibu Tabanan', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:22:28'),
(121350, 'RSWP', 'Rumah Sakit Wisma Prasanti Tabanan', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:22:45'),
(121351, 'RSBR', 'Rumah Sakit Bakti Rahayu Tabanan', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:23:07'),
(121352, 'RSBH', 'Rumah Sakit Bali Holistik Tabanan', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:23:38'),
(121353, 'RSSR', 'Rumah Sakit Semara Ratih Tabanan', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:23:57'),
(121354, 'UPB', 'UDD PMI Bali', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:27:43'),
(121355, 'UPD', 'UDD PMI Denpasar', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:27:57'),
(121356, 'UPT', 'UDD PMI Tabanan', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:28:10'),
(121357, 'UPG', 'UDD PMI Gianyar', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '1999-01-01 00:00:00', NULL, '1999-01-01 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '1', '0', '0', 0, '2022-08-31 13:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer_type`
--

CREATE TABLE `customer_type` (
  `id_customer_type` int NOT NULL,
  `customer_type_code` char(2) NOT NULL,
  `customer_type_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer_type`
--

INSERT INTO `customer_type` (`id_customer_type`, `customer_type_code`, `customer_type_desc`) VALUES
(1, '00', 'Dealer'),
(2, '11', 'Individual Private'),
(3, '12', 'Individual Corporate'),
(4, '13', 'Expedition'),
(5, '14', 'Leasing'),
(6, '16', 'Mediator'),
(7, '21', 'Government'),
(8, '31', 'Duty Free'),
(9, '41', 'Subdealer'),
(10, '51', 'Afiliasi - HMSI'),
(11, '61', 'Related Parties - HMSI'),
(12, '71', 'Related Parties - Lainnya'),
(13, '94', 'Insurance'),
(14, '99', 'One Time Customer');

-- --------------------------------------------------------

--
-- Table structure for table `docno`
--

CREATE TABLE `docno` (
  `docno_id` int NOT NULL,
  `bulantahun` varchar(6) NOT NULL,
  `rtrans` varchar(2) NOT NULL,
  `docno` varchar(25) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `docno`
--

INSERT INTO `docno` (`docno_id`, `bulantahun`, `rtrans`, `docno`, `date_create`) VALUES
(752, '202209', 'PO', 'PMI-PO-09-26-00001', '2022-09-26 06:46:00'),
(753, '202209', 'PR', 'PMI-PR-09-26-00001', '2022-09-26 06:46:18'),
(754, '202210', 'PD', 'PMI-PD-10-16-00001', '2022-10-16 12:37:30'),
(759, '202210', 'PD', 'PMI-PD-10-16-00002', '2022-10-16 14:24:52'),
(760, '202210', 'PD', 'PMI-PD-10-16-00003', '2022-10-16 14:26:53'),
(761, '202210', 'PD', 'PMI-PD-10-16-00004', '2022-10-16 14:37:35'),
(762, '202210', 'PD', 'PMI-PD-10-16-00005', '2022-10-16 14:38:06'),
(764, '202210', 'PO', 'PMI-PO-10-16-00001', '2022-10-16 15:15:56'),
(765, '202210', 'PO', 'PMI-PO-10-16-00002', '2022-10-16 18:47:13'),
(766, '202210', 'PO', 'PMI-PO-10-16-00003', '2022-10-16 19:13:07'),
(767, '202210', 'PR', 'PMI-PR-10-16-00001', '2022-10-16 19:16:46'),
(768, '202210', 'PO', 'PMI-PO-10-16-00004', '2022-10-16 19:24:15'),
(769, '202210', 'PR', 'PMI-PR-10-16-00002', '2022-10-16 19:25:16'),
(770, '202210', 'PO', 'PMI-PO-10-16-00005', '2022-10-16 19:27:38'),
(771, '202210', 'PR', 'PMI-PR-10-16-00003', '2022-10-16 19:27:53'),
(772, '202210', 'SO', 'PMI-SO-10-16-00001', '2022-10-16 19:34:03'),
(773, '202210', 'SO', 'PMI-SO-10-16-00002', '2022-10-16 20:08:19'),
(774, '202210', 'SL', 'PMI-SV-10-16-00001', '2022-10-16 20:08:33'),
(775, '202210', 'PD', 'PMI-PD-10-17-00006', '2022-10-17 03:52:42'),
(776, '202210', 'PO', 'PMI-PO-10-17-00006', '2022-10-17 04:52:00'),
(778, '202302', 'PO', 'PMI-PO-02-01-00001', '2023-02-01 17:54:27'),
(779, '202302', 'PR', 'PMI-PR-02-01-00001', '2023-02-01 17:56:08'),
(780, '202302', 'PG', 'PMI-PG-02-01-00001', '2023-02-01 22:00:53'),
(781, '202302', 'PO', 'PMI-PO-02-05-00002', '2023-02-05 14:26:28'),
(782, '000000', 'PR', 'PMI-PR-02-05-00002', '2023-02-05 14:28:57'),
(783, '202302', 'SO', 'PMI-SO-02-09-00001', '2023-02-09 08:12:47'),
(784, '202302', 'SL', 'PMI-SV-02-09-00001', '2023-02-09 08:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id_form` int NOT NULL,
  `nama_form` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form`
--

INSERT INTO `form` (`id_form`, `nama_form`) VALUES
(1, '#sales order#'),
(2, '#sales#'),
(3, '#sales_register#'),
(4, '#customer payment#'),
(5, '#purchase#'),
(6, '#purchase order#'),
(7, '#production#'),
(8, '#production_register#'),
(9, '#production_expxls#'),
(10, '#sales_export_efaktur#'),
(11, '#supplier#'),
(12, '#master_barang#'),
(13, '#opnum#'),
(14, '#customer#'),
(15, '#master_karyawan#'),
(16, '#purchase_register#'),
(17, '#supplier payment#'),
(18, '#register#'),
(19, '#balance_sheet#'),
(20, '#univ#'),
(21, '#MDI#'),
(22, '#items#'),
(23, '#inventory#'),
(24, '#assets#'),
(25, '#liability#'),
(26, '#equity#'),
(27, '#income#'),
(28, '#cost_of_sales#'),
(29, '#expense#'),
(30, '#other_income#'),
(31, '#other_expense#'),
(32, '#supplier#'),
(33, '#customer#'),
(34, '#master_karyawan#'),
(35, '#sales_person#'),
(36, '#master_model#'),
(37, '#master_variant#'),
(38, '#master_color#'),
(39, '#inventaris#'),
(40, '#retailing#'),
(41, '#master_rekening#'),
(42, '#pengadaan#'),
(43, '#journal_entry#'),
(44, '#profit_loss#');

-- --------------------------------------------------------

--
-- Table structure for table `general_ledger`
--

CREATE TABLE `general_ledger` (
  `id` int NOT NULL,
  `notrans` varchar(20) NOT NULL,
  `order_no` varchar(20) NOT NULL DEFAULT '0',
  `invoice_no` varchar(20) NOT NULL DEFAULT '0',
  `r_anggaran` int NOT NULL,
  `sumber_anggaran` tinyint NOT NULL DEFAULT '1' COMMENT '0 = silpa, 1 = hibah',
  `tabel_trans` varchar(20) NOT NULL,
  `tgl` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_trans` decimal(15,2) NOT NULL DEFAULT '0.00',
  `memo` varchar(100) NOT NULL,
  `jurnal` varchar(2) NOT NULL,
  `rlocation` varchar(10) NOT NULL,
  `comp_loc` varchar(20) NOT NULL,
  `loctrf_from` varchar(3) NOT NULL DEFAULT '0',
  `loctrf_to` varchar(3) NOT NULL DEFAULT '0',
  `pay_notrans` varchar(20) NOT NULL DEFAULT '0',
  `return_notrans` varchar(20) NOT NULL DEFAULT '0',
  `trigered` int NOT NULL DEFAULT '0',
  `void_flag` int NOT NULL DEFAULT '0',
  `extdata_flag` int NOT NULL DEFAULT '0',
  `us_create` varchar(18) NOT NULL,
  `us_update` varchar(18) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_udpate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `general_ledger`
--

INSERT INTO `general_ledger` (`id`, `notrans`, `order_no`, `invoice_no`, `r_anggaran`, `sumber_anggaran`, `tabel_trans`, `tgl`, `total_trans`, `memo`, `jurnal`, `rlocation`, `comp_loc`, `loctrf_from`, `loctrf_to`, `pay_notrans`, `return_notrans`, `trigered`, `void_flag`, `extdata_flag`, `us_create`, `us_update`, `date_create`, `date_udpate`) VALUES
(1, 'MRS.GJ000002', '0', '0', 0, 1, 'general_ledger', '2023-02-10 13:40:21', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 21:40:21', '2023-02-10 21:40:21'),
(2, 'MRS.GJ000003', '0', '0', 0, 1, 'general_ledger', '2023-02-10 13:41:15', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 21:41:15', '2023-02-10 21:41:15'),
(16, 'MRS.GJ000004', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:22:11', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:22:11', '2023-02-10 22:22:11'),
(17, 'MRS.GJ000005', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:23:12', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:23:12', '2023-02-10 22:23:12'),
(18, 'MRS.GJ000006', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:23:52', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:23:52', '2023-02-10 22:23:52'),
(19, 'MRS.GJ000007', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:24:22', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:24:22', '2023-02-10 22:24:22'),
(20, 'MRS.GJ000008', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:24:43', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:24:43', '2023-02-10 22:24:43'),
(21, 'MRS.GJ000009', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:25:28', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:25:28', '2023-02-10 22:25:28'),
(22, 'MRS.GJ000010', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:25:56', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:25:56', '2023-02-10 22:25:56'),
(23, 'MRS.GJ000011', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:26:11', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:26:11', '2023-02-10 22:26:11'),
(24, 'MRS.GJ000012', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:26:23', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:26:23', '2023-02-10 22:26:23'),
(25, 'MRS.GJ000013', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:26:47', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:26:47', '2023-02-10 22:26:47'),
(26, 'MRS.GJ000014', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:27:16', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:27:16', '2023-02-10 22:27:16'),
(27, 'MRS.GJ000015', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:27:35', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:27:35', '2023-02-10 22:27:35'),
(28, 'MRS.GJ000016', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:28:02', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:28:02', '2023-02-10 22:28:02'),
(29, 'MRS.GJ000017', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:28:26', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:28:26', '2023-02-10 22:28:26'),
(30, 'MRS.GJ000018', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:28:48', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:28:48', '2023-02-10 22:28:48'),
(31, 'MRS.GJ000019', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:29:35', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:29:35', '2023-02-10 22:29:35'),
(32, 'MRS.GJ000020', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:30:07', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:30:07', '2023-02-10 22:30:07'),
(33, 'MRS.GJ000021', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:30:23', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:30:23', '2023-02-10 22:30:23'),
(34, 'MRS.GJ000022', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:30:48', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:30:48', '2023-02-10 22:30:48'),
(35, 'MRS.GJ000023', '0', '0', 0, 1, 'general_ledger', '2023-02-10 14:31:13', '0.00', 'Input Account', 'JK', '01020', 'Comp-Loc', '0', '0', '0', '0', 0, 0, 0, 'US003', 'US003', '2023-02-10 22:31:13', '2023-02-10 22:31:13');

--
-- Triggers `general_ledger`
--
DELIMITER $$
CREATE TRIGGER `general_ledger_afInsert` AFTER INSERT ON `general_ledger` FOR EACH ROW BEGIN
INSERT INTO rekening_anggaran_detail(unique_detail_anggaran,r_rekening,sumber,bulan_anggaran,rlocation,anggaran,date_trans,user_create,user_update) Values(NEW.notrans,NEW.r_anggaran,NEW.sumber_anggaran,DATE_FORMAT(NEW.tgl,'%m%Y'),NEW.rlocation, -1*NEW.total_trans,NEW.tgl,NEW.us_create,NEW.us_update);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `general_ledger_afdelete` AFTER DELETE ON `general_ledger` FOR EACH ROW BEGIN 
	DELETE FROM gl_detail where rgl = OLD.notrans;    
    DELETE FROM rekening_anggaran_detail where unique_detail_anggaran  = OLD.notrans;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `general_ledger_afupdate` AFTER UPDATE ON `general_ledger` FOR EACH ROW BEGIN 
	IF NEW.void_flag != OLD.void_flag THEN
		UPDATE gl_detail set void_flag = NEW.void_flag where rgl = OLD.notrans;
    END IF;
    UPDATE rekening_anggaran_detail set r_rekening = NEW.r_anggaran,sumber = NEW.sumber_anggaran,bulan_anggaran=DATE_FORMAT(NEW.tgl,'%m%Y'),rlocation=NEW.rlocation,anggaran= -1*NEW.total_trans,date_trans=NEW.tgl,user_create=NEW.us_create,user_update=NEW.us_update  where unique_detail_anggaran = NEW.notrans;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gl_detail`
--

CREATE TABLE `gl_detail` (
  `id` int NOT NULL,
  `rgl` varchar(30) NOT NULL,
  `acc_id` int NOT NULL,
  `debet` decimal(13,2) NOT NULL,
  `kredit` decimal(13,2) NOT NULL,
  `trans_detail` varchar(100) NOT NULL,
  `void_flag` int NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_udpate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gl_detail`
--

INSERT INTO `gl_detail` (`id`, `rgl`, `acc_id`, `debet`, `kredit`, `trans_detail`, `void_flag`, `date_create`, `date_udpate`) VALUES
(1, 'MRS.GJ000002', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 21:40:21', '2023-02-10 21:40:21'),
(2, 'MRS.GJ000002', 41200, '0.00', '0.00', 'Input Account', 0, '2023-02-10 21:40:21', '2023-02-10 21:40:21'),
(3, 'MRS.GJ000003', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 21:41:15', '2023-02-10 21:41:15'),
(4, 'MRS.GJ000003', 41300, '0.00', '0.00', 'Input Account', 0, '2023-02-10 21:41:15', '2023-02-10 21:41:15'),
(31, 'MRS.GJ000004', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:22:11', '2023-02-10 22:22:11'),
(32, 'MRS.GJ000004', 51101, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:22:11', '2023-02-10 22:22:11'),
(33, 'MRS.GJ000005', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:23:12', '2023-02-10 22:23:12'),
(34, 'MRS.GJ000005', 51102, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:23:12', '2023-02-10 22:23:12'),
(35, 'MRS.GJ000006', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:23:52', '2023-02-10 22:23:52'),
(36, 'MRS.GJ000006', 51103, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:23:52', '2023-02-10 22:23:52'),
(37, 'MRS.GJ000007', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:24:22', '2023-02-10 22:24:22'),
(38, 'MRS.GJ000007', 51104, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:24:22', '2023-02-10 22:24:22'),
(39, 'MRS.GJ000008', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:24:43', '2023-02-10 22:24:43'),
(40, 'MRS.GJ000008', 51105, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:24:43', '2023-02-10 22:24:43'),
(41, 'MRS.GJ000009', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:25:28', '2023-02-10 22:25:28'),
(42, 'MRS.GJ000009', 51106, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:25:28', '2023-02-10 22:25:28'),
(43, 'MRS.GJ000010', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:25:56', '2023-02-10 22:25:56'),
(44, 'MRS.GJ000010', 51107, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:25:56', '2023-02-10 22:25:56'),
(45, 'MRS.GJ000011', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:26:11', '2023-02-10 22:26:11'),
(46, 'MRS.GJ000011', 51108, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:26:11', '2023-02-10 22:26:11'),
(47, 'MRS.GJ000012', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:26:23', '2023-02-10 22:26:23'),
(48, 'MRS.GJ000012', 51109, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:26:23', '2023-02-10 22:26:23'),
(49, 'MRS.GJ000013', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:26:47', '2023-02-10 22:26:47'),
(50, 'MRS.GJ000013', 51110, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:26:47', '2023-02-10 22:26:47'),
(51, 'MRS.GJ000014', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:27:16', '2023-02-10 22:27:16'),
(52, 'MRS.GJ000014', 51111, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:27:16', '2023-02-10 22:27:16'),
(53, 'MRS.GJ000015', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:27:35', '2023-02-10 22:27:35'),
(54, 'MRS.GJ000015', 51112, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:27:35', '2023-02-10 22:27:35'),
(55, 'MRS.GJ000016', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:28:02', '2023-02-10 22:28:02'),
(56, 'MRS.GJ000016', 51113, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:28:02', '2023-02-10 22:28:02'),
(57, 'MRS.GJ000017', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:28:26', '2023-02-10 22:28:26'),
(58, 'MRS.GJ000017', 51114, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:28:26', '2023-02-10 22:28:26'),
(59, 'MRS.GJ000018', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:28:48', '2023-02-10 22:28:48'),
(60, 'MRS.GJ000018', 51115, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:28:48', '2023-02-10 22:28:48'),
(61, 'MRS.GJ000019', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:29:35', '2023-02-10 22:29:35'),
(62, 'MRS.GJ000019', 51116, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:29:35', '2023-02-10 22:29:35'),
(63, 'MRS.GJ000020', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:30:07', '2023-02-10 22:30:07'),
(64, 'MRS.GJ000020', 51117, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:30:07', '2023-02-10 22:30:07'),
(65, 'MRS.GJ000021', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:30:23', '2023-02-10 22:30:23'),
(66, 'MRS.GJ000021', 51118, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:30:23', '2023-02-10 22:30:23'),
(67, 'MRS.GJ000022', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:30:48', '2023-02-10 22:30:48'),
(68, 'MRS.GJ000022', 51119, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:30:48', '2023-02-10 22:30:48'),
(69, 'MRS.GJ000023', 31000, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:31:13', '2023-02-10 22:31:13'),
(70, 'MRS.GJ000023', 51120, '0.00', '0.00', 'Input Account', 0, '2023-02-10 22:31:13', '2023-02-10 22:31:13');

-- --------------------------------------------------------

--
-- Table structure for table `good_receive`
--

CREATE TABLE `good_receive` (
  `gro_id` int NOT NULL,
  `grpo_sysno` int DEFAULT NULL,
  `grno` varchar(25) DEFAULT NULL,
  `grdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `podocno` varchar(25) DEFAULT NULL,
  `pono` varchar(25) DEFAULT NULL,
  `r_anggaran` int NOT NULL,
  `vat_flag` tinyint(1) NOT NULL DEFAULT '0',
  `r_acc` int NOT NULL,
  `bindocno` varchar(25) DEFAULT NULL,
  `delivery_orderno` varchar(25) DEFAULT NULL,
  `invoiceno` varchar(25) DEFAULT NULL,
  `supplier_code` varchar(20) DEFAULT NULL,
  `supplier_name` varchar(100) DEFAULT NULL,
  `change_userid` varchar(10) DEFAULT NULL,
  `dealer_repcode` varchar(20) DEFAULT NULL,
  `taxno` varchar(25) DEFAULT NULL,
  `order_type` varchar(50) DEFAULT NULL,
  `trxtype` varchar(100) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `whs_claimcode` varchar(100) DEFAULT NULL,
  `whs_code` varchar(5) DEFAULT NULL,
  `whscode_desc` varchar(100) DEFAULT NULL,
  `whsgroup_code` varchar(2) DEFAULT NULL,
  `top_code` varchar(5) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `good_receive`
--

INSERT INTO `good_receive` (`gro_id`, `grpo_sysno`, `grno`, `grdate`, `podocno`, `pono`, `r_anggaran`, `vat_flag`, `r_acc`, `bindocno`, `delivery_orderno`, `invoiceno`, `supplier_code`, `supplier_name`, `change_userid`, `dealer_repcode`, `taxno`, `order_type`, `trxtype`, `vehicle_brand`, `whs_claimcode`, `whs_code`, `whscode_desc`, `whsgroup_code`, `top_code`, `start_date`, `end_date`, `user_create`, `date_create`, `user_update`, `date_update`, `void_flag`, `extdata_flag`) VALUES
(724, 998000001, 'PMI-PR-02-05-00002', '0000-00-00 00:00:00', 'PMI-PO-02-05-00002', 'PMI-PO-02-05-00002', 218, 0, 21300, NULL, NULL, 'INV000001', 'SP000024', 'PT Prapen Ananda Dewata SPBU 5480332', NULL, '01020', 'INV000001', NULL, NULL, 'OTHERS', NULL, NULL, NULL, NULL, 'C30', '2023-02-05 00:00:00', '2023-03-08 00:00:00', '3', '2023-02-05 14:28:57', '3', '2023-02-05 14:28:57', 0, 0);

--
-- Triggers `good_receive`
--
DELIMITER $$
CREATE TRIGGER `good_receive_afdel` AFTER DELETE ON `good_receive` FOR EACH ROW BEGIN
delete from go_detail where grpo_sysno = OLD.grpo_sysno;
delete from general_ledger where invoice_no = OLD.grno;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `good_receive_afinsert` AFTER INSERT ON `good_receive` FOR EACH ROW BEGIN
	DECLARE bulantahun varchar(6);
	DECLARE gjno varchar(12);
	DECLARE location varchar(3);
	DECLARE rowbb integer(5);
	DECLARE rowbp integer(5);
	DECLARE ppn_percent integer(5);
	
	DECLARE acc_ppn integer(5);
	DECLARE acc_kredit INTEGER(5);
	DECLARE acc_pers_bb INTEGER(5);
	DECLARE acc_pers_bp INTEGER(5);
	DECLARE acc_pot INTEGER(5);
	
	DECLARE total_trans decimal (10,2);
	DECLARE tot_pot decimal (10,2);
	DECLARE total_bb decimal (10,2);
    DECLARE total_bp decimal (10,2);
	DECLARE total_ppn decimal (10,2);
	DECLARE total_grand DECIMAL(10,2);
		
	SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);
	SET @gjno = (SELECT concat(@location,'.PR',RIGHT(concat('000000',cast(COALESCE(RIGHT(max(notrans),6),0) AS UNSIGNED)+1),6)) maxno FROM general_ledger where notrans like concat(@location,'.PR%'));
	SET @acc_ppn = (SELECT acc_id FROM link_acc WHERE link = 'ppn_masukan');
	SET @acc_kredit = NEW.r_acc;
	SET @acc_pers_bb = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_bahan_baku');
	SET @acc_pers_bp = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_bahan_pakai');
	SET @acc_pot = (SELECT acc_id FROM link_acc WHERE link = 'potongan_beli');
	
	SET @rowbb = (SELECT count(unique_detailgo) jumlah FROM go_detail a right join items b on a.item_code = b.item_code where a.grno = NEW.grno and b.item_group = 'BB');
	SET @rowbp = (SELECT count(unique_detailgo) jumlah FROM go_detail a right join items b on a.item_code = b.item_code where a.grno = NEW.grno and b.item_group = 'BP');
    
	SET @total_bb = (SELECT COALESCE(sum(unit_price*qty_received),0) subtotal FROM go_detail a right join items b on a.item_code = b.item_code where a.grno = NEW.grno and b.item_group = 'BB');
	SET @total_bp = (SELECT COALESCE(sum(unit_price*qty_received),0) subtotal FROM go_detail a right join items b on a.item_code = b.item_code where a.grno = NEW.grno and b.item_group = 'BP');
	SET @total_trans = (SELECT coalesce(ROUND(sum(price),2),0) afdisc from go_detail a where a.grno = NEW.grno);
	SET @tot_pot = (SELECT coalesce(ROUND(sum(discount_amount),2),0) afdisc from go_detail a where a.grno = NEW.grno);
	SET @grantotal = (SELECT coalesce(ROUND(sum(total),2),0) afdisc from go_detail a where a.grno = NEW.grno);
	SET @ppn_percent = (SELECT 11);
	SET @total_ppn = (SELECT ROUND(@grantotal*@ppn_percent/100,2));
	
	INSERT INTO messages(message) values(concat(@gjno,' ',NEW.podocno,' ',NEW.grno,' ',@total_trans,' ',@rowbb,' ',@rowbp));
	
	INSERT INTO general_ledger(notrans,order_no,invoice_no,r_anggaran,tabel_trans,tgl,total_trans,memo,jurnal,rlocation,comp_loc,us_create,us_update) VALUES(@gjno,NEW.podocno,NEW.grno,NEW.r_anggaran,'good_receive',NEW.grdate,@total_trans,'purchase invoice','JK',NEW.dealer_repcode,'comp_loc',NEW.user_create,NEW.user_update);
	
	IF @rowbb > 0 THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bb,@total_bb,'0','PR Bahan Baku');
	END IF;
	IF @rowbp > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bp,@total_bp,'0','PR Bahan Pakai');
	END IF;
	IF NEW.vat_flag = '1' THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_ppn,@total_ppn,'0','PPN Masukan');
	END IF;
	INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_kredit,'0',@grantotal+@total_ppn,'Total Transaksi');
	IF @tot_pot > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pot,'0',@tot_pot,'Potongan Beli');
	END IF;
	IF NEW.extdata_flag = 0 THEN     	
        SET @bulantahun = DATE_FORMAT(NEW.grdate, "%Y%m");
    	INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'PR',NEW.grno);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `good_receive_afupdate` AFTER UPDATE ON `good_receive` FOR EACH ROW BEGIN
	IF OLD.void_flag != NEW.void_flag THEN
		IF NEW.void_flag = 1 THEN
			UPDATE go_detail SET void_flag = '1' WHERE grpo_sysno = OLD.grpo_sysno;
		ELSEIF NEW.void_flag = 0 THEN 
			UPDATE go_detail SET void_flag = '0' WHERE grpo_sysno = OLD.grpo_sysno;
		END IF;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `go_detail`
--

CREATE TABLE `go_detail` (
  `grodetail_id` int NOT NULL,
  `unique_detailgo` varchar(65) NOT NULL,
  `grpo_sysno` int DEFAULT NULL,
  `grno` varchar(25) DEFAULT NULL,
  `pono` varchar(25) DEFAULT NULL,
  `date_trans` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rdealer_repcode` varchar(10) NOT NULL,
  `boxno` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `item_code` varchar(15) DEFAULT NULL,
  `qty_damage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty_over` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty_short` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty_wrong` decimal(10,2) NOT NULL DEFAULT '0.00',
  `qty_received` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unit_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(17,4) NOT NULL DEFAULT '0.0000' COMMENT 'belum x qty',
  `total` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `sales_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `grline_no` int DEFAULT NULL,
  `location_code` varchar(10) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `user_create` varchar(10) NOT NULL,
  `user_update` varchar(10) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `go_detail`
--

INSERT INTO `go_detail` (`grodetail_id`, `unique_detailgo`, `grpo_sysno`, `grno`, `pono`, `date_trans`, `rdealer_repcode`, `boxno`, `item_code`, `qty_damage`, `qty_over`, `qty_short`, `qty_wrong`, `qty_received`, `unit_price`, `price`, `discount_percent`, `discount_amount`, `total`, `sales_price`, `grline_no`, `location_code`, `remark`, `user_create`, `user_update`, `date_create`, `date_update`, `void_flag`, `extdata_flag`) VALUES
(3227, '998000001OBT000001', 998000001, 'PMI-PR-02-05-00002', 'PMI-PO-02-05-00002', '0000-00-00 00:00:00', '01020', NULL, 'OBT000001', '0.00', '0.00', '0.00', '0.00', '9.00', '130286.0000', '1172574.0000', '0.00', '0.0000', '1172574.0000', '130286.0000', 1, NULL, NULL, '3', '3', '2023-02-05 14:28:57', '2023-02-05 14:28:57', 0, 0);

--
-- Triggers `go_detail`
--
DELIMITER $$
CREATE TRIGGER `go_detail_afdel` AFTER DELETE ON `go_detail` FOR EACH ROW BEGIN
	DECLARE damageb4 DECIMAL(7,2);
	DECLARE overb4 DECIMAL(7,2);
	DECLARE shortb4 DECIMAL(7,2);
	DECLARE wrongb4 DECIMAL(7,2);
	DECLARE receivedb4 DECIMAL(7,2);
	DECLARE grpob4 DECIMAL(7,2);
	DECLARE damage_aft DECIMAL(7,2);
	DECLARE over_aft DECIMAL(7,2);
	DECLARE short_aft DECIMAL(7,2);
	DECLARE wrong_aft DECIMAL(7,2);
	DECLARE received_aft DECIMAL(7,2);
	DECLARE grpo_aft DECIMAL(7,2);
	SET @damageb4 = (SELECT qty_damage from po_detail where item_code= OLD.item_code and purchase_orderno=OLD.pono);
	IF (ISNULL(@damageb4)) THEN SET @damageb4 = 0; END IF;
	SET @overb4 = (SELECT qty_over from po_detail where item_code= OLD.item_code and purchase_orderno=OLD.pono);
	IF (ISNULL(@overb4)) THEN SET @overb4 = 0; END IF;
	SET @shortb4 = (SELECT qty_short from po_detail where item_code= OLD.item_code and purchase_orderno=OLD.pono);
	IF (ISNULL(@shortb4)) THEN SET @shortb4 = 0; END IF;
	SET @wrongb4 = (SELECT qty_wrong from po_detail where item_code= OLD.item_code and purchase_orderno=OLD.pono);
	IF (ISNULL(@wrongb4)) THEN SET @wrongb4 = 0; END IF;
	SET @receivedb4 = (SELECT qty_received from po_detail where item_code= OLD.item_code and purchase_orderno=OLD.pono);
	IF (ISNULL(@receivedb4)) THEN SET @receivedb4 = 0; END IF;
	SET @grpob4 = (SELECT qty_grpo from po_detail where item_code= OLD.item_code and purchase_orderno=OLD.pono);
	IF (ISNULL(@grpob4)) THEN SET @grpob4 = 0; END IF;
	
	DELETE from items_invdetail where  ritem_code = old.item_code and notrans = old.grno;
	SET @damage_aft = @damageb4 - OLD.qty_damage;
	SET @over_aft = @overb4 - OLD.qty_over;
	SET @short_aft = @shortb4 - OLD.qty_short;
	SET @wrong_aft = @wrongb4 - OLD.qty_wrong;			
	SET @received_aft = @receivedb4 - OLD.qty_received;
	SET @grpo_aft = @grpob4 - OLD.qty_received;
	IF (old.extdata_flag = 0) THEN 
		UPDATE po_detail SET qty_grpo = @grpo_aft,qty_damage = @damage_aft,qty_over = @over_aft,qty_short=@short_aft,qty_wrong=@wrong_aft,qty_received=@received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
	ELSE
		UPDATE po_detail SET qty_damage = @damage_aft,qty_over = @over_aft,qty_short=@short_aft,qty_wrong=@wrong_aft,qty_received=@received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `go_detail_afinsert` AFTER INSERT ON `go_detail` FOR EACH ROW BEGIN
	DECLARE damageb4 DECIMAL(7,2);
	DECLARE overb4 DECIMAL(7,2);
	DECLARE shortb4 DECIMAL(7,2);
	DECLARE wrongb4 DECIMAL(7,2);
	DECLARE receivedb4 DECIMAL(7,2);
	DECLARE grpob4 DECIMAL(7,2);
	DECLARE datetrans DATETIME;
	SET @datetrans = NEW.date_trans;
	SET @damageb4 = (SELECT qty_damage from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@damageb4)) THEN SET @damageb4 = 0; END IF;
	SET @overb4 = (SELECT qty_over from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@overb4)) THEN SET @overb4 = 0; END IF;
	SET @shortb4 = (SELECT qty_short from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@shortb4)) THEN SET @shortb4 = 0; END IF;
	SET @wrongb4 = (SELECT qty_wrong from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@wrongb4)) THEN SET @wrongb4 = 0; END IF;
	SET @receivedb4 = (SELECT qty_received from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@receivedb4)) THEN SET @receivedb4 = 0; END IF;
	SET @grpob4 = (SELECT qty_grpo from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@grpob4)) THEN SET @grpob4 = 0; END IF;
	
	INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty,cost, sales_price, rtrans,notrans,invtrans,date_trans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (new.item_code,new.rdealer_repcode,new.qty_received,new.unit_price, new.sales_price,'PR',NEW.pono,new.grno,@datetrans, '0', new.date_update,new.user_update,new.date_create,new.user_create, new.extdata_flag);
	IF(new.extdata_flag = 0) THEN
		UPDATE po_detail SET qty_grpo = @grpob4+NEW.qty_received,qty_damage = @damageb4+NEW.qty_damage, qty_over=@overb4+NEW.qty_over, qty_short=@shortb4+NEW.qty_short, qty_wrong= @wrongb4+NEW.qty_wrong, qty_received = @receivedb4+NEW.qty_received where item_code= NEW.item_code and purchase_orderno=NEW.pono;
	ELSE
		UPDATE po_detail SET qty_damage = @damageb4+NEW.qty_damage, qty_over=@overb4+NEW.qty_over, qty_short=@shortb4+NEW.qty_short, qty_wrong= @wrongb4+NEW.qty_wrong, qty_received = @receivedb4+NEW.qty_received where item_code= NEW.item_code and purchase_orderno=NEW.pono;
	END IF;	
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `go_detail_afupdate` AFTER UPDATE ON `go_detail` FOR EACH ROW BEGIN
	DECLARE damageb4 DECIMAL(7,2);
	DECLARE overb4 DECIMAL(7,2);
	DECLARE shortb4 DECIMAL(7,2);
	DECLARE wrongb4 DECIMAL(7,2);
	DECLARE receivedb4 DECIMAL(7,2);
	DECLARE grpob4 DECIMAL(7,2);	
	DECLARE damage_aft DECIMAL(7,2);
	DECLARE over_aft DECIMAL(7,2);
	DECLARE short_aft DECIMAL(7,2);
	DECLARE wrong_aft DECIMAL(7,2);
	DECLARE received_aft DECIMAL(7,2);
	DECLARE grpo_aft DECIMAL(7,2);
	DECLARE datetrans DATETIME;
	SET @datetrans = (SELECT grdate from good_receive where grpo_sysno = OLD.grpo_sysno);
	SET @damageb4 = (SELECT qty_damage from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@damageb4)) THEN SET @damageb4 = 0; END IF;
	SET @overb4 = (SELECT qty_over from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@overb4)) THEN SET @overb4 = 0; END IF;
	SET @shortb4 = (SELECT qty_short from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@shortb4)) THEN SET @shortb4 = 0; END IF;
	SET @wrongb4 = (SELECT qty_wrong from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@wrongb4)) THEN SET @wrongb4 = 0; END IF;
	SET @receivedb4 = (SELECT qty_received from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	IF (ISNULL(@receivedb4)) THEN SET @receivedb4 = 0; END IF;
	SET @grpob4 = (SELECT qty_grpo from po_detail where item_code= NEW.item_code and purchase_orderno=NEW.pono);
	
	IF NEW.void_flag != OLD.void_flag THEN
		IF NEW.void_flag = 1 THEN
			DELETE from items_invdetail where  ritem_code = old.item_code and notrans = old.grno;
			SET @damage_aft = @damageb4 - OLD.qty_damage;
			SET @over_aft = @overb4 - OLD.qty_over;
			SET @short_aft = @shortb4 - OLD.qty_short;
			SET @wrong_aft = @wrongb4 - OLD.qty_wrong;			
			SET @received_aft = @receivedb4 - OLD.qty_received;
			SET @grpo_aft = @grpob4 - OLD.qty_received;
			IF (new.extdata_flag = 0) THEN 
				UPDATE po_detail SET qty_grpo = @grpo_aft,qty_damage = @damage_aft,qty_over = @over_aft,qty_short=@short_aft,qty_wrong=@wrong_aft,qty_received=@received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
			ELSE 
				UPDATE po_detail SET qty_damage = @damage_aft,qty_over = @over_aft,qty_short=@short_aft,qty_wrong=@wrong_aft,qty_received=@received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
			END IF;			
		ELSEIF NEW.void_flag = 0 THEN
			INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty,cost,sales_price, rtrans, notrans, date_trans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (OLD.item_code,OLD.rdealer_repcode,OLD.qty_received,OLD.unit_price,OLD.sales_price,'PR',OLD.grno,@datetrans, '1', OLD.date_update,OLD.user_update,OLD.date_create,OLD.user_create, OLD.extdata_flag);
			SET @damage_aft = @damageb4 + OLD.qty_damage;
			SET @over_aft = @overb4 + OLD.qty_over;
			SET @short_aft = @shortb4 + OLD.qty_short;
			SET @wrong_aft = @wrongb4 + OLD.qty_wrong;			
			SET @received_aft = @receivedb4 + OLD.qty_received;
			SET @grpo_aft = @grpob4 + OLD.qty_received;
			IF (new.extdata_flag = 0) THEN 
				UPDATE po_detail SET qty_grpo = @grpo_aft,qty_damage = @damage_aft,qty_over = @over_aft,qty_short=@short_aft,qty_wrong=@wrong_aft,qty_received=@received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
			ELSE 
				UPDATE po_detail SET qty_damage = @damage_aft,qty_over = @over_aft,qty_short=@short_aft,qty_wrong=@wrong_aft,qty_received=@received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
			END IF;	
		END IF;
	ELSE
		IF OLD.qty_damage != new.qty_damage  THEN 
			SET @damage_aft = @damageb4 - OLD.qty_damage + NEW.qty_damage;
			UPDATE po_detail SET qty_damage = @damage_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
		END IF;
		IF OLD.qty_over  != new.qty_over  THEN 
			SET @over_aft = @overb4 - OLD.qty_over + NEW.qty_over;
			UPDATE po_detail SET qty_over = @over_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
		END IF;
		IF OLD.qty_short != new.qty_short  THEN 
			SET @short_aft = @shortb4 - OLD.qty_short + NEW.qty_short;
			UPDATE po_detail SET qty_short = @short_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
		END IF;
		IF OLD.qty_wrong != new.qty_wrong  THEN 
			SET @wrong_aft = @wrongb4 - OLD.qty_wrong + NEW.qty_wrong;
			UPDATE po_detail SET qty_wrong = @wrong_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
		END IF;
		IF OLD.qty_received  != new.qty_received  THEN 
			UPDATE items_invdetail SET qty = new.qty_received,alocation_flag = '0' where ritem_code = new.item_code and notrans = new.grno;
			SET @received_aft = @receivedb4 - OLD.qty_received + NEW.qty_received;
			IF (new.extdata_flag = 0) THEN 
				SET @grpo_aft = @grpob4 - OLD.qty_received + NEW.qty_received;
				UPDATE po_detail SET qty_grpo = @grpo_aft,qty_received = @received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
			ELSE 
				UPDATE po_detail SET qty_received = @received_aft where item_code = OLD.item_code and purchase_orderno = OLD.pono;
			END IF;
		END IF;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `group_barang`
--

CREATE TABLE `group_barang` (
  `id_group` int NOT NULL,
  `kode_group` varchar(3) NOT NULL,
  `nama_group` varchar(150) NOT NULL,
  `acc_hpp` int NOT NULL DEFAULT '0',
  `acc_persediaan` int NOT NULL DEFAULT '0',
  `acc_penjualan` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `group_barang`
--

INSERT INTO `group_barang` (`id_group`, `kode_group`, `nama_group`, `acc_hpp`, `acc_persediaan`, `acc_penjualan`) VALUES
(1, 'BB', 'Bahan Baku', 54700, 11606, 42999),
(2, 'BJ', 'Barang Jadi', 51000, 11610, 42802),
(3, 'BBM', 'BHP BBM', 51000, 11611, 42999),
(4, 'ATK', 'BHP ATK', 53000, 11601, 42999),
(5, 'OBT', 'BHP OBAT', 54500, 11604, 42801),
(7, 'MED', 'BHP Medis', 54500, 11605, 42999),
(8, 'OP', 'Operation / Jasa', 51000, 11609, 42804);

-- --------------------------------------------------------

--
-- Table structure for table `hncf_menu_level0`
--

CREATE TABLE `hncf_menu_level0` (
  `id_level0` int NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hncf_menu_level0`
--

INSERT INTO `hncf_menu_level0` (`id_level0`, `nama_menu`, `class`) VALUES
(1, 'Master', 'master'),
(2, 'After Sales', 'after_sales'),
(3, 'Purchase', 'purchase'),
(4, 'Sales', 'sales'),
(5, 'Inventory', 'inventory_mdi'),
(6, 'General Jurnal', 'general_jurnal'),
(7, 'Report', 'report');

-- --------------------------------------------------------

--
-- Table structure for table `hncf_menu_level1`
--

CREATE TABLE `hncf_menu_level1` (
  `id_level1` int NOT NULL,
  `r_level0` int NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hncf_menu_level1`
--

INSERT INTO `hncf_menu_level1` (`id_level1`, `r_level0`, `nama_menu`, `class`) VALUES
(1, 1, 'Account', 'account'),
(2, 1, 'Card File', 'card_file'),
(3, 3, 'General Transaction', 'general_transaction'),
(4, 3, 'Accounting', 'accounting'),
(5, 4, 'General Transaction', 'general_transaction'),
(6, 4, 'Accounting', 'accounting'),
(7, 5, 'Inventory', 'inventory_mdi'),
(8, 5, 'Inventory Transaction', 'inventory_transaction'),
(9, 5, 'Accounting', 'accounting'),
(10, 6, 'General Jurnal', 'general_jurnal'),
(11, 6, 'Expenses', 'expenses'),
(12, 7, 'General', 'general'),
(13, 7, 'Sales Report', 'sales_report'),
(14, 7, 'Accounting', 'accounting'),
(15, 1, 'Master Inventory', 'master_inv'),
(17, 2, 'Transaction', 'after_sales_transaction'),
(18, 2, 'Report', 'after_sales_report'),
(19, 4, 'Sales Tax', 'sales_tax');

-- --------------------------------------------------------

--
-- Table structure for table `hncf_menu_level2`
--

CREATE TABLE `hncf_menu_level2` (
  `id_level2` int NOT NULL,
  `r_level1` int NOT NULL,
  `has_submenu_flag` tinyint(1) NOT NULL DEFAULT '0',
  `nama_menu` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hncf_menu_level2`
--

INSERT INTO `hncf_menu_level2` (`id_level2`, `r_level1`, `has_submenu_flag`, `nama_menu`, `class`, `icon`) VALUES
(1, 1, 1, 'Neraca COA', 'neraca_coa', 'customer_balance.png'),
(2, 1, 1, 'Rugi Laba', 'rugilaba_coa', 'profit_&_lost.png'),
(9, 2, 1, 'Card File', 'cardfile', 'card_file.png'),
(11, 2, 0, 'Outlet', 'outlet', 'outlet.png'),
(12, 3, 0, 'Purchase Order', 'purchase_order', 'purchase_order.png'),
(13, 3, 0, 'Purchase', 'purchase', 'purchase.png'),
(14, 4, 0, 'Purchase Register', 'purchase_register', 'purchase_register.png'),
(15, 4, 0, 'Supplier Payment', 'supplier_payment', 'supplier_payment.png'),
(16, 4, 0, 'Purchase Journal', 'purchase_journal', 'purchase_journal.png'),
(17, 4, 0, 'Ageing Payable', 'ageing_payable', 'ageing_payable.png'),
(18, 5, 0, 'Sales Order', 'sales_order', 'sales_order.png'),
(19, 5, 0, 'Sales', 'sales', 'sales.png'),
(20, 6, 0, 'Sales Register', 'sales_register', 'sales_register.png'),
(21, 6, 0, 'Customer Payment', 'customer_payment', 'customer_payment.png'),
(22, 6, 0, 'Sales Journal', 'sales_journal', 'sales_journal.png'),
(23, 6, 0, 'Ageing Receivable', 'ageing_receivable', 'ageing_receivable.png'),
(24, 7, 0, 'Items', 'items', 'items.png'),
(25, 7, 0, 'Harvest', 'harvest', 'harvest.png'),
(26, 7, 0, 'Inventory', 'inventory', 'inventory.png'),
(27, 7, 0, 'Opnum', 'opnum', 'opnum.png'),
(28, 8, 0, 'Pengadaan', 'pengadaan', 'Ambulance-add-icon.png'),
(29, 8, 0, 'Transfer In', 'transfer_in', 'transfer_in.png'),
(30, 9, 0, 'Register In', 'register_in', 'register_in.png'),
(31, 9, 0, 'Register Out', 'register_out', 'register_out.png'),
(32, 9, 0, 'Inventory Journal', 'inventory_journal', 'inventory_journal.png'),
(33, 10, 0, 'Journal Entry', 'journal_entry', 'journal_entry.png'),
(34, 10, 0, 'Cash Flow', 'cash_flow', 'cash_flow.png'),
(35, 11, 0, 'Expense Form', 'expense_form', 'expense_form.png'),
(36, 11, 0, 'Register', 'register', 'register.png'),
(37, 11, 0, 'Payment', 'payment', 'payment.png'),
(38, 11, 0, 'Ageing Payable', 'ageing_payable', 'ageing_payment.png'),
(39, 12, 0, 'Purchase Report', 'purchase_report', 'purchase_report.png'),
(40, 12, 0, 'Expense Report', 'expense_report', 'expense_report.png'),
(41, 13, 0, 'Revenue', 'revenue', 'revenue.png'),
(42, 13, 0, 'Ranked Sales', 'ranked_sales', 'ranked_sales.png'),
(43, 13, 0, 'Sales Statement', 'sales_statement', 'sales_statement.png'),
(44, 13, 0, 'Customer Balance', 'customer_balance', 'customer_balance.png'),
(45, 13, 0, 'Paid Sales', 'paid_sales', 'paid_sales.png'),
(46, 14, 0, 'Balance Sheet', 'balance_sheet', 'balance_sheet.png'),
(47, 14, 0, 'Profit & Lost', 'profit_n_lost', 'profit_&_lost.png'),
(48, 14, 0, 'Ledger', 'ledger', 'ledger.png'),
(53, 15, 1, 'Master MVC', 'master_mvc', 'truck_vehicle.png'),
(54, 15, 0, 'Unit Vehicle', 'master_vehicle', 'new-items.png'),
(56, 15, 0, 'Barang', 'master_barang', 'inventory.png'),
(57, 15, 0, 'Pricelist', 'master_pricelist', 'paid_sales.png'),
(58, 17, 0, 'Production', 'production', 'blood-drop.png'),
(63, 18, 0, 'Work Order Inv Register', 'woinv_register', 'register-prod.png'),
(65, 19, 0, 'Export Faktur', 'sales_export_efaktur', 'export-excel.png'),
(66, 18, 0, 'WOInv Customer Payment', 'woinv_custpayment', 'sales_journal.png'),
(67, 15, 0, 'Inventaris', 'master_inventaris', 'Ambulance-icon.png'),
(68, 1, 0, 'Rekening', 'master_rekening', 'archive-icon.png'),
(69, 8, 0, 'Transfer Out', 'transfer_out', 'transfer_out.png'),
(70, 8, 0, 'Penyusutan', 'penyusutan', 'Penyusutan.png'),
(72, 17, 0, 'Retailing', 'retailing', 'Retailing.png');

-- --------------------------------------------------------

--
-- Table structure for table `hncf_menu_level3`
--

CREATE TABLE `hncf_menu_level3` (
  `id_level3` int NOT NULL,
  `r_level2` int NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hncf_menu_level3`
--

INSERT INTO `hncf_menu_level3` (`id_level3`, `r_level2`, `nama_menu`, `class`, `icon`) VALUES
(1, 1, 'Assets', 'assets', 'assets.png'),
(2, 1, 'Liability', 'liability', 'liability.png'),
(3, 1, 'Equity', 'equity', 'equity.png'),
(4, 2, 'Income', 'income', 'income.png'),
(5, 2, 'Cost Of Sales', 'cost_of_sales', 'cost_of_sales.png'),
(6, 2, 'Expense', 'expense', 'expense.png'),
(7, 2, 'Other Income', 'other_income', 'other_income.png'),
(8, 2, 'Other Expense', 'other_expense', 'other_expense.png'),
(9, 9, 'Supplier', 'supplier', 'supplier.png'),
(10, 9, 'Customer', 'customer', 'customer.png'),
(11, 9, 'Karyawan', 'master_karyawan', 'karyawan-kantor.png'),
(12, 9, 'Sales Person', 'sales_person', 'sales-person.png'),
(13, 53, 'Master Model', 'master_model', 'truck_gandeng.png'),
(14, 53, 'Master Variant', 'master_variant', 'truck_gandeng_orange.png'),
(15, 53, 'Master Color', 'master_color', 'truck_color1.png');

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE `inventaris` (
  `id_inventaris` int NOT NULL,
  `kode_inventaris` varchar(20) NOT NULL,
  `kode_pengadaan` varchar(20) NOT NULL,
  `nama_inventaris` varchar(225) NOT NULL,
  `group_inventaris` varchar(20) NOT NULL,
  `tahun_pembuatan` date NOT NULL,
  `tahun_perakitan` date NOT NULL,
  `merk` varchar(50) NOT NULL,
  `warna` varchar(150) NOT NULL,
  `bahan` varchar(225) NOT NULL,
  `umur_ekonomis` int NOT NULL COMMENT 'tahun',
  `rcabang_repcode` varchar(10) NOT NULL,
  `extdata_flag` tinyint NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `user_update` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`id_inventaris`, `kode_inventaris`, `kode_pengadaan`, `nama_inventaris`, `group_inventaris`, `tahun_pembuatan`, `tahun_perakitan`, `merk`, `warna`, `bahan`, `umur_ekonomis`, `rcabang_repcode`, `extdata_flag`, `date_create`, `date_update`, `user_create`, `user_update`) VALUES
(5, 'INV000001', '1234', 'Mesin', 'KD', '2021-01-01', '2021-01-01', 'MR000028', 'HITAM', 'BESI', 10, '01000', 0, '2023-02-01 21:57:18', '2023-02-01 21:57:18', '3', '3');

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_pengadaan`
--

CREATE TABLE `inventaris_pengadaan` (
  `id_pengadaan` int NOT NULL,
  `pengadaan_sysno` int NOT NULL,
  `pengadaan_docno` varchar(25) NOT NULL,
  `no_spk` varchar(25) NOT NULL,
  `tgl_spk` date NOT NULL,
  `tahun_anggaran` int NOT NULL,
  `r_anggaran` int NOT NULL,
  `memo` text NOT NULL,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `rcabang_repcode` varchar(10) NOT NULL,
  `extdata_flag` tinyint NOT NULL DEFAULT '0',
  `dealer_repcode` varchar(10) DEFAULT NULL,
  `supplier_code` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventaris_pengadaan`
--

INSERT INTO `inventaris_pengadaan` (`id_pengadaan`, `pengadaan_sysno`, `pengadaan_docno`, `no_spk`, `tgl_spk`, `tahun_anggaran`, `r_anggaran`, `memo`, `void_flag`, `rcabang_repcode`, `extdata_flag`, `dealer_repcode`, `supplier_code`, `date_create`, `user_create`, `date_update`, `user_update`) VALUES
(2, 989000001, 'PMI-PG-02-01-00001', '222', '2023-02-01', 2023, 189, '', 0, '', 0, '01020', 'SP000025', '2023-02-01 22:00:53', '3', '2023-02-01 22:00:53', '3');

--
-- Triggers `inventaris_pengadaan`
--
DELIMITER $$
CREATE TRIGGER `inventaris_pengadaa_afinsert` AFTER INSERT ON `inventaris_pengadaan` FOR EACH ROW BEGIN
DECLARE bulantahun varchar(6);
IF NEW.extdata_flag = 0 THEN     	
	SET @bulantahun = DATE_FORMAT(NEW.tgl_spk, '%Y%m');
	INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'PG',NEW.pengadaan_docno);
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_pengadaan_detail`
--

CREATE TABLE `inventaris_pengadaan_detail` (
  `id_pengadaan_detail` int NOT NULL,
  `rsysno_pengadaan` int NOT NULL,
  `rkode_inventaris` varchar(20) NOT NULL,
  `rkode_pengadaan` varchar(20) NOT NULL,
  `kode_pengadaan_detail` varchar(25) NOT NULL,
  `qty` decimal(11,2) NOT NULL DEFAULT '0.00',
  `harga_perolehan` decimal(11,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(11,2) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL,
  `pgaline_no` int DEFAULT NULL,
  `extdata_flag` tinyint(1) DEFAULT NULL,
  `rdealer_repcode` varchar(10) DEFAULT NULL,
  `unique_detailpga` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventaris_pengadaan_detail`
--

INSERT INTO `inventaris_pengadaan_detail` (`id_pengadaan_detail`, `rsysno_pengadaan`, `rkode_inventaris`, `rkode_pengadaan`, `kode_pengadaan_detail`, `qty`, `harga_perolehan`, `subtotal`, `date_create`, `user_create`, `date_update`, `user_update`, `pgaline_no`, `extdata_flag`, `rdealer_repcode`, `unique_detailpga`) VALUES
(2, 989000001, 'INV000001', '1234', '1234001', '3.00', '4000000.00', '12000000.00', '2023-02-01 22:00:53', '3', '2023-02-01 22:00:53', '3', 1, 0, '01020', '9890000011234001');

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_penyusutan`
--

CREATE TABLE `inventaris_penyusutan` (
  `id_penyusutan` int NOT NULL,
  `penyusutan_sysno` int NOT NULL,
  `penyusutan_docno` varchar(25) NOT NULL,
  `tgl_penyusutan` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `memo_penyusutan` text NOT NULL,
  `rcabang_repcode` varchar(10) NOT NULL,
  `extdata_flag` tinyint NOT NULL DEFAULT '0',
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_penyusutan_detail`
--

CREATE TABLE `inventaris_penyusutan_detail` (
  `id_penyusutan_detail` int NOT NULL,
  `rsysno_penyusutan` int NOT NULL,
  `rkode_inventaris` varchar(20) NOT NULL,
  `tgl_penyusutan` datetime NOT NULL,
  `jumlah_penyusutan` decimal(10,0) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int NOT NULL,
  `item_code` varchar(15) DEFAULT NULL,
  `item_name` varchar(40) DEFAULT NULL,
  `common_pricelist` tinyint(1) NOT NULL DEFAULT '0',
  `dim_height` decimal(11,2) NOT NULL DEFAULT '0.00',
  `dim_length` decimal(11,2) NOT NULL DEFAULT '0.00',
  `dim_width` decimal(11,2) NOT NULL DEFAULT '0.00',
  `weight` decimal(11,2) NOT NULL DEFAULT '0.00',
  `weight_unit` char(3) DEFAULT NULL,
  `ritem_class` varchar(10) DEFAULT NULL,
  `item_group` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `item_type` char(1) DEFAULT NULL,
  `emergency_lead_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `inspection` char(1) DEFAULT NULL,
  `ismandatory` tinyint(1) NOT NULL DEFAULT '0',
  `isremoveable` tinyint(1) NOT NULL DEFAULT '0',
  `last_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `last_sales` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `lottable` char(1) DEFAULT NULL,
  `markup_percent` varchar(10) DEFAULT NULL,
  `pricelist_item` char(1) DEFAULT NULL,
  `rdiscount_code` varchar(5) DEFAULT NULL,
  `sales_item` char(1) DEFAULT NULL,
  `sales_unit` char(3) DEFAULT NULL,
  `min_stock` decimal(5,2) NOT NULL DEFAULT '0.00',
  `rsupplier` varchar(20) DEFAULT NULL,
  `racc_persediaan` int NOT NULL DEFAULT '0',
  `racc_hpp` int NOT NULL DEFAULT '0',
  `racc_penjualan` int NOT NULL DEFAULT '0',
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `item_code`, `item_name`, `common_pricelist`, `dim_height`, `dim_length`, `dim_width`, `weight`, `weight_unit`, `ritem_class`, `item_group`, `item_type`, `emergency_lead_time`, `inspection`, `ismandatory`, `isremoveable`, `last_price`, `last_sales`, `lottable`, `markup_percent`, `pricelist_item`, `rdiscount_code`, `sales_item`, `sales_unit`, `min_stock`, `rsupplier`, `racc_persediaan`, `racc_hpp`, `racc_penjualan`, `date_update`, `user_update`, `date_create`, `user_create`, `extdata_flag`) VALUES
(303240, 'OBT000001', 'analgesic Gel 120 gr', 0, '0.00', '0.00', '0.00', '0.00', NULL, 'MR000029', 'OBT', 'S', '0.00', NULL, 0, 0, '130286.0000', '130286.0000', NULL, NULL, NULL, NULL, NULL, 'PCS', '5.00', 'SP000019', 11604, 54500, 42801, '2023-02-01 14:30:09', '2', '2023-02-01 14:30:09', '2', 0),
(303241, 'BJ000001', 'paramex', 0, '0.00', '0.00', '0.00', '0.00', NULL, 'MR000023', 'BJ', 'S', '0.00', NULL, 0, 0, '3000.0000', '5000.0000', NULL, NULL, NULL, NULL, NULL, 'PCS', '2.00', 'SP000026', 11610, 51000, 42802, '2023-02-09 08:11:58', '3', '2023-02-09 08:11:58', '3', 0);

-- --------------------------------------------------------

--
-- Table structure for table `items_class`
--

CREATE TABLE `items_class` (
  `itemsclass_id` int NOT NULL,
  `item_class_code` varchar(10) DEFAULT NULL,
  `item_class_name` varchar(100) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items_class`
--

INSERT INTO `items_class` (`itemsclass_id`, `item_class_code`, `item_class_name`, `date_update`, `user_update`, `date_create`, `user_create`, `extdata_flag`) VALUES
(23928, 'MR000001', 'TERUMO', '2022-08-29 22:19:47', NULL, '2022-08-29 22:19:47', NULL, 0),
(23929, 'MR000002', 'COMPOPLEX', '2022-08-29 22:20:00', NULL, '2022-08-29 22:20:00', NULL, 0),
(23930, 'MR000003', 'KARMI', '2022-08-29 22:20:09', NULL, '2022-08-29 22:20:09', NULL, 0),
(23931, 'MR000004', 'JMS', '2022-08-29 22:20:16', NULL, '2022-08-29 22:20:16', NULL, 0),
(23932, 'MR000005', 'SINAR DUNIA', '2022-08-30 12:17:44', NULL, '2022-08-30 12:17:44', NULL, 0),
(23933, 'MR000006', 'ELLYSER', '2022-10-15 03:04:28', NULL, '2022-10-15 03:04:28', NULL, 0),
(23934, 'MR000007', 'ELECSYS', '2022-10-15 03:05:46', NULL, '2022-10-15 03:05:46', NULL, 0),
(23935, 'MR000008', 'SECA', '2022-10-15 03:06:11', NULL, '2022-10-15 03:06:11', NULL, 0),
(23936, 'MR000009', 'ONE MED', '2022-10-15 03:06:21', NULL, '2022-10-15 03:06:21', NULL, 0),
(23937, 'MR000010', 'ACCU CHECK', '2022-10-15 03:06:57', NULL, '2022-10-15 03:06:57', NULL, 0),
(23938, 'MR000011', 'HANSAPLAST', '2022-10-15 03:07:06', NULL, '2022-10-15 03:07:06', NULL, 0),
(23939, 'MR000012', 'ESKA MED', '2022-10-15 03:07:22', NULL, '2022-10-15 03:07:22', NULL, 0),
(23940, 'MR000013', 'LATEX', '2022-10-15 03:07:53', NULL, '2022-10-15 03:07:53', NULL, 0),
(23941, 'MR000014', 'MAXTER', '2022-10-15 03:08:07', NULL, '2022-10-15 03:08:07', NULL, 0),
(23942, 'MR000015', 'MYGUARD', '2022-10-15 03:08:29', NULL, '2022-10-15 03:08:29', NULL, 0),
(23943, 'MR000016', 'ARKAN', '2022-10-15 03:08:49', NULL, '2022-10-15 03:08:49', NULL, 0),
(23944, 'MR000017', 'KIMA', '2022-10-15 03:09:03', NULL, '2022-10-15 03:09:03', NULL, 0),
(23945, 'MR000018', 'GIBSON', '2022-10-15 03:09:25', NULL, '2022-10-15 03:09:25', NULL, 0),
(23946, 'MR000019', 'BANTEX', '2022-10-15 03:09:43', NULL, '2022-10-15 03:09:43', NULL, 0),
(23947, 'MR000020', 'ALL BRAND', '2022-10-16 19:29:28', NULL, '2022-10-16 19:29:28', NULL, 0),
(23948, 'MR000021', 'PMI', '2023-01-02 13:12:20', NULL, '2023-01-02 13:12:20', NULL, 0),
(23949, 'MR000022', 'PERTAMAX', '2023-01-02 13:42:11', NULL, '2023-01-02 13:42:11', NULL, 0),
(23950, 'MR000023', 'PERTAMAX', '2023-01-27 15:51:05', NULL, '2023-01-27 15:51:05', NULL, 0),
(23951, 'MR000024', 'PANADOL', '2023-01-30 08:48:44', NULL, '2023-01-30 08:48:44', NULL, 0),
(23955, 'MR000028', 'HEXA', '2023-01-30 09:55:59', NULL, '2023-01-30 09:55:59', NULL, 0),
(23957, 'MR000029', 'COUNTERPAIN', '2023-02-01 14:27:37', NULL, '2023-02-01 14:27:37', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `items_inv`
--

CREATE TABLE `items_inv` (
  `items_invid` int NOT NULL,
  `inv_uniqueid` varchar(25) NOT NULL,
  `ritem_code` varchar(15) NOT NULL,
  `stock_inv` decimal(10,2) NOT NULL DEFAULT '0.00',
  `allocation` decimal(10,2) NOT NULL DEFAULT '0.00',
  `available` decimal(10,2) DEFAULT '0.00',
  `last_cost` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `average_cost` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `last_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `pdate_trans` date NOT NULL DEFAULT '2021-04-01',
  `sdate_trans` date NOT NULL DEFAULT '2021-04-01',
  `rcabang_repcode` varchar(10) NOT NULL DEFAULT '00000',
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items_inv`
--

INSERT INTO `items_inv` (`items_invid`, `inv_uniqueid`, `ritem_code`, `stock_inv`, `allocation`, `available`, `last_cost`, `average_cost`, `last_price`, `pdate_trans`, `sdate_trans`, `rcabang_repcode`, `date_update`, `user_update`, `date_create`, `user_create`, `extdata_flag`) VALUES
(381913, 'OBT00000101000', 'OBT000001', '4.00', '15.00', '-11.00', '130286.0000', '130286.0000', '130286.0000', '2023-02-01', '2021-04-01', '01000', '2023-02-09 08:14:25', 'US003', '2023-02-01 14:30:09', '2', 0),
(381918, 'BJ00000101000', 'BJ000001', '-5.00', '25.00', '-30.00', '3000.0000', '3000.0000', '5000.0000', '2023-02-09', '2021-04-01', '01000', '2023-02-09 08:14:25', 'US003', '2023-02-09 08:11:58', '3', 0);

--
-- Triggers `items_inv`
--
DELIMITER $$
CREATE TRIGGER `items_inv_b4insert` BEFORE INSERT ON `items_inv` FOR EACH ROW BEGIN
	SET new.available = new.stock_inv;    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `items_inv_b4update` BEFORE UPDATE ON `items_inv` FOR EACH ROW BEGIN
	DECLARE stock decimal(10,2);
    DECLARE alloc decimal(10,2);
    IF new.stock_inv IS NULL THEN 
        SET @stock = old.stock_inv;
    ELSE
        SET @stock = new.stock_inv;
    END IF;
    IF new.allocation IS NULL THEN 
        SET @alloc = abs(old.allocation);
    ELSE
        SET @alloc = abs(new.allocation);
    END IF;
	SET new.available = @stock-@alloc;   
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items_invdetail`
--

CREATE TABLE `items_invdetail` (
  `items_invid` int NOT NULL,
  `ritem_code` varchar(15) NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `cost` decimal(17,4) NOT NULL,
  `sales_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `rtrans` char(2) NOT NULL,
  `notrans` varchar(25) NOT NULL,
  `invtrans` varchar(25) NOT NULL DEFAULT '0',
  `alocation_flag` tinyint(1) NOT NULL DEFAULT '0',
  `rdealer_repcode` varchar(10) NOT NULL,
  `date_trans` date NOT NULL DEFAULT '2022-04-01',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items_invdetail`
--

INSERT INTO `items_invdetail` (`items_invid`, `ritem_code`, `qty`, `cost`, `sales_price`, `rtrans`, `notrans`, `invtrans`, `alocation_flag`, `rdealer_repcode`, `date_trans`, `date_create`, `user_create`, `date_update`, `user_update`, `extdata_flag`) VALUES
(396103, 'OBT000001', '0.00', '130286.0000', '130286.0000', 'OP', 'OP20230201', '0', 0, '01020', '2023-02-01', '2023-02-01 14:30:09', '2', '2023-02-01 13:38:58', '2', 0),
(396107, 'OBT000001', '9.00', '130286.0000', '130286.0000', 'PR', 'PMI-PO-02-05-00002', 'PMI-PR-02-05-00002', 0, '01020', '0000-00-00', '2023-02-05 14:28:57', '3', '2023-02-05 14:28:57', '3', 0),
(396108, 'BJ000001', '0.00', '3000.0000', '5000.0000', 'OP', 'OP20230209', '0', 0, '01020', '2023-02-09', '2023-02-09 08:11:58', '3', '2023-02-09 08:11:58', '3', 0),
(396109, 'OBT000001', '-20.00', '0.0000', '0.0000', 'SO', 'PMI-SO-02-09-00001', '0', 1, '01020', '2023-02-09', '2023-02-09 08:12:47', 'US003', '2023-02-09 08:12:47', 'US003', 0),
(396110, 'BJ000001', '-30.00', '0.0000', '0.0000', 'SO', 'PMI-SO-02-09-00001', '0', 1, '01020', '2023-02-09', '2023-02-09 08:12:47', 'US003', '2023-02-09 08:12:47', 'US003', 0),
(396111, 'OBT000001', '-5.00', '651430.0000', '0.0000', 'SI', 'PMI-SO-02-09-00001', 'PMI-SV-02-09-00001', 0, '01020', '2023-02-09', '2023-02-09 08:14:25', 'US003', '2023-02-09 08:14:25', 'US003', 0),
(396112, 'BJ000001', '-5.00', '25000.0000', '0.0000', 'SI', 'PMI-SO-02-09-00001', 'PMI-SV-02-09-00001', 0, '01020', '2023-02-09', '2023-02-09 08:14:25', 'US003', '2023-02-09 08:14:25', 'US003', 0);

--
-- Triggers `items_invdetail`
--
DELIMITER $$
CREATE TRIGGER `items_invdetail_afdel` AFTER DELETE ON `items_invdetail` FOR EACH ROW BEGIN
DECLARE amnb4 decimal(10,2);
DECLARE amnaf decimal(10,2);
DECLARE invb4 decimal(10,2);
DECLARE invaf decimal(10,2);
DECLARE uniqueid varchar(25);
DECLARE costb4 decimal (10,2);
DECLARE lastcost decimal(10,2);
DECLARE avgcost decimal (10,2);
DECLARE date_transb4 date;
DECLARE cabang varchar(10);
DECLARE sales_price DECIMAL(10,2);
SET @cabang = (SELECT trim(cabang_repcode) FROM setup_dealer where dealer_repcode = old.rdealer_repcode);
SET @uniqueid = concat(trim(old.ritem_code),trim(@cabang));
SET @date_transb4 = (SELECT pdate_trans FROM items_inv where inv_uniqueid = @uniqueid); 
SET @sales_price = old.sales_price;
	IF old.alocation_flag = '0' THEN
		SET @invb4 = (SELECT stock_inv from items_inv where inv_uniqueid = @uniqueid);
        IF (ISNULL(@invb4)) THEN SET @invb4 = 0; END IF;		
		IF old.rtrans = 'PR' or old.rtrans = 'OP' THEN
			SET @invaf = @invb4 - abs(old.qty);
			SET @costb4 = (SELECT last_cost FROM items_inv where inv_uniqueid = @uniqueid); 
			SET @lastcost = old.cost;
			SET @avgcost = ((@invb4 * @costb4)-(abs(old.qty)*@lastcost))/@invaf;
			IF old.date_trans >= @date_transb4 THEN			
				IF @sales_price > 0 THEN
					UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost,last_price = @sales_price where inv_uniqueid = @uniqueid;
				ELSE
					UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost where inv_uniqueid = @uniqueid;
				END IF;
			ELSE
				UPDATE items_inv set stock_inv = @invaf,average_cost = @avgcost where inv_uniqueid = @uniqueid;
			END IF;			
		ELSE			
			SET @amnb4 = (SELECT allocation from items_inv where inv_uniqueid = @uniqueid);
			IF (ISNULL(@amnb4)) THEN SET @amnb4 = 0.00; END IF;
			SET @amnaf = @amnb4 + abs(old.qty);
			UPDATE items_inv set allocation = @amnaf where inv_uniqueid = @uniqueid;
			SET @invaf = @invb4 + abs(old.qty);			
			UPDATE items_inv set stock_inv = @invaf where inv_uniqueid = @uniqueid;
		END IF;		
    ELSE 
		SET @amnb4 = (SELECT allocation from items_inv where inv_uniqueid = @uniqueid);
		IF (ISNULL(@amnb4)) THEN SET @amnb4 = 0.00; END IF;
		SET @amnaf = @amnb4 - abs(old.qty);				
		UPDATE items_inv set allocation = @amnaf where inv_uniqueid = @uniqueid;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `items_invdetail_afinsert` AFTER INSERT ON `items_invdetail` FOR EACH ROW BEGIN
DECLARE stockb4 decimal(10,2);
DECLARE stockaf decimal(10,2);
DECLARE amnaf decimal(10,2);
DECLARE amnb4 decimal(10,2);
DECLARE uniqueid varchar(25);
DECLARE costb4 decimal (10,2);
DECLARE lastcost decimal(10,2);
DECLARE avgcost decimal (10,2);
DECLARE date_transb4 date;
DECLARE cabang varchar(10);
DECLARE sales_price decimal(10,2);
SET @cabang = (SELECT rtrim(cabang_repcode) FROM setup_dealer where dealer_repcode = new.rdealer_repcode);
SET @uniqueid = concat(trim(new.ritem_code),trim(@cabang));
SET @date_transb4 = (SELECT pdate_trans FROM items_inv where inv_uniqueid = @uniqueid);
IF (ISNULL(@date_transb4)) THEN SET @date_transb4 = '1990-01-01'; END IF;
SET @invb4 = (SELECT stock_inv from items_inv where inv_uniqueid = @uniqueid);
IF (ISNULL(@invb4)) THEN SET @invb4 = 0; END IF;
SET @amnb4 = (SELECT allocation from items_inv where inv_uniqueid = @uniqueid);
IF (ISNULL(@amnb4)) THEN SET @amnb4 = 0; END IF;
SET @sales_price = new.sales_price;
	IF new.alocation_flag = '0' THEN 
		SET @stockb4 = (SELECT COALESCE(stock_inv,0) from items_inv where inv_uniqueid = @uniqueid);
		IF (ISNULL(@stockb4)) THEN SET @stockb4 = 0; END IF;
		SET @stockaf = @stockb4 + new.qty;
		IF  new.rtrans = 'OP' OR new.rtrans = 'PR' OR new.rtrans = 'PD' THEN 
			SET @costb4 = (SELECT last_cost FROM items_inv where inv_uniqueid = @uniqueid); 
			IF (ISNULL(@costb4)) THEN SET @costb4 = 0; END IF;
			SET @lastcost = new.cost;
			SET @invaf = @invb4 + new.qty;			
			SET @avgcost = ((@invb4 * @costb4)+(abs(new.qty)*@lastcost))/@invaf;	
			IF (ISNULL(@avgcost)) THEN SET @avgcost = @lastcost; END IF;			
			IF new.date_trans >= @date_transb4 THEN
				IF @sales_price > 0 THEN
					INSERT INTO items_inv (inv_uniqueid,ritem_code, stock_inv, rcabang_repcode,last_cost,average_cost,last_price,pdate_trans,user_update,user_create, extdata_flag) VALUES (
					@uniqueid, new.ritem_code,new.qty,@cabang,new.cost,new.cost,@sales_price,new.date_trans,new.user_update,new.user_create, new.extdata_flag) 
					ON DUPLICATE KEY UPDATE stock_inv = @invaf,last_cost=@lastcost,average_cost=@avgcost,last_price = @sales_price, pdate_trans=new.date_trans,user_update = new.user_update;
				ELSE
					INSERT INTO items_inv (inv_uniqueid,ritem_code, stock_inv, rcabang_repcode,last_cost,average_cost,pdate_trans,user_update,user_create, extdata_flag) VALUES (
					@uniqueid, new.ritem_code,new.qty,@cabang,new.cost,new.cost,new.date_trans,new.user_update,new.user_create, new.extdata_flag) 
					ON DUPLICATE KEY UPDATE stock_inv = @invaf,last_cost=@lastcost,average_cost=@avgcost, pdate_trans=new.date_trans,user_update = new.user_update;
				END IF;
			ELSE
				INSERT INTO items_inv (inv_uniqueid,ritem_code, stock_inv, rcabang_repcode,last_cost,average_cost,pdate_trans,user_update,user_create, extdata_flag) VALUES 
				(@uniqueid, new.ritem_code,new.qty,@cabang,new.cost,new.cost,new.date_trans,new.user_update,new.user_create, new.extdata_flag) 
				ON DUPLICATE KEY UPDATE stock_inv = new.qty,average_cost=@avgcost,user_update = new.user_update;
			END IF;
		ELSE 
			IF new.rtrans = 'SI' THEN
				SET @amnaf = @amnb4 - abs(new.qty);					
				SET @invaf = @invb4 - abs(new.qty);
				UPDATE items_inv set stock_inv = @invaf,allocation = @amnaf where inv_uniqueid = @uniqueid;
			ELSE
				INSERT INTO items_inv (inv_uniqueid,ritem_code, stock_inv, rcabang_repcode,user_update,user_create, extdata_flag) 
				VALUES (@uniqueid, new.ritem_code,new.qty,@cabang,new.user_update,new.user_create, new.extdata_flag) 
				ON DUPLICATE KEY UPDATE stock_inv = new.qty, user_update = new.user_update;
			END IF;
		END IF;	
	ELSE
		SET @stockb4 = (SELECT COALESCE(allocation,0) from items_inv where inv_uniqueid = @uniqueid);
		IF (ISNULL(@stockb4)) THEN SET @stockb4 = 0; END IF;
		SET @stockaf = @stockb4 + abs(new.qty);
		INSERT INTO items_inv (inv_uniqueid,ritem_code, stock_inv,allocation,rcabang_repcode,user_update,user_create, extdata_flag) 
			VALUES (@uniqueid, new.ritem_code,@stockaf,@stockaf,@cabang,new.user_update,new.user_create, new.extdata_flag) 
			ON DUPLICATE KEY UPDATE allocation = @stockaf, user_update = new.user_update;	
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `items_invdetail_afupdate` AFTER UPDATE ON `items_invdetail` FOR EACH ROW BEGIN
DECLARE amnb4 decimal(10,2);
DECLARE amnaf decimal(10,2);
DECLARE amnnew decimal(10,2);
DECLARE invb4 decimal(10,2);
DECLARE invaf decimal(10,2);
DECLARE invnew decimal(10,2);
DECLARE uniqueid varchar(25);
DECLARE date_transb4 date;
DECLARE costb4 decimal (10,2);
DECLARE lastcost decimal(10,2);
DECLARE avgcost decimal (10,2);
DECLARE sales_price decimal (10,2);
DECLARE cabang varchar(10);
SET @cabang = (SELECT rtrim(cabang_repcode) FROM setup_dealer where dealer_repcode = new.rdealer_repcode);
SET @uniqueid = concat(trim(new.ritem_code),trim(@cabang));
SET @date_transb4 = (SELECT pdate_trans FROM items_inv where inv_uniqueid = @uniqueid); 
SET @invb4 = (SELECT stock_inv from items_inv where inv_uniqueid = @uniqueid);
IF (ISNULL(@invb4)) THEN SET @invb4 = 0; END IF;
SET @amnb4 = (SELECT allocation from items_inv where inv_uniqueid = @uniqueid);
IF (ISNULL(@amnb4)) THEN SET @amnb4 = 0; END IF;
SET @sales_price = new.sales_price;
	IF old.alocation_flag != new.alocation_flag THEN	
    	IF new.alocation_flag = '0' THEN 					
			IF new.rtrans = 'PR' THEN
				SET @invaf = @invb4 - old.qty + new.qty;
				IF @invb4 = 0 THEN 
					SET @lastcost = new.cost;
					SET @avgcost = new.cost;
				ELSE
					SET @costb4 = (SELECT last_cost FROM items_inv where inv_uniqueid = @uniqueid); 
					SET @lastcost = new.cost;
					SET @avgcost = ((@invb4 * @costb4)+(abs(new.qty)*@lastcost))/@invaf;
				END IF;				
				IF new.date_trans >= @date_transb4 THEN	
					IF @sales_price > 0 THEN
						UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost,last_price = @sales_price where inv_uniqueid = @uniqueid;
					ELSE
						UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost where inv_uniqueid = @uniqueid;
					END IF;
				ELSE
					UPDATE items_inv set stock_inv = @invaf,average_cost = @avgcost where inv_uniqueid = @uniqueid;
				END IF;
			ELSE				
				IF new.rtrans = 'OP' THEN
					SET @invaf = @invb4 - old.qty + new.qty;
					SET @lastcost = new.cost;
					SET @avgcost = new.cost;
					IF new.date_trans >= @date_transb4 THEN	
						IF @sales_price > 0 THEN
							UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost,last_price = @sales_price where inv_uniqueid = @uniqueid;
						ELSE
							UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost where inv_uniqueid = @uniqueid;
						END IF;
					ELSE
						UPDATE items_inv set stock_inv = @invaf,average_cost = @avgcost where inv_uniqueid = @uniqueid;
					END IF;					
				ELSE
					SET @amnaf = @amnb4 - abs(old.qty);					
					SET @invaf = @invb4 + new.qty;
					UPDATE items_inv set stock_inv = @invaf,allocation = @amnaf where inv_uniqueid = @uniqueid;
				END IF;				
			END IF;
        END IF;
    ELSE 
		IF old.qty != new.qty THEN		
			IF new.alocation_flag = '0' THEN
				SET @invaf = @invb4 - old.qty + new.qty;
				IF new.rtrans = 'OP' or new.rtrans = 'PR' THEN		
					SET @costb4 = (SELECT last_cost FROM items_inv where inv_uniqueid = @uniqueid); 
					IF (ISNULL(@costb4)) THEN SET @costb4 = 0; END IF;
					SET @lastcost = new.cost;
					SET @avgcost = ((@invb4 * @costb4)+(abs(new.qty)*@lastcost))/@invaf;
					IF new.date_trans >= @date_transb4 THEN	
						IF @sales_price > 0 THEN
							UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost,last_price = @sales_price where inv_uniqueid = @uniqueid;						
						ELSE
							UPDATE items_inv set stock_inv = @invaf,last_cost = @lastcost,average_cost = @avgcost where inv_uniqueid = @uniqueid;				
						END IF;
					ELSE
						UPDATE items_inv set stock_inv = @invaf,average_cost = @avgcost where inv_uniqueid = @uniqueid;						
					END IF;
				ELSE
					UPDATE items_inv set stock_inv = @invaf where inv_uniqueid = @uniqueid;				
				END IF;				
			ELSE
				SET @amnaf = @amnb4 - abs(old.qty);
				SET @amnnew = @amnaf + abs(new.qty);
				UPDATE items_inv set allocation = @amnnew where inv_uniqueid = @uniqueid;
			END IF;
		ELSE
			IF old.cost != new.cost THEN
				SET @costb4 = (SELECT last_cost FROM items_inv where inv_uniqueid = @uniqueid); 
				IF (ISNULL(@costb4)) THEN SET @costb4 = 0; END IF;
				SET @lastcost = new.cost;
				SET @avgcost = ((@invb4 * @costb4)+(abs(old.qty)*@lastcost))/@invaf;
				IF new.date_trans >= @date_transb4 THEN	
					IF @sales_price > 0 THEN
						UPDATE items_inv set last_cost = @lastcost,average_cost = @avgcost,last_price = @sales_price where inv_uniqueid = @uniqueid;	
					ELSE
						UPDATE items_inv set last_cost = @lastcost,average_cost = @avgcost where inv_uniqueid = @uniqueid;					
					END IF;
				ELSE
					UPDATE items_inv set average_cost = @avgcost where inv_uniqueid = @uniqueid;
				END IF;
			ELSE
				IF old.sales_price != new.sales_price THEN
					IF new.date_trans >= @date_transb4 THEN	
						UPDATE items_inv set last_price = @sales_price where inv_uniqueid = @uniqueid;
					END IF;
				END IF;
			END IF;
		END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items_pricelist`
--

CREATE TABLE `items_pricelist` (
  `items_pricelist_id` int NOT NULL,
  `item_code` varchar(15) DEFAULT NULL,
  `ritem_class` varchar(10) DEFAULT NULL,
  `item_pricelist` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `supplier_itemprice` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `main_location` varchar(25) DEFAULT NULL,
  `max` decimal(17,2) NOT NULL DEFAULT '0.00',
  `min` decimal(17,2) NOT NULL DEFAULT '0.00',
  `model_code` varchar(500) DEFAULT NULL,
  `substitution` varchar(500) DEFAULT NULL,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_mobil`
--

CREATE TABLE `jenis_mobil` (
  `type_id` int NOT NULL,
  `type_code` char(25) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `jenis_mobil`
--

INSERT INTO `jenis_mobil` (`type_id`, `type_code`, `type_name`) VALUES
(1, 'asdfa', 'DUTRO DT001'),
(2, 'adkww', 'DL 1001 TA');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `karyawan_id` int NOT NULL,
  `karyawan_code` char(20) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `karyawan_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `rjabatan` char(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `rcabang_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alamat` char(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `phone` char(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `tmp_lahir` char(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `tgl_lahir` date DEFAULT NULL,
  `gender` char(15) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `sts_nikah` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `pendidikan` char(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `aktif` char(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT '',
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `password` varchar(225) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `user_create` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `user_update` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_udpate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`karyawan_id`, `karyawan_code`, `karyawan_name`, `rjabatan`, `rcabang_code`, `alamat`, `phone`, `tmp_lahir`, `tgl_lahir`, `gender`, `sts_nikah`, `tgl_masuk`, `tgl_keluar`, `pendidikan`, `aktif`, `keterangan`, `username`, `password`, `user_create`, `user_update`, `date_create`, `date_udpate`, `extdata_flag`) VALUES
(224, 'CSB00480', 'NI MADE SUDIARTINI', 'pos06', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:03', '2023-02-01 13:38:58', 0),
(225, 'CSB00371', 'I MADE PARTA CAHYA S,SE', 'pos06', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:03', '2023-02-01 13:38:58', 0),
(226, 'CSB00425', 'KOMANG REDENDI, SE ', 'pos06', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:03', '2023-02-01 13:38:58', 0),
(227, 'CSB100682', 'LUH AYU OKTAVIANI', 'pos06', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:03', '2023-02-01 13:38:58', 0),
(228, 'CSB00021', 'NI LUH MAROPI ', 'pos21', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(229, 'CSB00519', 'I GST AG ARI KUSUMA DEWI', 'pos07', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(230, 'CSB100684', 'NI LUH PT JULIANI DEWI G ', 'pos07', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(231, 'CS00036', 'YOHANES GESI', 'pos12', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(232, 'CSB00441', 'NI WAYAN EKA WIDNYANI', 'pos27', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(233, 'CSB00430', 'BIRGITA GEBIVIONA ALLO ', 'pos27', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(234, 'CSB00423', 'KETUT REDIASA', 'pos27', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(235, 'CSB00396', 'PUTU ANDIKA', 'pos27', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(236, 'CSB0364', 'UJANG ADI LESMANA', 'pos26', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(237, 'CSB00195', 'MADE SUDARMAYA', 'pos29', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(238, 'CSB00439', 'MOHAMMAD ARFIAN NUR YOGA ', 'pos22', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(239, 'CSB00084', 'KADEK SUARKA', 'pos14', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(240, 'CS00074', 'MADE ANTARA', 'pos13', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(241, 'CSB100655', 'GST AYU KT YUNI LIDYAWATI', 'pos08', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(242, 'CSB100696', 'NI WAYAN ARI WIDYASTITI', 'pos08', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(243, 'CSB00491', 'NANANG SETIAWAN', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(244, 'CSB00522', 'I Putu Rian Angga Pratama', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(245, 'CSB100566', 'LUTFIL HAKIM', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(246, 'CSB100673', 'YUDHIS ADI PUTRA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0),
(247, 'CS0358', 'MADE LANUS ARTA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(248, 'CS00081', 'MADE ADRA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(249, 'CS00018', 'WAYAN MARDIKA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(250, 'CSB00391', 'I GEDE AGUS KRISNHA PUTRA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(251, 'CSB00082', 'KADEK SUDIYASA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(252, 'CSB00389', 'LUCKY ANDRIAN', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(253, 'CSB00429', 'MADE SUKADA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(254, 'CSB00476', 'KADEK AGUS ARTAYASA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(255, 'CSB100687', 'RAKHA ALVIANO MAULANA', 'pos28', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(256, 'CS00232', 'GEDE WIRANATA', 'pos19', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(257, 'CS00037', 'NYOMAN SUPERDANA', 'pos19', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(258, 'CSB00392', 'JAINAL ABIDIN', 'pos19', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(259, 'CS00220', 'KOMANG KERTIYASA', 'pos19', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(260, 'CSB00203', 'I KADEK ARTAWAN', 'pos16', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(261, 'CSB100665', 'NI KOMANG ROSITA YANTI', 'pos18', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(262, 'CS00034', 'MURJAYA', 'pos15', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:05', '2023-02-01 13:38:58', 0),
(263, 'CS00043', 'NYOMAN SUDANA', 'pos15', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(264, 'CSB00106', 'I GEDE SUTRISNA BUANA P', 'pos20', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(265, 'CS00084', 'KADEK SUARKA', 'pos20', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(266, 'CS00080', 'I B TEJA KENCANA', 'pos04', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(267, 'CS0367', 'NI NYOMAN SUKA GINANTRI', 'pos09', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(268, 'CSB00554', 'JULIANA MARIA MONICA A.N', 'pos17', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(269, 'CSB00143', 'I GEDE ARTHA WIJAYA', 'pos05', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(270, 'CSB100656', 'NATHAN ADI RESWARA', 'pos10', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(271, 'CSB100689', 'A.A GITHA BHASUDEWA PUTRA', 'pos10', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(272, 'CS00004', 'I NYOMAN GEDE SUBAWA', 'pos03', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(273, 'CS00329', 'ELYSA', 'pos01', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(274, 'CSB00169', 'NI LUH GD EKA RATNA GIRI', 'pos11', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(275, 'CS00216', 'PUTU SUKANDI', 'pos02', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(276, 'CS00176', 'I NYM KIMUJANATA ', 'pos02', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(277, 'CSB00551', 'MICHAEL ', 'pos24', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(278, 'CSB00209', 'MADE WAHYU DARMAWAN ', 'pos24', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:06', '2023-02-01 13:38:58', 0),
(279, 'CSB00136', 'EDY DWI PURBA WANTARA', 'pos24', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(280, 'CSB100635', 'RINA KUSMIRAWATI ', 'pos25', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(281, 'CSB100649', 'KM AYU TRIANDARI PURWANTO', 'pos25', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(282, 'CSB00198', 'NI NYOMAN BUDIAYU LESTARI', 'pos25', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(283, 'CS00486', 'ANDY KOSWARA', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(284, 'CS00484', 'ARDYANTO SERAN', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(285, 'CS00485', 'LUH LOVIANA ARI UTAMI ', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(286, 'CSB100605', 'I GST NGR OKA WIDYASTIKA', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(287, 'CSB100650', 'I MADE GUNARSA ', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(288, 'CSB00147', 'I WAYAN SUARDIKA', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(289, 'CSB100671', 'KADEK UNGGAH ADI NOPE ', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(290, 'CSB100690', 'I NYM WIDHI ASTIKA KARANG', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(291, 'CSB100691', 'KOMANG JULI ANGGA PRAYOGA', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:07', '2023-02-01 13:38:58', 0),
(292, 'CSB100695', 'I DEWA MADE BUDI DHARMA', 'pos23', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:08', '2023-02-01 13:38:58', 0),
(293, 'HINO034', 'NYOMAN SUDANA', NULL, '', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2022-04-27 16:31:55', '2023-02-01 13:38:58', 1),
(294, 'HINO035', 'KOMANG KERTIYASA', NULL, '', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '2022-04-27 16:31:55', '2023-02-01 13:38:58', 1),
(295, 'CSB00001', 'CSBI Sales Person', 'pos22', '01020', NULL, NULL, '', NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, 'HMSI', 'HMSI', '2022-03-20 11:47:04', '2023-02-01 13:38:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `label`
--

CREATE TABLE `label` (
  `id_label` int NOT NULL,
  `nama_label` varchar(50) NOT NULL,
  `form` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `label`
--

INSERT INTO `label` (`id_label`, `nama_label`, `form`) VALUES
(1, 'hncf_master', '#MDI#'),
(3, 'hncf_sales', '#MDI#'),
(6, 'hncf_report', '#MDI#'),
(8, 'hncf_account', '#MDI#'),
(9, 'hncf_card_file', '#MDI#'),
(10, 'hncf_general_transaction', '#MDI#'),
(11, 'hncf_accounting', '#MDI#'),
(12, 'hncf_inventory_mdi', '#MDI#'),
(13, 'hncf_inventory_transaction', '#MDI#'),
(14, 'hncf_general_jurnal', '#MDI#'),
(15, 'hncf_expenses', '#MDI#'),
(16, 'hncf_general', '#MDI#'),
(17, 'hncf_sales_report', '#MDI#'),
(23, 'hncf_assets', '#MDI#'),
(24, 'hncf_liability', '#MDI#'),
(25, 'hncf_equity', '#MDI#'),
(26, 'hncf_income', '#MDI#'),
(27, 'hncf_cost_of_sales', '#MDI#'),
(28, 'hncf_expense', '#MDI#'),
(29, 'hncf_other_income', '#MDI#'),
(30, 'hncf_other_expense', '#MDI#'),
(31, 'hncf_supplier', '#MDI#'),
(32, 'hncf_customer', '#MDI#'),
(33, 'hncf_outlet', '#MDI#'),
(34, 'hncf_purchase_order', '#MDI#'),
(35, 'hncf_purchase', '#MDI#'),
(36, 'hncf_purchase_register', '#MDI#'),
(37, 'hncf_supplier_payment', '#MDI#'),
(38, 'hncf_purchase_journal', '#MDI#'),
(40, 'hncf_sales_order', '#MDI#'),
(42, 'hncf_sales_register', '#MDI#'),
(43, 'hncf_customer_payment', '#MDI#'),
(44, 'hncf_sales_journal', '#MDI#'),
(45, 'hncf_ageing_receivable', '#MDI#'),
(46, 'hncf_items', '#MDI#'),
(47, 'hncf_harves', '#MDI#'),
(49, 'hncf_opnum', '#MDI#'),
(50, 'hncf_transfer_in', '#MDI#'),
(51, 'hncf_transfer_out', '#MDI#'),
(52, 'hncf_register_in', '#MDI#'),
(53, 'hncf_register_out', '#MDI#'),
(54, 'hncf_inventory_journal', '#MDI#'),
(55, 'hncf_journal_entry', '#MDI#'),
(56, 'hncf_cash_flow', '#MDI#'),
(57, 'hncf_expense_form', '#MDI#'),
(58, 'hncf_register', '#MDI#'),
(59, 'hncf_payment', '#MDI#'),
(60, 'hncf_ageing_payable', '#MDI#'),
(61, 'hncf_purchase_report', '#MDI#'),
(62, 'hncf_expense_report', '#MDI#'),
(63, 'hncf_revenue', '#MDI#'),
(64, 'hncf_ranked_sales', '#MDI#'),
(65, 'hncf_sales_statement', '#MDI#'),
(66, 'hncf_customer_balance', '#MDI#'),
(67, 'hncf_paid_sales', '#MDI#'),
(68, 'hncf_balance_sheet', '#MDI#'),
(69, 'hncf_profit_n_lost', '#MDI#'),
(70, 'hncf_ledger', '#MDI#'),
(71, 'hncf_master_inv', '#MDI#'),
(74, 'hncf_neraca_coa', '#MDI#'),
(75, 'hncf_rugilaba_coa', '#MDI#'),
(76, 'hncf_cardfile', '#MDI#'),
(77, 'hncf_karyawan', '#MDI#'),
(78, 'hncf_sales_person', '#MDI#'),
(80, 'hncf_master_mvc', '#MDI#'),
(81, 'hncf_master_model', '#MDI#'),
(82, 'hncf_master_variant', '#MDI#'),
(83, 'hncf_master_color', '#MDI#'),
(84, 'hncf_master_vehicle', '#MDI#'),
(86, 'hncf_master_barang', '#MDI#'),
(87, 'hncf_master_pricelist', '#MDI#'),
(88, 'hncf_after_sales', '#MDI#'),
(89, 'hncf_production', '#MDI#'),
(90, 'hncf_wo_invoice', '#MDI#'),
(91, 'hncf_wo_register', '#MDI#'),
(93, 'hncf_after_sales_transaction', '#MDI#'),
(94, 'hncf_after_sales_report', '#MDI#'),
(96, 'hncf_wo_allocation', '#MDI#'),
(97, 'hncf_woinv_register', '#MDI#'),
(98, 'hncf_woinv_expxls', '#MDI#'),
(99, 'hncf_sales_tax', '#MDI#'),
(100, 'hncf_sales_export_efaktur', '#MDI#'),
(101, 'hncf_woinv_custpayment', '#MDI#'),
(103, 'hncf_btn_close', '#univ#'),
(105, 'hncf_btn_add', '#master_barang#'),
(106, 'hncf_btn_save_opnum', '#opnum#'),
(107, 'hncf_lbl_address', '#sales order#'),
(109, 'hncf_lbl_form_name', '#master_barang#'),
(110, 'hncf_tbl_col_no', '#master_barang#'),
(111, 'hncf_tbl_col_action', '#master_barang#'),
(113, 'hncf_tbl_col_code', '#master_barang#'),
(114, 'hncf_tbl_col_name', '#master_barang#'),
(115, 'hncf_tbl_col_group', '#master_barang#'),
(116, 'hncf_tbl_col_last', '#master_barang#'),
(121, 'hncf_tbl_col_brand', '#master_barang#'),
(123, 'hncf_btn_col_supplier', '#master_barang#'),
(124, 'hncf_btn_col_sale', '#master_barang#'),
(125, 'hncf_btn_col_min', '#master_barang#'),
(126, 'hncf_btn_save', '#univ#'),
(127, 'hncf_btn_cancel', '#univ#'),
(128, 'hncf_btn_update', '#univ#'),
(129, 'hncf_lbl_form_title', '#master_barang#'),
(130, 'hncf_lbl_form_title1', '#master_barang#'),
(131, 'hncf_lbl_code', '#master_barang#'),
(132, 'hncf_lbl_form_Item', '#master_barang#'),
(133, 'hncf_lbl_form_brand', '#master_barang#'),
(134, 'hncf_lbl_form_item2', '#master_barang#'),
(135, 'hncf_lbl_form_sales', '#master_barang#'),
(136, 'hncf_lbl_form_min', '#master_barang#'),
(137, 'hncf_lbl_form_price1', '#master_barang#'),
(138, 'hncf_lbl_form_price2', '#master_barang#'),
(139, 'hncf_lbl_form_supplier', '#master_barang#'),
(140, 'hncf_pch_form_entryitem', '#master_barang#'),
(141, 'hncf_pch_form_entrymin', '#master_barang#'),
(142, 'hncf_pch_form_entrylast', '#master_barang#'),
(143, 'hncf_pch_form_entrybrand', '#master_barang#'),
(144, 'hncf_pch_form_brand', '#master_barang#'),
(145, 'hncf_pch_form_entrysupplier1', '#master_barang#'),
(146, 'hncf_pch_form_supplier2', '#master_barang#'),
(148, 'hncf_btn_modal_add', '#master_barang#'),
(149, 'hncf_btn_modal_close', '#master_barang#'),
(150, 'hncf_lbl_modal_title', '#master_barang#'),
(153, 'hncf_tbl_responsive_showing', '#univ#'),
(154, 'hncf_tbl_responsive_record', '#univ#'),
(155, 'hncf_tbl_responsive_zeroRecords', '#univ#'),
(156, 'hncf_tbl_responsive_infopage', '#univ#'),
(157, 'hncf_tbl_responsive_from', '#univ#'),
(158, 'hncf_tbl_responsive_infoEmpty', '#univ#'),
(159, 'hncf_tbl_responsive_infoFiltered', '#univ#'),
(160, 'hncf_tbl_responsive_totalrecords', '#univ#'),
(162, 'hncf_tbl_modal_colAction', '#univ#'),
(165, 'hncf_tbl_merk_colCode', '#master_barang#'),
(166, 'hncf_tbl_merk_colname', '#master_barang#'),
(167, 'hncf_tbl_supp_kode', '#master_barang#'),
(168, 'hncf_tbl_supp_name', '#master_barang#'),
(169, 'hncf_tbl_supp_address', '#master_barang#'),
(170, 'hncf_lbl_right_systemdate', '#MDI#'),
(171, 'hncf_lbl_right_useronline', '#MDI#'),
(172, 'hncf_lbl_right_transdate', '#MDI#'),
(173, 'hncf_lbl_right_reportdate', '#MDI#'),
(174, 'hncf_btn_right_from', '#MDI#'),
(175, 'hncf_btn_right_to', '#MDI#'),
(176, 'hncf_lbl_supp_formname', '#supplier#'),
(177, 'hncf_btn_supp_add', '#supplier#'),
(178, 'hncf_btn_supp_list', '#supplier#'),
(179, 'hncf_btn_supp_print', '#supplier#'),
(181, 'hncf_btn_supp_prev', '#supplier#'),
(182, 'hncf_btn_supp_update', '#supplier#'),
(183, 'hncf_btn_supp_cancel', '#supplier#'),
(184, 'hncf_btn_supp_close', '#supplier#'),
(185, 'hncf_btn_supp_save', '#supplier#'),
(186, 'hncf_tbl_supp_col_no', '#supplier#'),
(187, 'hncf_tbl_supp_col_action', '#supplier#'),
(189, 'hncf_tbl_supp_col_code', '#supplier#'),
(190, 'hncf_tbl_supp_col_name', '#supplier#'),
(193, 'hncf_tbl_supp_col_add1', '#supplier#'),
(194, 'hncf_tbl_supp_col_add2', '#supplier#'),
(195, 'hncf_tbl_supp_col_contPers', '#supplier#'),
(196, 'hncf_tbl_supp_col_city', '#supplier#'),
(197, 'hncf_tbl_supp_col_postcd', '#supplier#'),
(198, 'hncf_tbl_supp_col_email', '#supplier#'),
(199, 'hncf_tbl_supp_col_phone1', '#supplier#'),
(200, 'hncf_tbl_supp_col_phone2', '#supplier#'),
(201, 'hncf_lbl_supp_code', '#supplier#'),
(202, 'hncf_lbl_supp_name', '#supplier#'),
(203, 'hncf_lbl_supp_contPers', '#supplier#'),
(204, 'hncf_lbl_supp_telp1', '#supplier#'),
(205, 'hncf_lbl_supp_telp2', '#supplier#'),
(206, 'hncf_lbl_supp_term', '#supplier#'),
(207, 'hncf_lbl_supp_email', '#supplier#'),
(208, 'hncf_lbl_supp_add1', '#supplier#'),
(209, 'hncf_lbl_supp_add2', '#supplier#'),
(211, 'hncf_lbl_supp_post', '#supplier#'),
(212, 'hncf_btn_modal_suppAdd', '#master_barang#'),
(213, 'hncf_lbl_modal_suppTitle', '#master_barang#'),
(214, 'hncf_lbl_mdl_addBrd_tittle', '#master_barang#'),
(215, 'hncf_lbl_mdl_addBrd_cd', '#master_barang#'),
(216, 'hncf_lbl_mdl_addBrd_brd', '#master_barang#'),
(217, 'hncf_lbl_mdl_tittle_addSup', '#master_barang#'),
(219, 'hncf_lbl_mdl_code', '#master_barang#'),
(220, 'hncf_lbl_mdl_name', '#master_barang#'),
(221, 'hncf_lbl_mdl_contPrs', '#master_barang#'),
(222, 'hncf_lbl_mdl_phn1', '#master_barang#'),
(223, 'hncf_lbl_mdl_phn2', '#master_barang#'),
(224, 'hncf_lbl_mdl_email', '#master_barang#'),
(225, 'hncf_lbl_mdl_add1', '#master_barang#'),
(226, 'hncf_lbl_mdl_city', '#master_barang#'),
(227, 'hncf_lbl_mdl_add2', '#master_barang#'),
(228, 'hncf_lbl_mdl_city2', '#master_barang#'),
(229, 'hncf_lbl_mdl_tom', '#master_barang#'),
(230, 'hncf_lbl_mdl_post', '#master_barang#'),
(231, 'hncf_btn_list', '#master_barang#'),
(233, 'hncf_pch_mdl_cd', '#master_barang#'),
(234, 'hncf_pch_mdl_name', '#master_barang#'),
(235, 'hncf_pch_mdl_suppCd', '#master_barang#'),
(236, 'hncf_pch_mdl_nmBrd', '#master_barang#'),
(237, 'hncf_pch_mdl_contPrs', '#master_barang#'),
(238, 'hncf_pch_mdl_phn1', '#master_barang#'),
(239, 'hncf_pch_mdl_phn2', '#master_barang#'),
(240, 'hncf_pch_mdl_email', '#master_barang#'),
(241, 'hncf_pch_mdl_add1', '#master_barang#'),
(242, 'hncf_pch_mdl_city1', '#master_barang#'),
(244, 'hncf_pch_mdl_add2', '#master_barang#'),
(245, 'hncf_pch_mdl_city2', '#master_barang#'),
(246, 'hncf_pch_mdl_top', '#master_barang#'),
(247, 'hncf_pch_mdl_pstcd', '#master_barang#'),
(249, 'hncf_pch_supp_entryName', '#supplier#'),
(253, 'hncf_pch_supp_cntPrs', '#supplier#'),
(254, 'hncf_pch_supp_phn1', '#supplier#'),
(256, 'hncf_pch_supp_phn2', '#supplier#'),
(257, 'hncf_pch_supp_email', '#supplier#'),
(258, 'hncf_pch_supp_top', '#supplier#'),
(259, 'hncf_pch_supp_add1', '#supplier#'),
(260, 'hncf_pch_supp_city', '#supplier#'),
(261, 'hncf_pch_supp_city2', '#supplier#'),
(262, 'hncf_pch_supp_add2', '#supplier#'),
(263, 'hncf_pch_supp_post', '#supplier#'),
(264, 'hncf_lbl_supp_city1', '#supplier#'),
(265, 'hncf_lbl_supp_city2', '#supplier#'),
(268, 'hncf_tbl_po_sys', '#purchase order#'),
(269, 'hncf_tbl_po_tmDate', '#purchase order#'),
(270, 'hncf_tbl_po_tmDue', '#purchase order#'),
(271, 'hncf_tbl_po_tmSupp', '#purchase order#'),
(272, 'hncf_tbl_po_tmAdd', '#purchase order#'),
(273, 'hncf_tbl_po_tmPhn', '#purchase order#'),
(276, 'hncf_pch_po_fndSupp', '#purchase order#'),
(277, 'hncf_lbl_po_suppTitle', '#purchase order#'),
(281, 'hncf_btn_src', '#univ#'),
(283, 'hncf_btn_closeSrc', '#univ#'),
(284, 'hncf_btn_po_print', '#purchase order#'),
(285, 'hncf_btn_po_closePrint', '#purchase order#'),
(286, 'hncf_tbl_po_colNo', '#purchase order#'),
(287, 'hncf_tbl_po_colItm', '#purchase order#'),
(288, 'hncf_tbl_po_colDesc', '#purchase order#'),
(289, 'hncf_tbl_po_colQty', '#purchase order#'),
(290, 'hncf_tbl_po_colUnit', '#purchase order#'),
(291, 'hncf_tbl_po_colUnitp', '#purchase order#'),
(292, 'hncf_tbl_po_colDisc', '#purchase order#'),
(293, 'hncf_tbl_po_colSub', '#purchase order#'),
(294, 'hncf_lbl_po_mdlTittle', '#purchase order#'),
(296, 'hncf_lbl_po_mdlItmcd', '#purchase order#'),
(297, 'hncf_lbl_po_mdlItmcl', '#purchase order#'),
(299, 'hncf_lbl_po_mdlItmUnt', '#purchase order#'),
(300, 'hncf_lbl_po_mdlItmNm', '#purchase order#'),
(302, 'hncf_lbl_po_mdl_slPrc', '#purchase order#'),
(303, 'hncf_lbl_po_mdl_purPrc', '#purchase order#'),
(304, 'hncf_lbl_po_mdl_supp', '#purchase order#'),
(306, 'hncf_lbl_po_mdl_warn', '#purchase order#'),
(307, 'hncf_tbl_responsive_sSearch', '#univ#'),
(309, 'hncf_pch_po_mdl_entryItmNm', '#purchase order#'),
(310, 'hncf_pch_po_mdl_entryItmCd', '#purchase order#'),
(311, 'hncf_pch_po_mdl_entryPrcPrs', '#purchase order#'),
(312, 'hncf_pch_po_mdl_entrySlPrc', '#purchase order#'),
(313, 'hncf_pch_po_mdl_entrySuppNm', '#purchase order#'),
(315, 'hncf_tbl_po_colAction', '#purchase order#'),
(316, 'hncf_tbl_po_colSupp', '#purchase order#'),
(318, 'hncf_tbl_po_colInst', '#purchase order#'),
(321, 'hncf_tbl_po_foot_trans', '#purchase order#'),
(323, 'hncf_lbl_po_foot_subToDisc', '#purchase order#'),
(326, 'hncf_lbl_po_foot_subBeDisc', '#purchase order#'),
(327, 'hncf_lbl_po_foot_subAfDisc', '#purchase order#'),
(329, 'hncf_lbl_pr_respv_title', '#purchase#'),
(330, 'hncf_tbl_po_suppCd', '#purchase order#'),
(331, 'hncf_tbl_po_suppCst', '#purchase order#'),
(332, 'hncf_tbl_po_suppAdd', '#purchase order#'),
(333, 'hncf_tbl_pr_respv_cd', '#purchase#'),
(334, 'hncf_tbl_pr_respv_cst', '#purchase#'),
(335, 'hncf_tbl_pr_respv_add', '#purchase#'),
(336, 'hncf_lbl_pr_mdl_tittle', '#purchase#'),
(337, 'hncf_tbl_pr_mdl_supp', '#purchase#'),
(338, 'hncf_tbl_pr_mdl_branch', '#purchase#'),
(339, 'hncf_tbl_pr_date', '#purchase#'),
(340, 'hncf_tbl_pr_due', '#purchase#'),
(341, 'hncf_tbl_pr_supp', '#purchase#'),
(342, 'hncf_tbl_pr_add', '#purchase#'),
(343, 'hncf_tbl_pr_phn', '#purchase#'),
(344, 'hncf_lbl_pr_pr', '#purchase#'),
(347, 'hncf_btn_pr_print', '#purchase#'),
(348, 'hncf_btn_pr_closePrint', '#purchase#'),
(349, 'hncf_pch_pr_fndSupp', '#purchase#'),
(350, 'hncf_tbl_pr_colAction', '#purchase#'),
(351, 'hncf_tbl_pr_colSupp', '#purchase#'),
(352, 'hncf_tbl_pr_col_itmCd', '#purchase#'),
(353, 'hncf_tbl_pr_col_desc', '#purchase#'),
(354, 'hncf_tbl_pr_col_unit', '#purchase#'),
(355, 'hncf_tbl_pr_col_unitPrc', '#purchase#'),
(356, 'hncf_tbl_pr_col_disc', '#purchase#'),
(357, 'hncf_tbl_pr_col_slPrc', '#purchase#'),
(358, 'hncf_pch_pr_fndPo', '#purchase#'),
(359, 'hncf_tbl_pr_foot_trans', '#purchase#'),
(360, 'hncf_tbl_pr_foot_transDet', '#purchase#'),
(361, 'hncf_lbl_pr_foot_subTtDisc', '#purchase#'),
(362, 'hncf_lbl_pr_foot_paid', '#purchase#'),
(364, 'hncf_lbl_pr_foot_SubTtAf', '#purchase#'),
(365, 'hncf_lbl_pr_foot_SubTtBe', '#purchase#'),
(367, 'hncf_lbl_cst_title', '#customer#'),
(372, 'hncf_btn_cst_add', '#customer#'),
(373, 'hncf_btn_cst_list', '#customer#'),
(374, 'hncf_tbl_cst_col_action', '#customer#'),
(375, 'hncf_tbl_cst_col_code', '#customer#'),
(376, 'hncf_tbl_cst_col_nm', '#customer#'),
(379, 'hncf_tbl_cst_col_add1', '#customer#'),
(380, 'hncf_tbl_cst_col_add2', '#customer#'),
(381, 'hncf_tbl_cst_col_city1', '#customer#'),
(382, 'hncf_tbl_cst_col_city2', '#customer#'),
(383, 'hncf_tbl_cst_col_phn1', '#customer#'),
(384, 'hncf_tbl_cst_col_phn2', '#customer#'),
(385, 'hncf_tbl_cst_col_email', '#customer#'),
(387, 'hncf_tbl_cst_col_type', '#customer#'),
(388, 'hncf_tbl_cst_col_credit', '#customer#'),
(389, 'hncf_tbl_cst_col_contC', '#customer#'),
(390, 'hncf_lbl_cst_code', '#customer#'),
(392, 'hncf_lbl_cst_type', '#customer#'),
(393, 'hncf_lbl_cst_type_comp', '#customer#'),
(394, 'hncf_lbl_cst_type_pro', '#customer#'),
(395, 'hncf_lbl_cst_name', '#customer#'),
(396, 'hncf_lbl_cst_contP', '#customer#'),
(398, 'hncf_lbl_cst_phn2', '#customer#'),
(399, 'hncf_lbl_cst_phn1', '#customer#'),
(400, 'hncf_lbl_cst_email', '#customer#'),
(401, 'hncf_lbl_cst_creditMax', '#customer#'),
(402, 'hncf_lbl_cst_term', '#customer#'),
(403, 'hncf_lbl_cst_add1', '#customer#'),
(404, 'hncf_lbl_cst_add2', '#customer#'),
(405, 'hncf_lbl_cst_city1', '#customer#'),
(406, 'hncf_lbl_cst_city2', '#customer#'),
(407, 'hncf_lbl_cst_area', '#customer#'),
(408, 'hncf_btn_cst_day', '#customer#'),
(409, 'hncf_pch_cst_code', '#customer#'),
(410, 'hncf_pch_cst_name', '#customer#'),
(411, 'hncf_pch_cst_contP', '#customer#'),
(412, 'hncf_pch_cst_phn1', '#customer#'),
(413, 'hncf_pch_cst_phn2', '#customer#'),
(414, 'hncf_pch_cst_fax', '#customer#'),
(415, 'hncf_pch_cst_email', '#customer#'),
(416, 'hncf_pch_cst_top', '#customer#'),
(418, 'hncf_pch_cst_add1', '#customer#'),
(419, 'hncf_pch_cst_add2', '#customer#'),
(420, 'hncf_pch_cst_city1', '#customer#'),
(421, 'hncf_pch_cst_city2', '#customer#'),
(422, 'hncf_pch_cst_area', '#customer#'),
(423, 'hncf_lbl_pre_tittle', '#production_register#'),
(426, 'hncf_btn_cstpy_rld', '#customer payment#'),
(427, 'hncf_btn_cstpy_prntPrev', '#customer payment#'),
(428, 'hncf_btn_cstpy_closePrev', '#customer payment#'),
(429, 'hncf_btn_cstpy_export', '#customer payment#'),
(430, 'hncf_pch_cstpy_gbSrch', '#customer payment#'),
(431, 'hncf_tbl_cstpy_col_cstNm', '#customer payment#'),
(432, 'hncf_tbl_cstpy_col_cstCd', '#customer payment#'),
(433, 'hncf_tbl_cstpy_col_action', '#customer payment#'),
(434, 'hncf_tbl_cstpy_col_type', '#customer payment#'),
(435, 'hncf_tbl_cstpy_col_id', '#customer payment#'),
(436, 'hncf_tbl_cstpy_col_add', '#customer payment#'),
(437, 'hncf_tbl_cstpy_col_delCd', '#customer payment#'),
(438, 'hncf_tbl_prod_date', '#production#'),
(441, 'hncf_tbl_prod_itmsProd', '#production#'),
(442, 'hncf_tbl_prod_itmsDesc', '#production#'),
(443, 'hncf_tbl_prod_qty', '#production#'),
(445, 'hncf_tbl_prod_memo', '#production#'),
(448, 'hncf_lbl_prod_title', '#production#'),
(449, 'hncf_lbl_prod_mdl_title', '#production#'),
(451, 'hncf_tbl_mdl_date', '#production#'),
(453, 'hncf_lbl_prod_mdl_title2', '#production#'),
(454, 'hncf_tbl_prod_mdl_itmCd', '#production#'),
(455, 'hncf_tbl_prod_mdl_itmNm', '#production#'),
(456, 'hncf_tbl_prod_mdl_itmGrup', '#production#'),
(458, 'hncf_tbl_prod_mdl_slPrc', '#production#'),
(459, 'hncf_tbl_prod_mdl_minS', '#production#'),
(460, 'hncf_pch_prod_find', '#production#'),
(461, 'hncf_tbl_prod_col_ItmCd', '#production#'),
(462, 'hncf_tbl_prod_col_desc', '#production#'),
(463, 'hncf_tbl_prod_col_supp', '#production#'),
(464, 'hncf_tbl_prod_col_unit', '#production#'),
(465, 'hncf_tbl_prod_col_unitP', '#production#'),
(469, 'hncf_lbl_serv_title', '#sales#'),
(473, 'hncf_lbl_so_title', '#sales order#'),
(475, 'hncf_tbl_so_date', '#sales order#'),
(477, 'hncf_tbl_so_due', '#sales order#'),
(478, 'hncf_tbl_so_trans', '#sales order#'),
(479, 'hncf_tbl_so_soDate', '#sales order#'),
(480, 'hncf_tbl_serv_cst', '#sales#'),
(481, 'hncf_tbl_serv_add', '#sales#'),
(482, 'hncf_btn_serv_prnt', '#sales#'),
(483, 'hncf_btn_serv_csPrnt', '#sales#'),
(484, 'hncf_tbl_serv_col_itmCd', '#sales#'),
(485, 'hncf_tbl_serv_col_dsc', '#sales#'),
(486, 'hncf_tbl_serv_col_unt', '#sales#'),
(487, 'hncf_tbl_serv_col_untPrc', '#sales#'),
(488, 'hncf_tbl_serv_col_disc', '#sales#'),
(489, 'hncf_tbl_so_cst', '#sales order#'),
(490, 'hncf_tbl_serv_slesPrsn', '#sales#'),
(491, 'hncf_tbl_so_add', '#sales order#'),
(492, 'hncf_tbl_serv_trns', '#sales#'),
(493, 'hncf_tbl_serv_subTlDisc', '#sales#'),
(494, 'hncf_btn_so_print', '#sales order#'),
(495, 'hncf_btn_so_clsPrint', '#sales order#'),
(496, 'hncf_tbl_serv_SbTlBfrDsc', '#sales#'),
(497, 'hncf_tbl_serv_SbTlAftDsc', '#sales#'),
(499, 'hncf_lbl_serv_titel', '#sales#'),
(502, 'hncf_tbl_so_mdl_cst', '#sales order#'),
(503, 'hncf_tbl_so_mdl_add', '#sales order#'),
(505, 'hncf_lbl_serv_mdl_cst', '#sales#'),
(506, 'hncf_tbl_so_mdl_cCd', '#sales order#'),
(507, 'hncf_lbl_serv_mdl_cab', '#sales#'),
(508, 'hncf_tbl_so_mdl_title', '#sales order#'),
(509, 'hncf_lbl_serv_mdl_addr', '#sales#'),
(510, 'hncf_pch_so_fndCst', '#sales order#'),
(511, 'hncf_tbl_so_col_itmCd', '#sales order#'),
(512, 'hncf_tbl_so_col_desc', '#sales order#'),
(513, 'hncf_tbl_so_col_unt', '#sales order#'),
(514, 'hncf_tbl_so_col_untP', '#sales order#'),
(515, 'hncf_tbl_so_col_disc', '#sales order#'),
(516, 'hncf_tbl_so_col_credit', '#sales order#'),
(517, 'hncf_tbl_so_slsPrsn', '#sales order#'),
(519, 'hncf_tbl_so_trnsc', '#sales order#'),
(521, 'hncf_tbl_so_subTtBf', '#sales order#'),
(522, 'hncf_tbl_so_subTtAf', '#sales order#'),
(523, 'hncf_tbl_so_subTt', '#sales order#'),
(525, 'hncf_btn_preg_reload', '#purchase_register#'),
(526, 'hncf_btn_preg_printPrev', '#purchase_register#'),
(527, 'hncf_btn_preg_clsPrev', '#purchase_register#'),
(528, 'hncf_btn_preg_ex', '#purchase_register#'),
(529, 'hncf_tbl_preg_col_dlv', '#purchase_register#'),
(530, 'hncf_tbl_preg_col_supp', '#purchase_register#'),
(531, 'hncf_tbl_preg_col_disc', '#purchase_register#'),
(532, 'hncf_pch_serv_findSo', '#sales#'),
(533, 'hncf_pch_serv_findCst', '#sales#'),
(534, 'hncf_btn_sr_reload', '#sales_register#'),
(535, 'hncf_btn_sr_printPrev', '#sales_register#'),
(536, 'hncf_btn_sr_clsPrev', '#sales_register#'),
(537, 'hncf_btn_sr_ex', '#sales_register#'),
(538, 'hncf_btn_sr_list', '#sales_register#'),
(540, 'hncf_tbl_sr_col_blNm', '#sales_register#'),
(541, 'hncf_tbl_sr_col_disc', '#sales_register#'),
(542, 'hncf_tbl_sr_col_pay', '#sales_register#'),
(543, 'hncf_tbl_sr_col_vatNm', '#sales_register#'),
(544, 'hncf_lbl_preg_title', '#purchase_register#'),
(545, 'hncf_lbl_sr_title', '#sales_register#'),
(546, 'hncf_lbl_op_title', '#opnum#'),
(547, 'hncf_btn_op_list', '#opnum#'),
(548, 'hncf_tbl_op_col_ItmCd', '#opnum#'),
(549, 'hncf_tbl_op_col_ItmNm', '#opnum#'),
(550, 'hncf_tbl_op_col_itmGp', '#opnum#'),
(551, 'hncf_tbl_op_col_brnd', '#opnum#'),
(552, 'hncf_tbl_op_col_unit', '#opnum#'),
(553, 'hncf_tbl_op_col_brch', '#opnum#'),
(554, 'hncf_tbl_op_col_stock', '#opnum#'),
(555, 'hncf_tbl_op_col_count', '#opnum#'),
(557, 'hncf_tbl_prod_col_action', '#production#'),
(559, 'hncf_tbl_prod_col_docNo', '#production#'),
(560, 'hncf_tbl_prod_col_sysNo', '#production#'),
(561, 'hncf_tbl_prod_col_memo', '#production#'),
(562, 'hncf_tbl_prod_col_date', '#production#'),
(563, 'hncf_tbl_so_col_date', '#sales order#'),
(564, 'hncf_tbl_so_col_blNm', '#sales order#'),
(565, 'hncf_master_karyawan', '#MDI#'),
(569, 'hncf_lbl_judul_kiri_atas', '#assets#'),
(571, 'hncf_lbl_judul_kanan_atas', '#assets#'),
(573, 'hncf_lbl_liab_judul_kiri_atas', '#liability#'),
(574, 'hncf_lbl_eq_judul_kiri_atas', '#equity#'),
(575, 'hncf_lbl_liab_judul_kanan_atas', '#liability#'),
(576, 'hncf_lbl_eq_judul_kanan_atas', '#equity#'),
(578, 'hncf_lbl_account_grup', '#univ#'),
(579, 'hncf_lbl_sub_group', '#univ#'),
(580, 'hncf_lbl_account_type', '#univ#'),
(581, 'hncf_lbl_header_account', '#univ#'),
(583, 'hncf_lbl_detail_account', '#univ#'),
(584, 'hncf_lbl_payment_account', '#univ#'),
(586, 'hncf_lbl_account_no', '#univ#'),
(587, 'hncf_lbl_account_name', '#univ#'),
(588, 'hncf_lbl_beginning_balance', '#univ#'),
(589, 'hncf_btn_print', '#univ#'),
(590, 'hncf_btn_delete', '#univ#'),
(591, 'hncf_btn_reset', '#univ#'),
(592, 'hncf_btn_pre_reload', '#production_register#'),
(594, 'hncf_btn_pre_list_itms', '#production_register#'),
(595, 'hncf_btn_pre_printPrev', '#production_register#'),
(596, 'hncf_btn_pre_closePrev', '#production_register#'),
(597, 'hncf_btn_pre_ex', '#production_register#'),
(598, 'hncf_tbl_pre_col_sysNo', '#production_register#'),
(599, 'hncf_tbl_pre_col_date', '#production_register#'),
(600, 'hncf_tbl_pre_col_docNo', '#production_register#'),
(601, 'hncf_tbl_pre_col_itemCd', '#production_register#'),
(602, 'hncf_tbl_pre_col_itemNm', '#production_register#'),
(603, 'hncf_tbl_pre_col_qty', '#production_register#'),
(604, 'hncf_tbl_pre_col_memo', '#production_register#'),
(605, 'hncf_pch_pre_global', '#production_register#'),
(608, 'hncf_lbl_inv_title', '#inventory#'),
(609, 'hncf_btn_inv_list', '#inventory#'),
(610, 'hncf_pch_inv_global', '#inventory#'),
(612, 'hncf_tbl_inv_col_itemCd', '#inventory#'),
(613, 'hncf_tbl_inv_col_itemNm', '#inventory#'),
(614, 'hncf_tbl_inv_col_itemG', '#inventory#'),
(615, 'hncf_tbl_inv_col_brand', '#inventory#'),
(616, 'hncf_tbl_inv_col_sales_unit', '#inventory#'),
(618, 'hncf_tbl_inv_col_salesPrc', '#inventory#'),
(619, 'hncf_tbl_inv_col_branch', '#inventory#'),
(620, 'hncf_tbl_inv_col_stock', '#inventory#'),
(621, 'hncf_tbl_inv_col_allocations', '#inventory#'),
(622, 'hncf_tbl_inv_col_available', '#inventory#'),
(625, 'hncf_lbl_itm_title', '#items#'),
(626, 'hncf_btn_itm_list', '#items#'),
(627, 'hncf_tbl_itm_col_itemCd', '#items#'),
(628, 'hncf_tbl_itm_col_itemNm', '#items#'),
(629, 'hncf_tbl_itm_col_itmG', '#items#'),
(630, 'hncf_tbl_itm_col_brand', '#items#'),
(632, 'hncf_tbl_itm_col_slPrc', '#items#'),
(633, 'hncf_tbl_itm_col_buyPrc', '#items#'),
(634, 'hncf_tbl_itm_col_supp', '#items#'),
(636, 'hncf_tbl_prod_grid_title', '#production#'),
(637, 'hncf_tbl_inv_col_minS', '#inventory#'),
(638, 'hncf_tbl_itm_col_slUnit', '#items#'),
(639, 'hncf_tbl_itm_col_minS', '#items#'),
(642, 'hncf_lbl_income_kanan_atas', '#income#'),
(643, 'hncf_lbl_income_judul_kiri', '#income#'),
(644, 'hncf_lbl_hpp_kiri_atas', '#cost_of_sales#'),
(645, 'hncf_lbl_hpp_kanan_atas', '#cost_of_sales#'),
(646, 'hncf_lbl_biaya_kiri_atas', '#expense#'),
(647, 'hncf_lbl_biaya_kanan_atas', '#expense#'),
(649, 'hncf_lbl_pendlain_kiri_atas', '#other_income#'),
(650, 'hncf_lbl_pendlain_kanan_atas', '#other_income#'),
(652, 'hncf_lbl_byylain_kiri_atas', '#other_expense#'),
(653, 'hncf_lbl_byylain_kanan_atas', '#other_expense#'),
(654, 'hncf_btn_op_col_unbalance', '#opnum#'),
(655, 'hncf_lbl_cstpy_title', '#customer payment#'),
(657, 'hncf_lbl_sr_head_title', '#sales_register#'),
(659, 'hncf_lbl_preg_head_title', '#purchase_register#'),
(660, 'hncf_lbl_po_title', '#purchase order#'),
(661, 'hncf_pch_op_counted', '#opnum#'),
(662, 'hncf_master_inventaris', '#MDI#'),
(663, 'hncf_master_rekening', '#MDI#'),
(664, 'hncf_pengadaan', '#MDI#'),
(665, 'hncf_penyusutan', '#MDI#'),
(666, 'hncf_inventory', '#MDI#'),
(670, 'hncf_lbl_po_anggaran', '#purchase order#'),
(671, 'hncf_pch_po_anggaran', '#purchase order#'),
(672, 'hncf_lbl_cari_anggaran', '#purchase order#'),
(673, 'hncf_tbl_po_code_anggaran', '#purchase order#'),
(674, 'hncf_tbl_po_nama_anggaran', '#purchase order#'),
(675, 'hncf_tbl_po_jumlah_anggaran', '#purchase order#'),
(676, 'hncf_retailing', '#MDI#'),
(677, 'hncf_lbl_nama_anggaran', '#master_rekening#'),
(678, 'hncf_lbl_nomor_anggaran', '#master_rekening#'),
(680, 'hncf_tbl_kode_anggaran', '#master_rekening#'),
(681, 'hncf_tbl_uraian', '#master_rekening#'),
(683, 'hncf_tbl_saldo_anggaran', '#master_rekening#'),
(684, 'hncf_lbl_pr_anggaran', '#purchase#'),
(685, 'hncf_pch_pr_anggaran', '#purchase#'),
(686, 'hncf_lbl_minv_title', '#inventaris#'),
(687, 'hncf_btn_minv_add', '#inventaris#'),
(688, 'hncf_btn_minv_name', '#inventaris#'),
(689, 'hncf_lbl_minv_codeEqu', '#inventaris#'),
(690, 'hncf_lbl_minv_nameEqu', '#inventaris#'),
(691, 'hncf_lbl_minv_brand', '#inventaris#'),
(692, 'hncf_lbl_minv_group', '#inventaris#'),
(693, 'hncf_lbl_minv_eco', '#inventaris#'),
(694, 'hncf_lbl_minv_prodDate', '#inventaris#'),
(695, 'hncf_lbl_minv_assembly', '#inventaris#'),
(696, 'hncf_lbl_minv_color', '#inventaris#'),
(697, 'hncf_lbl_minv_inggridient', '#inventaris#'),
(698, 'hncf_lbl_minv_addBrand', '#inventaris#'),
(699, 'hncf_lbl_minv_form_title', '#inventaris#'),
(700, 'hncf_lbl_minv_mdl_title', '#inventaris#'),
(701, 'hncf_tbl_minv_colAction', '#inventaris#'),
(702, 'hncf_tbl_minv_colCode', '#inventaris#'),
(703, 'hncf_tbl_minv_colName', '#inventaris#'),
(704, 'hncf_pch_minv_nameEqu', '#inventaris#'),
(706, 'hncf_pch_minv_brandCd', '#inventaris#'),
(707, 'hncf_pch_minv_brand', '#inventaris#'),
(710, 'hncf_lbl_rtl_title', '#retailing#'),
(711, 'hncf_lbl_rtl_date', '#retailing#'),
(714, 'hncf_lbl_rtl_items', '#retailing#'),
(715, 'hncf_lbl_rtl_desc', '#retailing#'),
(716, 'hncf_lbl_rtl_qty', '#retailing#'),
(717, 'hncf_lbl_rtl_memo', '#retailing#'),
(718, 'hncf_lbl_rtl_mdl_title', '#retailing#'),
(719, 'hncf_lbl_rtl_mdl_date', '#retailing#'),
(720, 'hncf_lbl_rtl_mdl_title2', '#retailing#'),
(721, 'hncf_lbl_rtl_mdl_itmCd', '#retailing#'),
(722, 'hncf_lbl_rtl_mdl_ItmNm', '#retailing#'),
(723, 'hncf_lbl_rtl_mdl_itmGrup', '#retailing#'),
(724, 'hncf_lbl_rtl_mdl_price', '#retailing#'),
(725, 'hncf_lbl_rtl_mdl_slprice', '#retailing#'),
(726, 'hncf_lbl_rtl_mdl_minS', '#retailing#'),
(727, 'hncf_lbl_rtl_grid_title', '#retailing#'),
(728, 'hncf_tbl_rtl_col_itmCd', '#retailing#'),
(729, 'hncf_tbl_rtl_col_desc', '#retailing#'),
(731, 'hncf_tbl_rtl_col_supp', '#retailing#'),
(732, 'hncf_tbl_rtl_col_unit', '#retailing#'),
(733, 'hncf_tbl_rtl_col_unitP', '#retailing#'),
(734, 'hncf_pch_rtl_find', '#retailing#'),
(736, 'hncf_tbl_rtl_col_itmNm', '#retailing#'),
(737, 'hncf_tbl_rtl_col_qty', '#retailing#'),
(738, 'hncf_tbl_rtl_col_memo', '#retailing#'),
(739, 'hncf_tbl_rtl_col_date', '#retailing#'),
(740, 'hncf_tbl_rtl_col_action', '#retailing#'),
(741, 'hncf_tbl_rtl_col_sysNo', '#retailing#'),
(742, 'hncf_tbl_rtl_col_docNo', '#retailing#'),
(743, 'hncf_lbl_ep_title', '#pengadaan#'),
(744, 'hncf_lbl_ep_date', '#pengadaan#'),
(745, 'hncf_lbl_ep_dateSpk', '#pengadaan#'),
(746, 'hncf_lbl_ep_anggaran', '#pengadaan#'),
(747, 'hncf_lbl_ep_supp', '#pengadaan#'),
(748, 'hncf_pch_ep_fndSupp', '#pengadaan#'),
(749, 'hncf_lbl_ep_alamat', '#pengadaan#'),
(751, 'hncf_btn_ep_print', '#pengadaan#'),
(752, 'hncf_btn_ep_closePrint', '#pengadaan#'),
(753, 'hncf_lbl_ep_mdlTitle', '#pengadaan#'),
(754, 'hncf_lbl_pga_mdlTitle', '#pengadaan#'),
(755, 'hncf_lbl_ep_cariAnggaran', '#pengadaan#'),
(760, 'hncf_lbl_pga_suppTitle', '#pengadaan#'),
(762, 'hncf_tbl_pga_suppCd', '#pengadaan#'),
(763, 'hncf_tbl_pga_suppCst', '#pengadaan#'),
(764, 'hncf_tbl_pga_supp', '#pengadaan#'),
(765, 'hncf_tbl_pga_suppAdd', '#pengadaan#'),
(766, 'hncf_tbl_pga_code_anggaran', '#pengadaan#'),
(767, 'hncf_tbl_pga_nama_anggaran', '#pengadaan#'),
(768, 'hncf_tbl_pga_jumlah_anggaran', '#pengadaan#'),
(769, 'hncf_tbl_pga_colNo', '#pengadaan#'),
(770, 'hncf_tbl_pga_colItm', '#pengadaan#'),
(771, 'hncf_tbl_pga_colDesc', '#pengadaan#'),
(772, 'hncf_tbl_pga_colUnit', '#pengadaan#'),
(773, 'hncf_tbl_pga_colUnitp', '#pengadaan#'),
(779, 'hncf_tbl_pga_colDisc', '#pengadaan#'),
(780, 'hncf_tbl_pga_col_dateSpk', '#pengadaan#'),
(781, 'hncf_tbl_pga_colAction', '#pengadaan#'),
(782, 'hncf_tbl_pga_col_tahunAnggaran', '#pengadaan#'),
(783, 'hncf_tbl_pga_col_rek', '#pengadaan#'),
(784, 'hncf_tbl_pga_col_cabang', '#pengadaan#'),
(785, 'hncf_tbl_pga_col_rekanan', '#pengadaan#'),
(786, 'hncf_pch_pga_anggaran', '#pengadaan#'),
(787, 'hncf_tbl_pga_foot_trans', '#pengadaan#'),
(788, 'hncf_tbl_pga_colInst', '#pengadaan#'),
(790, 'hncf_lbl_pga_foot_subToDisc', '#pengadaan#'),
(791, 'hncf_lbl_pga_foot_subBeDisc', '#pengadaan#'),
(792, 'hncf_lbl_pga_foot_subAfDisc', '#pengadaan#'),
(793, 'hncf_lbl_gj_title', '#journal_entry#'),
(795, 'hncf_tbl_gj_date', '#journal_entry#'),
(796, 'hncf_tbl_gj_col_no', '#journal_entry#'),
(797, 'hncf_tbl_gj_col_name', '#journal_entry#'),
(798, 'hncf_tbl_gj_col_kredit', '#journal_entry#'),
(799, 'hncf_tbl_gj_col_action', '#journal_entry#'),
(800, 'hncf_tbl_gj_col_sysNo', '#journal_entry#'),
(801, 'hncf_tbl_gj_col_docNo', '#journal_entry#'),
(802, 'hncf_tbl_gj_col_ItmCd', '#journal_entry#'),
(803, 'hncf_tbl_gj_col_itmNm', '#journal_entry#'),
(804, 'hncf_tbl_gj_col_qty', '#journal_entry#'),
(805, 'hncf_tbl_gj_col_memo', '#journal_entry#'),
(806, 'hncf_tbl_gj_col_date', '#journal_entry#'),
(807, 'hncf_lbl_gj_totalKredit', '#journal_entry#'),
(808, 'hncf_tbl_gj_mdl_sysNo', '#journal_entry#'),
(809, 'hncf_tbl_gj_mdl_docNo', '#journal_entry#'),
(811, 'hncf_tbl_gj_modal_colAction', '#journal_entry#'),
(812, 'hncf_tbl_gj_mdl_date', '#journal_entry#'),
(820, 'hncf_lbl_nrc_title', '#balance_sheet#'),
(821, 'hncf_btn_nrc_rld', '#balance_sheet#'),
(822, 'hncf_btn_nrc_prntPreview', '#balance_sheet#'),
(823, 'hncf_btn_nrc_clsPrv', '#balance_sheet#'),
(825, 'hncf_lbl_rgl_title', '#profit_loss#'),
(826, 'hncf_btn_rgl_reload', '#profit_loss#'),
(827, 'hncf_btn_rgl_printPrev', '#profit_loss#'),
(828, 'hncf_btn_rgl_closePrev', '#profit_loss#'),
(829, 'hncf_lbl_gj_anggaran', '#journal_entry#'),
(830, 'hncf_tbl_notrans', '#journal_entry#'),
(831, 'hncf_tbl_gjno', '#journal_entry#'),
(832, 'hncf_tbl_tgl', '#journal_entry#'),
(833, 'hncf_tbl_total', '#journal_entry#'),
(834, 'hncf_tbl_memo', '#journal_entry#'),
(835, 'hncf_tbl_location', '#journal_entry#'),
(836, 'hncf_btn_edit_tbl', '#master_rekening#'),
(837, 'hncf_btn_simpan_tbl', '#master_rekening#'),
(838, 'hncf_lbl_form_hpp', '#master_barang#'),
(839, 'hncf_lbl_form_persediaan', '#master_barang#'),
(840, 'hncf_lbl_form_penjualan', '#master_barang#'),
(842, 'hncf_tbl_col_hpp', '#master_barang#'),
(843, 'hncf_tbl_col_persediaan', '#master_barang#'),
(844, 'hncf_tbl_col_Penjualan', '#master_barang#'),
(845, 'hncf_lbl_nrc_bc', '#balance_sheet#'),
(846, 'hncf_lbl_warning', '#univ#'),
(847, 'hncf_btn_reload', '#univ#');

-- --------------------------------------------------------

--
-- Table structure for table `level1`
--

CREATE TABLE `level1` (
  `id` char(30) NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `atype` char(1) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) NOT NULL,
  `jtype` char(1) NOT NULL,
  `trigered` varchar(4) NOT NULL,
  `active` char(1) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level1`
--

INSERT INTO `level1` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('202208011', 10000, 1, 0, 'HARTA', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208012', 20000, 1, 0, 'KEWAJIBAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208013', 30000, 1, 0, 'EKUITAS', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208014', 40000, 1, 0, 'PENERIMAAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208015', 50000, 1, 0, 'BIAYA OPERASIONAL', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208016', 60000, 1, 0, 'PENGELUARAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208017', 70000, 1, 0, 'PENERIMAAN LAIN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18'),
('202208018', 80000, 1, 0, 'PENGELUARAN LAIN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `level2`
--

CREATE TABLE `level2` (
  `id` char(30) NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `atype` char(1) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) NOT NULL,
  `jtype` char(1) NOT NULL,
  `trigered` varchar(4) NOT NULL,
  `active` char(1) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level2`
--

INSERT INTO `level2` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('202208011', 11000, 2, 10000, 'ASET LANCAR', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('2022080110', 61000, 2, 60000, 'PENGELUARAN OPERASIONAL', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('2022080111', 71000, 2, 70000, 'PENDAPATAN LAIN', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:35'),
('2022080112', 81000, 2, 80000, 'BIAYA LAIN', 'H', '0.00', 'JK', 'h', '0', '1', '2022-08-25 21:51:35'),
('2022080114', 12000, 2, 10000, 'ASET TETAP', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('2022080115', 62000, 2, 60000, 'BIAYA NON OPERASIONAL', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('2022080116', 23000, 2, 20000, 'HUTANG PAJAK', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('2022080117', 32000, 2, 30000, 'MODAL YANG DISETOR', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('202208012', 21000, 2, 20000, 'KEWAJIBAN JANGKA PENDEK', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:35'),
('202208013', 31000, 2, 30000, 'MODAL SAHAM DISETOR', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:35'),
('202208016', 41000, 2, 40000, 'PENDAPATAN', 'H', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:35'),
('202208018', 51000, 2, 50000, 'BIAYA OPERASIONAL', 'H', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `level3`
--

CREATE TABLE `level3` (
  `id` char(30) NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `atype` char(1) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) NOT NULL,
  `jtype` char(1) NOT NULL,
  `trigered` varchar(4) NOT NULL,
  `active` char(1) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level3`
--

INSERT INTO `level3` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('2022080112', 62100, 3, 62000, 'BIAYA ADM DAN JASA LAIN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('2022080113', 61100, 3, 61000, 'BELANJA PEGAWAI DAN PENGURUS', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('2022080114', 61200, 3, 61000, 'BELANJA JASA KANTOR', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('2022080116', 21920, 3, 21000, 'BIAYA YANG BELUM DIBAYAR', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080117', 62200, 3, 62000, 'BIAYA LAIN-LAIN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('2022080118', 23100, 3, 23000, 'HUTANG PAJAK PPH FINAL', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080119', 23200, 3, 23000, 'HUTANG PPN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:51'),
('202208012', 21300, 3, 21000, 'BIAYA YANG MASIH HARUS DIBAYAR', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080123', 42999, 3, 42000, 'PENDAPATAN LAINNYA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080126', 71100, 3, 71000, 'PENDAPATAN JASA BANK', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('2022080128', 11300, 3, 11000, 'PIUTANG PENDAPATAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('202208013', 31000, 2, 31000, 'MODAL SAHAM DISETOR', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51'),
('2022080131', 11600, 3, 11000, 'PERSEDIAAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:52'),
('2022080132', 12100, 3, 12000, 'TANAH', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080133', 12200, 3, 12000, 'GEDUNG DAN BANGUNAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080134', 12300, 3, 12000, 'PERALATAN DAN MESIN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080135', 12400, 3, 12000, 'KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080136', 12500, 3, 12000, 'AKUMULASI PENYUSUTAN', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-25 21:51:52'),
('2022080138', 21100, 3, 21000, 'HUTANG USAHA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080140', 21400, 3, 21000, 'PENDAPATAN DITERIMA DIMUKA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080142', 21600, 3, 21000, 'HUTANG LAINNYA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('2022080153', 61300, 3, 61000, 'BELANJA ADMINISTRASI', 'H', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:52'),
('202208016', 41100, 3, 41000, 'PENJUALAN BBM', 'D', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:51:51'),
('202208017', 51000, 2, 51000, 'UANG SUPIR', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51'),
('202208018', 52000, 2, 52000, 'IURAN HISWANA MIGAS', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51'),
('202208019', 81100, 3, 81000, 'BIAYA TAK TERDUGA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:51:51'),
('20220830033326', 23700, 3, 23000, 'HUTANG JANGKA PAJANG', 'H', '0.00', 'JK', '1', '0', '1', '2022-08-30 11:33:26'),
('20230201021633', 11100, 3, 11000, 'KAS DAN SETARA KAS', 'H', '0.00', 'JK', '1', '0', '1', '2023-02-01 09:16:33'),
('20230201022212', 11200, 3, 11000, 'KAS BANK', 'H', '0.00', 'JK', '1', '0', '1', '2023-02-01 09:22:13'),
('20230210', 54000, 3, 50000, 'KANTOR LAINNYA', 'D', '0.00', 'JK', 'c', '0', '1', '2022-08-25 21:51:51'),
('20230210134021', 41200, 3, 41000, 'PENJUALAN GAS', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 21:40:21'),
('20230210134115', 41300, 3, 41000, 'PENJUALAN OLI', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 21:41:15'),
('20230210142211', 51101, 3, 51000, 'UANG SUPIR', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:22:11'),
('20230210142312', 51102, 3, 51000, 'IURAN HISWANA MIGAS', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:23:12'),
('20230210142352', 51103, 3, 51000, 'BIAYA MATERAI', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:23:52'),
('20230210142422', 51104, 3, 51000, 'KEPERLUAN KANTOR LAINNYA', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:24:22'),
('20230210142443', 51105, 3, 51000, 'BIAYA TRANSPORT', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:24:43'),
('20230210142528', 51106, 3, 51000, 'BIAYA GAJI DAN INSTANSI, THR, JTK', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:25:28'),
('20230210142556', 51107, 3, 51000, 'BIAYA LISTRIK', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:25:56'),
('20230210142611', 51108, 3, 51000, 'BIAYA TELPON', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:26:11'),
('20230210142623', 51109, 3, 51000, 'BIAYA TAMU', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:26:23'),
('20230210142647', 51110, 3, 51000, 'BANTEN/MEACI-ACI', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:26:47'),
('20230210142716', 51111, 3, 51000, 'PEMELIHARAAN/PERBAIKAN', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:27:16'),
('20230210142735', 51112, 3, 51000, 'PROMOSI', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:27:35'),
('20230210142802', 51113, 3, 51000, 'BBM GENSET/MESIN RUMPUT', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:28:02'),
('20230210142826', 51114, 3, 51000, 'BIAYA PERCETAKAN & BUKU', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:28:26'),
('20230210142848', 51115, 3, 51000, 'KOMISI PENJUALAN', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:28:48'),
('20230210142935', 51116, 3, 51000, 'BIAYA IJIN TENGKI PENDAM', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:29:35'),
('20230210143007', 51117, 3, 51000, 'ASURANSI POMPA', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:30:07'),
('20230210143023', 51118, 3, 51000, 'PAJAK BUMI DAN BANGUNAN', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:30:23'),
('20230210143048', 51119, 3, 51000, 'BONUS SATPAM', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:30:48'),
('20230210143113', 51120, 3, 51000, 'PAKAIAN KARYAWAN', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:31:13'),
('202308001', 52000, 2, 53000, 'IURAN HISWANA MIGAS', 'B', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `level4`
--

CREATE TABLE `level4` (
  `id` char(30) NOT NULL,
  `acc_id` int NOT NULL,
  `alevel` int NOT NULL,
  `parent` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `atype` char(1) NOT NULL,
  `amount` decimal(13,2) NOT NULL,
  `jurnal` char(2) NOT NULL,
  `jtype` char(1) NOT NULL,
  `trigered` varchar(4) NOT NULL,
  `active` char(1) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level4`
--

INSERT INTO `level4` (`id`, `acc_id`, `alevel`, `parent`, `name`, `atype`, `amount`, `jurnal`, `jtype`, `trigered`, `active`, `date_create`) VALUES
('2022080115', 23210, 4, 23200, 'PPN MASUKAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:22'),
('2022080116', 23220, 4, 23200, 'PPN KELUARAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:22'),
('2022080121', 62120, 4, 62100, 'BIAYA MATERAI', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080122', 62121, 4, 62100, 'BIAYA PARKIR dan TOL', 'D', '0.00', 'JK', 'd', '0', '1', '2022-08-25 21:52:23'),
('2022080123', 62201, 4, 62200, 'BIAYA BANTEN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080126', 62277, 4, 62200, 'BIAYA LAIN-LAIN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080138', 11601, 4, 11600, 'PERSEDIAAN ALAT TULIS KANTOR', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080145', 12502, 4, 12500, 'AKP. BANGUNAN DAN GEDUNG', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080146', 12501, 4, 12500, 'AKP. PERALATAN DAN MESIN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080163', 61201, 4, 61200, 'BELANJA TELPON DAN INTERNET', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080164', 61202, 4, 61200, 'BELANJA LISTRIK DAN AIR', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080165', 61199, 4, 61100, 'BIAYA TAMBAHAN PEMBELIAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080166', 61102, 4, 61100, 'HONORARIUM PEGAWAI PMI', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080167', 61103, 4, 61100, 'HONORARIUM PEGAWAI NON PMI', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080168', 61104, 4, 61100, 'UANG LEMBUR', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080170', 61106, 4, 61100, 'BELANJA MAKAN DAN MINUM PEGAWAI DAN PENGURUS', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080171', 61107, 4, 61100, 'BELANJA PAKAIAN DINAS/KERJA DAN ATRIBUTNYA', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080172', 61108, 4, 61100, 'BELANJA PERJALANAN DINAS', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080173', 61109, 4, 61100, 'BELANJA DIKLAT, SOSIALSIASI DAN BINTEK', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080176', 61112, 4, 61100, 'BELANJA PEMELIHARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080178', 62119, 4, 62100, 'BIAYA BUKU CEK', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080179', 62101, 4, 62100, 'PAJAK DAN ADM TABUNGAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080180', 62102, 4, 62100, 'BIAYA TRANSFER', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080182', 61101, 4, 61100, 'BELANJA GAJI DAN TUNJANGAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080183', 61301, 4, 61300, 'BELANJA ALAT LISTRIK DAN ELEKTRONIK', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('2022080184', 61302, 4, 61300, 'BELANJA PERALATAN KEBERSIHAN DAN BAHAN PEMBERSIH', 'D', '0.00', 'JK', '2', '0', '1', '2022-08-25 21:52:23'),
('20221208032333', 12503, 4, 12500, 'AKP. KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-08 11:23:34'),
('20221208035557', 61203, 4, 61200, 'BELANJA SURAT KABAR DAN MAJALAH', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-08 11:55:58'),
('20221212055840', 61204, 4, 61200, 'BELANJA PAKET DAN PENGIRIMAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 13:58:41'),
('20221212060252', 61205, 4, 61200, 'BELANJA SERTIFIKASI/AUDIT/KALIBRASI/UJI LAB', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:02:53'),
('20221212060445', 61206, 4, 61200, 'BELANJA JASA TRANSPORT/AKOMODASI/DEKORASI', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:04:46'),
('20221212060515', 61207, 4, 61200, 'BELANJA PUBLIKASI/DOKUMENTASI/PENGATUR ACARA', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:05:17'),
('20221212061006', 61208, 4, 61200, 'BELANJA JASA KEBERSIHAN DAN PERTAMANAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:10:07'),
('20221212061633', 61209, 4, 61200, 'BELANJA JASA KESENIAN DAN KEAMANAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:16:34'),
('20221212061713', 61210, 4, 61200, 'BELANJA LISENSI PERANGKAT LUNAK', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:17:14'),
('20221212062447', 61304, 4, 61300, 'BELANJA PENGISIAN TABUNG GAS', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:24:48'),
('20221212062650', 61305, 4, 61300, 'BELANJA PENGHARGAAN/HADIAH/CENDRAMATA', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:26:52'),
('20221212062923', 61307, 4, 61300, 'BELANJA PERALATAN KANTOR/RUMAH TANGGA/BANTUAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:29:24'),
('20221212063053', 61308, 4, 61300, 'BELANJA PERALATAN PERLENGKAPAN PERIJINAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 14:30:54'),
('20221212120438', 61105, 4, 61100, 'BELANJA PENGURUS', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-12 20:04:40'),
('20221213050949', 61309, 4, 61300, 'BELANJA PERAWATAN KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-13 13:09:51'),
('20221213051018', 61310, 4, 61300, 'BELANJA CETAK DAN PENGGANDAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-13 13:10:20'),
('20221213051104', 61311, 4, 61300, 'BELANJA SEWA TEMPAT/PERALATAN KANTOR/KENDARAAN', 'D', '0.00', 'JK', '2', '0', '1', '2022-12-13 13:11:05'),
('20221214040403', 11611, 4, 11600, 'PERSEDIAAN BAHAN BAKAR MINYAK / BBM', 'D', '0.00', 'JK', '3', '0', '1', '2022-12-14 12:04:05'),
('20230201022146', 11130, 4, 11100, 'KAS', 'D', '0.00', 'JK', '3', '0', '1', '2023-02-01 09:21:46'),
('20230201022303', 11210, 4, 11200, 'Mandiri', 'D', '0.00', 'JK', 'c', '0', '1', '2023-02-01 09:23:03'),
('20230201022956', 11612, 4, 11600, 'PERSEDIAAN MATERAI', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-01 09:29:56'),
('20230201023837', 62202, 4, 62200, 'BIAYA KONSUMSI', 'D', '0.00', 'JK', '2', '0', '1', '2023-02-01 09:38:37'),
('20230210134021', 41200, 3, 41000, 'PENJUALAN GAS', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 21:40:21'),
('20230210134115', 41300, 3, 41000, 'PENJUALAN OLI', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 21:41:15'),
('20230210142211', 51101, 3, 51000, 'UANG SUPIR', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:22:11'),
('20230210142312', 51102, 3, 51000, 'IURAN HISWANA MIGAS', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:23:12'),
('20230210142352', 51103, 3, 51000, 'BIAYA MATERAI', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:23:52'),
('20230210142422', 51104, 3, 51000, 'KEPERLUAN KANTOR LAINNYA', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:24:22'),
('20230210142443', 51105, 3, 51000, 'BIAYA TRANSPORT', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:24:43'),
('20230210142528', 51106, 3, 51000, 'BIAYA GAJI DAN INSTANSI, THR, JTK', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:25:28'),
('20230210142556', 51107, 3, 51000, 'BIAYA LISTRIK', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:25:56'),
('20230210142611', 51108, 3, 51000, 'BIAYA TELPON', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:26:11'),
('20230210142623', 51109, 3, 51000, 'BIAYA TAMU', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:26:23'),
('20230210142647', 51110, 3, 51000, 'BANTEN/MEACI-ACI', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:26:47'),
('20230210142716', 51111, 3, 51000, 'PEMELIHARAAN/PERBAIKAN', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:27:16'),
('20230210142735', 51112, 3, 51000, 'PROMOSI', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:27:35'),
('20230210142802', 51113, 3, 51000, 'BBM GENSET/MESIN RUMPUT', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:28:02'),
('20230210142826', 51114, 3, 51000, 'BIAYA PERCETAKAN & BUKU', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:28:26'),
('20230210142848', 51115, 3, 51000, 'KOMISI PENJUALAN', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:28:48'),
('20230210142935', 51116, 3, 51000, 'BIAYA IJIN TENGKI PENDAM', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:29:35'),
('20230210143007', 51117, 3, 51000, 'ASURANSI POMPA', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:30:07'),
('20230210143023', 51118, 3, 51000, 'PAJAK BUMI DAN BANGUNAN', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:30:23'),
('20230210143048', 51119, 3, 51000, 'BONUS SATPAM', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:30:48'),
('20230210143113', 51120, 3, 51000, 'PAKAIAN KARYAWAN', 'B', '0.00', 'JK', '2', '0', '1', '2023-02-10 22:31:13');

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
(1, 31000, 'MODAL', 'modal', '2022-06-21 15:00:24', '2023-02-01 13:38:59'),
(4, 42100, 'PENDAPATAN SERVICE', 'pendapatan_service', '2022-06-21 15:00:24', '2023-02-01 13:38:59'),
(18, 43200, 'PENDAPATAN DENDA KONSUMEN', 'denda_konsumen', '2022-06-21 15:00:26', '2023-02-01 13:38:59'),
(20, 62310, 'BIAYA NON OPERASIONAL LAIN', 'opnum_persediaan', '2022-06-21 15:00:26', '2023-02-01 13:38:59'),
(22, 23210, 'PPN MASUKAN', 'ppn_masukan', '2022-06-21 15:00:26', '2023-02-01 13:38:59'),
(23, 23220, 'PPN KELUARAN', 'ppn_keluaran', '2022-06-21 15:00:26', '2023-02-01 13:38:59'),
(24, 43100, 'ONGKOS ANGKUT PENJUALAN', 'ongkos_angkut_jual', '2022-06-21 15:00:26', '2023-02-01 13:38:59'),
(25, 21306, 'TITIPAN PPN GABUNGAN', 'titipan_ppn', '2022-06-28 20:39:49', '2023-02-01 13:38:59'),
(35, 21300, 'HUTANG USAHA', 'hutang_usaha', '2022-09-22 07:51:05', '2023-02-01 13:38:59'),
(50, 21100, 'HUTANG PIHAK KETIGA', 'hutang_pihak3', '2022-09-25 10:31:17', '2023-02-01 13:38:59'),
(53, 21400, 'PENDAPATAN DITERIMA DIMUKA', 'hutang_pendapatan', '2022-09-25 10:32:10', '2023-02-01 13:38:59'),
(55, 21600, 'HUTANG LAINNYA', 'hutang_lain', '2022-09-25 10:32:38', '2023-02-01 13:38:59'),
(61, 11300, 'PIUTANG PENDAPATAN', 'piutang_pendapatan', '2022-09-25 10:37:15', '2023-02-01 13:38:59'),
(65, 50000, 'HARGA POKOK PENJUALAN', 'hpp', '2022-06-21 15:00:24', '2023-02-01 13:38:59'),
(66, 11600, 'PERSEDIAAN', 'persediaan', '2022-06-21 15:00:24', '2023-02-01 13:38:59'),
(67, 52000, 'POTONGAN BIAYA PELAYANAN', 'potongan_penjualan', '2023-01-26 13:25:30', '2023-02-01 13:38:59'),
(69, 11130, 'KAS', 'kas', '2023-02-01 09:28:10', '2023-02-01 13:38:59');

-- --------------------------------------------------------

--
-- Table structure for table `master_category`
--

CREATE TABLE `master_category` (
  `category_id` int NOT NULL,
  `category_code` char(10) NOT NULL,
  `category_desc` varchar(256) NOT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_category`
--

INSERT INTO `master_category` (`category_id`, `category_code`, `category_desc`, `extdata_flag`, `date_create`) VALUES
(25, 'CAT2', 'Category 2', 1, '2022-03-12 07:53:39'),
(26, '', '', 1, '2022-03-12 07:53:39'),
(107, 'CAT3', 'Category 3', 1, '2022-03-12 08:07:19'),
(122, 'CATB', 'Category Bus', 1, '2022-03-12 08:07:19'),
(125, 'CAT5', 'Category 5', 1, '2022-03-12 08:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `master_colour`
--

CREATE TABLE `master_colour` (
  `colour_id` int NOT NULL,
  `colour_code` varchar(25) DEFAULT NULL,
  `colour_desc` varchar(100) DEFAULT NULL,
  `police_desc` varchar(100) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_colour`
--

INSERT INTO `master_colour` (`colour_id`, `colour_code`, `colour_desc`, `police_desc`, `vehicle_brand`, `date_create`, `date_update`, `user_create`, `user_update`, `extdata_flag`) VALUES
(51, '01', 'INDONESIA GREEN', 'HIJAU', 'HINO', '2015-09-01 00:00:00', '2015-09-01 00:00:00', 'HMSI', 'HMSI', 1),
(52, '02', 'BLACK CHASSIS', 'HITAM RANGKA', 'HINO', '2015-09-01 00:00:00', '2015-09-01 00:00:00', 'HMSI', 'HMSI', 1),
(53, '03', 'ORANGE', 'ORANGE', 'HINO', '2015-09-01 00:00:00', '2018-08-30 14:01:59', 'HMSI', '38086', 1),
(54, '04', 'RED WHITE', 'RED WHITE', 'HINO', '2018-08-29 17:45:23', '2018-08-29 17:45:23', '36745', '36745', 1),
(55, '05', 'WHITE', 'PUTIH', 'HINO', '2015-09-01 00:00:00', '2015-09-01 00:00:00', 'HMSI', 'HMSI', 1),
(56, '06', 'HIGH GREEN', 'HIJAU TUA', 'HINO', '2015-09-01 00:00:00', '2015-09-01 00:00:00', 'HMSI', 'HMSI', 1),
(57, '07', 'GY GREEN', 'GY GREEN', 'HINO', '2018-08-29 17:46:09', '2018-08-29 17:46:09', '36745', '36745', 1),
(58, '08', 'RED', 'MERAH', 'HINO', '2015-09-01 00:00:00', '2015-09-01 00:00:00', 'HMSI', 'HMSI', 1),
(59, '09', 'BLUE', 'BIRU', 'HINO', '2015-09-01 00:00:00', '2015-09-01 00:00:00', 'HMSI', 'HMSI', 1),
(60, '10', 'SUPER WHITE', 'PUTIH', 'HINO', '2015-09-01 00:00:00', '2015-09-01 00:00:00', 'HMSI', 'HMSI', 1),
(61, '11', 'YELLOW', 'KUNING', 'HINO', '2015-09-17 09:37:26', '2015-09-17 09:37:26', '50471', '50471', 1),
(62, '13', 'ORANGE', 'ORANGE', 'HINO', '2017-10-20 08:58:39', '2017-10-20 08:58:39', '36745', '36745', 1),
(63, '20', 'BLACK', 'BLACK', 'HINO', '2017-10-20 08:59:31', '2017-10-20 08:59:31', '36745', '36745', 1),
(64, '21', 'BLACK GLOSS', 'BLACK GLOSS', 'HINO', '2017-10-20 08:59:58', '2017-10-20 08:59:58', '36745', '36745', 1),
(65, '22', 'BLUE PEARL', 'BLUE PEARL', 'HINO', '2017-10-20 09:00:13', '2017-10-20 09:00:13', '36745', '36745', 1),
(66, '23', 'MARINE GREEN', 'MARINE GREEN', 'HINO', '2017-10-20 09:00:29', '2017-10-20 09:00:29', '36745', '36745', 1),
(67, '24', 'GREEN ARMY', 'GREEN ARMY', 'HINO', '2017-10-20 09:00:45', '2017-10-20 09:00:45', '36745', '36745', 1),
(68, 'C01', 'Other Color', 'Other Color', 'OTHBRN1', '2015-09-09 10:35:27', '2017-01-24 23:24:37', 'N93355', '50554', 1),
(69, 'HB', 'BLUE MICA', 'BIRU MIKA', 'HINO', '2021-08-19 15:22:27', '2021-08-19 15:22:55', '38086', '38086', 1),
(70, 'HB1', 'BLUE METALLIC', 'BIRU METALIK', 'HINO', '2019-07-22 13:21:44', '2019-07-22 13:21:44', '38142', '38142', 1),
(171, '14', 'MERAH PERTAMINA', 'MERAH PERTAMINA', 'HINO', '2022-05-31 11:35:16', '2022-05-31 11:35:16', '38086', '38086', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_discount`
--

CREATE TABLE `master_discount` (
  `discount_id` int NOT NULL,
  `discount_code` char(2) NOT NULL,
  `discount_percent` decimal(4,2) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_discount`
--

INSERT INTO `master_discount` (`discount_id`, `discount_code`, `discount_percent`, `date_create`) VALUES
(7, '0', '0.00', '2022-03-15 13:29:56'),
(8, '01', '35.00', '2022-03-15 13:29:56'),
(9, '02', '40.00', '2022-03-15 13:29:56'),
(10, '04', '31.00', '2022-03-15 13:29:56'),
(11, '06', '23.00', '2022-03-15 13:29:56'),
(12, 'ZY', '45.00', '2022-03-15 13:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `master_group`
--

CREATE TABLE `master_group` (
  `group_id` int NOT NULL,
  `group_code` varchar(5) NOT NULL,
  `group_desc` varchar(256) NOT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_group`
--

INSERT INTO `master_group` (`group_id`, `group_code`, `group_desc`, `extdata_flag`, `date_create`) VALUES
(27, 'CAT2', 'HINO 300 DUTRO', 1, '2022-03-12 08:07:18'),
(39, 'CAT3', 'HINO 500 RANGER', 1, '2022-03-12 08:07:19'),
(40, 'PCK', 'Pickup', 1, '2022-03-12 08:07:19'),
(49, 'CATB', 'HINO BUS', 1, '2022-03-12 08:07:19'),
(50, 'MNB', 'Minibus', 1, '2022-03-12 08:07:19'),
(57, 'CAT5', 'HINO 700 PROFIA', 1, '2022-03-12 08:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `master_jabatan`
--

CREATE TABLE `master_jabatan` (
  `id_jabatan` int NOT NULL,
  `kode_jabatan` char(7) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `level_jabatan` int NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_jabatan`
--

INSERT INTO `master_jabatan` (`id_jabatan`, `kode_jabatan`, `nama_jabatan`, `level_jabatan`, `date_create`) VALUES
(1, 'J0001', 'General Manager', 10, '2022-03-10 22:47:05'),
(2, 'J0002', 'Manger Service', 9, '2022-03-10 22:47:05'),
(3, 'J0003', 'Mekanik', 1, '2022-03-10 22:47:05'),
(4, 'J0004', 'Supervisor', 2, '2022-03-10 22:47:05'),
(5, 'J0005', 'Kasir', 2, '2022-03-10 22:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `master_model`
--

CREATE TABLE `master_model` (
  `id_model` int NOT NULL,
  `model_code` varchar(25) DEFAULT NULL,
  `model_desc` varchar(100) DEFAULT NULL,
  `fs_exp_mile_age` int DEFAULT NULL,
  `fs_exp_month` int DEFAULT NULL,
  `indent_indicator` char(1) DEFAULT NULL,
  `sales_allow` char(1) DEFAULT NULL,
  `source_data` char(1) DEFAULT NULL,
  `rcategory_code` varchar(10) DEFAULT NULL,
  `rgroup_code` varchar(5) DEFAULT NULL,
  `unit_segment_code` varchar(10) DEFAULT NULL,
  `unit_segment_desc` varchar(256) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `warranty_expmile_age` int DEFAULT NULL,
  `warranty_exp_year` int DEFAULT NULL,
  `discontinue_date` datetime DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0',
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_udpate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_operation`
--

CREATE TABLE `master_operation` (
  `operation_id` int NOT NULL,
  `oprpdi` bit(1) DEFAULT NULL,
  `operation_code` varchar(10) DEFAULT NULL,
  `operation_name` varchar(60) DEFAULT NULL,
  `rmodel` varchar(25) DEFAULT NULL,
  `model_description` varchar(100) DEFAULT NULL,
  `oprusing_actual` bit(1) DEFAULT NULL,
  `oprusing_incentive` bit(1) DEFAULT NULL,
  `change_no` decimal(3,0) DEFAULT NULL,
  `taxcode` varchar(10) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `result_status` varchar(255) DEFAULT NULL,
  `record_status` char(1) DEFAULT NULL,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_type`
--

CREATE TABLE `master_type` (
  `type_id` int NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `master_type`
--

INSERT INTO `master_type` (`type_id`, `type_name`, `date_create`) VALUES
(1, 'TYPE 01', '2022-02-26 21:47:52'),
(2, 'TYPE 02', '2022-02-26 21:47:52'),
(3, 'TYPE 03', '2022-02-26 21:47:52'),
(4, 'TYPE 04', '2022-02-26 21:47:52');

-- --------------------------------------------------------

--
-- Table structure for table `master_variant`
--

CREATE TABLE `master_variant` (
  `variant_id` int NOT NULL,
  `variant_code` varchar(25) DEFAULT NULL,
  `variant_desc` varchar(100) DEFAULT NULL,
  `model_variant_code` varchar(25) NOT NULL,
  `wheel_drive` varchar(10) DEFAULT NULL,
  `rmodel_code` varchar(25) DEFAULT NULL,
  `cbuckd` char(10) DEFAULT NULL,
  `chassis_prefix` varchar(15) DEFAULT NULL,
  `cylinder` varchar(10) DEFAULT NULL,
  `dp_amount` decimal(9,0) NOT NULL DEFAULT '0',
  `engine_prefix` varchar(15) DEFAULT NULL,
  `fuel` varchar(10) DEFAULT NULL,
  `indent_indicator` char(1) DEFAULT NULL,
  `picture_file` varchar(256) DEFAULT NULL,
  `ppnbm_percentage` decimal(18,0) NOT NULL DEFAULT '0',
  `relase_date` datetime DEFAULT NULL,
  `sales_allow` char(1) NOT NULL DEFAULT '0',
  `source_data` char(1) NOT NULL DEFAULT '0',
  `transmission` char(10) DEFAULT NULL,
  `rgroup_code` varchar(5) DEFAULT NULL,
  `discontinue_date` datetime DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0',
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_vehicle`
--

CREATE TABLE `master_vehicle` (
  `vehicle_id` int NOT NULL,
  `vehicle_chassisno` varchar(30) NOT NULL,
  `vehicle_engineno` varchar(30) NOT NULL,
  `tnkb` varchar(10) DEFAULT NULL,
  `tnkb_colour` varchar(20) DEFAULT NULL,
  `stnk_no` varchar(25) DEFAULT NULL,
  `stnk_name` varchar(100) DEFAULT NULL,
  `stnk_validdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stnk_custcode` varchar(20) DEFAULT NULL,
  `stnk_address1` varchar(100) DEFAULT NULL,
  `stnk_address2` varchar(100) DEFAULT NULL,
  `stnk_address3` varchar(100) DEFAULT NULL,
  `stnk_city` varchar(5) DEFAULT NULL,
  `rcust_code` varchar(20) DEFAULT NULL,
  `trans_mission` varchar(10) DEFAULT NULL,
  `cylinder` varchar(10) DEFAULT NULL,
  `rvariant_code` varchar(25) DEFAULT NULL,
  `rcolour_code` varchar(25) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `vehicle_status` char(2) DEFAULT NULL,
  `model_code` varchar(25) DEFAULT NULL,
  `assembly_year` decimal(4,0) NOT NULL DEFAULT '0',
  `bpkb_no` varchar(50) DEFAULT NULL,
  `bpk_servbookno` varchar(15) DEFAULT NULL,
  `bpkb_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fak_polno` varchar(30) DEFAULT NULL,
  `fuel` varchar(10) DEFAULT NULL,
  `last_km` decimal(10,2) NOT NULL DEFAULT '0.00',
  `last_servdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prod_year` decimal(4,0) NOT NULL DEFAULT '0',
  `purchase_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purchase_dealer` decimal(10,0) NOT NULL DEFAULT '0',
  `purchase_dealername` varchar(100) DEFAULT NULL,
  `vin` varchar(20) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0',
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `message`, `time`) VALUES
(2006, 'MRS.PR000001 PMI-PO-09-26-00001 PMI-PR-09-26-00001 6000.00 2 0', '2023-02-01 13:38:59'),
(2007, 'MRS.PR000002 PMI-PO-10-16-00003 PMI-PR-10-16-00001 1800.00 2 0', '2023-02-01 13:38:59'),
(2008, 'MRS.PR000003 PMI-PO-10-16-00004 PMI-PR-10-16-00002 18000.00 2 0', '2023-02-01 13:38:59'),
(2009, 'MRS.PR000004 PMI-PO-10-16-00005 PMI-PR-10-16-00003 12000.00 1 1', '2023-02-01 13:38:59'),
(2010, '997000002', '2023-02-01 13:38:59'),
(2013, 'UTD.PR000001 PMI-PO-02-01-00001 PMI-PR-02-01-00001 130286.00 0 0', '2023-02-01 13:38:59'),
(2014, 'MRS.PR000001 PMI-PO-02-05-00002 PMI-PR-02-05-00002 1172574.00 0 0', '2023-02-05 06:28:57'),
(2015, 'MRS.SL000001 PMI-SV-02-09-00001 996000002 676430.00', '2023-02-09 00:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `nomor_group`
--

CREATE TABLE `nomor_group` (
  `id_nomor_group` int NOT NULL,
  `dealer` varchar(4) NOT NULL,
  `fiskal_year` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nomor_group`
--

INSERT INTO `nomor_group` (`id_nomor_group`, `dealer`, `fiskal_year`, `number`) VALUES
(1, 'HINO', 22, 1),
(2, 'HINO', 22, 2),
(3, 'HINO', 22, 3),
(4, 'HINO', 0, 4),
(5, 'HINO', 22, 5),
(6, 'HINO', 22, 6);

-- --------------------------------------------------------

--
-- Table structure for table `nomor_jabatan`
--

CREATE TABLE `nomor_jabatan` (
  `id_nomor_jabatan` int NOT NULL,
  `dealer` varchar(4) NOT NULL,
  `fiskal_year` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nomor_jabatan`
--

INSERT INTO `nomor_jabatan` (`id_nomor_jabatan`, `dealer`, `fiskal_year`, `number`) VALUES
(1, '22', 0, 0),
(2, 'HINO', 2022, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nomor_kode`
--

CREATE TABLE `nomor_kode` (
  `id_nomor_kode` int NOT NULL,
  `dealer` varchar(5) DEFAULT NULL,
  `fiskal_year` varchar(50) DEFAULT NULL,
  `number` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nomor_kode`
--

INSERT INTO `nomor_kode` (`id_nomor_kode`, `dealer`, `fiskal_year`, `number`) VALUES
(1, 'BB', '22', 1),
(2, 'BD', '22', 1),
(3, 'BB', '22', 2),
(4, 'BB', '22', 3),
(5, 'BB', '22', 4),
(6, 'BB', '22', 5),
(7, 'BB', '22', 6),
(8, 'BB', '22', 7),
(9, 'BB', '22', 8),
(10, 'BB', '22', 9),
(11, 'BB', '22', 10),
(12, 'BB', '22', 11),
(13, 'BB', '22', 12),
(14, 'BB', '22', 13),
(15, 'BB', '22', 14),
(16, 'BD', '22', 2),
(17, 'BB', '22', 15),
(18, 'BB', '22', 16),
(19, 'BB', '22', 17),
(20, 'BB', '22', 18),
(21, 'BB', '22', 19),
(22, 'BD', '22', 3),
(23, 'BJ', '22', 1),
(24, 'BP', '22', 1),
(25, 'BB', '22', 20);

-- --------------------------------------------------------

--
-- Table structure for table `nomor_staff`
--

CREATE TABLE `nomor_staff` (
  `id_nomor_staff` int NOT NULL,
  `dealer` varchar(4) NOT NULL,
  `fiskal_year` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nomor_staff`
--

INSERT INTO `nomor_staff` (`id_nomor_staff`, `dealer`, `fiskal_year`, `number`) VALUES
(2, 'HINO', 2022, 1),
(3, 'HINO', 2022, 2),
(4, 'HINO', 22, 3),
(5, 'HINO', 22, 4),
(6, 'HINO', 22, 5),
(7, 'HINO', 22, 6),
(8, 'HINO', 22, 7),
(9, 'HINO', 22, 8),
(10, 'HINO', 22, 9),
(11, 'HINO', 22, 10),
(12, 'HINO', 22, 11),
(13, 'HINO', 22, 12),
(14, 'HINO', 22, 13),
(15, 'HINO', 22, 14),
(16, 'HINO', 22, 15),
(17, 'HINO', 22, 16),
(18, 'HINO', 22, 17),
(19, 'HINO', 22, 18),
(20, 'HINO', 22, 19),
(21, 'HINO', 22, 20),
(22, 'HINO', 22, 21),
(23, 'HINO', 22, 22),
(24, 'HINO', 22, 23),
(25, 'HINO', 22, 24),
(26, 'HINO', 22, 25),
(27, 'HINO', 22, 26),
(28, 'HINO', 22, 27),
(29, 'HINO', 22, 28),
(30, 'HINO', 22, 29),
(31, 'HINO', 22, 30),
(32, 'HINO', 22, 31),
(33, 'HINO', 22, 32),
(34, 'HINO', 22, 33),
(35, 'HINO', 22, 34),
(36, 'HINO', 22, 35);

-- --------------------------------------------------------

--
-- Table structure for table `nomor_type`
--

CREATE TABLE `nomor_type` (
  `id_nomor_type` int NOT NULL,
  `dealer` varchar(4) NOT NULL,
  `fiskal_year` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nomor_type`
--

INSERT INTO `nomor_type` (`id_nomor_type`, `dealer`, `fiskal_year`, `number`) VALUES
(1, 'hino', 2022, 1);

-- --------------------------------------------------------

--
-- Table structure for table `opnum_detail`
--

CREATE TABLE `opnum_detail` (
  `opnum_detail_id` int NOT NULL,
  `date_trans` datetime DEFAULT NULL,
  `unique_detail_opnum` varchar(65) NOT NULL,
  `opnum_sysno` int DEFAULT NULL,
  `opnum_docno` varchar(25) DEFAULT NULL,
  `rdealer_repcode` varchar(10) NOT NULL,
  `item_code` varchar(15) DEFAULT NULL,
  `qty_opnum` decimal(10,2) NOT NULL DEFAULT '0.00',
  `last_cost` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `last_sales` decimal(10,0) NOT NULL DEFAULT '0',
  `total` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `remark` varchar(256) DEFAULT NULL,
  `user_create` varchar(10) NOT NULL,
  `user_update` varchar(10) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `opnum_detail`
--
DELIMITER $$
CREATE TRIGGER `opnum_detail_afdel` AFTER DELETE ON `opnum_detail` FOR EACH ROW BEGIN	
	DELETE from items_invdetail where  ritem_code = old.item_code and notrans = old.opnum_docno;	
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `opnum_detail_afinsert` AFTER INSERT ON `opnum_detail` FOR EACH ROW BEGIN			
	INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty,cost, sales_price, rtrans,notrans,date_trans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (new.item_code,new.rdealer_repcode,new.qty_opnum,new.last_cost, new.last_cost,'OP',new.opnum_docno,new.date_trans, '0', new.date_update,new.user_update,new.date_create,new.user_create, new.extdata_flag);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `opnum_detail_afupdate` AFTER UPDATE ON `opnum_detail` FOR EACH ROW BEGIN
	DECLARE datetrans DATETIME;	
	IF NEW.void_flag != OLD.void_flag THEN
		IF NEW.void_flag = 1 THEN
			DELETE from items_invdetail where  ritem_code = old.item_code and notrans = old.opnum_docno;		
		ELSEIF NEW.void_flag = 0 THEN
			INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty,cost, sales_price, rtrans, notrans,date_trans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (new.item_code,new.rdealer_repcode,new.qty_opnum,new.last_cost, new.last_cost,'OP',new.opnum_docno,new.date_trans, '0', new.date_update,new.user_update,new.date_create,new.user_create, new.extdata_flag);			
		END IF;
	ELSE		
		IF OLD.qty_opnum != new.qty_opnum THEN 
			UPDATE items_invdetail SET qty = new.qty_opnum,alocation_flag = '0' where ritem_code = new.item_code and notrans = new.opnum_docno;			
		END IF;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `opnum_stock`
--

CREATE TABLE `opnum_stock` (
  `opnum_id` int NOT NULL,
  `opnum_sysno` int DEFAULT NULL,
  `opnum_docno` varchar(25) DEFAULT NULL,
  `opnum_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `change_userid` varchar(10) DEFAULT NULL,
  `dealer_repcode` varchar(20) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `opnum_stock`
--
DELIMITER $$
CREATE TRIGGER `opnum_stock_afdel` AFTER DELETE ON `opnum_stock` FOR EACH ROW BEGIN
	Delete from opnum_detail where opnum_sysno = OLD.opnum_sysno;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `opnum_stock_afinsert` AFTER INSERT ON `opnum_stock` FOR EACH ROW BEGIN	
	DECLARE bulantahun varchar(6);
	DECLARE gjno varchar(12);
	DECLARE location varchar(3);
	DECLARE rowbb integer(5);
	DECLARE rowbp integer(5);
	DECLARE rowbj integer(5);
	DECLARE r_anggaran INTEGER(5);
	
	DECLARE acc_kredit INTEGER(5);
	DECLARE acc_pers_bb INTEGER(5);
	DECLARE acc_pers_bp INTEGER(5);
	DECLARE acc_pers_bj INTEGER(5);
		
	DECLARE total_trans decimal (10,2);
	DECLARE total_bb decimal (10,2);
    DECLARE total_bp decimal (10,2);
	DECLARE total_bj decimal (10,2);
	DECLARE total_grand DECIMAL(10,2);
		
	SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);
	SET @gjno = (SELECT concat(@location,'.GJ',RIGHT(concat('000000',cast(COALESCE(RIGHT(max(notrans),6),0) AS UNSIGNED)+1),6)) maxno FROM general_ledger where notrans like concat(@location,'.GJ%'));
	SET @acc_kredit = (SELECT acc_id FROM link_acc WHERE link = 'modal');
	SET @acc_pers_bb = (SELECT acc_id FROM link_acc WHERE link =  'persediaan_bahan_baku');
	SET @acc_pers_bp = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_bahan_habis_pakai');
	SET @acc_pers_bj = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_barang_jadi');
	SET @r_anggaran = (SELECT id_rekening FROM rekening_anggaran WHERE nomor_rekening = '0000001');
	
	SET @rowbb = (SELECT count(unique_detail_opnum) jumlah FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BB');
	SET @rowbp = (SELECT count(unique_detail_opnum) jumlah FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BP');
	SET @rowbj = (SELECT count(unique_detail_opnum) jumlah FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BJ');
    
	SET @total_bb = (SELECT COALESCE(sum(last_cost*qty_opnum),0) subtotal FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BB');
	SET @total_bp = (SELECT COALESCE(sum(last_cost*qty_opnum),0) subtotal FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BP');
	SET @total_bj = (SELECT COALESCE(sum(last_cost*qty_opnum),0) subtotal FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BJ');
	
	SET @total_trans = (SELECT coalesce(ROUND(sum(total),2),0) afdisc from opnum_detail a where a.opnum_sysno = NEW.opnum_sysno);
	SET @grantotal = (SELECT coalesce(ROUND(sum(total),2),0) afdisc from opnum_detail a where a.opnum_sysno = NEW.opnum_sysno);
	
	INSERT INTO messages(message) values(concat(@gjno,' ',NEW.opnum_docno,' ',NEW.opnum_sysno,' ',@total_trans,' ',@rowbb,' ',@rowbj));
	
	INSERT INTO general_ledger(notrans,order_no,invoice_no,r_anggaran,tabel_trans,tgl,total_trans,memo,jurnal,rlocation,comp_loc,us_create,us_update) VALUES(@gjno,NEW.opnum_docno,NEW.opnum_sysno,@r_anggaran,'Opnum Inventory',NEW.opnum_date,@total_trans,'Opnum Inventory','JK',NEW.dealer_repcode,'comp_loc',NEW.user_create,NEW.user_update);
	
	IF @rowbb > 0 THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bb,@total_bb,'0','OP Bahan Baku');
	END IF;
	IF @rowbp > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bp,@total_bp,'0','OP Bahan Pakai');
	END IF;
	IF @rowbj > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bj,@total_bj,'0','OP Barang Jadi');
	END IF;

	INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_kredit,'0',@grantotal,'Total Transaksi');

	IF NEW.extdata_flag = 0 THEN     	
        SET @bulantahun = DATE_FORMAT(NEW.opnum_date, "%Y%m");
    	INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'OP',NEW.opnum_docno);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `opnum_stock_afupdate` AFTER UPDATE ON `opnum_stock` FOR EACH ROW BEGIN
	DECLARE bulantahun varchar(6);
	DECLARE gjno varchar(12);
	DECLARE location varchar(3);
	DECLARE rowbb integer(5);
	DECLARE rowbp integer(5);
	DECLARE rowbj integer(5);
	DECLARE r_anggaran INTEGER(5);
	
	DECLARE acc_kredit INTEGER(5);
	DECLARE acc_pers_bb INTEGER(5);
	DECLARE acc_pers_bp INTEGER(5);
	DECLARE acc_pers_bj INTEGER(5);
		
	DECLARE total_trans decimal (10,2);
	DECLARE total_bb decimal (10,2);
    DECLARE total_bp decimal (10,2);
	DECLARE total_bj decimal (10,2);
	DECLARE total_grand DECIMAL(10,2);
	IF NEW.void_flag = 1 THEN
    	DELETE from general_ledger where invoice_no = OLD.opnum_sysno;
		UPDATE opnum_detail SET void_flag = '1' WHERE opnum_sysno = OLD.opnum_sysno;
	ELSEIF NEW.void_flag = 0 THEN
    	SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);
	SET @gjno = (SELECT concat(@location,'.GJ',RIGHT(concat('000000',cast(COALESCE(RIGHT(max(notrans),6),0) AS UNSIGNED)+1),6)) maxno FROM general_ledger where notrans like concat(@location,'.GJ%'));
	SET @acc_kredit = (SELECT acc_id FROM link_acc WHERE link = 'modal');
	SET @acc_pers_bb = (SELECT acc_id FROM link_acc WHERE link =  'persediaan_bahan_baku');
	SET @acc_pers_bp = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_bahan_habis_pakai');
	SET @acc_pers_bj = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_barang_jadi');
	SET @r_anggaran = (SELECT id_rekening FROM rekening_anggaran WHERE nomor_rekening = '0000001');
	
	SET @rowbb = (SELECT count(unique_detail_opnum) jumlah FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BB');
	SET @rowbp = (SELECT count(unique_detail_opnum) jumlah FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BP');
	SET @rowbj = (SELECT count(unique_detail_opnum) jumlah FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BJ');
    
	SET @total_bb = (SELECT COALESCE(sum(last_cost*qty_opnum),0) subtotal FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BB');
	SET @total_bp = (SELECT COALESCE(sum(last_cost*qty_opnum),0) subtotal FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BP');
	SET @total_bj = (SELECT COALESCE(sum(last_cost*qty_opnum),0) subtotal FROM opnum_detail a right join items b on a.item_code = b.item_code where a.opnum_sysno = NEW.opnum_sysno and b.item_group = 'BJ');
	
	SET @total_trans = (SELECT coalesce(ROUND(sum(total),2),0) afdisc from opnum_detail a where a.opnum_sysno = NEW.opnum_sysno);
	SET @grantotal = (SELECT coalesce(ROUND(sum(total),2),0) afdisc from opnum_detail a where a.opnum_sysno = NEW.opnum_sysno);
	
	INSERT INTO messages(message) values(concat(@gjno,' ',NEW.opnum_docno,' ',NEW.opnum_sysno,' ',@total_trans,' ',@rowbb,' ',@rowbj));
	
	INSERT INTO general_ledger(notrans,order_no,invoice_no,r_anggaran,tabel_trans,tgl,total_trans,memo,jurnal,rlocation,comp_loc,us_create,us_update) VALUES(@gjno,NEW.opnum_docno,NEW.opnum_sysno,@r_anggaran,'Opnum Inventory',NEW.opnum_date,@total_trans,'Opnum Inventory','JK',NEW.dealer_repcode,'comp_loc',NEW.user_create,NEW.user_update);
	
	IF @rowbb > 0 THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bb,@total_bb,'0','OP Bahan Baku');
	END IF;
	IF @rowbp > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bp,@total_bp,'0','OP Bahan Pakai');
	END IF;
	IF @rowbj > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pers_bj,@total_bj,'0','OP Barang Jadi');
	END IF;

	INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_kredit,'0',@grantotal,'Total Transaksi');
		UPDATE opnum_detail SET void_flag = '0' WHERE opnum_sysno = OLD.opnum_sysno;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `po_detail`
--

CREATE TABLE `po_detail` (
  `podetail_id` int NOT NULL,
  `unique_detailpo` varchar(65) NOT NULL,
  `rposysno` int DEFAULT NULL,
  `purchase_orderno` varchar(25) DEFAULT NULL,
  `grno` varchar(25) DEFAULT NULL,
  `rdealer_repcode` varchar(10) NOT NULL,
  `item_code` varchar(15) DEFAULT NULL,
  `qty_grpo` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qty_item` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qty_damage` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qty_over` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qty_short` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qty_wrong` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qty_received` decimal(7,2) NOT NULL DEFAULT '0.00',
  `unit_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `total_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `item_total` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `backorder` varchar(1) DEFAULT NULL,
  `item_group` varchar(20) DEFAULT NULL,
  `moving_code` varchar(3) DEFAULT NULL,
  `remark` varchar(225) DEFAULT NULL,
  `grline_no` int DEFAULT NULL,
  `poline_no` int DEFAULT NULL,
  `user_create` varchar(10) NOT NULL,
  `user_update` varchar(10) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `po_detail`
--

INSERT INTO `po_detail` (`podetail_id`, `unique_detailpo`, `rposysno`, `purchase_orderno`, `grno`, `rdealer_repcode`, `item_code`, `qty_grpo`, `qty_item`, `qty_damage`, `qty_over`, `qty_short`, `qty_wrong`, `qty_received`, `unit_price`, `total_price`, `discount_percent`, `discount_amount`, `item_total`, `backorder`, `item_group`, `moving_code`, `remark`, `grline_no`, `poline_no`, `user_create`, `user_update`, `date_create`, `date_update`, `void_flag`, `extdata_flag`) VALUES
(2865, '999000001BB000001', 999000001, 'PMI-PO-10-16-00003', NULL, '01020', 'BB000001', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '800.0000', '800.0000', '0.00', '0.0000', '800.0000', NULL, NULL, NULL, NULL, NULL, 1, '2', '2', '2022-10-16 19:13:07', '2023-02-01 13:38:59', 0, 0),
(2866, '999000001BB000003', 999000001, 'PMI-PO-10-16-00003', NULL, '01020', 'BB000003', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.0000', '1000.0000', '0.00', '0.0000', '1000.0000', NULL, NULL, NULL, NULL, NULL, 2, '2', '2', '2022-10-16 19:13:07', '2023-02-01 13:38:59', 0, 0),
(2867, '999000002BB000001', 999000002, 'PMI-PO-10-16-00004', NULL, '01020', 'BB000001', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '800.0000', '8000.0000', '0.00', '0.0000', '8000.0000', NULL, NULL, NULL, NULL, NULL, 1, '2', '2', '2022-10-16 19:24:15', '2023-02-01 13:38:59', 0, 0),
(2868, '999000002BB000003', 999000002, 'PMI-PO-10-16-00004', NULL, '01020', 'BB000003', '0.00', '10.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.0000', '10000.0000', '0.00', '0.0000', '10000.0000', NULL, NULL, NULL, NULL, NULL, 2, '2', '2', '2022-10-16 19:24:15', '2023-02-01 13:38:59', 0, 0),
(2869, '999000003BP000001', 999000003, 'PMI-PO-10-16-00005', NULL, '01020', 'BP000001', '0.00', '4.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2000.0000', '8000.0000', '0.00', '0.0000', '8000.0000', NULL, NULL, NULL, NULL, NULL, 1, '2', '2', '2022-10-16 19:27:38', '2023-02-01 13:38:59', 0, 0),
(2870, '999000003BB000003', 999000003, 'PMI-PO-10-16-00005', NULL, '01020', 'BB000003', '0.00', '4.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000.0000', '4000.0000', '0.00', '0.0000', '4000.0000', NULL, NULL, NULL, NULL, NULL, 2, '2', '2', '2022-10-16 19:27:38', '2023-02-01 13:38:59', 0, 0),
(2871, '999000004BB000001', 999000004, 'PMI-PO-10-17-00006', NULL, '01020', 'BB000001', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '800.0000', '800.0000', '0.00', '0.0000', '800.0000', NULL, NULL, NULL, NULL, NULL, 1, '2', '2', '2022-10-17 04:52:00', '2023-02-01 13:38:59', 0, 0),
(2872, '999000005OBT000001', 999000005, 'PMI-PO-02-01-00001', NULL, '11020', 'OBT000001', '0.00', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '130286.0000', '130286.0000', '0.00', '0.0000', '130286.0000', NULL, NULL, NULL, NULL, NULL, 1, '2', '2', '2023-02-01 17:54:27', '2023-02-01 13:38:59', 0, 0),
(2873, '999000006OBT000001', 999000006, 'PMI-PO-02-05-00002', NULL, '01020', 'OBT000001', '9.00', '99.00', '0.00', '0.00', '0.00', '0.00', '9.00', '130286.0000', '12898314.0000', '0.00', '0.0000', '12898314.0000', NULL, NULL, NULL, NULL, NULL, 1, '3', '3', '2023-02-05 14:26:28', '2023-02-05 14:28:57', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `production_id` int NOT NULL,
  `production_sysno` int DEFAULT NULL,
  `production_docno` varchar(25) DEFAULT NULL,
  `production_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ritem_code` varchar(50) NOT NULL,
  `production_qty` decimal(10,2) NOT NULL,
  `production_memo` varchar(255) NOT NULL,
  `change_userid` varchar(10) DEFAULT NULL,
  `dealer_repcode` varchar(20) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`production_id`, `production_sysno`, `production_docno`, `production_date`, `ritem_code`, `production_qty`, `production_memo`, `change_userid`, `dealer_repcode`, `start_date`, `end_date`, `user_create`, `date_create`, `user_update`, `date_update`, `void_flag`, `extdata_flag`) VALUES
(22, 994000001, 'PMI-PD-10-16-00004', '2022-10-16 14:37:35', 'BJ000002', '10.00', '', 'admindps', '01020', '2022-10-16 14:37:35', '2022-10-16 14:37:35', 'admindps', '2022-10-16 14:37:35', 'admindps', '2023-02-01 13:38:59', 0, 0),
(23, 994000002, 'PMI-PD-10-16-00005', '2022-10-16 14:38:06', 'BJ000002', '10.00', '', 'admindps', '01020', '2022-10-16 14:38:06', '2022-10-16 14:38:06', 'admindps', '2022-10-16 14:38:06', 'admindps', '2023-02-01 13:38:59', 0, 0),
(25, 994000003, 'PMI-PD-10-17-00006', '2022-10-17 03:52:42', 'BJ000002', '10.00', '', 'admindps', '01020', '2022-10-17 03:52:42', '2022-10-17 03:52:42', 'admindps', '2022-10-17 03:52:42', 'admindps', '2023-02-01 13:38:59', 0, 0);

--
-- Triggers `production`
--
DELIMITER $$
CREATE TRIGGER `production_afterinsert` AFTER INSERT ON `production` FOR EACH ROW BEGIN
DECLARE bulantahun varchar(6);
	IF NEW.extdata_flag = 0 THEN     	
        SET @bulantahun = DATE_FORMAT(NEW.production_date, "%Y%m");
    	INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'PD',NEW.production_docno);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `production_afterupdate` AFTER UPDATE ON `production` FOR EACH ROW BEGIN
	IF NEW.void_flag = 1 THEN
		UPDATE production_detail SET void_flag = '1' WHERE rproduction_sysno = OLD.production_sysno;
	ELSEIF NEW.void_flag = 0 THEN 
		UPDATE production_detail SET void_flag = '0' WHERE rproduction_sysno = OLD.production_sysno;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `production_detail`
--

CREATE TABLE `production_detail` (
  `production_detail_id` int NOT NULL,
  `unique_detail_production` varchar(65) NOT NULL,
  `rproduction_sysno` int DEFAULT NULL,
  `production_docno` varchar(25) DEFAULT NULL,
  `rdealer_repcode` varchar(10) NOT NULL,
  `item_code` varchar(15) DEFAULT NULL,
  `qty_production` decimal(10,2) NOT NULL DEFAULT '0.00',
  `last_cost` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `remark` varchar(256) DEFAULT NULL,
  `user_create` varchar(10) NOT NULL,
  `user_update` varchar(10) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `production_detail`
--

INSERT INTO `production_detail` (`production_detail_id`, `unique_detail_production`, `rproduction_sysno`, `production_docno`, `rdealer_repcode`, `item_code`, `qty_production`, `last_cost`, `total`, `remark`, `user_create`, `user_update`, `date_create`, `date_update`, `void_flag`, `extdata_flag`) VALUES
(45, '994000001BB000001', 994000001, 'PMI-PD-10-16-00004', '01020', 'BB000001', '-5.00', '800.0000', '4000.0000', NULL, 'admindps', 'admindps', '2022-10-16 14:37:35', '2023-02-01 13:39:00', 0, 0),
(46, '994000001BB000003', 994000001, 'PMI-PD-10-16-00004', '01020', 'BB000003', '-5.00', '2000.0000', '10000.0000', NULL, 'admindps', 'admindps', '2022-10-16 14:37:35', '2023-02-01 13:39:00', 0, 0),
(47, '994000001BJ000002', 994000001, 'PMI-PD-10-16-00004', '01020', 'BJ000002', '10.00', '1400.0000', '10000.0000', NULL, 'admindps', 'admindps', '2022-10-16 14:37:35', '2023-02-01 13:39:00', 0, 0),
(48, '994000002BB000001', 994000002, 'PMI-PD-10-16-00005', '01020', 'BB000001', '-5.00', '800.0000', '4000.0000', NULL, 'admindps', 'admindps', '2022-10-16 14:38:06', '2023-02-01 13:39:00', 0, 0),
(49, '994000002BB000003', 994000002, 'PMI-PD-10-16-00005', '01020', 'BB000003', '-5.00', '2000.0000', '10000.0000', NULL, 'admindps', 'admindps', '2022-10-16 14:38:06', '2023-02-01 13:39:00', 0, 0),
(50, '994000002BJ000002', 994000002, 'PMI-PD-10-16-00005', '01020', 'BJ000002', '10.00', '1400.0000', '10000.0000', NULL, 'admindps', 'admindps', '2022-10-16 14:38:06', '2023-02-01 13:39:00', 0, 0),
(53, '994000003BB000001', 994000003, 'PMI-PD-10-17-00006', '01020', 'BB000001', '-10.00', '800.0000', '8000.0000', NULL, 'admindps', 'admindps', '2022-10-17 03:52:42', '2023-02-01 13:39:00', 0, 0),
(54, '994000003BB000003', 994000003, 'PMI-PD-10-17-00006', '01020', 'BB000003', '-5.00', '2000.0000', '10000.0000', NULL, 'admindps', 'admindps', '2022-10-17 03:52:42', '2023-02-01 13:39:00', 0, 0),
(55, '994000003BJ000002', 994000003, 'PMI-PD-10-17-00006', '01020', 'BJ000002', '10.00', '1800.0000', '10000.0000', NULL, 'admindps', 'admindps', '2022-10-17 03:52:42', '2023-02-01 13:39:00', 0, 0);

--
-- Triggers `production_detail`
--
DELIMITER $$
CREATE TRIGGER `production_detail_afinsert` AFTER INSERT ON `production_detail` FOR EACH ROW BEGIN
	DECLARE datetrans DATETIME;
	SET @datetrans = (SELECT production_date FROM production where production_docno = new.production_docno);
	INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty, rtrans, date_trans, notrans,invtrans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag,cost) VALUES (new.item_code,new.rdealer_repcode,new.qty_production,'PD',@datetrans,new.production_docno,new.production_docno, '0', new.date_update,new.user_update,new.date_create,new.user_create, new.extdata_flag,abs(new.last_cost));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `program_aktivitas`
--

CREATE TABLE `program_aktivitas` (
  `id_program` int NOT NULL,
  `program_sysno` int NOT NULL,
  `program_docno` varchar(25) NOT NULL,
  `acara_kegiatan` varchar(225) NOT NULL,
  `tgl_kegiatan` datetime NOT NULL,
  `tgl_kegiatan_selesai` datetime NOT NULL,
  `r_anggaran` int NOT NULL,
  `penanggungjawab` varchar(225) NOT NULL,
  `memo` text NOT NULL,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint NOT NULL DEFAULT '0',
  `dealer_repcode` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `program_aktivitas_detail`
--

CREATE TABLE `program_aktivitas_detail` (
  `id_program_detail` int NOT NULL,
  `rprogram_sysno` int NOT NULL,
  `program_docno` varchar(25) DEFAULT NULL,
  `dealer_repcode` varchar(25) DEFAULT NULL,
  `ritem_code` varchar(45) NOT NULL,
  `unique_detail_program` varchar(45) DEFAULT NULL,
  `item_name` varchar(225) NOT NULL,
  `qty` decimal(11,2) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `subtotal` int NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL,
  `extdata_flag` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE `purchase_order` (
  `purchase_order_id` int NOT NULL,
  `posysno` int DEFAULT NULL,
  `purchase_orderno` varchar(25) DEFAULT NULL,
  `prdocno` varchar(25) DEFAULT NULL,
  `r_anggaran` varchar(20) NOT NULL,
  `vat_flag` tinyint(1) NOT NULL DEFAULT '0',
  `purchase_orderdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dealer_repcode` varchar(10) DEFAULT NULL,
  `setorder` varchar(1) DEFAULT NULL,
  `order_type` varchar(1) DEFAULT NULL,
  `supplier_code` char(20) DEFAULT NULL,
  `top_code` varchar(5) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `whs_groupcode` varchar(2) DEFAULT NULL,
  `whs_groupdesc` varchar(100) DEFAULT NULL,
  `user_create` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`purchase_order_id`, `posysno`, `purchase_orderno`, `prdocno`, `r_anggaran`, `vat_flag`, `purchase_orderdate`, `dealer_repcode`, `setorder`, `order_type`, `supplier_code`, `top_code`, `start_date`, `end_date`, `whs_groupcode`, `whs_groupdesc`, `user_create`, `date_create`, `user_update`, `date_update`, `void_flag`, `extdata_flag`) VALUES
(699, 999000001, 'PMI-PO-10-16-00003', '', '717202201020', 0, '2022-10-16 00:00:00', '01020', 'N', 'S', 'SP000018', 'C30', '2022-10-16 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '2', '2022-10-16 19:13:07', '2', '2023-02-01 13:39:00', 0, 0),
(700, 999000002, 'PMI-PO-10-16-00004', '', '717202201020', 0, '2022-10-16 00:00:00', '01020', 'N', 'S', 'SP000017', 'C30', '2022-10-16 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '2', '2022-10-16 19:24:15', '2', '2023-02-01 13:39:00', 0, 0),
(701, 999000003, 'PMI-PO-10-16-00005', '', '717202201020', 0, '2022-10-16 00:00:00', '01020', 'N', 'S', 'SP000018', 'C30', '2022-10-16 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '2', '2022-10-16 19:27:38', '2', '2023-02-01 13:39:00', 0, 0),
(702, 999000004, 'PMI-PO-10-17-00006', '', '1017202201020', 0, '2022-10-17 00:00:00', '01020', 'N', 'S', 'SP000017', 'C30', '2022-10-17 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '2', '2022-10-17 04:52:00', '2', '2023-02-01 13:39:00', 0, 0),
(703, 999000005, 'PMI-PO-02-01-00001', '', '197', 0, '2023-02-01 00:00:00', '11020', 'N', 'S', 'SP000026', 'C30', '2023-02-01 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '2', '2023-02-01 17:54:27', '2', '2023-02-01 13:39:00', 0, 0),
(704, 999000006, 'PMI-PO-02-05-00002', '', '218', 0, '2023-02-05 00:00:00', '01020', 'N', 'S', 'SP000024', 'C30', '2023-02-05 00:00:00', '0000-00-00 00:00:00', NULL, NULL, '3', '2023-02-05 14:26:28', '3', '2023-02-05 14:26:28', 0, 0);

--
-- Triggers `purchase_order`
--
DELIMITER $$
CREATE TRIGGER `purchase_order_afinsert` AFTER INSERT ON `purchase_order` FOR EACH ROW BEGIN
DECLARE bulantahun varchar(6);
	IF NEW.extdata_flag = 0 THEN     	
        SET @bulantahun = DATE_FORMAT(NEW.purchase_orderdate, "%Y%m");
    	INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'PO',NEW.purchase_orderno);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `purchase_order_afupdate` AFTER UPDATE ON `purchase_order` FOR EACH ROW BEGIN
	IF NEW.void_flag = 1 THEN
		UPDATE po_detail SET void_flag = '1' WHERE rposysno = OLD.posysno;
	ELSEIF NEW.void_flag = 0 THEN 
		UPDATE po_detail SET void_flag = '0' WHERE rposysno = OLD.posysno;
    END IF;
END
$$
DELIMITER ;

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

--
-- Dumping data for table `rekening_anggaran`
--

INSERT INTO `rekening_anggaran` (`id_rekening`, `nomor_rekening`, `nama_rekening`, `anggaran`, `parent_id`, `level`, `view_level`, `tipe`, `rlocation`, `tahun_anggaran`, `date_create`, `date_update`, `user_create`, `user_update`) VALUES
(2, '10', 'BIRO KEPEGAWAIAN,UMUM & KEUANGAN (KUK)', '0.00', 1, 0, 1, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(3, '1001', 'SUB BIRO KEPEGAWAIAN, UMUM', '0.00', 2, 1, 2, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(4, '100101', 'Umum/Rutin', '0.00', 3, 2, 3, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(5, '51101', 'Belanja Pegawai', '0.00', 4, 3, 4, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(6, '5110101', 'Belanja Gaji', '0.00', 5, 4, 5, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(7, '511010101', 'Pegawai Markas', '0.00', 6, 5, 6, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(8, '511010102', 'Pegawai Ambulan', '0.00', 6, 5, 7, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(9, '5110109', 'Iuran Asuransi Kesehatan', '0.00', 5, 4, 8, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(10, '5110110', 'Iuran Asuransi Ketenagakerjaan', '0.00', 5, 4, 9, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(19, '522', 'Belanja Barang dan Jasa', '0.00', 4, 3, 10, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(20, '1002', 'SUB BIRO KEUANGAN', '0.00', 2, 1, 14, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(21, '5220109', 'Belanja Aci-aci dan sesajen', '0.00', 19, 4, 11, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(22, '522', 'Belanja Barang dan Jasa', '0.00', 20, 2, 15, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(23, '5220308', 'Belanja Jasa Audit', '0.00', 22, 3, 16, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(26, '5221104', ': Belanja Makanan dan Minuman Kegiatan', '0.00', 19, 3, 12, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(30, '5220607', 'Belanja Software/Aplikasi', '0.00', 22, 3, 17, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(33, '11', 'DIVISI KELEMBAGAAN', '0.00', 1, 0, 43, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(35, '12', 'DIVISI PB DAN RELAWAN', '0.00', 1, 0, 62, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(36, '13', 'DIVISI PELAYANAN KESEHATAN', '0.00', 1, 0, 74, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(37, '522', 'Belanja Barang dan Jasa', '0.00', 33, 1, 44, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(38, '131', 'Operasional Pelayanan Ambulan', '0.00', 36, 2, 75, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(41, '132', 'SAFARI KESEHATAN', '0.00', 36, 2, 79, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(43, '5210302', 'Uang Lembur Non PNS', '0.00', 38, 3, 76, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(44, '5220202', 'Belanja bahan medis/ non medis', '0.00', 38, 3, 77, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(46, '5220120', 'Belanja peralatan perlengkapan bantuan', '0.00', 41, 3, 80, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(47, '5220310', 'Belanja Jasa Transportasi dan Akomodasi', '0.00', 41, 3, 81, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(48, '5220311', 'Belanja Jasa Dokumentasi', '0.00', 41, 3, 82, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(49, '5221104', 'Belanja Makanan dan Minuman Kegiatan', '0.00', 41, 3, 83, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(51, '121', 'DIKLAT KSR UNIT', '0.00', 35, 1, 63, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(53, '52101', 'Honorarium Pegawai PMI', '0.00', 51, 2, 64, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(54, '5210106', 'Honorarium tenaga ahli/narasumber/instruktur/pelattih', '0.00', 53, 3, 65, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(58, '52206', 'Belanja Cetak dan Penggandaan', '0.00', 35, 1, 68, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(59, '5220601', 'Belanja Cetak ', '0.00', 58, 2, 69, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(60, '1203', 'KESIAPSIAGAAN', '0.00', 35, 1, 72, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(61, '5210106', 'Honor Pelatih Kabupaten', '0.00', 54, 4, 66, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(63, '5210201', 'Honor Pelatih Provinsi', '0.00', 54, 4, 67, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(64, '5220601', 'Cetak Sertifikat', '0.00', 59, 3, 70, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(65, '5220601', 'Cetak Kartu Anggota', '0.00', 59, 3, 71, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(66, '51301', 'Belanja Tak Terduga', '0.00', 60, 2, 73, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(71, '5220327', 'Belanja Lisensi Perangkat Lunak', '0.00', 37, 2, 45, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(72, '5220603', 'Belanja Foto Copy', '0.00', 37, 2, 46, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(73, '1101', 'Belanja Rutin', '0.00', 37, 2, 47, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(74, '512', 'Belanja Pengurus', '0.00', 73, 2, 48, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(75, '522', 'Belanja Barang dan Jasa', '0.00', 73, 2, 50, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(77, '1102', 'Musyawarah Kerja Kabupaten', '0.00', 73, 2, 54, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(78, '5120101', 'Tunjangan Komunikasi', '0.00', 74, 3, 49, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(80, '5220314', 'Belanja Jasa Publikasi Media Cetak dan Elektronik', '0.00', 75, 3, 51, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(81, '5220603', 'Belanja Foto Copy', '0.00', 75, 3, 52, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(82, '5220604', 'Belanja Penjilidan', '0.00', 75, 3, 53, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(84, '5220109', 'Belanja Aci-aci dan Sesajen', '0.00', 77, 3, 55, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(85, '5220311', 'Belanja Jasa Dokumentasi', '0.00', 77, 3, 56, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(86, '5220312', 'Belanja Jasa Dekorasi', '0.00', 77, 3, 57, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(87, '5220601', 'Belanja Cetak ', '0.00', 77, 3, 58, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(88, '5220603', 'Belanja Foto Copy', '0.00', 77, 3, 59, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(90, '5220604', 'Belanja Penjilidan', '0.00', 77, 3, 60, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(91, '5221104', 'Belanja Makanan dan Minuman Kegiatan', '0.00', 77, 3, 61, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(98, '52203', 'Belanja Jasa Kantor', '0.00', 172, 2, 20, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(100, '14', 'DIVIISI PENGEMBANGAN SUMBER DAYA', '0.00', 1, 0, 84, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(109, '5220502', 'Belanja pergantian suku cadang', '0.00', 185, 3, 41, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(110, '5220507', 'Belanja surat tanda nomor kendaraan', '0.00', 185, 3, 42, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(111, '5220602', 'Belanja Penggandaan', '0.00', 19, 4, 13, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(112, '52220', 'Belanja Pemeliharaan', '0.00', 172, 2, 26, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(113, '5222001', 'Belanja Pemeliharaan Listrik dan Telepon', '0.00', 112, 3, 27, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(114, '5222008', 'Belanja Pemeliharaan Kantor / Gedung / Bangunan', '0.00', 112, 3, 28, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(115, '5222010', 'Belanja Pemeliharaan Peralatan Kantor', '0.00', 112, 3, 29, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(116, '5222011', 'Belanja Pemeliharaan Perlengkapan', '0.00', 112, 3, 30, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(117, '15', 'UNIT TRANFUSI DARAH', '0.00', 1, 0, 85, 'H', '11020,01020', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(118, '2000000', 'UTANG', '0.00', 117, 1, 86, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(123, '2100000', 'Utang Layanan Darah', '0.00', 118, 2, 87, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(124, '2200000', 'Utang Usaha', '0.00', 118, 2, 89, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(125, '5110000', 'BELANJA PEGAWAI', '0.00', 117, 1, 91, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(126, '5220000', 'BELANJA BARANG DAN JASA', '0.00', 117, 1, 101, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(127, '5110100', 'GAJI DAN TUNJANGAN', '0.00', 125, 2, 92, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(128, '5110200', 'TAMBAHAN PENGHASILAN', '0.00', 125, 2, 97, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(129, '5220100', 'BELANJA BAHAN PAKAI HABIS KANTOR', '0.00', 126, 2, 102, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(130, '5220200', 'BELANJA BAHAN / MATERIAL', '0.00', 126, 2, 112, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(131, '5220300', 'BELANJA  JASA KANTOR', '0.00', 126, 2, 117, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(132, '5220500', 'BELANJA PERAWATAN KENDARAAN BERMOTOR', '0.00', 126, 2, 124, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(146, '5220501', 'Belanja Jasa Service', '0.00', 132, 3, 125, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(147, '5220505', 'Belanja Pajak Kendaraan Bermotor', '0.00', 132, 3, 126, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(148, '5220301', 'Belanja Telpon dan Internet', '0.00', 131, 3, 118, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(149, '5220305', 'Belanja Kawat/Faksimile/Internet ', '0.00', 131, 3, 119, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(150, '5220307', 'Belanja Sertifikasi', '0.00', 131, 3, 120, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(151, '5220318', 'Belanja Jasa Pemeriksaan Laboratorium', '0.00', 131, 3, 121, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(152, '5220319', 'Belanja Jasa Uji Laboratorium', '0.00', 131, 3, 122, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(153, '5220201', 'Belanja Bahan Baku', '0.00', 130, 3, 113, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(154, '5220202', 'Belanja Bahan Medis/Non Medis', '0.00', 130, 3, 114, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(155, '5220205', 'Belanja Reagen ', '0.00', 130, 3, 115, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(156, '5110101', 'Gaji Pokok Pegawai', '0.00', 127, 3, 93, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(157, '5110109', 'Iuran BPJS Kesehatan', '0.00', 127, 3, 94, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(158, '5110110', 'Iuran BPJS Tenaga Kerja', '0.00', 127, 3, 95, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(159, '5110201', 'Tambahan Penghasilan Berdasarkan Beban Kerja', '0.00', 128, 3, 98, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(161, '5210303', 'Uang Lembur Kegiatan ', '0.00', 190, 3, 100, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(163, '5220101', 'Belanja Alat Tulis Kantor', '0.00', 129, 3, 103, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(164, '5220107', 'Belanja Bahan Bakr Minyak/Gas Sarana mobilitas', '0.00', 129, 3, 104, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(165, '5220110', 'Belanja Aci-Aci dan Sesajen', '0.00', 129, 3, 105, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(166, '5220115', 'Belanja Perlengkapan Kantor', '0.00', 129, 3, 106, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(167, '5220208', 'Belanja Bahan Alat Kerja', '0.00', 130, 3, 116, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(168, '2101000', 'Utang Layanan Darah', '0.00', 123, 3, 88, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(169, '2201000', 'Utang Usaha', '0.00', 124, 3, 90, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(172, '1003', 'SUB BIRO LOGISTIK DAN ASET', '0.00', 2, 1, 19, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(173, '52201', 'Belanja bahan pakai habis', '0.00', 172, 2, 31, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(174, '5220112', 'Belanja obat-obatan', '0.00', 38, 3, 78, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(176, '5220302', 'Belanja Air', '0.00', 98, 3, 21, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(177, '5220303', 'Belanja Listrik', '0.00', 98, 3, 22, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(178, '5220304', 'Belanja Surat kabar/Majalah', '0.00', 98, 3, 23, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(179, '5220316', 'Belanja jasa kebersihan dan penghijauan', '0.00', 98, 3, 24, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(180, '5220104', 'Belanja Perangko,meterai dan benda pos lainnya', '0.00', 173, 3, 32, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(181, '5220105', 'Belanja Peralatan kebersihan dan bahan pembersih', '0.00', 173, 3, 33, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(182, '5220106', 'Belanja bahan bakar minyak/gas sarana mobilitas', '0.00', 173, 3, 34, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(183, '5220108', 'Belanja Gas Elpiji', '0.00', 173, 3, 35, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(184, '52206', 'Belanja Cetak dan Penggandaan', '0.00', 172, 2, 37, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(185, '52205', 'Belanja Perawatan kendaraan Bermotor', '0.00', 172, 2, 40, 'H', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(186, '5220601', 'Belanja Cetak', '0.00', 184, 3, 38, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(187, '5220602', 'Belanja Penggandaan', '0.00', 184, 3, 39, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(188, '5220301', 'Belanja Telepon', '0.00', 98, 3, 25, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(189, '5220101', 'Belanja ATK', '0.00', 173, 3, 36, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(190, '5210300', 'Uang Lembur', '0.00', 125, 2, 99, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(191, '5220330', 'Belanja administrasi Bank', '0.00', 22, 3, 18, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(192, '5220600', 'BELANJA CETAK DAN PENGGANDAAN', '0.00', 126, 2, 128, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(195, '5221100', 'BELANJA MAKANAN DAN MINUMAN', '0.00', 126, 2, 131, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(196, '5221500', 'BELANJA PERJALANAN DINAS', '0.00', 126, 2, 135, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(197, '5220104', 'Belanja Perangko, Materai dan Benda Pos', '0.00', 129, 3, 107, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(198, '5220105', 'Belanja Perlaatan Kebersihan dan Bahan Pembersih', '0.00', 129, 3, 108, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(199, '5220116', 'Belanja Alat Kesehatan', '0.00', 129, 3, 109, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(200, '5220117', 'Belanja Bahan Penujang Medis', '0.00', 129, 3, 110, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(201, '5220317', 'Belanja Jasa Tera/Kalibrasi', '0.00', 131, 3, 123, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(202, '5220504', 'Belanja Pengecatan Kendaraan Bermotor', '0.00', 132, 3, 127, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(203, '5220601', 'Belanja Cetak', '0.00', 192, 3, 129, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(204, '5220603', 'Belanja Fotocopy', '0.00', 192, 3, 130, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(205, '5221101', 'Belanja Makanan dan Minuman Harian Pegawai', '0.00', 195, 3, 132, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(206, '5221103', 'Belanja Makanan dan MInuman Tamu', '0.00', 195, 3, 133, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(207, '5221104', 'Belanja Makanan dan Minuman Kegiatan', '0.00', 195, 3, 134, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(208, '5221501', 'Belanja Perjalanan Dinas Dalam Daerah', '0.00', 196, 3, 136, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(209, '5221502', 'Belanja Perjalanan Dinas Luar Daerah', '0.00', 196, 3, 137, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(210, '5221700', 'BELANJA KURSUS PELATIHAN SOSIALSIASI DAN BINTEK', '0.00', 126, 2, 138, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(211, '5222000', 'BELANJA PEMELIHARAAN', '0.00', 126, 2, 140, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(212, '5222300', 'BELANJA BARANG YG DISERAHKAN PD MASY', '0.00', 126, 2, 142, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(213, '5222006', 'Belanja Pemeliharaan Peralatan Kantor', '0.00', 211, 3, 141, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(214, '5221701', 'Belanja Diklat', '0.00', 210, 3, 139, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(215, '5222301', 'Belanja Barang yg Diserahkan kpd Masy', '0.00', 212, 3, 143, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(216, '522', 'Belanja Barang dan Jasa', '0.00', 117, 1, 144, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(217, '523', 'Belanja Modal', '0.00', 117, 1, 145, 'D', '01020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(218, '99999', 'DEFAULT ANGGARAN', '0.00', 1, 0, 151, 'D', '01020,11020', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(219, '5110102', 'Honor Pegawai Non PMI', '0.00', 127, 3, 96, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(220, '5220106', 'Belanja Bahan Bakar Minyak/Gas', '0.00', 129, 3, 111, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(221, '1000000', 'PERENCANAAN PENERIMAAN', '0.00', 117, 1, 146, 'H', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(223, '1100000', 'Silpa Tahun Lalu', '0.00', 221, 2, 147, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(224, '1200000', 'Penerimaan BPPD', '0.00', 221, 2, 148, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(225, '1300000', 'Piutang ', '0.00', 221, 2, 149, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL),
(226, '1400000', 'Persediaan', '0.00', 221, 2, 150, 'D', '11020,', 2022, '2023-01-19 11:52:22', '2023-02-01 13:39:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rekening_anggaran_bck`
--

CREATE TABLE `rekening_anggaran_bck` (
  `id_rekening` int NOT NULL,
  `nomor_rekening` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_rekening` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `anggaran` decimal(11,2) NOT NULL DEFAULT '0.00',
  `parent_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `view_level` int NOT NULL,
  `tipe` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'D',
  `rlocation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tahun_anggaran` int NOT NULL DEFAULT '2022',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekening_anggaran_bck`
--

INSERT INTO `rekening_anggaran_bck` (`id_rekening`, `nomor_rekening`, `nama_rekening`, `anggaran`, `parent_id`, `level`, `view_level`, `tipe`, `rlocation`, `tahun_anggaran`, `date_create`, `date_update`, `user_create`, `user_update`) VALUES
(2, '10', 'BIRO KEPEGAWAIAN,UMUM & KEUANGAN (KUK)', '0.00', 1, 0, 1, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(3, '1001', 'SUB BIRO KEPEGAWAIAN, UMUM', '0.00', 2, 1, 2, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(4, '100101', 'Umum/Rutin', '0.00', 3, 2, 3, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(5, '51101', 'Belanja Pegawai', '0.00', 4, 3, 4, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(6, '5110101', 'Belanja Gaji', '0.00', 5, 4, 5, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(7, '511010101', 'Pegawai Markas', '0.00', 6, 5, 6, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(8, '511010102', 'Pegawai Ambulan', '0.00', 6, 5, 7, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(9, '5110109', 'Iuran Asuransi Kesehatan', '0.00', 5, 4, 8, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(10, '5110110', 'Iuran Asuransi Ketenagakerjaan', '0.00', 5, 4, 9, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(19, '522', 'Belanja Barang dan Jasa', '0.00', 4, 3, 10, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(21, '5220109', 'Belanja Aci-aci dan sesajen', '0.00', 19, 4, 11, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(26, '5221104', ': Belanja Makanan dan Minuman Kegiatan', '0.00', 19, 3, 12, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(111, '5220602', 'Belanja Penggandaan', '0.00', 19, 4, 13, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(20, '1002', 'SUB BIRO KEUANGAN', '0.00', 2, 1, 14, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(22, '522', 'Belanja Barang dan Jasa', '0.00', 20, 2, 15, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(23, '5220308', 'Belanja Jasa Audit', '0.00', 22, 3, 16, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(30, '5220607', 'Belanja Software/Aplikasi', '0.00', 22, 3, 17, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(191, '5220330', 'Belanja administrasi Bank', '0.00', 22, 3, 18, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(172, '1003', 'SUB BIRO LOGISTIK DAN ASET', '0.00', 2, 1, 19, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(98, '52203', 'Belanja Jasa Kantor', '0.00', 172, 2, 20, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(176, '5220302', 'Belanja Air', '0.00', 98, 3, 21, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(177, '5220303', 'Belanja Listrik', '0.00', 98, 3, 22, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(178, '5220304', 'Belanja Surat kabar/Majalah', '0.00', 98, 3, 23, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(179, '5220316', 'Belanja jasa kebersihan dan penghijauan', '0.00', 98, 3, 24, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(188, '5220301', 'Belanja Telepon', '0.00', 98, 3, 25, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(112, '52220', 'Belanja Pemeliharaan', '0.00', 172, 2, 26, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(113, '5222001', 'Belanja Pemeliharaan Listrik dan Telepon', '0.00', 112, 3, 27, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(114, '5222008', 'Belanja Pemeliharaan Kantor / Gedung / Bangunan', '0.00', 112, 3, 28, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(115, '5222010', 'Belanja Pemeliharaan Peralatan Kantor', '0.00', 112, 3, 29, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(116, '5222011', 'Belanja Pemeliharaan Perlengkapan', '0.00', 112, 3, 30, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(173, '52201', 'Belanja bahan pakai habis', '0.00', 172, 2, 31, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(180, '5220104', 'Belanja Perangko,meterai dan benda pos lainnya', '0.00', 173, 3, 32, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(181, '5220105', 'Belanja Peralatan kebersihan dan bahan pembersih', '0.00', 173, 3, 33, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(182, '5220106', 'Belanja bahan bakar minyak/gas sarana mobilitas', '0.00', 173, 3, 34, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(183, '5220108', 'Belanja Gas Elpiji', '0.00', 173, 3, 35, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(189, '5220101', 'Belanja ATK', '0.00', 173, 3, 36, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(184, '52206', 'Belanja Cetak dan Penggandaan', '0.00', 172, 2, 37, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(186, '5220601', 'Belanja Cetak', '0.00', 184, 3, 38, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(187, '5220602', 'Belanja Penggandaan', '0.00', 184, 3, 39, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(185, '52205', 'Belanja Perawatan kendaraan Bermotor', '0.00', 172, 2, 40, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(109, '5220502', 'Belanja pergantian suku cadang', '0.00', 185, 3, 41, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(110, '5220507', 'Belanja surat tanda nomor kendaraan', '0.00', 185, 3, 42, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(33, '11', 'DIVISI KELEMBAGAAN', '0.00', 1, 0, 43, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(37, '522', 'Belanja Barang dan Jasa', '0.00', 33, 1, 44, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(71, '5220327', 'Belanja Lisensi Perangkat Lunak', '0.00', 37, 2, 45, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(72, '5220603', 'Belanja Foto Copy', '0.00', 37, 2, 46, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(73, '1101', 'Belanja Rutin', '0.00', 37, 2, 47, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(74, '512', 'Belanja Pengurus', '0.00', 73, 2, 48, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(78, '5120101', 'Tunjangan Komunikasi', '0.00', 74, 3, 49, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(75, '522', 'Belanja Barang dan Jasa', '0.00', 73, 2, 50, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(80, '5220314', 'Belanja Jasa Publikasi Media Cetak dan Elektronik', '0.00', 75, 3, 51, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(81, '5220603', 'Belanja Foto Copy', '0.00', 75, 3, 52, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(82, '5220604', 'Belanja Penjilidan', '0.00', 75, 3, 53, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(77, '1102', 'Musyawarah Kerja Kabupaten', '0.00', 73, 2, 54, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(84, '5220109', 'Belanja Aci-aci dan Sesajen', '0.00', 77, 3, 55, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(85, '5220311', 'Belanja Jasa Dokumentasi', '0.00', 77, 3, 56, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(86, '5220312', 'Belanja Jasa Dekorasi', '0.00', 77, 3, 57, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(87, '5220601', 'Belanja Cetak ', '0.00', 77, 3, 58, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(88, '5220603', 'Belanja Foto Copy', '0.00', 77, 3, 59, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(90, '5220604', 'Belanja Penjilidan', '0.00', 77, 3, 60, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(91, '5221104', 'Belanja Makanan dan Minuman Kegiatan', '0.00', 77, 3, 61, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(35, '12', 'DIVISI PB DAN RELAWAN', '0.00', 1, 0, 62, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(51, '121', 'DIKLAT KSR UNIT', '0.00', 35, 1, 63, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(53, '52101', 'Honorarium Pegawai PMI', '0.00', 51, 2, 64, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(54, '5210106', 'Honorarium tenaga ahli/narasumber/instruktur/pelattih', '0.00', 53, 3, 65, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(61, '5210106', 'Honor Pelatih Kabupaten', '0.00', 54, 4, 66, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(63, '5210201', 'Honor Pelatih Provinsi', '0.00', 54, 4, 67, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(58, '52206', 'Belanja Cetak dan Penggandaan', '0.00', 35, 1, 68, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(59, '5220601', 'Belanja Cetak ', '0.00', 58, 2, 69, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(64, '5220601', 'Cetak Sertifikat', '0.00', 59, 3, 70, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(65, '5220601', 'Cetak Kartu Anggota', '0.00', 59, 3, 71, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(60, '1203', 'KESIAPSIAGAAN', '0.00', 35, 1, 72, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(66, '51301', 'Belanja Tak Terduga', '0.00', 60, 2, 73, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(36, '13', 'DIVISI PELAYANAN KESEHATAN', '0.00', 1, 0, 74, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(38, '131', 'Operasional Pelayanan Ambulan', '0.00', 36, 2, 75, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(43, '5210302', 'Uang Lembur Non PNS', '0.00', 38, 3, 76, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(44, '5220202', 'Belanja bahan medis/ non medis', '0.00', 38, 3, 77, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(174, '5220112', 'Belanja obat-obatan', '0.00', 38, 3, 78, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(41, '132', 'SAFARI KESEHATAN', '0.00', 36, 2, 79, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(46, '5220120', 'Belanja peralatan perlengkapan bantuan', '0.00', 41, 3, 80, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(47, '5220310', 'Belanja Jasa Transportasi dan Akomodasi', '0.00', 41, 3, 81, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(48, '5220311', 'Belanja Jasa Dokumentasi', '0.00', 41, 3, 82, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(49, '5221104', 'Belanja Makanan dan Minuman Kegiatan', '0.00', 41, 3, 83, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(100, '14', 'DIVIISI PENGEMBANGAN SUMBER DAYA', '0.00', 1, 0, 84, 'H', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(117, '15', 'UNIT TRANFUSI DARAH', '0.00', 1, 0, 85, 'H', '11020,01020', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(118, '2000000', 'UTANG', '0.00', 117, 1, 86, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(123, '2100000', 'Utang Layanan Darah', '0.00', 118, 2, 87, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(168, '2101000', 'Utang Layanan Darah', '0.00', 123, 3, 88, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(124, '2200000', 'Utang Usaha', '0.00', 118, 2, 89, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(169, '2201000', 'Utang Usaha', '0.00', 124, 3, 90, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(125, '5110000', 'BELANJA PEGAWAI', '0.00', 117, 1, 91, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(127, '5110100', 'GAJI DAN TUNJANGAN', '0.00', 125, 2, 92, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(156, '5110101', 'Gaji Pokok Pegawai', '0.00', 127, 3, 93, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(157, '5110109', 'Iuran BPJS Kesehatan', '0.00', 127, 3, 94, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(158, '5110110', 'Iuran BPJS Tenaga Kerja', '0.00', 127, 3, 95, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(219, '5110102', 'Honor Pegawai Non PMI', '0.00', 127, 3, 96, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(128, '5110200', 'TAMBAHAN PENGHASILAN', '0.00', 125, 2, 97, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(159, '5110201', 'Tambahan Penghasilan Berdasarkan Beban Kerja', '0.00', 128, 3, 98, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(190, '5210300', 'Uang Lembur', '0.00', 125, 2, 99, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(161, '5210303', 'Uang Lembur Kegiatan ', '0.00', 190, 3, 100, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(126, '5220000', 'BELANJA BARANG DAN JASA', '0.00', 117, 1, 101, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(129, '5220100', 'BELANJA BAHAN PAKAI HABIS KANTOR', '0.00', 126, 2, 102, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(163, '5220101', 'Belanja Alat Tulis Kantor', '0.00', 129, 3, 103, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(164, '5220107', 'Belanja Bahan Bakr Minyak/Gas Sarana mobilitas', '0.00', 129, 3, 104, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(165, '5220110', 'Belanja Aci-Aci dan Sesajen', '0.00', 129, 3, 105, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(166, '5220115', 'Belanja Perlengkapan Kantor', '0.00', 129, 3, 106, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(197, '5220104', 'Belanja Perangko, Materai dan Benda Pos', '0.00', 129, 3, 107, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(198, '5220105', 'Belanja Perlaatan Kebersihan dan Bahan Pembersih', '0.00', 129, 3, 108, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(199, '5220116', 'Belanja Alat Kesehatan', '0.00', 129, 3, 109, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(200, '5220117', 'Belanja Bahan Penujang Medis', '0.00', 129, 3, 110, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(220, '5220106', 'Belanja Bahan Bakar Minyak/Gas', '0.00', 129, 3, 111, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(130, '5220200', 'BELANJA BAHAN / MATERIAL', '0.00', 126, 2, 112, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(153, '5220201', 'Belanja Bahan Baku', '0.00', 130, 3, 113, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(154, '5220202', 'Belanja Bahan Medis/Non Medis', '0.00', 130, 3, 114, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(155, '5220205', 'Belanja Reagen ', '0.00', 130, 3, 115, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(167, '5220208', 'Belanja Bahan Alat Kerja', '0.00', 130, 3, 116, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(131, '5220300', 'BELANJA  JASA KANTOR', '0.00', 126, 2, 117, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(148, '5220301', 'Belanja Telpon dan Internet', '0.00', 131, 3, 118, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(149, '5220305', 'Belanja Kawat/Faksimile/Internet ', '0.00', 131, 3, 119, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(150, '5220307', 'Belanja Sertifikasi', '0.00', 131, 3, 120, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(151, '5220318', 'Belanja Jasa Pemeriksaan Laboratorium', '0.00', 131, 3, 121, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(152, '5220319', 'Belanja Jasa Uji Laboratorium', '0.00', 131, 3, 122, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(201, '5220317', 'Belanja Jasa Tera/Kalibrasi', '0.00', 131, 3, 123, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(132, '5220500', 'BELANJA PERAWATAN KENDARAAN BERMOTOR', '0.00', 126, 2, 124, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(146, '5220501', 'Belanja Jasa Service', '0.00', 132, 3, 125, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(147, '5220505', 'Belanja Pajak Kendaraan Bermotor', '0.00', 132, 3, 126, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(202, '5220504', 'Belanja Pengecatan Kendaraan Bermotor', '0.00', 132, 3, 127, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(192, '5220600', 'BELANJA CETAK DAN PENGGANDAAN', '0.00', 126, 2, 128, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(203, '5220601', 'Belanja Cetak', '0.00', 192, 3, 129, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(204, '5220603', 'Belanja Fotocopy', '0.00', 192, 3, 130, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(195, '5221100', 'BELANJA MAKANAN DAN MINUMAN', '0.00', 126, 2, 131, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(205, '5221101', 'Belanja Makanan dan Minuman Harian Pegawai', '0.00', 195, 3, 132, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(206, '5221103', 'Belanja Makanan dan MInuman Tamu', '0.00', 195, 3, 133, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(207, '5221104', 'Belanja Makanan dan Minuman Kegiatan', '0.00', 195, 3, 134, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(196, '5221500', 'BELANJA PERJALANAN DINAS', '0.00', 126, 2, 135, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(208, '5221501', 'Belanja Perjalanan Dinas Dalam Daerah', '0.00', 196, 3, 136, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(209, '5221502', 'Belanja Perjalanan Dinas Luar Daerah', '0.00', 196, 3, 137, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(210, '5221700', 'BELANJA KURSUS PELATIHAN SOSIALSIASI DAN BINTEK', '0.00', 126, 2, 138, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(214, '5221701', 'Belanja Diklat', '0.00', 210, 3, 139, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(211, '5222000', 'BELANJA PEMELIHARAAN', '0.00', 126, 2, 140, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(213, '5222006', 'Belanja Pemeliharaan Peralatan Kantor', '0.00', 211, 3, 141, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(212, '5222300', 'BELANJA BARANG YG DISERAHKAN PD MASY', '0.00', 126, 2, 142, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(215, '5222301', 'Belanja Barang yg Diserahkan kpd Masy', '0.00', 212, 3, 143, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(216, '522', 'Belanja Barang dan Jasa', '0.00', 117, 1, 144, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(217, '523', 'Belanja Modal', '0.00', 117, 1, 145, 'D', '01020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(221, '1000000', 'PERENCANAAN PENERIMAAN', '0.00', 117, 1, 146, 'H', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(223, '1100000', 'Silpa Tahun Lalu', '0.00', 221, 2, 147, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(224, '1200000', 'Penerimaan BPPD', '0.00', 221, 2, 148, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(225, '1300000', 'Piutang ', '0.00', 221, 2, 149, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(226, '1400000', 'Persediaan', '0.00', 221, 2, 150, 'D', '11020,', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL),
(218, '99999', 'DEFAULT ANGGARAN', '0.00', 1, 0, 151, 'D', '01020,11020', 2022, '2023-01-19 11:51:08', '2023-02-01 13:39:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rekening_anggaran_detail`
--

CREATE TABLE `rekening_anggaran_detail` (
  `id_detail_rekening` int NOT NULL,
  `unique_detail_anggaran` varchar(20) NOT NULL,
  `r_rekening` int NOT NULL,
  `sumber` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = silpa\r\n1 = Hibah',
  `opening_flag` tinyint(1) NOT NULL DEFAULT '0',
  `bulan_anggaran` int NOT NULL DEFAULT '12022',
  `rlocation` varchar(10) NOT NULL,
  `anggaran` decimal(13,2) NOT NULL DEFAULT '0.00',
  `date_trans` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `user_update` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekening_anggaran_detail`
--

INSERT INTO `rekening_anggaran_detail` (`id_detail_rekening`, `unique_detail_anggaran`, `r_rekening`, `sumber`, `opening_flag`, `bulan_anggaran`, `rlocation`, `anggaran`, `date_trans`, `date_create`, `date_update`, `user_create`, `user_update`) VALUES
(1, '217202201020', 2, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(2, '317202201020', 3, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(3, '417202201020', 4, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(4, '517202201020', 5, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(5, '617202201020', 6, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(10, '1917202201020', 19, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(11, '2017202201020', 20, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(13, '2217202201020', 22, 1, 0, 72022, '01020', '0.00', '2022-11-21 04:42:12', '2022-10-16 15:44:05', '2023-02-01 13:39:00', '', ''),
(72, '29001202201020', 29, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-24 13:36:36', '2023-02-01 13:39:00', '', ''),
(75, '170001202201020', 170, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-24 13:36:36', '2023-02-01 13:39:00', '', ''),
(80, '17301202201020', 173, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-25 12:26:17', '2023-02-01 13:39:00', '', ''),
(87, '11101202201020', 111, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-25 12:30:09', '2023-02-01 13:39:00', '', ''),
(101, '9101202201020', 91, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-25 12:32:31', '2023-02-01 13:39:00', '', ''),
(103, '9801202201020', 98, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-25 12:35:11', '2023-02-01 13:39:00', '', ''),
(106, '2911202201020', 29, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(109, '17011202201020', 170, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(115, '17311202201020', 173, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(116, '7111202201020', 71, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(117, '7211202201020', 72, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(129, '6111202201020', 61, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(130, '6311202201020', 63, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(131, '6411202201020', 64, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(132, '6511202201020', 65, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(133, '11111202201020', 111, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(135, '4311202201020', 43, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(136, '4411202201020', 44, 1, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 08:42:45', '2023-02-01 13:39:00', '', ''),
(154, '17901202201020', 179, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 10:41:34', '2023-02-01 13:39:00', '', ''),
(179, '18601202201020', 186, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-28 14:30:25', '2023-02-01 13:39:00', '', ''),
(182, '3001202201020', 30, 0, 1, 12022, '01020', '0.00', '2022-01-01 00:00:00', '2022-11-29 09:18:42', '2023-02-01 13:39:00', '', ''),
(198, '21811202201020', 218, 1, 1, 12022, '01020', '0.00', '2022-12-06 09:50:16', '2022-12-06 09:50:16', '2023-02-01 13:39:00', '', ''),
(275, '.GJ000001', 0, 1, 0, 122022, '11030', '0.00', '2022-12-08 03:23:33', '2022-12-08 11:23:34', '2023-02-01 13:39:00', 'US002', 'US002'),
(278, 'UTD.GJ000002', 0, 1, 0, 122022, '11020', '0.00', '2022-12-08 03:55:57', '2022-12-08 11:55:58', '2023-02-01 13:39:00', 'US002', 'US002'),
(345, '19701202211020', 197, 0, 1, 12022, '11020', '0.00', '2022-12-09 10:01:40', '2022-12-09 10:01:40', '2023-02-01 13:39:00', '', ''),
(346, '19801202211020', 198, 0, 1, 12022, '11020', '0.00', '2022-12-09 10:01:40', '2022-12-09 10:01:40', '2023-02-01 13:39:00', '', ''),
(352, '20601202211020', 206, 0, 1, 12022, '11020', '0.00', '2022-12-09 10:05:13', '2022-12-09 10:05:13', '2023-02-01 13:39:00', '', ''),
(354, '20801202211020', 208, 0, 1, 12022, '11020', '0.00', '2022-12-09 10:05:13', '2022-12-09 10:05:13', '2023-02-01 13:39:00', '', ''),
(355, '20901202211020', 209, 0, 1, 12022, '11020', '0.00', '2022-12-09 10:05:13', '2022-12-09 10:05:13', '2023-02-01 13:39:00', '', ''),
(426, 'MRS.GJ000149', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:48:01', '2022-12-12 11:48:02', '2023-02-01 13:39:00', 'US002', 'US002'),
(427, 'MRS.GJ000150', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:48:48', '2022-12-12 11:48:49', '2023-02-01 13:39:00', 'US002', 'US002'),
(428, 'MRS.GJ000151', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:49:15', '2022-12-12 11:49:16', '2023-02-01 13:39:00', 'US002', 'US002'),
(429, 'MRS.GJ000152', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:49:51', '2022-12-12 11:49:53', '2023-02-01 13:39:00', 'US002', 'US002'),
(430, 'MRS.GJ000153', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:50:17', '2022-12-12 11:50:18', '2023-02-01 13:39:00', 'US002', 'US002'),
(431, 'MRS.GJ000154', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:50:42', '2022-12-12 11:50:43', '2023-02-01 13:39:00', 'US002', 'US002'),
(432, 'MRS.GJ000155', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:51:01', '2022-12-12 11:51:02', '2023-02-01 13:39:00', 'US002', 'US002'),
(433, 'MRS.GJ000156', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:54:56', '2022-12-12 11:54:58', '2023-02-01 13:39:00', 'US002', 'US002'),
(434, 'MRS.GJ000157', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 03:55:30', '2022-12-12 11:55:32', '2023-02-01 13:39:00', 'US002', 'US002'),
(438, 'MRS.GJ000158', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 05:58:40', '2022-12-12 13:58:41', '2023-02-01 13:39:00', 'US002', 'US002'),
(439, 'MRS.GJ000159', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:02:52', '2022-12-12 14:02:53', '2023-02-01 13:39:00', 'US002', 'US002'),
(440, 'MRS.GJ000160', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:04:45', '2022-12-12 14:04:46', '2023-02-01 13:39:00', 'US002', 'US002'),
(441, 'MRS.GJ000161', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:05:15', '2022-12-12 14:05:17', '2023-02-01 13:39:00', 'US002', 'US002'),
(442, 'MRS.GJ000162', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:10:06', '2022-12-12 14:10:07', '2023-02-01 13:39:00', 'US002', 'US002'),
(443, 'MRS.GJ000163', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:16:33', '2022-12-12 14:16:34', '2023-02-01 13:39:00', 'US002', 'US002'),
(444, 'MRS.GJ000164', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:17:13', '2022-12-12 14:17:14', '2023-02-01 13:39:00', 'US002', 'US002'),
(446, 'MRS.GJ000166', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:24:47', '2022-12-12 14:24:48', '2023-02-01 13:39:00', 'US002', 'US002'),
(447, 'MRS.GJ000167', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:26:50', '2022-12-12 14:26:52', '2023-02-01 13:39:00', 'US002', 'US002'),
(449, 'MRS.GJ000169', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:29:23', '2022-12-12 14:29:24', '2023-02-01 13:39:00', 'US002', 'US002'),
(450, 'MRS.GJ000170', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 06:30:53', '2022-12-12 14:30:54', '2023-02-01 13:39:00', 'US002', 'US002'),
(451, 'MRS.GJ000171', 0, 1, 0, 122022, '01020', '0.00', '2022-12-12 12:04:38', '2022-12-12 20:04:40', '2023-02-01 13:39:00', 'US002', 'US002'),
(475, 'MRS.GJ000173', 0, 1, 0, 122022, '01020', '0.00', '2022-12-13 05:09:49', '2022-12-13 13:09:51', '2023-02-01 13:39:00', 'US002', 'US002'),
(476, 'MRS.GJ000174', 0, 1, 0, 122022, '01020', '0.00', '2022-12-13 05:10:18', '2022-12-13 13:10:20', '2023-02-01 13:39:00', 'US002', 'US002'),
(477, 'MRS.GJ000175', 0, 1, 0, 122022, '01020', '0.00', '2022-12-13 05:11:04', '2022-12-13 13:11:05', '2023-02-01 13:39:00', 'US002', 'US002'),
(608, 'MRS.GJ000177', 0, 1, 0, 122022, '01020', '0.00', '2022-12-14 04:04:03', '2022-12-14 12:04:05', '2023-02-01 13:39:00', 'US002', 'US002'),
(1235, '19111202201020', 191, 1, 1, 12022, '01020', '0.00', '2022-12-29 13:00:45', '2022-12-29 13:00:45', '2023-02-01 13:39:00', '', ''),
(1289, '21001202301020', 21, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1290, '26001202301020', 26, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1291, '111001202301020', 111, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1292, '23001202301020', 23, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1293, '30001202301020', 30, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1296, '178001202301020', 178, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1297, '179001202301020', 179, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1299, '113001202301020', 113, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1300, '114001202301020', 114, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1301, '115001202301020', 115, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1302, '116001202301020', 116, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1303, '180001202301020', 180, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1304, '181001202301020', 181, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1305, '182001202301020', 182, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1306, '183001202301020', 183, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1307, '189001202301020', 189, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1308, '186001202301020', 186, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1309, '187001202301020', 187, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1310, '109001202301020', 109, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1311, '110001202301020', 110, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1312, '71001202301020', 71, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1313, '72001202301020', 72, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1314, '78001202301020', 78, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1315, '80001202301020', 80, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1316, '81001202301020', 81, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1317, '82001202301020', 82, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1318, '84001202301020', 84, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1319, '85001202301020', 85, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1321, '87001202301020', 87, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1322, '88001202301020', 88, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1323, '90001202301020', 90, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1324, '91001202301020', 91, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1325, '61001202301020', 61, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1326, '63001202301020', 63, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1327, '64001202301020', 64, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1328, '65001202301020', 65, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1329, '66001202301020', 66, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1330, '43001202301020', 43, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1331, '44001202301020', 44, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1332, '174001202301020', 174, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1337, '216001202301020', 216, 0, 1, 12023, '01020', '0.00', '2023-01-11 11:07:49', '2023-01-11 11:07:49', '2023-02-01 13:39:00', '', ''),
(1535, 'MRS.GJ000178', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:17:43', '2023-02-01 09:17:43', '2023-02-01 13:39:00', 'US002', 'US002'),
(1537, 'MRS.GJ000180', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:21:46', '2023-02-01 09:21:46', '2023-02-01 13:39:00', 'US002', 'US002'),
(1538, 'MRS.GJ000181', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:23:03', '2023-02-01 09:23:03', '2023-02-01 13:39:00', 'US002', 'US002'),
(1539, 'MRS.GJ000182', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:23:52', '2023-02-01 09:23:52', '2023-02-01 13:39:00', 'US002', 'US002'),
(1540, 'MRS.GJ000183', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:27:21', '2023-02-01 09:27:21', '2023-02-01 13:39:00', 'US002', 'US002'),
(1541, 'MRS.GJ000184', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:29:56', '2023-02-01 09:29:56', '2023-02-01 13:39:00', 'US002', 'US002'),
(1542, 'MRS.GJ000185', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:36:30', '2023-02-01 09:36:30', '2023-02-01 13:39:00', 'US002', 'US002'),
(1543, 'MRS.GJ000186', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:36:59', '2023-02-01 09:36:58', '2023-02-01 13:39:00', 'US002', 'US002'),
(1544, 'MRS.GJ000187', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:38:37', '2023-02-01 09:38:37', '2023-02-01 13:39:00', 'US002', 'US002'),
(1545, 'MRS.GJ000188', 0, 1, 0, 22023, '01020', '0.00', '2023-02-01 02:39:17', '2023-02-01 09:39:17', '2023-02-01 13:39:00', 'US002', 'US002'),
(1547, 'MRS.GJ000189', 218, 1, 0, 12023, '01020', '-5000.00', '2023-01-02 00:00:00', '2023-02-02 06:16:47', '2023-02-02 06:16:47', '', ''),
(1548, 'MRS.GJ000190', 218, 1, 0, 12023, '01020', '-200000.00', '2023-01-04 00:00:00', '2023-02-02 06:18:03', '2023-02-02 06:18:03', '', ''),
(1549, 'MRS.GJ000191', 218, 1, 0, 12023, '01020', '-130000.00', '2023-01-07 00:00:00', '2023-02-02 06:18:57', '2023-02-02 06:18:57', '', ''),
(1550, 'MRS.GJ000192', 218, 1, 0, 12023, '01020', '-400000.00', '2023-01-16 00:00:00', '2023-02-02 06:19:52', '2023-02-02 06:19:52', '', ''),
(1551, 'MRS.GJ000193', 218, 1, 0, 12023, '01020', '-40000.00', '2023-01-19 00:00:00', '2023-02-02 06:20:43', '2023-02-02 06:20:43', '', ''),
(1552, 'MRS.GJ000194', 218, 1, 0, 22023, '01020', '-3000.00', '2023-02-04 00:00:00', '2023-02-04 22:08:13', '2023-02-04 22:08:13', '', ''),
(1553, 'MRS.GJ000195', 218, 1, 0, 22023, '01020', '-2000.00', '2023-02-04 00:00:00', '2023-02-04 22:21:31', '2023-02-04 22:21:31', '', ''),
(1554, 'MRS.PR000001', 218, 1, 0, 0, '01020', '-1172574.00', '0000-00-00 00:00:00', '2023-02-05 14:28:57', '2023-02-05 14:28:57', '3', '3'),
(1555, 'MRS.GJ000196', 0, 1, 0, 22023, '01020', '-1172574.00', '2023-02-05 00:00:00', '2023-02-05 14:28:57', '2023-02-05 14:28:57', 'US003', 'US003'),
(1556, 'MRS.GJ000197', 218, 1, 0, 22023, '01020', '-13000.00', '2023-02-08 00:00:00', '2023-02-08 18:59:57', '2023-02-08 18:59:57', '', ''),
(1557, 'MRS.SL000001', 218, 1, 0, 22023, '01020', '-676430.00', '2023-02-09 00:00:00', '2023-02-09 08:14:25', '2023-02-09 08:14:25', 'US003', 'US003'),
(1558, 'MRS.GJ000198', 0, 1, 0, 22023, '01020', '-750837.30', '2023-02-09 00:00:00', '2023-02-09 08:14:25', '2023-02-09 08:14:25', 'US003', 'US003'),
(1559, 'MRS.GJ000002', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 13:40:21', '2023-02-10 21:40:21', '2023-02-10 21:40:21', 'US003', 'US003'),
(1560, 'MRS.GJ000003', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 13:41:15', '2023-02-10 21:41:15', '2023-02-10 21:41:15', 'US003', 'US003'),
(1574, 'MRS.GJ000004', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:22:11', '2023-02-10 22:22:11', '2023-02-10 22:22:11', 'US003', 'US003'),
(1575, 'MRS.GJ000005', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:23:12', '2023-02-10 22:23:12', '2023-02-10 22:23:12', 'US003', 'US003'),
(1576, 'MRS.GJ000006', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:23:52', '2023-02-10 22:23:52', '2023-02-10 22:23:52', 'US003', 'US003'),
(1577, 'MRS.GJ000007', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:24:22', '2023-02-10 22:24:22', '2023-02-10 22:24:22', 'US003', 'US003'),
(1578, 'MRS.GJ000008', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:24:43', '2023-02-10 22:24:43', '2023-02-10 22:24:43', 'US003', 'US003'),
(1579, 'MRS.GJ000009', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:25:28', '2023-02-10 22:25:28', '2023-02-10 22:25:28', 'US003', 'US003'),
(1580, 'MRS.GJ000010', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:25:56', '2023-02-10 22:25:56', '2023-02-10 22:25:56', 'US003', 'US003'),
(1581, 'MRS.GJ000011', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:26:11', '2023-02-10 22:26:11', '2023-02-10 22:26:11', 'US003', 'US003'),
(1582, 'MRS.GJ000012', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:26:23', '2023-02-10 22:26:23', '2023-02-10 22:26:23', 'US003', 'US003'),
(1583, 'MRS.GJ000013', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:26:47', '2023-02-10 22:26:47', '2023-02-10 22:26:47', 'US003', 'US003'),
(1584, 'MRS.GJ000014', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:27:16', '2023-02-10 22:27:16', '2023-02-10 22:27:16', 'US003', 'US003'),
(1585, 'MRS.GJ000015', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:27:35', '2023-02-10 22:27:35', '2023-02-10 22:27:35', 'US003', 'US003'),
(1586, 'MRS.GJ000016', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:28:02', '2023-02-10 22:28:02', '2023-02-10 22:28:02', 'US003', 'US003'),
(1587, 'MRS.GJ000017', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:28:26', '2023-02-10 22:28:26', '2023-02-10 22:28:26', 'US003', 'US003'),
(1588, 'MRS.GJ000018', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:28:48', '2023-02-10 22:28:48', '2023-02-10 22:28:48', 'US003', 'US003'),
(1589, 'MRS.GJ000019', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:29:35', '2023-02-10 22:29:35', '2023-02-10 22:29:35', 'US003', 'US003'),
(1590, 'MRS.GJ000020', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:30:07', '2023-02-10 22:30:07', '2023-02-10 22:30:07', 'US003', 'US003'),
(1591, 'MRS.GJ000021', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:30:23', '2023-02-10 22:30:23', '2023-02-10 22:30:23', 'US003', 'US003'),
(1592, 'MRS.GJ000022', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:30:48', '2023-02-10 22:30:48', '2023-02-10 22:30:48', 'US003', 'US003'),
(1593, 'MRS.GJ000023', 0, 1, 0, 22023, '01020', '0.00', '2023-02-10 14:31:13', '2023-02-10 22:31:13', '2023-02-10 22:31:13', 'US003', 'US003');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_anggaran_temp`
--

CREATE TABLE `rekening_anggaran_temp` (
  `id_rekening` int NOT NULL,
  `nomor_rekening` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_rekening` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_id` int NOT NULL,
  `level` int NOT NULL DEFAULT '1',
  `view_level` int NOT NULL DEFAULT '0',
  `tipe` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'D',
  `rlocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tahun_anggaran` int NOT NULL,
  `anggaran1` decimal(12,2) NOT NULL DEFAULT '0.00',
  `anggaran2` decimal(12,2) NOT NULL DEFAULT '0.00',
  `anggaran3` decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekening_anggaran_temp`
--

INSERT INTO `rekening_anggaran_temp` (`id_rekening`, `nomor_rekening`, `nama_rekening`, `parent_id`, `level`, `view_level`, `tipe`, `rlocation`, `tahun_anggaran`, `anggaran1`, `anggaran2`, `anggaran3`) VALUES
(2, '10', 'BIRO KEPEGAWAIAN,UMUM & KEUANGAN (KUK)', 1, 1, 1, 'H', '01020,', 2022, '826194977.00', '700102470.00', '564610824.00'),
(3, '1001', 'SUB BIRO KEPEGAWAIAN, UMUM', 2, 1, 2, 'H', '01020,', 2022, '609845641.00', '493264268.00', '371922895.00'),
(4, '100101', 'Umum/Rutin', 3, 1, 3, 'H', '01020,', 2022, '609845641.00', '493264268.00', '371922895.00'),
(5, '51101', 'Belanja Pegawai', 4, 1, 4, 'H', '01020,', 2022, '566967641.00', '451608268.00', '336248895.00'),
(6, '5110101', 'Belanja Gaji', 5, 1, 5, 'H', '01020,', 2022, '514673281.00', '408992480.00', '303311679.00'),
(7, '511010101', 'Pegawai Markas', 6, 1, 6, 'D', '01020,', 2022, '303847636.00', '240291338.00', '176735040.00'),
(8, '511010102', 'Pegawai Ambulan', 6, 1, 7, 'D', '01020,', 2022, '210825645.00', '168701142.00', '126576639.00'),
(9, '5110109', 'Iuran Asuransi Kesehatan', 5, 1, 8, 'D', '01020,', 2022, '20728748.00', '17092418.00', '13456088.00'),
(10, '5110110', 'Iuran Asuransi Ketenagakerjaan', 5, 1, 9, 'D', '01020,', 2022, '31565612.00', '25523370.00', '19481128.00'),
(19, '522', 'Belanja Barang dan Jasa', 4, 1, 10, 'H', '01020,', 2022, '42878000.00', '41656000.00', '35674000.00'),
(20, '1002', 'SUB BIRO KEUANGAN', 2, 1, 14, 'H', '01020,', 2022, '31574629.00', '31435820.00', '31333515.00'),
(21, '5220109', 'Belanja Aci-aci dan sesajen', 19, 1, 11, 'D', '01020,', 2022, '18028000.00', '16806000.00', '10824000.00'),
(22, '522', 'Belanja Barang dan Jasa', 20, 1, 15, 'H', '01020,', 2022, '31574629.00', '31435820.00', '31333515.00'),
(23, '5220308', 'Belanja Jasa Audit', 22, 1, 16, 'D', '01020,', 2022, '25000000.00', '25000000.00', '25000000.00'),
(26, '5221104', ': Belanja Makanan dan Minuman Kegiatan', 19, 1, 12, 'D', '01020,', 2022, '24850000.00', '24850000.00', '24850000.00'),
(30, '5220607', 'Belanja Software/Aplikasi', 22, 1, 17, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(33, '11', 'DIVISI KELEMBAGAAN', 1, 1, 43, 'H', '01020,', 2022, '2742000.00', '2742000.00', '742000.00'),
(35, '12', 'DIVISI PB DAN RELAWAN', 1, 1, 62, 'H', '01020,', 2022, '50278035.00', '39953035.00', '39953035.00'),
(36, '13', 'DIVISI PELAYANAN KESEHATAN', 1, 1, 74, 'H', '01020,', 2022, '60125000.00', '59375000.00', '56975000.00'),
(37, '522', 'Belanja Barang dan Jasa', 33, 1, 44, 'H', '01020,', 2022, '2742000.00', '2742000.00', '742000.00'),
(38, '131', 'Operasional Pelayanan Ambulan', 36, 1, 75, 'H', '01020,', 2022, '12560000.00', '11810000.00', '9410000.00'),
(41, '132', 'SAFARI KESEHATAN', 36, 1, 79, 'H', '01020,', 2022, '47565000.00', '47565000.00', '47565000.00'),
(43, '5210302', 'Uang Lembur Non PNS', 38, 1, 76, 'D', '01020,', 2022, '12000000.00', '11250000.00', '8850000.00'),
(44, '5220202', 'Belanja bahan medis/ non medis', 38, 1, 77, 'D', '01020,', 2022, '560000.00', '560000.00', '560000.00'),
(46, '5220120', 'Belanja peralatan perlengkapan bantuan', 41, 1, 80, 'D', '01020,', 2022, '26500000.00', '26500000.00', '26500000.00'),
(47, '5220310', 'Belanja Jasa Transportasi dan Akomodasi', 41, 1, 81, 'D', '01020,', 2022, '7800000.00', '7800000.00', '7800000.00'),
(48, '5220311', 'Belanja Jasa Dokumentasi', 41, 1, 82, 'D', '01020,', 2022, '125000.00', '125000.00', '125000.00'),
(49, '5221104', 'Belanja Makanan dan Minuman Kegiatan', 41, 1, 83, 'D', '01020,', 2022, '13140000.00', '13140000.00', '13140000.00'),
(51, '121', 'DIKLAT KSR UNIT', 35, 1, 63, 'H', '01020,', 2022, '21525000.00', '11575000.00', '11575000.00'),
(53, '52101', 'Honorarium Pegawai PMI', 51, 1, 64, 'H', '01020,', 2022, '21525000.00', '11575000.00', '11575000.00'),
(54, '5210106', 'Honorarium tenaga ahli/narasumber/instruktur/pelattih', 53, 1, 65, 'H', '01020,', 2022, '21525000.00', '11575000.00', '11575000.00'),
(58, '52206', 'Belanja Cetak dan Penggandaan', 35, 1, 68, 'H', '01020,', 2022, '2420000.00', '2295000.00', '2295000.00'),
(59, '5220601', 'Belanja Cetak ', 58, 1, 69, 'H', '01020,', 2022, '2420000.00', '2295000.00', '2295000.00'),
(60, '1203', 'KESIAPSIAGAAN', 35, 1, 72, 'H', '01020,', 2022, '26333035.00', '26083035.00', '26083035.00'),
(61, '5210106', 'Honor Pelatih Kabupaten', 54, 1, 66, 'D', '01020,', 2022, '18900000.00', '10700000.00', '10700000.00'),
(63, '5210201', 'Honor Pelatih Provinsi', 54, 1, 67, 'D', '01020,', 2022, '2625000.00', '875000.00', '875000.00'),
(64, '5220601', 'Cetak Sertifikat', 59, 1, 70, 'D', '01020,', 2022, '620000.00', '495000.00', '495000.00'),
(65, '5220601', 'Cetak Kartu Anggota', 59, 1, 71, 'D', '01020,', 2022, '1800000.00', '1800000.00', '1800000.00'),
(66, '51301', 'Belanja Tak Terduga', 60, 1, 73, 'D', '01020,', 2022, '26333035.00', '26083035.00', '26083035.00'),
(71, '5220327', 'Belanja Lisensi Perangkat Lunak', 37, 1, 45, 'D', '01020,', 2022, '2000000.00', '2000000.00', '0.00'),
(72, '5220603', 'Belanja Foto Copy', 37, 1, 46, 'D', '01020,', 2022, '742000.00', '742000.00', '742000.00'),
(73, '1101', 'Belanja Rutin', 33, 1, 47, 'H', '01020,', 2022, '0.00', '0.00', '0.00'),
(74, '512', 'Belanja Pengurus', 73, 1, 48, 'H', '01020,', 2022, '0.00', '0.00', '0.00'),
(75, '522', 'Belanja Barang dan Jasa', 73, 1, 50, 'H', '01020,', 2022, '0.00', '0.00', '0.00'),
(77, '1102', 'Musyawarah Kerja Kabupaten', 73, 1, 54, 'H', '01020,', 2022, '0.00', '0.00', '0.00'),
(78, '5120101', 'Tunjangan Komunikasi', 74, 1, 49, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(80, '5220314', 'Belanja Jasa Publikasi Media Cetak dan Elektronik', 75, 1, 51, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(81, '5220603', 'Belanja Foto Copy', 75, 1, 52, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(82, '5220604', 'Belanja Penjilidan', 75, 1, 53, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(84, '5220109', 'Belanja Aci-aci dan Sesajen', 77, 1, 55, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(85, '5220311', 'Belanja Jasa Dokumentasi', 77, 1, 56, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(86, '5220312', 'Belanja Jasa Dekorasi', 77, 1, 57, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(87, '5220601', 'Belanja Cetak ', 77, 1, 58, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(88, '5220603', 'Belanja Foto Copy', 77, 1, 59, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(90, '5220604', 'Belanja Penjilidan', 77, 1, 60, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(91, '5221104', 'Belanja Makanan dan Minuman Kegiatan', 77, 1, 61, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(98, '52203', 'Belanja Jasa Kantor', 172, 1, 20, 'H', '01020,', 2022, '31617502.00', '27597177.00', '23897209.00'),
(100, '14', 'DIVIISI PENGEMBANGAN SUMBER DAYA', 1, 1, 84, 'H', '01020,', 2022, '0.00', '0.00', '0.00'),
(109, '5220502', 'Belanja pergantian suku cadang', 185, 1, 41, 'D', '01020,', 2022, '58000000.00', '58000000.00', '58000000.00'),
(110, '5220507', 'Belanja surat tanda nomor kendaraan', 185, 1, 42, 'D', '01020,', 2022, '12000000.00', '12000000.00', '12000000.00'),
(111, '5220602', 'Belanja Penggandaan', 19, 1, 13, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(112, '52220', 'Belanja Pemeliharaan', 172, 1, 26, 'H', '01020,', 2022, '18000000.00', '18000000.00', '18000000.00'),
(113, '5222001', 'Belanja Pemeliharaan Listrik dan Telepon', 112, 1, 27, 'D', '01020,', 2022, '2500000.00', '2500000.00', '2500000.00'),
(114, '5222008', 'Belanja Pemeliharaan Kantor / Gedung / Bangunan', 112, 1, 28, 'D', '01020,', 2022, '7500000.00', '7500000.00', '7500000.00'),
(115, '5222010', 'Belanja Pemeliharaan Peralatan Kantor', 112, 1, 29, 'D', '01020,', 2022, '5000000.00', '5000000.00', '5000000.00'),
(116, '5222011', 'Belanja Pemeliharaan Perlengkapan', 112, 1, 30, 'D', '01020,', 2022, '3000000.00', '3000000.00', '3000000.00'),
(117, '15', 'UNIT TRANFUSI DARAH', 1, 1, 85, 'H', '11020,01020', 2022, '0.00', '0.00', '0.00'),
(118, '2000000', 'UTANG', 117, 1, 86, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(123, '2100000', 'Utang Layanan Darah', 118, 1, 87, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(124, '2200000', 'Utang Usaha', 118, 1, 89, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(125, '5110000', 'BELANJA PEGAWAI', 117, 1, 91, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(126, '5220000', 'BELANJA BARANG DAN JASA', 117, 1, 101, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(127, '5110100', 'GAJI DAN TUNJANGAN', 125, 1, 92, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(128, '5110200', 'TAMBAHAN PENGHASILAN', 125, 1, 97, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(129, '5220100', 'BELANJA BAHAN PAKAI HABIS KANTOR', 126, 1, 102, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(130, '5220200', 'BELANJA BAHAN / MATERIAL', 126, 1, 112, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(131, '5220300', 'BELANJA  JASA KANTOR', 126, 1, 117, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(132, '5220500', 'BELANJA PERAWATAN KENDARAAN BERMOTOR', 126, 1, 124, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(146, '5220501', 'Belanja Jasa Service', 132, 1, 125, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(147, '5220505', 'Belanja Pajak Kendaraan Bermotor', 132, 1, 126, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(148, '5220301', 'Belanja Telpon dan Internet', 131, 1, 118, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(149, '5220305', 'Belanja Kawat/Faksimile/Internet ', 131, 1, 119, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(150, '5220307', 'Belanja Sertifikasi', 131, 1, 120, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(151, '5220318', 'Belanja Jasa Pemeriksaan Laboratorium', 131, 1, 121, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(152, '5220319', 'Belanja Jasa Uji Laboratorium', 131, 1, 122, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(153, '5220201', 'Belanja Bahan Baku', 130, 1, 113, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(154, '5220202', 'Belanja Bahan Medis/Non Medis', 130, 1, 114, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(155, '5220205', 'Belanja Reagen ', 130, 1, 115, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(156, '5110101', 'Gaji Pokok Pegawai', 127, 1, 93, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(157, '5110109', 'Iuran BPJS Kesehatan', 127, 1, 94, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(158, '5110110', 'Iuran BPJS Tenaga Kerja', 127, 1, 95, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(159, '5110201', 'Tambahan Penghasilan Berdasarkan Beban Kerja', 128, 1, 98, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(161, '5210303', 'Uang Lembur Kegiatan ', 190, 1, 100, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(163, '5220101', 'Belanja Alat Tulis Kantor', 129, 1, 103, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(164, '5220107', 'Belanja Bahan Bakr Minyak/Gas Sarana mobilitas', 129, 1, 104, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(165, '5220110', 'Belanja Aci-Aci dan Sesajen', 129, 1, 105, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(166, '5220115', 'Belanja Perlengkapan Kantor', 129, 1, 106, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(167, '5220208', 'Belanja Bahan Alat Kerja', 130, 1, 116, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(168, '2101000', 'Utang Layanan Darah', 123, 1, 88, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(169, '2201000', 'Utang Usaha', 124, 1, 90, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(172, '1003', 'SUB BIRO LOGISTIK DAN ASET', 2, 1, 19, 'H', '01020,', 2022, '184774707.00', '175402382.00', '161354414.00'),
(173, '52201', 'Belanja bahan pakai habis', 172, 1, 31, 'H', '01020,', 2022, '64545205.00', '59193205.00', '48845205.00'),
(174, '5220112', 'Belanja obat-obatan', 38, 1, 78, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(176, '5220302', 'Belanja Air', 98, 1, 21, 'D', '01020,', 2022, '540950.00', '507130.00', '473310.00'),
(177, '5220303', 'Belanja Listrik', 98, 1, 22, 'D', '01020,', 2022, '22037117.00', '18967375.00', '16260180.00'),
(178, '5220304', 'Belanja Surat kabar/Majalah', 98, 1, 23, 'D', '01020,', 2022, '900000.00', '720000.00', '540000.00'),
(179, '5220316', 'Belanja jasa kebersihan dan penghijauan', 98, 1, 24, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(180, '5220104', 'Belanja Perangko,meterai dan benda pos lainnya', 173, 1, 32, 'D', '01020,', 2022, '1000000.00', '1000000.00', '1000000.00'),
(181, '5220105', 'Belanja Peralatan kebersihan dan bahan pembersih', 173, 1, 33, 'D', '01020,', 2022, '1000000.00', '1000000.00', '1000000.00'),
(182, '5220106', 'Belanja bahan bakar minyak/gas sarana mobilitas', 173, 1, 34, 'D', '01020,', 2022, '58611000.00', '53259000.00', '42911000.00'),
(183, '5220108', 'Belanja Gas Elpiji', 173, 1, 35, 'D', '01020,', 2022, '600000.00', '600000.00', '600000.00'),
(184, '52206', 'Belanja Cetak dan Penggandaan', 172, 1, 37, 'H', '01020,', 2022, '612000.00', '612000.00', '612000.00'),
(185, '52205', 'Belanja Perawatan kendaraan Bermotor', 172, 1, 40, 'H', '01020,', 2022, '70000000.00', '70000000.00', '70000000.00'),
(186, '5220601', 'Belanja Cetak', 184, 1, 38, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(187, '5220602', 'Belanja Penggandaan', 184, 1, 39, 'D', '01020,', 2022, '612000.00', '612000.00', '612000.00'),
(188, '5220301', 'Belanja Telepon', 98, 1, 25, 'D', '01020,', 2022, '8139435.00', '7402672.00', '6623719.00'),
(189, '5220101', 'Belanja ATK', 173, 1, 36, 'D', '01020,', 2022, '3334205.00', '3334205.00', '3334205.00'),
(190, '5210300', 'Uang Lembur', 125, 1, 99, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(191, '5220330', 'Belanja administrasi Bank', 22, 1, 18, 'D', '01020,', 2022, '6574629.00', '6435820.00', '6333515.00'),
(192, '5220600', 'BELANJA CETAK DAN PENGGANDAAN', 126, 1, 128, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(195, '5221100', 'BELANJA MAKANAN DAN MINUMAN', 126, 1, 131, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(196, '5221500', 'BELANJA PERJALANAN DINAS', 126, 1, 135, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(197, '5220104', 'Belanja Perangko, Materai dan Benda Pos', 129, 1, 107, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(198, '5220105', 'Belanja Perlaatan Kebersihan dan Bahan Pembersih', 129, 1, 108, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(199, '5220116', 'Belanja Alat Kesehatan', 129, 1, 109, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(200, '5220117', 'Belanja Bahan Penujang Medis', 129, 1, 110, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(201, '5220317', 'Belanja Jasa Tera/Kalibrasi', 131, 1, 123, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(202, '5220504', 'Belanja Pengecatan Kendaraan Bermotor', 132, 1, 127, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(203, '5220601', 'Belanja Cetak', 192, 1, 129, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(204, '5220603', 'Belanja Fotocopy', 192, 1, 130, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(205, '5221101', 'Belanja Makanan dan Minuman Harian Pegawai', 195, 1, 132, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(206, '5221103', 'Belanja Makanan dan MInuman Tamu', 195, 1, 133, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(207, '5221104', 'Belanja Makanan dan Minuman Kegiatan', 195, 1, 134, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(208, '5221501', 'Belanja Perjalanan Dinas Dalam Daerah', 196, 1, 136, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(209, '5221502', 'Belanja Perjalanan Dinas Luar Daerah', 196, 1, 137, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(210, '5221700', 'BELANJA KURSUS PELATIHAN SOSIALSIASI DAN BINTEK', 126, 1, 138, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(211, '5222000', 'BELANJA PEMELIHARAAN', 126, 1, 140, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(212, '5222300', 'BELANJA BARANG YG DISERAHKAN PD MASY', 126, 1, 142, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(213, '5222006', 'Belanja Pemeliharaan Peralatan Kantor', 211, 1, 141, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(214, '5221701', 'Belanja Diklat', 210, 1, 139, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(215, '5222301', 'Belanja Barang yg Diserahkan kpd Masy', 212, 1, 143, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(216, '522', 'Belanja Barang dan Jasa', 117, 1, 144, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(217, '523', 'Belanja Modal', 117, 1, 145, 'D', '01020,', 2022, '0.00', '0.00', '0.00'),
(218, '99999', 'DEFAULT ANGGARAN', 1, 1, 151, 'D', '01020,11020', 2022, '0.00', '0.00', '0.00'),
(219, '5110102', 'Honor Pegawai Non PMI', 127, 1, 96, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(220, '5220106', 'Belanja Bahan Bakar Minyak/Gas', 129, 1, 111, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(221, '1000000', 'PERENCANAAN PENERIMAAN', 117, 1, 146, 'H', '11020,', 2022, '0.00', '0.00', '0.00'),
(223, '1100000', 'Silpa Tahun Lalu', 221, 1, 147, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(224, '1200000', 'Penerimaan BPPD', 221, 1, 148, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(225, '1300000', 'Piutang ', 221, 1, 149, 'D', '11020,', 2022, '0.00', '0.00', '0.00'),
(226, '1400000', 'Persediaan', 221, 1, 150, 'D', '11020,', 2022, '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `salesorder`
--

CREATE TABLE `salesorder` (
  `so_id` int NOT NULL,
  `sosysno` int DEFAULT NULL,
  `sales_orderno` varchar(25) DEFAULT NULL,
  `sodate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_type` varchar(10) DEFAULT NULL,
  `order_typedesc` varchar(50) DEFAULT NULL,
  `sales_estimationno` varchar(25) DEFAULT NULL,
  `purchase_orderno` varchar(25) DEFAULT NULL,
  `purchase_ordertype` varchar(10) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `salesman` varchar(35) DEFAULT NULL,
  `salesman_empno` varchar(20) DEFAULT NULL,
  `setorder` char(1) DEFAULT NULL,
  `sales_type` varchar(10) DEFAULT NULL,
  `sales_typedesc` varchar(20) DEFAULT NULL,
  `topcode` varchar(5) DEFAULT NULL,
  `topdesc` varchar(25) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_code` char(2) DEFAULT NULL,
  `status_desc` varchar(20) DEFAULT NULL,
  `aggreement_no` varchar(20) DEFAULT NULL,
  `backorder` char(1) DEFAULT NULL,
  `outstanding_remark` varchar(10) DEFAULT NULL,
  `dealer_repcode` varchar(10) DEFAULT NULL,
  `profit_center` varchar(100) DEFAULT NULL,
  `transaction_type` varchar(100) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salesorder`
--

INSERT INTO `salesorder` (`so_id`, `sosysno`, `sales_orderno`, `sodate`, `order_type`, `order_typedesc`, `sales_estimationno`, `purchase_orderno`, `purchase_ordertype`, `customer_code`, `salesman`, `salesman_empno`, `setorder`, `sales_type`, `sales_typedesc`, `topcode`, `topdesc`, `start_date`, `end_date`, `status_code`, `status_desc`, `aggreement_no`, `backorder`, `outstanding_remark`, `dealer_repcode`, `profit_center`, `transaction_type`, `vehicle_brand`, `remark`, `user_create`, `user_update`, `date_create`, `date_update`, `extdata_flag`) VALUES
(1433, 997000001, 'PMI-SO-10-16-00001', '2022-10-16 00:00:00', '41100', 'PASIEN UMUM', 'PMI-SO-10-16-00001', NULL, NULL, 'RSDM', 'CSBI Sales Person', 'CSB00001', NULL, NULL, NULL, 'C30', 'Credit 30 Days', '2022-10-16 00:00:00', '0000-00-00 00:00:00', '20', 'Approved', NULL, 'N', NULL, '01020', 'Sparepart', 'BPPD', 'OTHERS', NULL, 'US002', 'US002', '2022-10-16 19:34:03', '2023-02-01 13:39:00', 0),
(1434, 997000002, 'PMI-SO-10-16-00002', '2022-10-16 00:00:00', '42802', 'PENDAPATAN DENDA KONSUMEN', 'PMI-SO-10-16-00002', NULL, NULL, 'RSDM', 'CSBI Sales Person', 'CSB00001', NULL, NULL, NULL, 'C30', 'Credit 30 Days', '2022-10-16 00:00:00', '0000-00-00 00:00:00', '20', 'Approved', NULL, 'N', NULL, '01020', 'Sparepart', 'LAIN', 'OTHERS', NULL, 'US002', 'US002', '2022-10-16 20:08:19', '2023-02-01 13:39:00', 0),
(1437, 997000003, 'PMI-SO-02-09-00001', '2023-02-09 00:00:00', '41100', 'PENERIMAAN HIBAH PEMERINTAH', 'PMI-SO-02-09-00001', NULL, NULL, 'RSDM', 'CSBI Sales Person', 'CSB00001', NULL, NULL, NULL, 'C30', 'Credit 30 Days', '2023-02-09 00:00:00', '0000-00-00 00:00:00', '20', 'Approved', NULL, 'N', NULL, '01020', 'Sparepart', 'BPPD', 'OTHERS', NULL, 'US003', 'US003', '2023-02-09 08:12:47', '2023-02-09 08:12:47', 0);

--
-- Triggers `salesorder`
--
DELIMITER $$
CREATE TRIGGER `salesorder_afdell` AFTER DELETE ON `salesorder` FOR EACH ROW BEGIN
	DELETE from salesorder_detail where rso_sysno = OLD.sosysno;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `salesorder_afinsert` AFTER INSERT ON `salesorder` FOR EACH ROW BEGIN
DECLARE bulantahun varchar(6);
	IF NEW.extdata_flag = 0 THEN     	
        SET @bulantahun = DATE_FORMAT(NEW.sodate, "%Y%m");
    	INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'SO',NEW.sales_orderno);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `salesorder_b4del` BEFORE DELETE ON `salesorder` FOR EACH ROW BEGIN 
	DECLARE sisno INTEGER(15);
    SET @sisno = (SELECT invsysno from soinvoice where rsales_orderno = OLD.sales_orderno);
    IF (!ISNULL(@sisno)) THEN 
		signal sqlstate '45000' set message_text = 'Sales Order with Invoice can not be deleted. Delete Invoice First and Try again!';
    END IF;    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `salesorder_detail`
--

CREATE TABLE `salesorder_detail` (
  `sodetail_id` int NOT NULL,
  `unique_detailso` varchar(65) NOT NULL DEFAULT '0',
  `rso_sysno` int DEFAULT NULL,
  `sales_orderno` varchar(25) NOT NULL DEFAULT '0',
  `soinvno` varchar(25) NOT NULL DEFAULT '0',
  `rdealer_repcode` varchar(10) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `qty_demand` decimal(7,2) NOT NULL DEFAULT '0.00',
  `qty_supply` decimal(7,2) NOT NULL DEFAULT '0.00',
  `selling_price` decimal(17,4) NOT NULL,
  `price_beforetax` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `discount` decimal(17,4) NOT NULL DEFAULT '0.0000' COMMENT 'sudah x qty',
  `tax` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `price_aftertax` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `backorder` varchar(1) DEFAULT NULL,
  `user_create` varchar(10) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salesorder_detail`
--

INSERT INTO `salesorder_detail` (`sodetail_id`, `unique_detailso`, `rso_sysno`, `sales_orderno`, `soinvno`, `rdealer_repcode`, `item_code`, `item_name`, `qty_demand`, `qty_supply`, `selling_price`, `price_beforetax`, `discount_percent`, `discount`, `tax`, `price_aftertax`, `backorder`, `user_create`, `date_create`, `user_update`, `date_update`, `extdata_flag`) VALUES
(3656, '997000001BJ000002', 997000001, 'PMI-SO-10-16-00001', '0', '01020', 'BJ000002', 'TROMBOSIT CONCENTRATE', '3.00', '0.00', '2000.0000', '6000.0000', '0.0000', '0.0000', '0.0000', '6000.0000', 'N', 'US002', '2022-10-16 19:34:03', 'US002', '2023-02-01 13:39:00', 0),
(3657, '997000002BJ000002', 997000002, 'PMI-SO-10-16-00002', '0', '01020', 'BJ000002', 'TROMBOSIT CONCENTRATE', '1.00', '1.00', '2000.0000', '2000.0000', '0.0000', '0.0000', '220.0000', '2220.0000', 'N', 'US002', '2022-10-16 20:08:19', 'US002', '2023-02-01 13:39:00', 0),
(3658, '997000003OBT000001', 997000003, 'PMI-SO-02-09-00001', '0', '01020', 'OBT000001', 'analgesic Gel 120 gr', '20.00', '5.00', '130286.0000', '2605720.0000', '0.0000', '0.0000', '286629.2000', '2892349.2000', 'N', 'US003', '2023-02-09 08:12:47', 'US003', '2023-02-09 08:14:25', 0),
(3659, '997000003BJ000001', 997000003, 'PMI-SO-02-09-00001', '0', '01020', 'BJ000001', 'paramex', '30.00', '5.00', '5000.0000', '150000.0000', '0.0000', '0.0000', '16500.0000', '166500.0000', 'N', 'US003', '2023-02-09 08:12:47', 'US003', '2023-02-09 08:14:25', 0);

--
-- Triggers `salesorder_detail`
--
DELIMITER $$
CREATE TRIGGER `salesorder_detail_afdel` AFTER DELETE ON `salesorder_detail` FOR EACH ROW BEGIN
	DELETE from items_invdetail where  	ritem_code = old.item_code and notrans = old.sales_orderno;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `salesorder_detail_afinsert` AFTER INSERT ON `salesorder_detail` FOR EACH ROW BEGIN
	DECLARE datetrans DATETIME;
	SET @datetrans = (SELECT sodate from salesorder where sosysno = new.rso_sysno);	
	INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty, rtrans, notrans, date_trans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (new.item_code,new.rdealer_repcode,-1*new.qty_demand,'SO',new.sales_orderno, @datetrans, '1', new.date_update,new.user_update,new.date_create,new.user_create, new.extdata_flag); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `salesorder_detail_afupdate` AFTER UPDATE ON `salesorder_detail` FOR EACH ROW BEGIN
	IF OLD.qty_demand != new.qty_demand  THEN 
		UPDATE items_invdetail SET qty = -1*new.qty_demand,alocation_flag = '1' where ritem_code = new.item_code and notrans = new.sales_orderno;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int NOT NULL,
  `kode_satuan` varchar(5) NOT NULL,
  `nama_satuan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `kode_satuan`, `nama_satuan`) VALUES
(1, 'PCS', 'PIECES'),
(2, 'KAN', 'KANTONG'),
(3, 'BTL', 'BOTOL'),
(4, 'KAR', 'KARTON'),
(5, 'SCT', 'SACHET'),
(6, 'LS', 'LUMSUM'),
(7, 'BOX', 'KOTAK/BOX'),
(8, 'DOZ', 'KARTON/DOOZ'),
(9, 'PAK', 'BUNGKUS/PACK'),
(10, 'LTR', 'LITER'),
(11, 'GLN', 'GALON'),
(12, 'LBR', 'LEMBAR'),
(13, 'RIM', 'RIM'),
(14, 'ROL', 'GULUNG/ROLL'),
(15, 'VIL', 'VIAL'),
(16, 'KIT', 'KIT');

-- --------------------------------------------------------

--
-- Table structure for table `setup_dealer`
--

CREATE TABLE `setup_dealer` (
  `dealer_id` int NOT NULL,
  `cabang_repcode` varchar(10) NOT NULL,
  `unit_repcode` varchar(10) NOT NULL,
  `dealer_repcode` varchar(10) NOT NULL,
  `dealer_repcode_desc` varchar(50) NOT NULL,
  `dealer_desc` varchar(100) NOT NULL,
  `dealer_address` varchar(300) NOT NULL,
  `dealer_status` varchar(2) NOT NULL DEFAULT 'CB',
  `dealer_alias` varchar(3) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `setup_dealer`
--

INSERT INTO `setup_dealer` (`dealer_id`, `cabang_repcode`, `unit_repcode`, `dealer_repcode`, `dealer_repcode_desc`, `dealer_desc`, `dealer_address`, `dealer_status`, `dealer_alias`, `date_create`, `date_update`) VALUES
(1, '01000', '00020', '01020', 'MARKAS PMI', 'MARKAS PMI<BR>KABUPATEN BADUNG', 'Jalan Raya Abianbase, Kapal, Mengwi, Badung, Telp (0361) 9006953', 'HO', 'MRS', '2022-03-27 08:31:19', '2023-02-01 13:39:00'),
(4, '11000', '00020', '11020', 'UTD PMI', 'UNIT TRANSFUSI DARAH<BR>PMI KABUPATEN BADUNG', 'Jalan Raya Abianbase, Kapal, Mengwi, Badung, Telp (0361) 9006953', 'HO', 'UTD', '2022-03-27 08:31:19', '2023-02-01 13:39:00');

-- --------------------------------------------------------

--
-- Table structure for table `setup_itemunit`
--

CREATE TABLE `setup_itemunit` (
  `item_unitid` int NOT NULL,
  `unit_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `unit_name` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setup_itemunit`
--

INSERT INTO `setup_itemunit` (`item_unitid`, `unit_code`, `unit_name`) VALUES
(1, 'PCS', ''),
(2, 'UNT', ''),
(3, 'PAK', ''),
(4, 'SET', ''),
(5, 'LTR', ''),
(6, 'BTL', ''),
(7, 'CAN', ''),
(8, 'TUB', ''),
(9, 'LBR', ''),
(10, 'CM', ''),
(11, 'ROL', ''),
(12, 'RIM', ''),
(13, 'MTR', ''),
(14, 'KLG', ''),
(15, 'KG', ''),
(16, 'JRN', ''),
(17, 'GLN', '');

-- --------------------------------------------------------

--
-- Table structure for table `setup_jasa`
--

CREATE TABLE `setup_jasa` (
  `id_setup_jasa` int NOT NULL,
  `ritem` int NOT NULL,
  `rtype` int NOT NULL,
  `working_time` decimal(2,2) NOT NULL,
  `working_price` decimal(12,2) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setup_jobtype`
--

CREATE TABLE `setup_jobtype` (
  `jobtype_id` int NOT NULL,
  `jobtype_code` char(3) NOT NULL,
  `jobtype_desc` varchar(150) NOT NULL,
  `user_create` varchar(10) NOT NULL,
  `user_update` varchar(10) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `setup_jobtype`
--

INSERT INTO `setup_jobtype` (`jobtype_id`, `jobtype_code`, `jobtype_desc`, `user_create`, `user_update`, `date_create`, `date_update`, `extdata_flag`) VALUES
(1, 'BR', 'Job Type For Body Repair', 'HMSI', 'HMSI', '2022-03-18 16:06:39', '2022-03-18 16:06:39', 1),
(2, 'CP', 'Job Type For Campaign', 'HMSI', 'HMSI', '2022-03-18 16:06:39', '2022-03-18 16:06:39', 1),
(3, 'CS', 'Job Type For Contract Service', 'HMSI', 'HMSI', '2022-03-18 16:06:39', '2022-03-18 16:06:39', 1),
(4, 'FSI', 'Free Service Inspection', 'HMSI', 'HMSI', '2022-03-18 16:06:39', '2022-03-18 16:06:39', 1),
(5, 'GR', 'Job Type For General Repair', 'HMSI', 'HMSI', '2022-03-18 16:06:39', '2022-03-18 16:06:39', 1),
(6, 'JPA', 'Job Type For JP Accessories', 'HMSI', 'HMSI', '2022-03-18 16:06:39', '2022-03-18 16:06:39', 1),
(7, 'M', 'Job Type For Marketing', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(8, 'PDI', 'Job Type For PDI', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(9, 'PM', 'Job Type For Periodical Maintenance', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(10, 'P', 'Job Type For Purchasing', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(11, 'RJ', 'Job Type For Robbing', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(12, 'TB', 'Job Type For Transfer To Body Repair', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(13, 'TG', 'Job Type For Transfer To General Repair', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(14, 'WH', 'Job Type For Warehousing', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1),
(15, 'WR', 'Job Type For Warranty ', 'HMSI', 'HMSI', '2022-03-18 16:06:40', '2022-03-18 16:06:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `setup_master`
--

CREATE TABLE `setup_master` (
  `id` varchar(30) NOT NULL,
  `kd_area` varchar(20) NOT NULL,
  `data` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `setup_master`
--

INSERT INTO `setup_master` (`id`, `kd_area`, `data`, `keterangan`, `date_create`) VALUES
('20200307084023', 'hncf_', '0', 'lokasi', '2020-03-07 00:00:00'),
('20200307084024', 'hncf_', 'Palang Merah Indonesia', 'nama', '2020-03-09 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `setup_ppn`
--

CREATE TABLE `setup_ppn` (
  `ppn_id` int NOT NULL,
  `ppn` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `setup_ppn`
--

INSERT INTO `setup_ppn` (`ppn_id`, `ppn`) VALUES
(1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `setup_topcode`
--

CREATE TABLE `setup_topcode` (
  `top_id` int NOT NULL,
  `top_code` varchar(5) NOT NULL,
  `jml_hari` int NOT NULL DEFAULT '1',
  `top_desc` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `setup_topcode`
--

INSERT INTO `setup_topcode` (`top_id`, `top_code`, `jml_hari`, `top_desc`) VALUES
(1, 'C00', 1, 'Cash on Delivery'),
(2, 'C07', 7, 'Credit 7 Days'),
(3, 'C120', 120, 'Credit 120 Days'),
(4, 'C14', 14, 'Credit 14 Days'),
(5, 'C180', 180, 'Credit 180 Days'),
(6, 'C21', 21, 'Credit 21 Days'),
(7, 'C30', 30, 'Credit 30 Days'),
(8, 'C42', 42, 'Credit 42 Days'),
(9, 'C45', 45, 'Credit 45 Days'),
(10, 'C60', 60, 'Credit 60 Days'),
(11, 'C90', 90, 'Credit 90 Days'),
(12, 'L12', 360, 'Leasing 12 bulan'),
(13, 'M12', 360, 'Installment 12 months'),
(14, 'M18', 540, 'Installment 18 Months'),
(15, 'M6', 180, 'Installment 6 months'),
(16, 'M6-30', 180, 'Installment 6 months ( per 30 days)');

-- --------------------------------------------------------

--
-- Table structure for table `setup_wostatus`
--

CREATE TABLE `setup_wostatus` (
  `wostatus_id` int NOT NULL,
  `wostatus_code` char(2) NOT NULL,
  `wostatus_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `setup_wostatus`
--

INSERT INTO `setup_wostatus` (`wostatus_id`, `wostatus_code`, `wostatus_desc`) VALUES
(1, '03', 'On Going'),
(2, '10', 'QC Pass'),
(3, '15', 'Ready'),
(4, '20', 'Accept'),
(5, '30', 'Reject'),
(6, '40', 'Booking'),
(7, '50', 'Work Order'),
(8, '60', 'Closed');

-- --------------------------------------------------------

--
-- Table structure for table `soinvoice`
--

CREATE TABLE `soinvoice` (
  `soinv_id` int NOT NULL,
  `invsysno` int NOT NULL DEFAULT '0',
  `invno` varchar(25) DEFAULT NULL,
  `refdocno` varchar(25) DEFAULT NULL,
  `invdate` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `invdue_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `sodate` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `rsales_orderno` varchar(25) DEFAULT NULL,
  `sosalesman` varchar(35) DEFAULT NULL,
  `sosalesman_empno` varchar(35) DEFAULT NULL,
  `status_code` char(2) DEFAULT NULL,
  `status_desc` varchar(20) DEFAULT NULL,
  `tax_invdate` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `tax_invno` varchar(25) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(500) DEFAULT NULL,
  `address1` varchar(40) DEFAULT NULL,
  `address2` varchar(40) DEFAULT NULL,
  `address3` varchar(40) DEFAULT NULL,
  `npwpno` varchar(30) DEFAULT NULL,
  `billto` varchar(50) DEFAULT NULL,
  `bill_address1` varchar(100) DEFAULT NULL,
  `bill_address2` varchar(100) DEFAULT NULL,
  `bill_address3` varchar(100) DEFAULT NULL,
  `billname` varchar(100) DEFAULT NULL,
  `po_customer` varchar(25) DEFAULT NULL,
  `po_docno` varchar(25) DEFAULT NULL,
  `packinglist_no` varchar(25) DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  `payment_typedesc` varchar(50) DEFAULT NULL,
  `top` varchar(5) DEFAULT NULL,
  `cpc_desc` varchar(100) DEFAULT NULL,
  `grandtotal_beforevat` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `grandtotal_vat` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `grandtotal_aftervat` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `cash` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `credit` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `dealer_repcode` varchar(10) DEFAULT NULL,
  `trx_type` varchar(10) DEFAULT NULL,
  `transaction_typedesc` varchar(256) DEFAULT NULL,
  `vat` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `vatno` varchar(25) DEFAULT NULL,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `soinvoice`
--

INSERT INTO `soinvoice` (`soinv_id`, `invsysno`, `invno`, `refdocno`, `invdate`, `invdue_date`, `sodate`, `rsales_orderno`, `sosalesman`, `sosalesman_empno`, `status_code`, `status_desc`, `tax_invdate`, `tax_invno`, `customer_code`, `customer_name`, `address1`, `address2`, `address3`, `npwpno`, `billto`, `bill_address1`, `bill_address2`, `bill_address3`, `billname`, `po_customer`, `po_docno`, `packinglist_no`, `payment_type`, `payment_typedesc`, `top`, `cpc_desc`, `grandtotal_beforevat`, `grandtotal_vat`, `grandtotal_aftervat`, `cash`, `credit`, `dealer_repcode`, `trx_type`, `transaction_typedesc`, `vat`, `vatno`, `user_create`, `user_update`, `void_flag`, `extdata_flag`) VALUES
(1827, 996000001, 'PMI-SV-10-16-00001', 'PMI-SO-10-16-00002', '2022-10-16 00:00:00', '2022-11-16 00:00:00', '2022-10-16 00:00:00', 'PMI-SO-10-16-00002', 'CSBI Sales Person', 'CSB00001', '20', 'Approved', '1900-01-01 00:00:00', NULL, 'RSDM', 'Rumah Sakit Daerah Mangusada', NULL, NULL, NULL, NULL, 'RSDM', NULL, NULL, NULL, 'Rumah Sakit Daerah Mangusada', NULL, NULL, NULL, 'OT', 'OTHER', 'C30', NULL, '2000.0000', '220.0000', '2220.0000', '0.0000', '0.0000', '01020', 'SU01', 'Direct', '220.0000', NULL, 'US002', 'US002', 0, 0),
(1828, 996000002, 'PMI-SV-02-09-00001', 'PMI-SO-02-09-00001', '2023-02-09 00:00:00', '2023-03-12 00:00:00', '2023-02-09 00:00:00', 'PMI-SO-02-09-00001', 'CSBI Sales Person', 'CSB00001', '20', 'Approved', '1900-01-01 00:00:00', NULL, 'RSDM', 'Rumah Sakit Daerah Mangusada', NULL, NULL, NULL, NULL, 'RSDM', NULL, NULL, NULL, 'Rumah Sakit Daerah Mangusada', NULL, NULL, NULL, 'OT', 'OTHER', 'C30', NULL, '676430.0000', '74407.3000', '750837.3000', '750837.3000', '0.0000', '01020', '41100', 'PENERIMAAN HIBAH PEMERINTAH', '74407.3000', NULL, 'US003', 'US003', 0, 0);

--
-- Triggers `soinvoice`
--
DELIMITER $$
CREATE TRIGGER `soinvoice_afdell` AFTER DELETE ON `soinvoice` FOR EACH ROW BEGIN
	DELETE from soinvoice_detail where rinv_sysno = OLD.invsysno;
	DELETE from general_ledger where invoice_no = OLD.invsysno;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `soinvoice_afinsert` AFTER INSERT ON `soinvoice` FOR EACH ROW BEGIN
	DECLARE bulantahun varchar(6);
	DECLARE gjid INTEGER(6);
	DECLARE gjno varchar(12);
	DECLARE location varchar(3);
	DECLARE r_anggaran INTEGER(5);
	DECLARE ppn_percent integer(5);
	
	DECLARE acc_ppn integer(5);
	DECLARE acc_debet INTEGER(5);
	DECLARE acc_pot INTEGER(5);
	
	DECLARE total_trans decimal (10,2);
	DECLARE tot_pot decimal (10,2);
	DECLARE total_ppn decimal (10,2);
	DECLARE total_grand DECIMAL(10,2);
	
	DECLARE done INT DEFAULT FALSE;
    DECLARE a,c,e INT;
    DECLARE b,d,f DECIMAL;
    DECLARE cur CURSOR FOR SELECT b.racc_penjualan,sum((a.qty*a.unit_price)-a.discount) subtot FROM soinvoice_detail a left join items b on a.item_code = b.item_code where a.rinv_sysno = NEW.invsysno group by b.racc_penjualan;
	DECLARE cur1 CURSOR FOR SELECT b.racc_hpp,sum(a.qty*a.hpp) subtot FROM soinvoice_detail a left join items b on a.item_code = b.item_code where a.rinv_sysno = NEW.invsysno group by b.racc_hpp;
    DECLARE cur2 CURSOR FOR SELECT b.racc_persediaan,sum(a.qty*a.hpp) subtot FROM soinvoice_detail a left join items b on a.item_code = b.item_code where a.rinv_sysno = NEW.invsysno group by b.racc_persediaan;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
		
	SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);
	SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);
	SET @gjid = (SELECT cast(COALESCE(RIGHT(max(notrans),6),0) AS UNSIGNED)+1 as maxno FROM general_ledger where notrans like concat(@location,'.SL%'));
	SET @gjno = (SELECT concat(@location,'.SL',RIGHT(concat('000000',@gjid),6)) as maxno);
	SET @acc_ppn = (SELECT acc_id FROM link_acc WHERE link = 'ppn_masukan' limit 1);
	SET @acc_debet = (SELECT acc_id FROM link_acc WHERE link = 'piutang_pendapatan' limit 1);
	SET @r_anggaran = (SELECT id_rekening FROM rekening_anggaran WHERE nomor_rekening = '99999');
	SET @acc_pot = (SELECT acc_id FROM link_acc WHERE link = 'potongan_penjualan');
	SET @total_trans = (SELECT coalesce(ROUND(sum(qty*unit_price),2),0) afdisc from soinvoice_detail a where a.rinv_sysno = NEW.invsysno);
	
	SET @tot_pot = (SELECT coalesce(ROUND(sum(discount),2),0) afdisc from soinvoice_detail a where a.rinv_sysno = NEW.invsysno);
	SET @grantotal = (SELECT coalesce(ROUND(sum((qty*unit_price)-discount),2),0) afdisc from soinvoice_detail a where a.rinv_sysno = NEW.invsysno);
	SET @ppn_percent = (SELECT 11);
	SET @total_ppn = (SELECT ROUND(@grantotal*@ppn_percent/100,2));
	
	INSERT INTO messages(message) values(concat(@gjno,' ',NEW.invno,' ',NEW.invsysno,' ',@total_trans));
	
	INSERT INTO general_ledger(notrans,order_no,invoice_no,r_anggaran,tabel_trans,tgl,total_trans,memo,jurnal,rlocation,comp_loc,us_create,us_update) VALUES(@gjno,NEW.invno,NEW.invsysno,@r_anggaran,'soinvoice',NEW.invdate,@total_trans,'Sales Invoice','JK',NEW.dealer_repcode,'comp_loc',NEW.user_create,NEW.user_update);
		
	OPEN cur;
    OPEN cur1;
    OPEN cur2;
        ins_loop: LOOP
            FETCH cur INTO a,b;
            FETCH cur1 INTO c,d;
            FETCH cur2 INTO e,f;
            IF done THEN
                LEAVE ins_loop;
            END IF;
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,c,d,'0','HPP');
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,e,'0',f,'Persediaan');
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,a,'0',b,'Penjualan');
        END LOOP;
    CLOSE cur;
    CLOSE cur1;
    CLOSE cur2;	
	INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_debet,@grantotal+@total_ppn,'0','Total Transaksi');
	IF @total_ppn > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_ppn,'0',@total_ppn,'PPN Masukan');
	END IF;
	IF @tot_pot > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pot,'0',@tot_pot,'Potongan Jual');
	END IF;
	IF NEW.extdata_flag = 0 THEN     	
        SET @bulantahun = DATE_FORMAT(NEW.invdate, "%Y%m");
    	INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'SL',NEW.invno);
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `soinvoice_afupdate` AFTER UPDATE ON `soinvoice` FOR EACH ROW BEGIN
	DECLARE bulantahun varchar(6);
    DECLARE gjid INTEGER(6);
    DECLARE gjno varchar(12);
    DECLARE location varchar(3);
    DECLARE r_anggaran INTEGER(5);
    DECLARE ppn_percent integer(5);

	DECLARE acc_ppn integer(5);
    DECLARE acc_debet INTEGER(5);
    DECLARE acc_pot INTEGER(5);

    DECLARE total_trans decimal (10,2);
    DECLARE tot_pot decimal (10,2);
    DECLARE total_ppn decimal (10,2);
    DECLARE total_grand DECIMAL(10,2);

    DECLARE done INT DEFAULT FALSE;
    DECLARE a,c,e INT;
    DECLARE b,d,f DECIMAL;
    DECLARE cur CURSOR FOR SELECT b.racc_penjualan,sum((a.qty*a.unit_price)-a.discount) subtot FROM soinvoice_detail a left join items b on a.item_code = b.item_code where a.rinv_sysno = NEW.invsysno group by b.racc_penjualan;
    DECLARE cur1 CURSOR FOR SELECT b.racc_hpp,sum(a.qty*a.hpp) subtot FROM soinvoice_detail a left join items b on a.item_code = b.item_code where a.rinv_sysno = NEW.invsysno group by b.racc_hpp;
    DECLARE cur2 CURSOR FOR SELECT b.racc_persediaan,sum(a.qty*a.hpp) subtot FROM soinvoice_detail a left join items b on a.item_code = b.item_code where a.rinv_sysno = NEW.invsysno group by b.racc_persediaan;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
	IF NEW.void_flag = 1 THEN
		UPDATE soinvoice_detail SET void_flag = '1' WHERE rinv_sysno = OLD.invsysno;
        DELETE from general_ledger where invoice_no = OLD.invsysno and notrans not like '%GJ%';
	ELSEIF NEW.void_flag = 0 THEN 
		UPDATE soinvoice_detail SET void_flag = '0' WHERE rinv_sysno = OLD.invsysno;
        IF OLD.void_flag = NEW.void_flag THEN
        	SET @gjno = (SELECT notrans FROM general_ledger where invoice_no = OLD.invsysno and notrans not like '%GJ%');
        	DELETE from general_ledger where invoice_no = OLD.invsysno and notrans not like '%GJ%';
        END IF;
        SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);
        SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);        
        SET @acc_ppn = (SELECT acc_id FROM link_acc WHERE link = 'ppn_masukan' limit 1);
        SET @acc_debet = (SELECT acc_id FROM link_acc WHERE link = 'piutang_pendapatan' limit 1);
        SET @r_anggaran = (SELECT id_rekening FROM rekening_anggaran WHERE nomor_rekening = '99999');
        SET @acc_pot = (SELECT acc_id FROM link_acc WHERE link = 'potongan_penjualan');
        SET @total_trans = (SELECT coalesce(ROUND(sum(qty*unit_price),2),0) afdisc from soinvoice_detail a where a.rinv_sysno = NEW.invsysno);

        SET @tot_pot = (SELECT coalesce(ROUND(sum(discount),2),0) afdisc from soinvoice_detail a where a.rinv_sysno = NEW.invsysno);
        SET @grantotal = (SELECT coalesce(ROUND(sum((qty*unit_price)-discount),2),0) afdisc from soinvoice_detail a where a.rinv_sysno = NEW.invsysno);
        SET @ppn_percent = (SELECT 11);
        SET @total_ppn = (SELECT ROUND(@grantotal*@ppn_percent/100,2));
       
        INSERT INTO general_ledger(notrans,order_no,invoice_no,r_anggaran,tabel_trans,tgl,total_trans,memo,jurnal,rlocation,comp_loc,us_create,us_update) VALUES(@gjno,NEW.invno,NEW.invsysno,@r_anggaran,'soinvoice',NEW.invdate,@total_trans,'Sales Invoice','JK',NEW.dealer_repcode,'comp_loc',NEW.user_create,NEW.user_update);

        OPEN cur;
        OPEN cur1;
        OPEN cur2;
            ins_loop: LOOP
                FETCH cur INTO a,b;
                FETCH cur1 INTO c,d;
                FETCH cur2 INTO e,f;
                IF done THEN
                    LEAVE ins_loop;
                END IF;
                INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,c,d,'0','HPP');
                INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,e,'0',f,'Persediaan');
                INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,a,'0',b,'Penjualan');
            END LOOP;
        CLOSE cur;
        CLOSE cur1;
        CLOSE cur2;	
        INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_debet,@grantotal+@total_ppn,'0','Total Transaksi');
        IF @total_ppn > 0 THEN 
            INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_ppn,'0',@total_ppn,'PPN Masukan');
        END IF;
        IF @tot_pot > 0 THEN 
            INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@acc_pot,'0',@tot_pot,'Potongan Jual');
        END IF;
        IF NEW.extdata_flag = 0 THEN     	
            SET @bulantahun = DATE_FORMAT(NEW.invdate, "%Y%m");
            INSERT into docno(bulantahun,rtrans,docno) values(@bulantahun,'SL',NEW.invno);
        END IF;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `soinvoice_detail`
--

CREATE TABLE `soinvoice_detail` (
  `soinvdetail_id` int NOT NULL,
  `unique_detailsoinv` varchar(65) DEFAULT NULL,
  `rinv_sysno` int DEFAULT NULL,
  `invno` varchar(25) DEFAULT NULL,
  `sl_invdate` datetime DEFAULT NULL,
  `sono` varchar(25) DEFAULT NULL,
  `rdealer_repcode` varchar(10) DEFAULT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `qty` decimal(17,2) DEFAULT NULL,
  `unit_price` decimal(17,4) DEFAULT NULL,
  `price_beforetax` decimal(17,4) DEFAULT NULL,
  `discount` decimal(17,4) DEFAULT NULL COMMENT 'sudah x qty',
  `hpp` decimal(17,4) DEFAULT NULL,
  `gross_profit` decimal(17,4) DEFAULT NULL,
  `subtotal` decimal(17,4) DEFAULT NULL,
  `user_create` varchar(10) DEFAULT NULL,
  `user_update` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `soinvoice_detail`
--

INSERT INTO `soinvoice_detail` (`soinvdetail_id`, `unique_detailsoinv`, `rinv_sysno`, `invno`, `sl_invdate`, `sono`, `rdealer_repcode`, `item_code`, `qty`, `unit_price`, `price_beforetax`, `discount`, `hpp`, `gross_profit`, `subtotal`, `user_create`, `user_update`, `date_create`, `date_update`, `void_flag`, `extdata_flag`) VALUES
(3619, '996000001BJ000002', 996000001, 'PMI-SV-10-16-00001', NULL, 'PMI-SO-10-16-00002', '01020', 'BJ000002', '1.00', '2000.0000', '2000.0000', '0.0000', '1000.0000', '1000.0000', NULL, 'US002', 'US002', '2022-10-16 20:08:33', '2023-02-01 13:39:00', 0, 0),
(3620, '996000002OBT000001', 996000002, 'PMI-SV-02-09-00001', '2023-02-09 00:00:00', 'PMI-SO-02-09-00001', '01020', 'OBT000001', '5.00', '130286.0000', '651430.0000', '0.0000', '651430.0000', '0.0000', NULL, 'US003', 'US003', '2023-02-09 08:14:25', '2023-02-09 08:14:25', 0, 0),
(3621, '996000002BJ000001', 996000002, 'PMI-SV-02-09-00001', '2023-02-09 00:00:00', 'PMI-SO-02-09-00001', '01020', 'BJ000001', '5.00', '5000.0000', '25000.0000', '0.0000', '25000.0000', '0.0000', NULL, 'US003', 'US003', '2023-02-09 08:14:25', '2023-02-09 08:14:25', 0, 0);

--
-- Triggers `soinvoice_detail`
--
DELIMITER $$
CREATE TRIGGER `soinvoice_detail_afdelete` AFTER DELETE ON `soinvoice_detail` FOR EACH ROW BEGIN
	DECLARE supplyb4 DECIMAL(10,2);
	DECLARE supplyAf DECIMAL(10,2);
	SET @supplyb4 = (SELECT qty_supply from salesorder_detail where item_code = old.item_code and sales_orderno = old.sono);
	DELETE from items_invdetail where ritem_code = old.item_code and notrans = old.invno;
	SET @supplyAf = @supplyb4 - abs(old.qty);
	UPDATE salesorder_detail SET qty_supply = @supplyAf where item_code = old.item_code and sales_orderno = old.sono;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `soinvoice_detail_afinsert` AFTER INSERT ON `soinvoice_detail` FOR EACH ROW BEGIN
	DECLARE supplyb4 DECIMAL(10,2);
	DECLARE supplyAf DECIMAL(10,2);
	SET @supplyb4 = (SELECT qty_supply from salesorder_detail where item_code = new.item_code and sales_orderno = new.sono);
	INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty, cost, rtrans, date_trans, notrans,invtrans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (new.item_code,new.rdealer_repcode,-1*new.qty,new.hpp,'SI',new.sl_invdate,new.sono,new.invno, '0', new.date_update,new.user_update,new.date_create,new.user_create, new.extdata_flag);
	SET @supplyAf = @supplyb4 + abs(new.qty);
	UPDATE salesorder_detail SET qty_supply = @supplyAf where item_code = new.item_code and sales_orderno = new.sono;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `soinvoice_detail_afupdate` AFTER UPDATE ON `soinvoice_detail` FOR EACH ROW BEGIN
	DECLARE supplyb4 DECIMAL(10,2);
	DECLARE supplyAf DECIMAL(10,2);
	DECLARE datetrans DATETIME;
	SET @supplyb4 = (SELECT qty_supply from salesorder_detail where item_code = new.item_code and sales_orderno = new.sono);
	IF OLD.qty  != new.qty  THEN 
		UPDATE items_invdetail SET qty = -1*new.qty,alocation_flag = '0' where ritem_code = new.item_code and notrans = new.invno;
		SET @supplyAf = @supplyb4 - abs(old.qty) + abs(new.qty);
		UPDATE salesorder_detail SET qty_supply = @supplyAf where item_code = new.item_code and sales_orderno = new.sono;
	END IF;
	IF NEW.void_flag = 1 THEN
		DELETE from items_invdetail where  ritem_code = old.item_code and notrans = old.invno;
	ELSEIF NEW.void_flag = 0 THEN
    	IF NEW.void_flag = OLD.void_flag THEN
        	DELETE from items_invdetail where  ritem_code = old.item_code and notrans = old.invno;
        END IF;
		INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty,cost, rtrans, notrans,date_trans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (OLD.item_code,OLD.rdealer_repcode,-1*OLD.qty,OLD.hpp,'SI',OLD.invno,OLD.sl_invdate, '0', OLD.date_update,OLD.user_update,OLD.date_create,OLD.user_create, OLD.extdata_flag);
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sumber_anggaran`
--

CREATE TABLE `sumber_anggaran` (
  `id_sumber` int NOT NULL,
  `kode_sumber` int NOT NULL,
  `nama_sumber` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sumber_anggaran`
--

INSERT INTO `sumber_anggaran` (`id_sumber`, `kode_sumber`, `nama_sumber`) VALUES
(1, 0, 'Dana Silpa'),
(2, 1, 'Dana Hibah');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL,
  `supplier_code` char(15) NOT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `supplier_name` varchar(50) DEFAULT NULL,
  `supplier_address1` varchar(100) DEFAULT NULL,
  `supplier_address2` varchar(100) DEFAULT NULL,
  `supplier_city1` varchar(100) DEFAULT NULL,
  `supplier_city2` varchar(100) DEFAULT NULL,
  `code_pos` varchar(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone1` varchar(40) DEFAULT NULL,
  `phone2` varchar(40) DEFAULT NULL,
  `top` decimal(10,0) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `supplier_code`, `contact_person`, `supplier_name`, `supplier_address1`, `supplier_address2`, `supplier_city1`, `supplier_city2`, `code_pos`, `email`, `phone1`, `phone2`, `top`, `extdata_flag`, `date_create`, `date_update`) VALUES
(1887, 'SA1800012', 'ACE HARDWARE', 'ACE HARDWARE', 'CIBUBUR', '', '', '', '', '', ',', '', NULL, 1, '2018-10-30 16:09:44', '2018-10-30 16:09:44'),
(5453, 'SP000003', 'test', 'PT Berliando Mitra Abadi', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '0', 0, '2022-08-20 04:05:34', '2022-08-20 04:05:34'),
(5454, 'SP000004', 'tes', 'PT Mensa Bina Sukses', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:14:26', '2022-08-31 13:14:26'),
(5455, 'SP000005', '', 'PT Abimata Manunggal', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:15:10', '2022-08-31 13:15:10'),
(5456, 'SP000006', '', 'PT Tristanisa Global Indonesia', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:16:04', '2022-08-31 13:16:04'),
(5457, 'SP000007', '', 'PT Nusa Tri Utama', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:16:38', '2022-08-31 13:16:38'),
(5458, 'SP000008', '', 'UDD PMI Provinsi Bali', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:17:08', '2022-08-31 13:17:08'),
(5459, 'SP000009', '', 'Apotik Familia', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:17:23', '2022-08-31 13:17:23'),
(5460, 'SP000010', '', 'UDD PMI Tabanan', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:17:36', '2022-08-31 13:17:36'),
(5461, 'SP000011', '', 'UDD PMI Denpasar', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:17:49', '2022-08-31 13:17:49'),
(5462, 'SP000012', '', 'UDD PMI Gianyar', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:17:59', '2022-08-31 13:17:59'),
(5463, 'SP000013', '', 'UD Kawan', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:18:11', '2022-08-31 13:18:11'),
(5464, 'SP000014', '', 'WR Eka Putra', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:18:25', '2022-08-31 13:18:25'),
(5465, 'SP000015', '', 'WR Bu Si Luh', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:18:36', '2022-08-31 13:18:36'),
(5466, 'SP000016', '', 'Percetakan Anugrah Sri Jaya', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:18:57', '2022-08-31 13:18:57'),
(5467, 'SP000017', '', 'Chrisna Yoga Motor', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:19:22', '2022-08-31 13:19:22'),
(5468, 'SP000018', '', 'PT Prima Alkesindo Nusantara', '', '', '', '', '', '', '', '', '0', 0, '2022-08-31 13:19:46', '2022-08-31 13:19:46'),
(5469, 'SP000019', 'ASFDA', 'KIMIA FARMA', 'asdfasfasd', 'asdfasdf', 'asdfasdf', 'asdfasd', '12313', 'testemail_subscribe@gmail.com', '23424', '31231', '10', 0, '2022-10-17 04:01:38', '2022-10-17 04:01:38'),
(5470, 'SP000020', '00000', 'UD Kawan', '', '', 'badung', '', '', '', '081000', '', '0', 0, '2023-01-02 13:11:09', '2023-01-02 13:11:09'),
(5471, 'SP000021', '', 'UDD PMI Badung', '', '', '', '', '', '', '', '', '0', 0, '2023-01-02 13:16:01', '2023-01-02 13:16:01'),
(5472, 'SP000022', '', 'Sentralindo', '', '', '', '', '', '', '', '', '0', 0, '2023-01-02 13:28:29', '2023-01-02 13:28:29'),
(5473, 'SP000023', '', 'PT Pos', '', '', '', '', '', '', '', '', '0', 0, '2023-01-02 13:41:17', '2023-01-02 13:41:17'),
(5474, 'SP000024', '', 'PT Prapen Ananda Dewata SPBU 5480332', 'Lukluk', '', 'Mengwi', '', '', '', '', '', '0', 0, '2023-01-02 13:44:16', '2023-01-02 13:44:16'),
(5475, 'SP000025', '-', 'Apotik Mita Farma', 'Jl Raya Abian Base', '', 'Mengwi', '', '', '0', '0', '', '0', 0, '2023-01-30 09:12:52', '2023-01-30 09:12:52'),
(5476, 'SP000026', '-', 'Toko/Warung', '-', '', '-', '', '0', '', '0', '', '0', 0, '2023-01-30 09:50:59', '2023-01-30 09:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `temp_workorder`
--

CREATE TABLE `temp_workorder` (
  `tempwo_id` int NOT NULL,
  `wosysno` int NOT NULL DEFAULT '0',
  `wodocno` varchar(25) DEFAULT NULL,
  `wodate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wostatus` char(2) DEFAULT NULL,
  `wostatus_desc` varchar(25) DEFAULT NULL,
  `customer_code` varchar(50) DEFAULT NULL,
  `customer_name` varchar(500) DEFAULT NULL,
  `address1` varchar(40) DEFAULT NULL,
  `address2` varchar(40) DEFAULT NULL,
  `address3` varchar(40) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `vehicle_chassisno` varchar(50) DEFAULT NULL,
  `vehicle_engineno` varchar(50) DEFAULT NULL,
  `stnk` varchar(10) DEFAULT NULL,
  `tnkb` varchar(10) DEFAULT NULL,
  `licenseno` varchar(50) DEFAULT NULL,
  `model_variant` varchar(35) DEFAULT NULL,
  `arrival_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `colour_code` varchar(6) DEFAULT NULL,
  `colour_desc` varchar(35) DEFAULT NULL,
  `company_code` varchar(10) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `dealer_repcode` varchar(10) DEFAULT NULL,
  `dealer_repcodedesc` varchar(50) DEFAULT NULL,
  `emergency_type` varchar(5) DEFAULT NULL,
  `jobtype` varchar(10) DEFAULT NULL,
  `jobtype_desc` varchar(100) DEFAULT NULL,
  `service_advisor` varchar(40) DEFAULT NULL,
  `service_cartype` varchar(3) DEFAULT NULL,
  `service_category` varchar(100) DEFAULT NULL,
  `service_categorydesc` varchar(100) DEFAULT NULL,
  `service_code` varchar(100) DEFAULT NULL,
  `service_codedesc` varchar(100) DEFAULT NULL,
  `service_site` varchar(100) DEFAULT NULL,
  `service_type` varchar(10) DEFAULT NULL,
  `service_typedesc` varchar(100) DEFAULT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `qcpass_date` datetime DEFAULT NULL,
  `leave_time` datetime DEFAULT NULL,
  `reason` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `remark_outstanding` varchar(256) DEFAULT NULL,
  `transaction_type` varchar(10) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_workorder_detail`
--

CREATE TABLE `temp_workorder_detail` (
  `tempwo_detail_id` int NOT NULL,
  `unique_detailwo` varchar(65) NOT NULL,
  `rwosysno` int NOT NULL DEFAULT '0',
  `wodocno` varchar(25) NOT NULL,
  `invdocno` varchar(25) DEFAULT NULL,
  `rdealer_repcode` varchar(10) NOT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `opr_flag` tinyint(1) NOT NULL DEFAULT '0',
  `item_name` varchar(100) DEFAULT NULL,
  `item_qty` decimal(10,2) DEFAULT NULL,
  `item_supply` decimal(10,2) NOT NULL DEFAULT '0.00',
  `item_price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `hpp` double(17,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `amount_discount` decimal(17,4) NOT NULL DEFAULT '0.0000' COMMENT 'belum x qty',
  `subtotal` decimal(17,4) NOT NULL DEFAULT '0.0000',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) NOT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) NOT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `temp_workorder_detail`
--
DELIMITER $$
CREATE TRIGGER `workorder_detail_afdel` AFTER DELETE ON `temp_workorder_detail` FOR EACH ROW BEGIN
DECLARE vnotrans varchar(25);
	IF old.opr_flag = '0' THEN
		SET @vnotrans = old.wodocno;
		DELETE from items_invdetail where ritem_code = old.item_code and notrans = @vnotrans;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `workorder_detail_afinsert` AFTER INSERT ON `temp_workorder_detail` FOR EACH ROW BEGIN
	DECLARE datetrans DATETIME;
	SET @datetrans = (SELECT wodate from workorder where wosysno = NEW.rwosysno);
	IF new.opr_flag = '0' THEN
        INSERT INTO items_invdetail (ritem_code,rdealer_repcode , qty, rtrans, notrans,date_trans, alocation_flag, date_update, user_update, date_create, user_create, extdata_flag) VALUES (new.item_code,new.rdealer_repcode,-1*new.item_supply,'WO',new.wodocno,@datetrans, '1', new.date_update,new.user_update,new.date_create,new.user_create, new.extdata_flag); 
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `workorder_detail_afupdate` AFTER UPDATE ON `temp_workorder_detail` FOR EACH ROW BEGIN
	IF new.opr_flag = '0' THEN
		IF OLD.item_supply <> new.item_supply THEN 
			IF old.invdocno <> new.invdocno THEN 
				IF new.invdocno IS NULL OR new.invdocno = '' THEN
					UPDATE items_invdetail SET qty = -1*new.item_supply,alocation_flag = '1' where ritem_code = new.item_code and notrans = new.wodocno;
				ELSE
					UPDATE items_invdetail SET qty = -1*new.item_supply,invtrans = new.invdocno,alocation_flag = '0' where ritem_code = new.item_code and notrans = new.wodocno;
				END IF;
			ELSE
				UPDATE items_invdetail SET qty = -1*new.item_supply where ritem_code = new.item_code and notrans = new.wodocno;
			END IF;
		ELSE
			IF old.invdocno <> new.invdocno THEN
				UPDATE items_invdetail SET alocation_flag = '0',invtrans = new.invdocno where ritem_code = new.item_code and notrans = new.wodocno;
			END IF;
		END IF;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_level`
--

CREATE TABLE `user_level` (
  `jabatan_id` int NOT NULL,
  `kode_jabatan` varchar(5) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_level`
--

INSERT INTO `user_level` (`jabatan_id`, `kode_jabatan`, `jabatan`, `level`) VALUES
(2, 'pos01', 'Director', '18'),
(3, 'pos02', 'Branch Manager', '17'),
(4, 'pos03', 'General Manager', '16'),
(5, 'pos04', 'Aftersales Service Manager', '15'),
(6, 'pos05', 'Hoyu Manager', '15'),
(7, 'pos06', 'Accounting & Finance Officer', '14'),
(8, 'pos07', 'HR Officer', '14'),
(9, 'pos08', 'Customers Care Officer', '14'),
(10, 'pos09', 'Customer Relationship Officer', '14'),
(11, 'pos10', 'Sales Support Officer', '14'),
(12, 'pos11', 'Government Sales Officer', '14'),
(13, 'pos12', 'Inventory Coordinator', '13'),
(14, 'pos13', 'Spare Part Head', '13'),
(15, 'pos14', 'Spare Parts Sales Coordinator', '12'),
(16, 'pos15', 'Service Advisor', '11'),
(17, 'pos16', 'Field Advisor', '11'),
(18, 'pos17', 'Sales Admin', '10'),
(19, 'pos18', 'Service Admin', '10'),
(20, 'pos19', 'Foreman', '10'),
(21, 'pos20', 'Service Head', '10'),
(22, 'pos21', 'Cashier', '9'),
(23, 'pos22', 'Spare Parts Fleet Salesman', '8'),
(24, 'pos23', 'Sales Representative', '7'),
(25, 'pos24', 'Sales SPV', '6'),
(26, 'pos25', 'Sales Counter', '5'),
(27, 'pos26', 'Spare Part Counter Salesman', '4'),
(28, 'pos27', 'Warehouse staff', '3'),
(29, 'pos28', 'Mechanic', '2'),
(30, 'pos29', 'Partshop Salesman', '1'),
(31, 'pos00', 'Super Admin', '30'),
(32, 'po000', 'Programmer', '99');

-- --------------------------------------------------------

--
-- Table structure for table `woinvoice`
--

CREATE TABLE `woinvoice` (
  `woinv_id` int NOT NULL,
  `invsysno` int DEFAULT NULL,
  `invdocno` varchar(25) DEFAULT NULL,
  `dealer_repcode` varchar(10) NOT NULL,
  `inv_date` datetime DEFAULT NULL,
  `inv_duedate` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `billto` varchar(50) DEFAULT NULL,
  `bill_name` varchar(100) DEFAULT NULL,
  `bill_address1` varchar(100) DEFAULT NULL,
  `bill_address2` varchar(100) DEFAULT NULL,
  `bill_address3` varchar(100) DEFAULT NULL,
  `top` varchar(5) DEFAULT NULL,
  `npwp` varchar(50) DEFAULT NULL,
  `tax_invdate` datetime DEFAULT NULL,
  `tax_invdocno` varchar(25) DEFAULT NULL,
  `ref_docno` varchar(25) DEFAULT NULL,
  `wono` varchar(25) DEFAULT NULL,
  `trx_type` varchar(10) DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  `profit_centercode` varchar(5) DEFAULT NULL,
  `profit_centerdesc` varchar(50) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `recommendation` varchar(100) DEFAULT NULL,
  `void_flag` tinyint(1) NOT NULL DEFAULT '0',
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `woinvoice`
--
DELIMITER $$
CREATE TRIGGER `woinvoice_afinsert` AFTER INSERT ON `woinvoice` FOR EACH ROW BEGIN 
	DECLARE gjno varchar(12);
	DECLARE location varchar(3);
	DECLARE rowori integer(5);
	DECLARE rowrr integer(5);
	DECLARE rowop integer(5);
	DECLARE ppn_percent integer(5);
	DECLARE ppn integer(5);
	
	DECLARE totaltrans decimal (10,2);
	
	DECLARE total_op decimal (10,2);
    DECLARE total_spori decimal (10,2);
	DECLARE total_sprr decimal (10,2);
	
	DECLARE total_hppori decimal (10,2);
	DECLARE total_hpprr decimal (10,2);
	DECLARE grantotal decimal(10,2);
	DECLARE total_ppn decimal (10,2);
	DECLARE total_ppn_ori decimal (10,2);
	DECLARE total_ppn_rr decimal (10,2);
	DECLARE total_ppn_op decimal (10,2);
	
	DECLARE tot_piuori decimal (10,2);
	DECLARE tot_piuori_b4ppn decimal (10,2);
	DECLARE tot_piurr decimal (10,2);
	DECLARE tot_piurr_b4ppn decimal (10,2);
	DECLARE tot_piuop decimal (10,2);
	
	DECLARE tot_potori decimal (10,2);
	DECLARE tot_potrr decimal (10,2);
	
	DECLARE penjualan_spori integer(5);
	DECLARE penjualan_sprr integer(5);
	DECLARE pendapatan_service integer(5);
	
	DECLARE piutang_spori integer(5);
	DECLARE piutang_sprr integer(5);
	DECLARE piutang_service integer(5);
	
	DECLARE pot_spori integer(5);
	DECLARE pot_sprr integer(5);
	
	DECLARE hpp_spori integer(5);
	DECLARE hpp_sprr integer(5);
	
	DECLARE persediaan_spori integer(5);
	DECLARE persediaan_sprr integer(5);
	
	SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = NEW.dealer_repcode);
	SET @gjno = (SELECT concat(@location,'.WO',RIGHT(concat('000000',cast(COALESCE(RIGHT(max(notrans),6),0) AS UNSIGNED)+1),6)) maxno FROM general_ledger where notrans like concat(@location,'.WO%'));
	SET @penjualan_spori = (SELECT acc_id FROM link_acc WHERE link = 'penjualan_spori');
	SET @penjualan_sprr = (SELECT acc_id FROM link_acc WHERE link = 'penjualan_sprr');
	SET @pendapatan_service = (SELECT acc_id FROM link_acc WHERE link = 'pendapatan_service');
	SET @piutang_spori = (SELECT acc_id FROM link_acc WHERE link = 'piutang_spori');
	SET @piutang_sprr = (SELECT acc_id FROM link_acc WHERE link = 'piutang_sprr');
	SET @piutang_service = (SELECT acc_id FROM link_acc WHERE link = 'piutang_service');
	SET @hpp_spori = (SELECT acc_id FROM link_acc WHERE link = 'hpp_spori');
	SET @hpp_sprr = (SELECT acc_id FROM link_acc WHERE link = 'hpp_sprr');
	SET @persediaan_spori = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_spori');
	SET @persediaan_sprr = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_sprr');
	SET @pot_spori = (SELECT acc_id FROM link_acc WHERE link = 'potongan_jualori');
	SET @pot_sprr = (SELECT acc_id FROM link_acc WHERE link = 'potongan_jualrr');
	SET @ppn = (SELECT acc_id FROM link_acc WHERE link = 'ppn_keluaran');
	
	
	SET @rowori = (SELECT count(unique_detailwo) jumlah FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
	SET @rowrr = (SELECT count(unique_detailwo) jumlah FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
	SET @rowop = (SELECT count(unique_detailwo) jumlah FROM temp_workorder_detail a right join (select item_code from items where ritem_class in ('OJ','WF') union SELECT operation_code item_code FROM master_operation) b on a.item_code = b.item_code where a.invdocno = NEW.invdocno);
    
	SET @total_spori = (SELECT COALESCE(sum(item_price*item_supply),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
	SET @total_sprr = (SELECT COALESCE(sum(item_price*item_supply),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
	SET @total_op = (SELECT COALESCE(sum((a.item_supply*a.item_price)-(a.item_supply*a.amount_discount)),0) subtotal FROM temp_workorder_detail a right join (select item_code from items where ritem_class in ('OJ','WF') union SELECT operation_code item_code FROM master_operation) b on a.item_code = b.item_code where a.invdocno = NEW.invdocno);
	SET @grantotal = (SELECT coalesce(ROUND(sum(jml),2)-ROUND(sum(disc),2),0) afdisc from ( SELECT item_supply*item_price as jml,item_supply*amount_discount as disc from temp_workorder_detail a where a.invdocno = NEW.invdocno) src);
	SET @ppn_percent = (SELECT 11);
	
	SET @tot_piuori_b4ppn = (SELECT COALESCE(sum((item_price*item_supply)-(item_supply*amount_discount)),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
	SET @total_ppn_ori = (SELECT ROUND(@tot_piuori_b4ppn*@ppn_percent/100,2));
	SET @tot_piuori = (SELECT @tot_piuori_b4ppn + @total_ppn_ori);
	
	SET @tot_piurr_b4ppn = (SELECT COALESCE(sum((item_price*item_supply)-(item_supply*amount_discount)),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');	
	SET @total_ppn_rr = (SELECT ROUND(@tot_piurr_b4ppn*@ppn_percent/100,2));
	SET @tot_piurr = (SELECT @tot_piurr_b4ppn + @total_ppn_rr);
	
	SET @total_ppn_op = (SELECT ROUND(@total_op*@ppn_percent/100,2));
	SET @tot_piuop = (SELECT @total_op + @total_ppn_op);
	SET @total_ppn = (SELECT ROUND(@grantotal*@ppn_percent/100,2));
	
	SET @tot_potori = (SELECT COALESCE(sum(item_qty*amount_discount),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
	SET @tot_potrr = (SELECT COALESCE(sum(item_qty*amount_discount),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
	
	SET @total_hppori = (SELECT COALESCE(sum(hpp),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
	SET @total_hpprr = (SELECT COALESCE(sum(hpp),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
	
	SET @totaltrans = (SELECT COALESCE(sum((item_price*item_supply)-(item_price*amount_discount)),0) subtotal FROM temp_workorder_detail a where a.invdocno = NEW.invdocno);
	
	INSERT INTO general_ledger(notrans,order_no,invoice_no,tabel_trans,tgl,total_trans,memo,jurnal,rlocation,comp_loc,us_create,us_update) VALUES(@gjno,NEW.wono,NEW.invdocno,'woinvoice',NEW.inv_date,@totaltrans,'wo invoice','JK',NEW.dealer_repcode,'comp_loc',NEW.user_create,NEW.user_update);
	
	IF @rowori > 0 THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@piutang_spori,@tot_piuori,'0','wo sp hino');
	END IF;
	IF @rowrr > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@piutang_sprr,@tot_piurr,'0','wo sp hino');
	END IF;
	IF @rowop > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@piutang_service,@tot_piuop,'0','wo sp hino');
	END IF;
	IF @tot_potori > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@pot_spori,@tot_potori,'0','wo sp hino');
	END IF;
	IF @tot_potrr > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@pot_sprr,@tot_potrr,'0','wo sp hino');
	END IF;	
	IF @rowori > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@penjualan_spori,'0',@total_spori,'wo sp hino');
	END IF;
	IF @rowrr > 0 THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@penjualan_sprr,'0',@total_sprr,'wo sp hino');
	END IF;
	IF @rowop THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@pendapatan_service,'0',@total_op,'wo sp hino');
	END IF;	
	INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@ppn,'0',@total_ppn,'wo sp hino');
	
	IF @rowori > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@hpp_spori,@total_hppori,'0','wo sp hino');		
	END IF;
	IF @rowrr > 0 THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@hpp_sprr,@total_hpprr,'0','wo sp hino');
	END IF;
	IF @rowori > 0 THEN 
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@persediaan_spori,'0',@total_hppori,'wo sp hino');		
	END IF;
	IF @rowrr > 0 THEN
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjno,@persediaan_sprr,'0',@total_hpprr,'wo sp hino');
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `woinvoice_afupdate` AFTER UPDATE ON `woinvoice` FOR EACH ROW BEGIN 
	DECLARE gjno varchar(12);
	DECLARE location varchar(3);
	DECLARE rowori integer(5);
	DECLARE rowrr integer(5);
	DECLARE rowop integer(5);
	DECLARE ppn_percent integer(5);
	DECLARE ppn integer(5);
	
	DECLARE totaltrans decimal (10,2);
	
	DECLARE total_op decimal (10,2);
    DECLARE total_spori decimal (10,2);
	DECLARE total_sprr decimal (10,2);
	
	DECLARE total_hppori decimal (10,2);
	DECLARE total_hpprr decimal (10,2);
	DECLARE grantotal decimal(10,2);
	DECLARE total_ppn decimal (10,2);
	DECLARE total_ppn_ori decimal (10,2);
	DECLARE total_ppn_rr decimal (10,2);
	DECLARE total_ppn_op decimal (10,2);
	
	DECLARE tot_piuori decimal (10,2);
	DECLARE tot_piuori_b4ppn decimal (10,2);
	DECLARE tot_piurr decimal (10,2);
	DECLARE tot_piurr_b4ppn decimal (10,2);
	DECLARE tot_piuop decimal (10,2);
	
	DECLARE tot_potori decimal (10,2);
	DECLARE tot_potrr decimal (10,2);
	
	DECLARE penjualan_spori integer(5);
	DECLARE penjualan_sprr integer(5);
	DECLARE pendapatan_service integer(5);
	
	DECLARE piutang_spori integer(5);
	DECLARE piutang_sprr integer(5);
	DECLARE piutang_service integer(5);
	
	DECLARE pot_spori integer(5);
	DECLARE pot_sprr integer(5);
	
	DECLARE hpp_spori integer(5);
	DECLARE hpp_sprr integer(5);
	
	DECLARE persediaan_spori integer(5);
	DECLARE persediaan_sprr integer(5);
	
	IF NEW.void_flag = 0 THEN
	
		SET @location = (SELECT dealer_alias FROM setup_dealer where dealer_repcode = OLD.dealer_repcode);
		SET @gjnob4 = (SELECT notrans from general_ledger where invoice_no = OLD.invdocno);
		
		SET @penjualan_spori = (SELECT acc_id FROM link_acc WHERE link = 'penjualan_spori');
		SET @penjualan_sprr = (SELECT acc_id FROM link_acc WHERE link = 'penjualan_sprr');
		SET @pendapatan_service = (SELECT acc_id FROM link_acc WHERE link = 'pendapatan_service');
		SET @piutang_spori = (SELECT acc_id FROM link_acc WHERE link = 'piutang_spori');
		SET @piutang_sprr = (SELECT acc_id FROM link_acc WHERE link = 'piutang_sprr');
		SET @piutang_service = (SELECT acc_id FROM link_acc WHERE link = 'piutang_service');
		SET @hpp_spori = (SELECT acc_id FROM link_acc WHERE link = 'hpp_spori');
		SET @hpp_sprr = (SELECT acc_id FROM link_acc WHERE link = 'hpp_sprr');
		SET @persediaan_spori = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_spori');
		SET @persediaan_sprr = (SELECT acc_id FROM link_acc WHERE link = 'persediaan_sprr');
		SET @pot_spori = (SELECT acc_id FROM link_acc WHERE link = 'potongan_jualori');
		SET @pot_sprr = (SELECT acc_id FROM link_acc WHERE link = 'potongan_jualrr');
		SET @ppn = (SELECT acc_id FROM link_acc WHERE link = 'ppn_keluaran');
		
		SET @rowori = (SELECT count(unique_detailwo) jumlah FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
		SET @rowrr = (SELECT count(unique_detailwo) jumlah FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
		SET @rowop = (SELECT count(unique_detailwo) jumlah FROM temp_workorder_detail a right join (select item_code from items where ritem_class in ('OJ','WF') union SELECT operation_code item_code FROM master_operation) b on a.item_code = b.item_code where a.invdocno = NEW.invdocno);
		
		SET @total_spori = (SELECT COALESCE(sum(item_price*item_supply),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
		SET @total_sprr = (SELECT COALESCE(sum(item_price*item_supply),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
		SET @total_op = (SELECT COALESCE(sum((a.item_supply*a.item_price)-(a.item_supply*a.amount_discount)),0) subtotal FROM temp_workorder_detail a right join (select item_code from items where ritem_class in ('OJ','WF') union SELECT operation_code item_code FROM master_operation) b on a.item_code = b.item_code where a.invdocno = NEW.invdocno);
		SET @grantotal = (SELECT coalesce(ROUND(sum(jml),2)-ROUND(sum(disc),2),0) afdisc from ( SELECT item_supply*item_price as jml,item_supply*amount_discount as disc from temp_workorder_detail a where a.invdocno = NEW.invdocno) src);
		SET @ppn_percent = (SELECT 11);
		
		SET @tot_piuori_b4ppn = (SELECT COALESCE(sum((item_price*item_supply)-(item_supply*amount_discount)),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
		SET @total_ppn_ori = (SELECT ROUND(@tot_piuori_b4ppn*@ppn_percent/100,2));
		SET @tot_piuori = (SELECT @tot_piuori_b4ppn + @total_ppn_ori);
		
		SET @tot_piurr_b4ppn = (SELECT COALESCE(sum((item_price*item_supply)-(item_supply*amount_discount)),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');	
		SET @total_ppn_rr = (SELECT ROUND(@tot_piurr_b4ppn*@ppn_percent/100,2));
		SET @tot_piurr = (SELECT @tot_piurr_b4ppn + @total_ppn_rr);
		
		SET @total_ppn_op = (SELECT ROUND(@total_op*@ppn_percent/100,2));
		SET @tot_piuop = (SELECT @total_op + @total_ppn_op);
		SET @total_ppn = (SELECT ROUND(@grantotal*@ppn_percent/100,2));
		
		SET @tot_potori = (SELECT COALESCE(sum(item_qty*amount_discount),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
		SET @tot_potrr = (SELECT COALESCE(sum(item_qty*amount_discount),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
		
		SET @total_hppori = (SELECT COALESCE(sum(hpp),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '1');
		SET @total_hpprr = (SELECT COALESCE(sum(hpp),0) subtotal FROM temp_workorder_detail a right join items b on a.item_code = b.item_code where a.invdocno = NEW.invdocno and b.ritem_class not in ('OJ','WF') and a.extdata_flag = '0');
		
		SET @totaltrans = (SELECT COALESCE(sum((item_price*item_supply)-(item_price*amount_discount)),0) subtotal FROM temp_workorder_detail a where a.invdocno = NEW.invdocno);
		
		INSERT INTO messages(message) values(concat(@rowori,',',@rowrr,',',@rowop));
		UPDATE temp_workorder_detail a inner join temp_workorder_detail b on a.tempwo_detail_id = b.tempwo_detail_id set a.item_supply = b.item_qty where a.invdocno = OLD.invdocno; 
		DELETE FROM general_ledger where notrans = @gjnob4b4;
		INSERT INTO general_ledger(notrans,order_no,invoice_no,tabel_trans,tgl,total_trans,memo,jurnal,rlocation,comp_loc,us_create,us_update) VALUES(@gjnob4,NEW.wono,NEW.invdocno,'woinvoice',NEW.inv_date,@totaltrans,'wo invoice','JK',NEW.dealer_repcode,'comp_loc',NEW.user_create,NEW.user_update);
	
		IF @rowori > 0 THEN
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@piutang_spori,@tot_piuori,'0','wo sp hino');
		END IF;
		IF @rowrr > 0 THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@piutang_sprr,@tot_piurr,'0','wo sp hino');
		END IF;
		IF @rowop > 0 THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@piutang_service,@tot_piuop,'0','wo sp hino');
		END IF;
		IF @tot_potori > 0 THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@pot_spori,@tot_potori,'0','wo sp hino');
		END IF;
		IF @tot_potrr > 0 THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@pot_sprr,@tot_potrr,'0','wo sp hino');
		END IF;	
		IF @rowori > 0 THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@penjualan_spori,'0',@total_spori,'wo sp hino');
		END IF;
		IF @rowrr > 0 THEN
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@penjualan_sprr,'0',@total_sprr,'wo sp hino');
		END IF;
		IF @rowop THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@pendapatan_service,'0',@total_op,'wo sp hino');
		END IF;	
		INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@ppn,'0',@total_ppn,'wo sp hino');
		
		IF @rowori > 0 THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@hpp_spori,@total_hppori,'0','wo sp hino');		
		END IF;
		IF @rowrr > 0 THEN
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@hpp_sprr,@total_hpprr,'0','wo sp hino');
		END IF;
		IF @rowori > 0 THEN 
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@persediaan_spori,'0',@total_hppori,'wo sp hino');		
		END IF;
		IF @rowrr > 0 THEN
			INSERT INTO gl_detail(rgl,acc_id,debet,kredit,trans_detail) values(@gjnob4,@persediaan_sprr,'0',@total_hpprr,'wo sp hino');
		END IF;
	ELSE 
		UPDATE general_ledger SET void_flag = 1 where invoice_no = OLD.invdocno;
		UPDATE temp_workorder_detail set item_supply = 0 where invdocno = OLD.invdocno;
	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `workorder`
--

CREATE TABLE `workorder` (
  `wo_id` int NOT NULL,
  `wosysno` int NOT NULL DEFAULT '0',
  `invdocno` varchar(25) NOT NULL DEFAULT '0',
  `wodocno` varchar(25) DEFAULT NULL,
  `wodate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `vehicle_chassisno` varchar(50) DEFAULT NULL,
  `vehicle_brand` varchar(10) DEFAULT NULL,
  `colour_code` varchar(6) DEFAULT NULL,
  `arrival_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT '1990-01-01 00:00:00',
  `leave_time` datetime NOT NULL DEFAULT '1990-01-01 00:00:00',
  `customer_code` varchar(50) DEFAULT NULL,
  `dealer_repcode` varchar(10) DEFAULT NULL,
  `emergency_type` varchar(5) DEFAULT NULL,
  `job_type` varchar(10) DEFAULT NULL,
  `licenseno` varchar(50) DEFAULT NULL,
  `service_advisor` varchar(40) DEFAULT NULL,
  `service_cartype` varchar(3) DEFAULT NULL,
  `service_category` varchar(100) DEFAULT NULL,
  `service_categorydesc` varchar(100) DEFAULT NULL,
  `service_code` varchar(100) DEFAULT NULL,
  `service_codedesc` varchar(100) DEFAULT NULL,
  `service_site` varchar(100) DEFAULT NULL,
  `service_type` varchar(10) DEFAULT NULL,
  `service_typedesc` varchar(100) DEFAULT NULL,
  `subtotal` decimal(17,2) DEFAULT '0.00',
  `transaction_type` varchar(10) DEFAULT NULL,
  `qcpass_date` datetime NOT NULL DEFAULT '1990-01-01 00:00:00',
  `reason` varchar(256) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `remark_outstanding` varchar(225) DEFAULT NULL,
  `wostatus` char(2) DEFAULT NULL,
  `wostatus_desc` varchar(25) DEFAULT NULL,
  `request_desc` varchar(225) DEFAULT NULL,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(10) DEFAULT NULL,
  `date_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_update` varchar(10) DEFAULT NULL,
  `extdata_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wo_teknisi`
--

CREATE TABLE `wo_teknisi` (
  `woteknisi_id` int NOT NULL,
  `rwosysno` int NOT NULL,
  `rkaryawan_code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accuser`
--
ALTER TABLE `accuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_id_2` (`user_id`);

--
-- Indexes for table `acc_setup`
--
ALTER TABLE `acc_setup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `bahasa`
--
ALTER TABLE `bahasa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`cabang_id`),
  ADD UNIQUE KEY `cabang_lokasi` (`cabang_lokasi`),
  ADD KEY `cabang_code` (`cabang_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_code` (`customer_code`) USING BTREE;

--
-- Indexes for table `customer_type`
--
ALTER TABLE `customer_type`
  ADD PRIMARY KEY (`id_customer_type`);

--
-- Indexes for table `docno`
--
ALTER TABLE `docno`
  ADD PRIMARY KEY (`docno_id`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id_form`);

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
-- Indexes for table `gl_detail`
--
ALTER TABLE `gl_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `r_general` (`rgl`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `good_receive`
--
ALTER TABLE `good_receive`
  ADD PRIMARY KEY (`gro_id`),
  ADD UNIQUE KEY `grpo_sysno` (`grpo_sysno`),
  ADD KEY `grno` (`grno`),
  ADD KEY `podocno` (`podocno`),
  ADD KEY `pono` (`pono`),
  ADD KEY `user_update` (`user_update`),
  ADD KEY `user_create` (`user_create`),
  ADD KEY `dealer_repcode` (`dealer_repcode`),
  ADD KEY `supplier_code` (`supplier_code`),
  ADD KEY `r_anggaran` (`r_anggaran`);

--
-- Indexes for table `go_detail`
--
ALTER TABLE `go_detail`
  ADD PRIMARY KEY (`grodetail_id`),
  ADD UNIQUE KEY `unique_detailgo` (`unique_detailgo`),
  ADD KEY `unique_detailgo_2` (`unique_detailgo`),
  ADD KEY `grpo_sysno` (`grpo_sysno`),
  ADD KEY `grno` (`grno`),
  ADD KEY `pono` (`pono`),
  ADD KEY `rdealer_repcode` (`rdealer_repcode`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `group_barang`
--
ALTER TABLE `group_barang`
  ADD PRIMARY KEY (`id_group`);

--
-- Indexes for table `hncf_menu_level0`
--
ALTER TABLE `hncf_menu_level0`
  ADD PRIMARY KEY (`id_level0`);

--
-- Indexes for table `hncf_menu_level1`
--
ALTER TABLE `hncf_menu_level1`
  ADD PRIMARY KEY (`id_level1`);

--
-- Indexes for table `hncf_menu_level2`
--
ALTER TABLE `hncf_menu_level2`
  ADD PRIMARY KEY (`id_level2`);

--
-- Indexes for table `hncf_menu_level3`
--
ALTER TABLE `hncf_menu_level3`
  ADD PRIMARY KEY (`id_level3`);

--
-- Indexes for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`id_inventaris`),
  ADD UNIQUE KEY `kode_inventaris_3` (`kode_inventaris`),
  ADD KEY `kode_inventaris` (`kode_inventaris`),
  ADD KEY `kode_inventaris_2` (`kode_inventaris`),
  ADD KEY `kode_pengadaan` (`kode_pengadaan`);

--
-- Indexes for table `inventaris_pengadaan`
--
ALTER TABLE `inventaris_pengadaan`
  ADD PRIMARY KEY (`id_pengadaan`),
  ADD UNIQUE KEY `pengadaan_sysno_UNIQUE` (`pengadaan_sysno`),
  ADD UNIQUE KEY `pengadaan_docno_UNIQUE` (`pengadaan_docno`),
  ADD KEY `pengadaan_sysno` (`pengadaan_sysno`),
  ADD KEY `r_anggaran` (`r_anggaran`);

--
-- Indexes for table `inventaris_pengadaan_detail`
--
ALTER TABLE `inventaris_pengadaan_detail`
  ADD PRIMARY KEY (`id_pengadaan_detail`),
  ADD KEY `rsysno_pengadaan` (`rsysno_pengadaan`),
  ADD KEY `rkode_inventaris` (`rkode_inventaris`);

--
-- Indexes for table `inventaris_penyusutan`
--
ALTER TABLE `inventaris_penyusutan`
  ADD PRIMARY KEY (`id_penyusutan`),
  ADD KEY `penyusutan_sysno` (`penyusutan_sysno`);

--
-- Indexes for table `inventaris_penyusutan_detail`
--
ALTER TABLE `inventaris_penyusutan_detail`
  ADD PRIMARY KEY (`id_penyusutan_detail`),
  ADD KEY `rsysno_penyusutan` (`rsysno_penyusutan`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD UNIQUE KEY `item_code` (`item_code`),
  ADD KEY `item_code_2` (`item_code`),
  ADD KEY `rdiscount_code` (`rdiscount_code`),
  ADD KEY `rsupplier` (`rsupplier`),
  ADD KEY `ritem_class` (`ritem_class`);

--
-- Indexes for table `items_class`
--
ALTER TABLE `items_class`
  ADD PRIMARY KEY (`itemsclass_id`),
  ADD UNIQUE KEY `item_class_code` (`item_class_code`),
  ADD KEY `item_class_code_2` (`item_class_code`);

--
-- Indexes for table `items_inv`
--
ALTER TABLE `items_inv`
  ADD PRIMARY KEY (`items_invid`),
  ADD UNIQUE KEY `inv_uniqueid` (`inv_uniqueid`),
  ADD KEY `ritem_code` (`ritem_code`),
  ADD KEY `rcabang_repcode` (`rcabang_repcode`);

--
-- Indexes for table `items_invdetail`
--
ALTER TABLE `items_invdetail`
  ADD PRIMARY KEY (`items_invid`);

--
-- Indexes for table `items_pricelist`
--
ALTER TABLE `items_pricelist`
  ADD PRIMARY KEY (`items_pricelist_id`),
  ADD KEY `item_code` (`item_code`),
  ADD KEY `ritem_class` (`ritem_class`);

--
-- Indexes for table `jenis_mobil`
--
ALTER TABLE `jenis_mobil`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `type_code_index` (`type_code`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`karyawan_id`),
  ADD UNIQUE KEY `karyawan_code` (`karyawan_code`),
  ADD KEY `karyawan_code_2` (`karyawan_code`),
  ADD KEY `rcabang_code` (`rcabang_code`);

--
-- Indexes for table `label`
--
ALTER TABLE `label`
  ADD PRIMARY KEY (`id_label`),
  ADD UNIQUE KEY `nama_label` (`nama_label`);

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
  ADD KEY `id` (`id`),
  ADD KEY `acc_id` (`acc_id`);

--
-- Indexes for table `link_acc`
--
ALTER TABLE `link_acc`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `master_category`
--
ALTER TABLE `master_category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_code_2` (`category_code`),
  ADD KEY `category_code` (`category_code`);

--
-- Indexes for table `master_colour`
--
ALTER TABLE `master_colour`
  ADD PRIMARY KEY (`colour_id`),
  ADD UNIQUE KEY `colour_code` (`colour_code`),
  ADD KEY `colour_code_2` (`colour_code`);

--
-- Indexes for table `master_discount`
--
ALTER TABLE `master_discount`
  ADD PRIMARY KEY (`discount_id`),
  ADD UNIQUE KEY `discount_code` (`discount_code`),
  ADD KEY `discount_code_2` (`discount_code`);

--
-- Indexes for table `master_group`
--
ALTER TABLE `master_group`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `group_code` (`group_code`),
  ADD UNIQUE KEY `group_name` (`group_desc`);

--
-- Indexes for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  ADD PRIMARY KEY (`id_jabatan`),
  ADD UNIQUE KEY `kode_jabatan` (`kode_jabatan`);

--
-- Indexes for table `master_model`
--
ALTER TABLE `master_model`
  ADD PRIMARY KEY (`id_model`),
  ADD UNIQUE KEY `model_code` (`model_code`),
  ADD KEY `model_code_2` (`model_code`);

--
-- Indexes for table `master_operation`
--
ALTER TABLE `master_operation`
  ADD PRIMARY KEY (`operation_id`),
  ADD UNIQUE KEY `operation_code` (`operation_code`) USING BTREE;

--
-- Indexes for table `master_type`
--
ALTER TABLE `master_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `master_variant`
--
ALTER TABLE `master_variant`
  ADD PRIMARY KEY (`variant_id`),
  ADD UNIQUE KEY `varian_code_index` (`variant_code`);

--
-- Indexes for table `master_vehicle`
--
ALTER TABLE `master_vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD UNIQUE KEY `vehicle_chassisno` (`vehicle_chassisno`) USING BTREE,
  ADD KEY `vehicle_chassisno_2` (`vehicle_chassisno`) USING BTREE;

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nomor_group`
--
ALTER TABLE `nomor_group`
  ADD PRIMARY KEY (`id_nomor_group`);

--
-- Indexes for table `nomor_jabatan`
--
ALTER TABLE `nomor_jabatan`
  ADD PRIMARY KEY (`id_nomor_jabatan`);

--
-- Indexes for table `nomor_kode`
--
ALTER TABLE `nomor_kode`
  ADD PRIMARY KEY (`id_nomor_kode`);

--
-- Indexes for table `nomor_staff`
--
ALTER TABLE `nomor_staff`
  ADD PRIMARY KEY (`id_nomor_staff`);

--
-- Indexes for table `nomor_type`
--
ALTER TABLE `nomor_type`
  ADD PRIMARY KEY (`id_nomor_type`);

--
-- Indexes for table `opnum_detail`
--
ALTER TABLE `opnum_detail`
  ADD PRIMARY KEY (`opnum_detail_id`),
  ADD UNIQUE KEY `unique_detail_opnum` (`unique_detail_opnum`),
  ADD KEY `unique_detail_opnum_2` (`unique_detail_opnum`),
  ADD KEY `opnum_sysno` (`opnum_sysno`),
  ADD KEY `opnum_docno` (`opnum_docno`),
  ADD KEY `rdealer_repcode` (`rdealer_repcode`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `opnum_stock`
--
ALTER TABLE `opnum_stock`
  ADD PRIMARY KEY (`opnum_id`),
  ADD UNIQUE KEY `opnum_sysno` (`opnum_sysno`),
  ADD UNIQUE KEY `opnum_docno_2` (`opnum_docno`),
  ADD KEY `opnum_docno` (`opnum_docno`),
  ADD KEY `user_update` (`user_update`),
  ADD KEY `user_create` (`user_create`),
  ADD KEY `dealer_repcode` (`dealer_repcode`);

--
-- Indexes for table `po_detail`
--
ALTER TABLE `po_detail`
  ADD PRIMARY KEY (`podetail_id`),
  ADD UNIQUE KEY `unique_detailpo` (`unique_detailpo`),
  ADD KEY `unique_detailpo_2` (`unique_detailpo`),
  ADD KEY `rposysno` (`rposysno`),
  ADD KEY `purchase_orderno` (`purchase_orderno`),
  ADD KEY `item_code` (`item_code`),
  ADD KEY `grno` (`grno`),
  ADD KEY `rdealer_repcode` (`rdealer_repcode`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`production_id`),
  ADD UNIQUE KEY `opnum_sysno` (`production_sysno`),
  ADD UNIQUE KEY `opnum_docno_2` (`production_docno`),
  ADD KEY `opnum_docno` (`production_docno`),
  ADD KEY `user_update` (`user_update`),
  ADD KEY `user_create` (`user_create`),
  ADD KEY `dealer_repcode` (`dealer_repcode`);

--
-- Indexes for table `production_detail`
--
ALTER TABLE `production_detail`
  ADD PRIMARY KEY (`production_detail_id`),
  ADD UNIQUE KEY `unique_detail_opnum` (`unique_detail_production`),
  ADD KEY `unique_detail_opnum_2` (`unique_detail_production`),
  ADD KEY `opnum_sysno` (`rproduction_sysno`),
  ADD KEY `opnum_docno` (`production_docno`),
  ADD KEY `rdealer_repcode` (`rdealer_repcode`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `program_aktivitas`
--
ALTER TABLE `program_aktivitas`
  ADD PRIMARY KEY (`id_program`),
  ADD KEY `program_sysno` (`program_sysno`),
  ADD KEY `r_anggaran` (`r_anggaran`),
  ADD KEY `dealer_repcode` (`dealer_repcode`);

--
-- Indexes for table `program_aktivitas_detail`
--
ALTER TABLE `program_aktivitas_detail`
  ADD PRIMARY KEY (`id_program_detail`),
  ADD UNIQUE KEY `unique_detail_program` (`unique_detail_program`),
  ADD KEY `rprogram_sysno` (`rprogram_sysno`),
  ADD KEY `ritem_code` (`ritem_code`),
  ADD KEY `program_docno` (`program_docno`),
  ADD KEY `dealer_repcode` (`dealer_repcode`);

--
-- Indexes for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`purchase_order_id`),
  ADD UNIQUE KEY `posysno` (`posysno`),
  ADD KEY `posysno_2` (`posysno`),
  ADD KEY `purchase_orderno` (`purchase_orderno`),
  ADD KEY `prdocno` (`prdocno`),
  ADD KEY `dealer_repcode` (`dealer_repcode`),
  ADD KEY `supplier_code` (`supplier_code`),
  ADD KEY `user_update` (`user_update`),
  ADD KEY `user_create` (`user_create`),
  ADD KEY `r_anggaran` (`r_anggaran`);

--
-- Indexes for table `rekening_anggaran`
--
ALTER TABLE `rekening_anggaran`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indexes for table `rekening_anggaran_bck`
--
ALTER TABLE `rekening_anggaran_bck`
  ADD PRIMARY KEY (`view_level`);

--
-- Indexes for table `rekening_anggaran_detail`
--
ALTER TABLE `rekening_anggaran_detail`
  ADD PRIMARY KEY (`id_detail_rekening`),
  ADD UNIQUE KEY `unique_detail_anggaran` (`unique_detail_anggaran`),
  ADD KEY `unique_detail_anggaran_2` (`unique_detail_anggaran`);

--
-- Indexes for table `rekening_anggaran_temp`
--
ALTER TABLE `rekening_anggaran_temp`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indexes for table `salesorder`
--
ALTER TABLE `salesorder`
  ADD PRIMARY KEY (`so_id`),
  ADD UNIQUE KEY `sosysno` (`sosysno`),
  ADD UNIQUE KEY `sales_orderno` (`sales_orderno`),
  ADD KEY `sosysno_2` (`sosysno`),
  ADD KEY `sales_orderno_2` (`sales_orderno`);

--
-- Indexes for table `salesorder_detail`
--
ALTER TABLE `salesorder_detail`
  ADD PRIMARY KEY (`sodetail_id`),
  ADD UNIQUE KEY `unique_detailso` (`unique_detailso`),
  ADD KEY `unique_detailso_2` (`unique_detailso`),
  ADD KEY `rso_sysno` (`rso_sysno`),
  ADD KEY `sales_orderno` (`sales_orderno`),
  ADD KEY `soinvno` (`soinvno`),
  ADD KEY `rdealer_repcode` (`rdealer_repcode`),
  ADD KEY `item_code` (`item_code`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `setup_dealer`
--
ALTER TABLE `setup_dealer`
  ADD PRIMARY KEY (`dealer_id`);

--
-- Indexes for table `setup_itemunit`
--
ALTER TABLE `setup_itemunit`
  ADD PRIMARY KEY (`item_unitid`),
  ADD UNIQUE KEY `unit_name` (`unit_code`);

--
-- Indexes for table `setup_jasa`
--
ALTER TABLE `setup_jasa`
  ADD PRIMARY KEY (`id_setup_jasa`);

--
-- Indexes for table `setup_jobtype`
--
ALTER TABLE `setup_jobtype`
  ADD PRIMARY KEY (`jobtype_id`),
  ADD UNIQUE KEY `jobtype_code` (`jobtype_code`),
  ADD KEY `jobtype_code_2` (`jobtype_code`);

--
-- Indexes for table `setup_master`
--
ALTER TABLE `setup_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setup_ppn`
--
ALTER TABLE `setup_ppn`
  ADD PRIMARY KEY (`ppn_id`);

--
-- Indexes for table `setup_topcode`
--
ALTER TABLE `setup_topcode`
  ADD PRIMARY KEY (`top_id`),
  ADD UNIQUE KEY `top_code` (`top_code`),
  ADD KEY `top_code_2` (`top_code`);

--
-- Indexes for table `setup_wostatus`
--
ALTER TABLE `setup_wostatus`
  ADD PRIMARY KEY (`wostatus_id`),
  ADD UNIQUE KEY `wostatus_code` (`wostatus_code`);

--
-- Indexes for table `soinvoice`
--
ALTER TABLE `soinvoice`
  ADD PRIMARY KEY (`soinv_id`),
  ADD UNIQUE KEY `invsysno` (`invsysno`),
  ADD UNIQUE KEY `invno` (`invno`),
  ADD KEY `invno_2` (`invno`),
  ADD KEY `invsysno_2` (`invsysno`),
  ADD KEY `dealer_repcode` (`dealer_repcode`),
  ADD KEY `customer_code` (`customer_code`),
  ADD KEY `billto` (`billto`);

--
-- Indexes for table `soinvoice_detail`
--
ALTER TABLE `soinvoice_detail`
  ADD PRIMARY KEY (`soinvdetail_id`),
  ADD UNIQUE KEY `unique_detailsoinv` (`unique_detailsoinv`),
  ADD KEY `unique_detailsoinv_2` (`unique_detailsoinv`),
  ADD KEY `invno` (`invno`),
  ADD KEY `sono` (`sono`),
  ADD KEY `rdealer_repcode` (`rdealer_repcode`),
  ADD KEY `item_code` (`item_code`),
  ADD KEY `user_create` (`user_create`),
  ADD KEY `user_update` (`user_update`),
  ADD KEY `rinv_sysno` (`rinv_sysno`);

--
-- Indexes for table `sumber_anggaran`
--
ALTER TABLE `sumber_anggaran`
  ADD PRIMARY KEY (`id_sumber`),
  ADD UNIQUE KEY `kode_sumber` (`kode_sumber`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`),
  ADD UNIQUE KEY `supplier_code` (`supplier_code`);

--
-- Indexes for table `temp_workorder`
--
ALTER TABLE `temp_workorder`
  ADD PRIMARY KEY (`tempwo_id`);

--
-- Indexes for table `temp_workorder_detail`
--
ALTER TABLE `temp_workorder_detail`
  ADD PRIMARY KEY (`tempwo_detail_id`),
  ADD UNIQUE KEY `unique_detailwo` (`unique_detailwo`),
  ADD KEY `unique_detailwo_2` (`unique_detailwo`),
  ADD KEY `rwosysno` (`rwosysno`),
  ADD KEY `item_code` (`item_code`),
  ADD KEY `wodocno` (`wodocno`),
  ADD KEY `rdealer_repcode` (`rdealer_repcode`),
  ADD KEY `invdocno` (`invdocno`);

--
-- Indexes for table `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`jabatan_id`);

--
-- Indexes for table `woinvoice`
--
ALTER TABLE `woinvoice`
  ADD PRIMARY KEY (`woinv_id`),
  ADD UNIQUE KEY `invsysno` (`invsysno`),
  ADD KEY `invsysno_2` (`invsysno`),
  ADD KEY `ref_docno` (`ref_docno`),
  ADD KEY `wono` (`wono`),
  ADD KEY `invdocno` (`invdocno`),
  ADD KEY `billto` (`billto`),
  ADD KEY `dealer_repcode` (`dealer_repcode`);

--
-- Indexes for table `workorder`
--
ALTER TABLE `workorder`
  ADD PRIMARY KEY (`wo_id`),
  ADD UNIQUE KEY `wosysno` (`wosysno`),
  ADD KEY `rinvsysno` (`invdocno`),
  ADD KEY `wodocno` (`wodocno`),
  ADD KEY `dealer_repcode` (`dealer_repcode`);

--
-- Indexes for table `wo_teknisi`
--
ALTER TABLE `wo_teknisi`
  ADD PRIMARY KEY (`woteknisi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accuser`
--
ALTER TABLE `accuser`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `acc_setup`
--
ALTER TABLE `acc_setup`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bahasa`
--
ALTER TABLE `bahasa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1624;

--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `cabang_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121358;

--
-- AUTO_INCREMENT for table `customer_type`
--
ALTER TABLE `customer_type`
  MODIFY `id_customer_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `docno`
--
ALTER TABLE `docno`
  MODIFY `docno_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=785;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `id_form` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `gl_detail`
--
ALTER TABLE `gl_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `good_receive`
--
ALTER TABLE `good_receive`
  MODIFY `gro_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=725;

--
-- AUTO_INCREMENT for table `go_detail`
--
ALTER TABLE `go_detail`
  MODIFY `grodetail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3228;

--
-- AUTO_INCREMENT for table `group_barang`
--
ALTER TABLE `group_barang`
  MODIFY `id_group` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `hncf_menu_level0`
--
ALTER TABLE `hncf_menu_level0`
  MODIFY `id_level0` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hncf_menu_level1`
--
ALTER TABLE `hncf_menu_level1`
  MODIFY `id_level1` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hncf_menu_level2`
--
ALTER TABLE `hncf_menu_level2`
  MODIFY `id_level2` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `hncf_menu_level3`
--
ALTER TABLE `hncf_menu_level3`
  MODIFY `id_level3` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `inventaris`
--
ALTER TABLE `inventaris`
  MODIFY `id_inventaris` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventaris_pengadaan`
--
ALTER TABLE `inventaris_pengadaan`
  MODIFY `id_pengadaan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventaris_pengadaan_detail`
--
ALTER TABLE `inventaris_pengadaan_detail`
  MODIFY `id_pengadaan_detail` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventaris_penyusutan`
--
ALTER TABLE `inventaris_penyusutan`
  MODIFY `id_penyusutan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventaris_penyusutan_detail`
--
ALTER TABLE `inventaris_penyusutan_detail`
  MODIFY `id_penyusutan_detail` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303242;

--
-- AUTO_INCREMENT for table `items_class`
--
ALTER TABLE `items_class`
  MODIFY `itemsclass_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23961;

--
-- AUTO_INCREMENT for table `items_inv`
--
ALTER TABLE `items_inv`
  MODIFY `items_invid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381921;

--
-- AUTO_INCREMENT for table `items_invdetail`
--
ALTER TABLE `items_invdetail`
  MODIFY `items_invid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396113;

--
-- AUTO_INCREMENT for table `items_pricelist`
--
ALTER TABLE `items_pricelist`
  MODIFY `items_pricelist_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2516;

--
-- AUTO_INCREMENT for table `jenis_mobil`
--
ALTER TABLE `jenis_mobil`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `karyawan_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `label`
--
ALTER TABLE `label`
  MODIFY `id_label` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=848;

--
-- AUTO_INCREMENT for table `link_acc`
--
ALTER TABLE `link_acc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `master_category`
--
ALTER TABLE `master_category`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `master_colour`
--
ALTER TABLE `master_colour`
  MODIFY `colour_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `master_discount`
--
ALTER TABLE `master_discount`
  MODIFY `discount_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `master_group`
--
ALTER TABLE `master_group`
  MODIFY `group_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  MODIFY `id_jabatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_model`
--
ALTER TABLE `master_model`
  MODIFY `id_model` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1125;

--
-- AUTO_INCREMENT for table `master_operation`
--
ALTER TABLE `master_operation`
  MODIFY `operation_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3394;

--
-- AUTO_INCREMENT for table `master_type`
--
ALTER TABLE `master_type`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_variant`
--
ALTER TABLE `master_variant`
  MODIFY `variant_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2524;

--
-- AUTO_INCREMENT for table `master_vehicle`
--
ALTER TABLE `master_vehicle`
  MODIFY `vehicle_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=384955;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2016;

--
-- AUTO_INCREMENT for table `nomor_group`
--
ALTER TABLE `nomor_group`
  MODIFY `id_nomor_group` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nomor_jabatan`
--
ALTER TABLE `nomor_jabatan`
  MODIFY `id_nomor_jabatan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nomor_kode`
--
ALTER TABLE `nomor_kode`
  MODIFY `id_nomor_kode` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `nomor_staff`
--
ALTER TABLE `nomor_staff`
  MODIFY `id_nomor_staff` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `nomor_type`
--
ALTER TABLE `nomor_type`
  MODIFY `id_nomor_type` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `opnum_detail`
--
ALTER TABLE `opnum_detail`
  MODIFY `opnum_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3121;

--
-- AUTO_INCREMENT for table `opnum_stock`
--
ALTER TABLE `opnum_stock`
  MODIFY `opnum_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=679;

--
-- AUTO_INCREMENT for table `po_detail`
--
ALTER TABLE `po_detail`
  MODIFY `podetail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2874;

--
-- AUTO_INCREMENT for table `production`
--
ALTER TABLE `production`
  MODIFY `production_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `production_detail`
--
ALTER TABLE `production_detail`
  MODIFY `production_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `program_aktivitas`
--
ALTER TABLE `program_aktivitas`
  MODIFY `id_program` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `program_aktivitas_detail`
--
ALTER TABLE `program_aktivitas_detail`
  MODIFY `id_program_detail` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `purchase_order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=705;

--
-- AUTO_INCREMENT for table `rekening_anggaran`
--
ALTER TABLE `rekening_anggaran`
  MODIFY `id_rekening` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `rekening_anggaran_bck`
--
ALTER TABLE `rekening_anggaran_bck`
  MODIFY `view_level` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `rekening_anggaran_detail`
--
ALTER TABLE `rekening_anggaran_detail`
  MODIFY `id_detail_rekening` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1594;

--
-- AUTO_INCREMENT for table `rekening_anggaran_temp`
--
ALTER TABLE `rekening_anggaran_temp`
  MODIFY `id_rekening` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `salesorder`
--
ALTER TABLE `salesorder`
  MODIFY `so_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1438;

--
-- AUTO_INCREMENT for table `salesorder_detail`
--
ALTER TABLE `salesorder_detail`
  MODIFY `sodetail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3660;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `setup_dealer`
--
ALTER TABLE `setup_dealer`
  MODIFY `dealer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `setup_itemunit`
--
ALTER TABLE `setup_itemunit`
  MODIFY `item_unitid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `setup_jasa`
--
ALTER TABLE `setup_jasa`
  MODIFY `id_setup_jasa` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setup_jobtype`
--
ALTER TABLE `setup_jobtype`
  MODIFY `jobtype_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `setup_ppn`
--
ALTER TABLE `setup_ppn`
  MODIFY `ppn_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setup_topcode`
--
ALTER TABLE `setup_topcode`
  MODIFY `top_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `setup_wostatus`
--
ALTER TABLE `setup_wostatus`
  MODIFY `wostatus_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `soinvoice`
--
ALTER TABLE `soinvoice`
  MODIFY `soinv_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1829;

--
-- AUTO_INCREMENT for table `soinvoice_detail`
--
ALTER TABLE `soinvoice_detail`
  MODIFY `soinvdetail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3622;

--
-- AUTO_INCREMENT for table `sumber_anggaran`
--
ALTER TABLE `sumber_anggaran`
  MODIFY `id_sumber` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5477;

--
-- AUTO_INCREMENT for table `temp_workorder`
--
ALTER TABLE `temp_workorder`
  MODIFY `tempwo_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_workorder_detail`
--
ALTER TABLE `temp_workorder_detail`
  MODIFY `tempwo_detail_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228151;

--
-- AUTO_INCREMENT for table `user_level`
--
ALTER TABLE `user_level`
  MODIFY `jabatan_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `woinvoice`
--
ALTER TABLE `woinvoice`
  MODIFY `woinv_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12296;

--
-- AUTO_INCREMENT for table `workorder`
--
ALTER TABLE `workorder`
  MODIFY `wo_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55059;

--
-- AUTO_INCREMENT for table `wo_teknisi`
--
ALTER TABLE `wo_teknisi`
  MODIFY `woteknisi_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
