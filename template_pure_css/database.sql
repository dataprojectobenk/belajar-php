-- Database: db_toko
CREATE DATABASE IF NOT EXISTS db_toko;
USE db_toko;

-- ===================================================
-- 1. Tabel Users (Model: User)
-- ===================================================
CREATE TABLE IF NOT EXISTS users (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  remember_token VARCHAR(100) NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================================
-- 2. Tabel Kategoris (Model: Kategori)
-- ===================================================
CREATE TABLE IF NOT EXISTS kategoris (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(50) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================================
-- 3. Tabel Barangs (Model: Barang)
-- ===================================================
CREATE TABLE IF NOT EXISTS barangs (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  kategori_id BIGINT UNSIGNED NOT NULL,
  kode_barang VARCHAR(30) NOT NULL UNIQUE,
  nama_barang VARCHAR(150) NOT NULL,
  harga_beli DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  harga_jual DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  stok INT NOT NULL DEFAULT 0,
  deskripsi TEXT NULL,
  foto VARCHAR(255) NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_barangs_kategori FOREIGN KEY (kategori_id) REFERENCES kategoris(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================================
-- 4. Tabel Transaksis (Model: Transaksi)
-- ===================================================
CREATE TABLE IF NOT EXISTS transaksis (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NULL,
  no_nota VARCHAR(50) NOT NULL UNIQUE,
  pelanggan VARCHAR(100) NOT NULL,
  total DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  status ENUM('Lunas', 'Proses', 'Batal') NOT NULL DEFAULT 'Lunas',
  tanggal DATE NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_transaksis_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ===================================================
-- 5. Tabel Detail Transaksis (Model: DetailTransaksi)
-- ===================================================
CREATE TABLE IF NOT EXISTS detail_transaksis (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  transaksi_id BIGINT UNSIGNED NOT NULL,
  barang_id BIGINT UNSIGNED NOT NULL,
  jumlah INT NOT NULL DEFAULT 1,
  harga DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  subtotal DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_detail_transaksi FOREIGN KEY (transaksi_id) REFERENCES transaksis(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_detail_barang FOREIGN KEY (barang_id) REFERENCES barangs(id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ===================================================
-- SAMPLE DATA (DUMMY DATA)
-- ===================================================

-- 1. Sample Data: Users
INSERT INTO users (nama, username, email, password, remember_token) VALUES
('Administrator', 'admin', 'admin@toko.com', '$2y$10$4.o7e/Yqf0Jc2F0P1P2AqePqSZe.mN9/3YgT9K8VbTzL1Q2W3E4R5', NULL),
('Kasir Utama', 'kasir1', 'kasir1@toko.com', '$2y$10$4.o7e/Yqf0Jc2F0P1P2AqePqSZe.mN9/3YgT9K8VbTzL1Q2W3E4R5', NULL);

-- 2. Sample Data: Kategoris
INSERT INTO kategoris (nama_kategori) VALUES
('ATK'),
('Komputer'),
('Perlengkapan'),
('Aksesoris');

-- 3. Sample Data: Barangs
INSERT INTO barangs (kategori_id, kode_barang, nama_barang, harga_beli, harga_jual, stok, deskripsi, foto) VALUES
(1, 'BRG-001', 'Kertas HVS A4 75gsm PaperOne', 48000.00, 55000.00, 45, 'Kertas fotokopi 1 rim isi 500 lembar', NULL),
(1, 'BRG-002', 'Bolpoin Faster C600 Hitam', 22000.00, 28000.00, 12, 'Bolpoin 1 pack isi 12 pcs tinta hitam', NULL),
(3, 'BRG-003', 'Lakban Bening 2 Inch Daimaru', 11000.00, 15000.00, 25, 'Lakban perekat packing tebal 48mm', NULL),
(2, 'BRG-004', 'Tinta Printer Epson 664 Black', 75000.00, 90000.00, 8, 'Tinta original Epson L series 70ml', NULL),
(1, 'BRG-005', 'Buku Kas Folio 100 Lembar', 18000.00, 24000.00, 15, 'Buku hard cover garis folio untuk pembukuan', NULL),
(2, 'BRG-006', 'Flashdisk Sandisk Cruzer Blade 32GB', 45000.00, 60000.00, 10, 'Flashdisk USB 2.0 garansi resmi', NULL),
(1, 'BRG-007', 'Stapler Joyko HD-10', 12000.00, 16000.00, 20, 'Stapler kecil untuk isi no. 10', NULL),
(3, 'BRG-008', 'Gunting Sedang Joyko SC-838', 8000.00, 12000.00, 7, 'Gunting stainless steel serbaguna', NULL);

-- 4. Sample Data: Transaksis
INSERT INTO transaksis (user_id, no_nota, pelanggan, total, status, tanggal) VALUES
(1, 'TRX-20261001', 'Budi Santoso', 165000.00, 'Lunas', '2026-10-12'),
(2, 'TRX-20261002', 'Toko Maju Jaya', 270000.00, 'Lunas', '2026-10-13'),
(1, 'TRX-20261003', 'CV Mandiri', 149000.00, 'Proses', '2026-10-14'),
(2, 'TRX-20261004', 'Dewi Sartika', 88000.00, 'Lunas', '2026-10-15');

-- 5. Sample Data: Detail Transaksis
-- Transaksi 1: 3x Kertas HVS (3 x 55.000 = 165.000)
INSERT INTO detail_transaksis (transaksi_id, barang_id, jumlah, harga, subtotal) VALUES
(1, 1, 3, 55000.00, 165000.00);

-- Transaksi 2: 3x Tinta Epson (3 x 90.000 = 270.000)
INSERT INTO detail_transaksis (transaksi_id, barang_id, jumlah, harga, subtotal) VALUES
(2, 4, 3, 90000.00, 270000.00);

-- Transaksi 3: 2x Bolpoin Faster (56.000) + 2x Buku Kas (48.000) + 3x Lakban Daimaru (45.000) = 149.000
INSERT INTO detail_transaksis (transaksi_id, barang_id, jumlah, harga, subtotal) VALUES
(3, 2, 2, 28000.00, 56000.00),
(3, 5, 2, 24000.00, 48000.00),
(3, 3, 3, 15000.00, 45000.00);

-- Transaksi 4: 1x Flashdisk Sandisk (60.000) + 1x Bolpoin Faster (28.000) = 88.000
INSERT INTO detail_transaksis (transaksi_id, barang_id, jumlah, harga, subtotal) VALUES
(4, 6, 1, 60000.00, 60000.00),
(4, 2, 1, 28000.00, 28000.00);
