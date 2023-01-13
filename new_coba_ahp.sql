-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 13 Jan 2023 pada 18.46
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_coba_ahp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id` int(11) NOT NULL,
  `nama` char(50) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` varchar(13) DEFAULT NULL,
  `fax` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id`, `nama`, `alamat`, `telp`, `fax`) VALUES
(1, 'PT. Vita Pratama Abadi', 'Jl. Surya Permata III No.47 , Kebon Jeruk, Jakarta Barat	', '082244333188', '-'),
(2, 'Boss Grocery and Supplier', 'Jl. Bunga Raya, Pasar Baloi Persero No.19, Riau', '07784081888', '-'),
(3, 'PT. Jaya Fermex', 'Komp. Purimutiara. Jl. Griya Utama Blok A No.21 - 22, Sunter Agung, Jakarta', '02165310808', '02165310811'),
(4, 'Ariani Sundari', 'Jl. Raya Sukabumi Selatan No.23, Kebon Jeruk, Jakarta Barat', '08127107772', '-'),
(5, 'Raja Telur', 'Jl. Ketandan Wetan No.47, Yogyakarta', '087838649495', '0274562079'),
(6, 'CV. Sumber Berkat', 'Jl. Jenggolo 25 Kemirirejo, Magelang', '082137221459', '-'),
(7, 'Jasmine Fresh Fruit', 'Jl. Teuku Umar. Gg. Rajawali No.8,  Bali', '081338582494', '-'),
(8, 'PT. Palembang Batam Sejahtera', 'Taman Sari Hijau Blok B2 No.11, Tiban Baru Sekupang, Batam', '02158902147', '02158902148');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bobot_kriteria`
--

CREATE TABLE `bobot_kriteria` (
  `kriteria_1` int(11) NOT NULL,
  `kriteria_2` int(11) NOT NULL,
  `bobot` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bobot_kriteria`
--

INSERT INTO `bobot_kriteria` (`kriteria_1`, `kriteria_2`, `bobot`) VALUES
(1, 2, '1/3'),
(1, 3, '4/1'),
(1, 4, '1/1'),
(1, 5, '3/1'),
(2, 3, '3/1'),
(2, 4, '1/1'),
(2, 5, '1/1'),
(3, 4, '1/5'),
(3, 5, '1/3'),
(4, 5, '1/9');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_alternatif` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `periode` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL,
  `nama` char(50) DEFAULT NULL,
  `bobot` double DEFAULT NULL,
  `atribut` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`, `bobot`, `atribut`) VALUES
(1, 'Harga', 0.23988, 'Cost'),
(2, 'Kualitas Produk', 0.28084, 'Benefit'),
(3, 'Waktu Pengiriman', 0.05956, 'Cost'),
(4, 'Ketersediaan Barang', 0.26146, 'Benefit'),
(5, 'Kualitas Pelayanan', 0.15828, 'Benefit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `keterangan` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`id`, `keterangan`) VALUES
(1, 'Decision Maker'),
(2, 'Staff Entry'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `masuk`
--

CREATE TABLE `masuk` (
  `id` char(36) NOT NULL,
  `pengguna` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `masuk`
--

INSERT INTO `masuk` (`id`, `pengguna`) VALUES
('64e86b32-92a7-11ed-ab9a-6030d46c7138', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_alternatif`
--

CREATE TABLE `nilai_alternatif` (
  `alternatif` int(11) DEFAULT NULL,
  `kriteria` int(11) DEFAULT NULL,
  `nilai` double DEFAULT NULL,
  `periode` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai_alternatif`
--

INSERT INTO `nilai_alternatif` (`alternatif`, `kriteria`, `nilai`, `periode`) VALUES
(1, 1, 11500, '2022-07-13'),
(1, 2, 3, '2022-07-13'),
(1, 3, 1, '2022-07-13'),
(1, 4, 3, '2022-07-13'),
(1, 5, 4, '2022-07-13'),
(2, 1, 27000, '2022-07-13'),
(2, 2, 4, '2022-07-13'),
(2, 3, 6, '2022-07-13'),
(2, 4, 4, '2022-07-13'),
(2, 5, 5, '2022-07-13'),
(3, 1, 39000, '2022-07-13'),
(3, 2, 4, '2022-07-13'),
(3, 3, 2, '2022-07-13'),
(3, 4, 4, '2022-07-13'),
(3, 5, 5, '2022-07-13'),
(4, 1, 23300, '2022-07-13'),
(4, 2, 4, '2022-07-13'),
(4, 3, 3, '2022-07-13'),
(4, 4, 4, '2022-07-13'),
(4, 5, 3, '2022-07-13'),
(5, 1, 21000, '2022-07-13'),
(5, 2, 4, '2022-07-13'),
(5, 3, 2, '2022-07-13'),
(5, 4, 4, '2022-07-13'),
(5, 5, 4, '2022-07-13'),
(6, 1, 24500, '2022-07-13'),
(6, 2, 3, '2022-07-13'),
(6, 3, 7, '2022-07-13'),
(6, 4, 3, '2022-07-13'),
(6, 5, 5, '2022-07-13'),
(7, 1, 21000, '2022-07-13'),
(7, 2, 5, '2022-07-13'),
(7, 3, 5, '2022-07-13'),
(7, 4, 4, '2022-07-13'),
(7, 5, 5, '2022-07-13'),
(8, 1, 16000, '2022-07-13'),
(8, 2, 5, '2022-07-13'),
(8, 3, 3, '2022-07-13'),
(8, 4, 3, '2022-07-13'),
(8, 5, 5, '2022-07-13'),
(2, 1, 20000, '2023-01-24'),
(2, 2, 23, '2023-01-24'),
(2, 3, 2333, '2023-01-24'),
(2, 4, 22, '2023-01-24'),
(2, 5, 2333, '2023-01-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `username` char(50) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `nama` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`username`, `password`, `level`, `nama`) VALUES
('admin', 'ac9689e2272427085e35b9d3e3e8bed88cb3434828b43b86fc0596cad4c6e270', 4, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD KEY `kriteria_1` (`kriteria_1`),
  ADD KEY `kriteria_2` (`kriteria_2`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_alternatif`,`periode`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `masuk`
--
ALTER TABLE `masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `masuk_ibfk_1` (`pengguna`);

--
-- Indeks untuk tabel `nilai_alternatif`
--
ALTER TABLE `nilai_alternatif`
  ADD KEY `alternatif` (`alternatif`),
  ADD KEY `kriteria` (`kriteria`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`username`),
  ADD KEY `level` (`level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_1` FOREIGN KEY (`kriteria_1`) REFERENCES `kriteria` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_2` FOREIGN KEY (`kriteria_2`) REFERENCES `kriteria` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `masuk`
--
ALTER TABLE `masuk`
  ADD CONSTRAINT `masuk_ibfk_1` FOREIGN KEY (`pengguna`) REFERENCES `pengguna` (`username`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `nilai_alternatif`
--
ALTER TABLE `nilai_alternatif`
  ADD CONSTRAINT `nilai_alternatif_ibfk_1` FOREIGN KEY (`alternatif`) REFERENCES `alternatif` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_alternatif_ibfk_2` FOREIGN KEY (`kriteria`) REFERENCES `kriteria` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`level`) REFERENCES `level` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
