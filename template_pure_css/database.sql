-- Database: db_toko

CREATE DATABASE IF NOT EXISTS db_toko;
USE db_toko;

-- Tabel Users
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabel Kategori
CREATE TABLE IF NOT EXISTS kategori (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- Tabel Barang
CREATE TABLE IF NOT EXISTS barang (
  id INT AUTO_INCREMENT PRIMARY KEY,
  kode_barang VARCHAR(20) NOT NULL UNIQUE,
  nama_barang VARCHAR(150) NOT NULL,
  kategori VARCHAR(50) NOT NULL,
  harga_beli INT NOT NULL,
  harga_jual INT NOT NULL,
  stok INT NOT NULL DEFAULT 0,
  deskripsi TEXT NULL,
  foto VARCHAR(255) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Tabel Transaksi
CREATE TABLE IF NOT EXISTS transaksi (
  id INT AUTO_INCREMENT PRIMARY KEY,
  no_nota VARCHAR(30) NOT NULL UNIQUE,
  pelanggan VARCHAR(100) NOT NULL,
  total INT NOT NULL,
  status ENUM('Lunas', 'Proses', 'Batal') NOT NULL DEFAULT 'Lunas',
  tanggal DATE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


-- Data Dummy: Users (password default: admin123)
-- Hash bcrypt di bawah cocok dengan password_verify() di PHP
INSERT INTO users (nama, username, password) VALUES
('Administrator', 'admin', '$2y$10$4.o7e/Yqf0Jc2F0P1P2AqePqSZe.mN9/3YgT9K8VbTzL1Q2W3E4R5');

-- Data Dummy: Kategori
INSERT INTO kategori (nama_kategori) VALUES
('ATK'),
('Komputer'),
('Perlengkapan');

-- Data Dummy: Barang
INSERT INTO barang (kode_barang, nama_barang, kategori, harga_beli, harga_jual, stok, deskripsi, foto) VALUES
('BRG-001', 'Kertas HVS A4 75gsm PaperOne', 'ATK', 48000, 55000, 45, 'Kertas fotokopi 1 rim isi 500 lembar', NULL),
('BRG-002', 'Bolpoin Faster C600 Hitam', 'ATK', 22000, 28000, 12, 'Bolpoin 1 pack isi 12 pcs tinta hitam', NULL),
('BRG-003', 'Lakban Bening 2 Inch Daimaru', 'Perlengkapan', 11000, 15000, 2, 'Lakban perekat packing tebal 48mm', NULL),
('BRG-004', 'Tinta Printer Epson 664 Black', 'Komputer', 75000, 90000, 8, 'Tinta original Epson L series 70ml', NULL),
('BRG-005', 'Buku Kas Folio 100 Lembar', 'ATK', 18000, 24000, 0, 'Buku hard cover garis folio untuk pembukuan', NULL),
('BRG-006', 'Flashdisk Sandisk Cruzer Blade 32GB', 'Komputer', 45000, 60000, 15, 'Flashdisk USB 2.0 garansi resmi', NULL),
('BRG-007', 'Stapler Joyko HD-10', 'ATK', 12000, 16000, 20, 'Stapler kecil untuk isi no. 10', NULL),
('BRG-008', 'Gunting Sedang Joyko SC-838', 'Perlengkapan', 8000, 12000, 7, 'Gunting stainless steel serbaguna', NULL);

-- Data Dummy: Transaksi
INSERT INTO transaksi (no_nota, pelanggan, total, status, tanggal) VALUES
('TRX-20261001', 'Budi Santoso', 165000, 'Lunas', '2026-10-12'),
('TRX-20261002', 'Toko Maju Jaya', 850000, 'Lunas', '2026-10-13'),
('TRX-20261003', 'CV Mandiri', 1450000, 'Proses', '2026-10-14'),
('TRX-20261004', 'Dewi Sartika', 75000, 'Lunas', '2026-10-15');

