-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2019 at 08:41 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lis_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `tm_item_pemeriksaan`
--

CREATE TABLE `tm_item_pemeriksaan` (
  `TestID` varchar(10) NOT NULL,
  `TestIDParent` varchar(10) NOT NULL,
  `IsParent` int(1) NOT NULL,
  `isChild` int(1) NOT NULL,
  `NameTest` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tm_item_pemeriksaan`
--

INSERT INTO `tm_item_pemeriksaan` (`TestID`, `TestIDParent`, `IsParent`, `isChild`, `NameTest`) VALUES
('00001', '', 1, 0, 'HEMATOLOGI'),
('00002', '00001', 0, 0, 'Darah Lengkap'),
('00003', '00001', 0, 0, 'Darah Rutin'),
('00004', '00001', 1, 1, 'Hemoglobin'),
('00005', '00001', 1, 0, 'Hitung jumlah sel'),
('00006', '00001', 0, 1, 'Leukosit'),
('00007', '00001', 0, 1, 'Eritrosit'),
('00008', '00001', 0, 1, 'Trombosit'),
('00009', '00001', 0, 1, 'Eosinofil'),
('00010', '00001', 0, 1, 'Retikulosit');

-- --------------------------------------------------------

--
-- Table structure for table `tm_kunjungan_pasien`
--

CREATE TABLE `tm_kunjungan_pasien` (
  `RegistrationNo` varchar(50) NOT NULL COMMENT 'Nomor kunjungan pasien',
  `MedicalRecordNo` varchar(20) NOT NULL COMMENT 'Rekam Medis Pasien',
  `OrderControl` varchar(2) NOT NULL COMMENT 'NW : New,RP:Replace,CA:Cancel',
  `AlternatePatientID` varchar(50) NOT NULL COMMENT 'Nomor Kunjungan Lainnya',
  `PatientName` varchar(100) NOT NULL COMMENT 'nama Pasien',
  `PatientAddress` varchar(200) NOT NULL COMMENT 'Alamat pasien',
  `PatientType` varchar(2) NOT NULL COMMENT 'IP:Pasien Rawat Inap,OP:Pasien Rawat Jalan',
  `BirthDate` date NOT NULL COMMENT 'tanggal lahir pasien',
  `Sex` int(11) NOT NULL COMMENT '1:Laki-laki,2:Perempuan',
  `HISOrderNumber` varchar(20) NOT NULL COMMENT 'Order Nomor dari SIMRS',
  `LabNumber` varchar(20) NOT NULL COMMENT 'Order Bukti Pemeriksaan Laboratorium',
  `OrderDate` datetime NOT NULL COMMENT 'Tanggal Order',
  `UnitCode` varchar(5) NOT NULL COMMENT 'Kode unit poliklinik atau rwat inap',
  `UnitName` varchar(100) NOT NULL COMMENT 'Nama unit poliklinik atau ruang rawat inap',
  `ClinicianCode` varchar(10) NOT NULL COMMENT 'Code petugas atau dokter order',
  `ClinicianName` varchar(100) NOT NULL COMMENT 'nama petugas atau dokter order',
  `RoomNo` varchar(6) NOT NULL COMMENT 'Nomor ruang untuk pasien rawat inap',
  `Priority` varchar(1) NOT NULL COMMENT 'U:urgent/Cito, R:Rutin',
  `PaymentStatus` int(11) NOT NULL COMMENT '0:belum bayar,9:lunas',
  `Comment` varchar(255) NOT NULL COMMENT 'keterangan',
  `VisitNo` int(11) NOT NULL COMMENT 'Jumlah Kunjungan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tm_kunjungan_pasien`
--

INSERT INTO `tm_kunjungan_pasien` (`RegistrationNo`, `MedicalRecordNo`, `OrderControl`, `AlternatePatientID`, `PatientName`, `PatientAddress`, `PatientType`, `BirthDate`, `Sex`, `HISOrderNumber`, `LabNumber`, `OrderDate`, `UnitCode`, `UnitName`, `ClinicianCode`, `ClinicianName`, `RoomNo`, `Priority`, `PaymentStatus`, `Comment`, `VisitNo`) VALUES
('RG20190909000001', '9999999', '1', '00000000', 'Teguh Susanto', 'Jl. Kaliurang Km 12 No 123 Ngagglik Sleman', 'IN', '1978-04-23', 1, 'TR20190909000001', 'LAB20190909000001', '2019-09-09 00:00:00', '2', 'Poliklinik Penyakit Dalam', '23', 'dr. Indra Hasibuan SPPD', '12', '1', 0, '', 1),
('RG20190910000002', '000002', '1', '', 'Gunawan Cisco Putra', 'Jl. Kemangi No 124 Condong Catur,Depok Sleman', '1', '1980-08-09', 1, 'TR20190909000002', 'LAB20190909000002', '2019-09-10 00:00:00', '02', 'Poliklinik Umum', '45', 'dr Dody', '1', '1', 0, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tm_sub_item_pemeriksaan`
--

CREATE TABLE `tm_sub_item_pemeriksaan` (
  `TestID` varchar(10) NOT NULL,
  `TestIDParent` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tm_sub_item_pemeriksaan`
--

INSERT INTO `tm_sub_item_pemeriksaan` (`TestID`, `TestIDParent`) VALUES
('00004', '00002'),
('00006', '00002'),
('00007', '00002'),
('00008', '00002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tm_item_pemeriksaan`
--
ALTER TABLE `tm_item_pemeriksaan`
  ADD PRIMARY KEY (`TestID`);

--
-- Indexes for table `tm_sub_item_pemeriksaan`
--
ALTER TABLE `tm_sub_item_pemeriksaan`
  ADD PRIMARY KEY (`TestIDParent`,`TestID`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
