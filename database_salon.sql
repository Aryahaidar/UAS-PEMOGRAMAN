-- =====================================================
-- DATABASE: db_salon
-- Aplikasi: Booking / Reservasi Salon
-- Tools: XAMPP (MySQL/MariaDB) + phpMyAdmin
-- =====================================================

CREATE DATABASE IF NOT EXISTS db_salon;
USE db_salon;

-- =====================================================
-- TABEL 1: tb_user
-- Untuk menyimpan akun login admin/kasir
-- =====================================================
CREATE TABLE tb_user (
    id_user INT(11) NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    level VARCHAR(20) NOT NULL DEFAULT 'admin',
    PRIMARY KEY (id_user),
    UNIQUE KEY username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data default untuk login (username: admin, password: admin123)
INSERT INTO tb_user (username, password, level) VALUES
('admin', 'admin123', 'admin');

-- =====================================================
-- TABEL 2: tb_layanan
-- Untuk menyimpan data layanan/treatment salon
-- =====================================================
CREATE TABLE tb_layanan (
    id_layanan INT(11) NOT NULL AUTO_INCREMENT,
    nama_layanan VARCHAR(100) NOT NULL,
    durasi_menit INT(11) NOT NULL DEFAULT 30,
    harga DECIMAL(10,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_layanan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Contoh data layanan
INSERT INTO tb_layanan (nama_layanan, durasi_menit, harga) VALUES
('Potong Rambut', 30, 50000),
('Creambath', 60, 100000),
('Manicure & Pedicure', 45, 80000),
('Smoothing Rambut', 120, 350000),
('Facial Wajah', 60, 150000);

-- =====================================================
-- TABEL 3: tb_booking
-- Tabel utama: no, nama pelanggan, layanan, tanggal, status
-- =====================================================
CREATE TABLE tb_booking (
    no INT(11) NOT NULL AUTO_INCREMENT,
    nama_pelanggan VARCHAR(100) NOT NULL,
    id_layanan INT(11) NOT NULL,
    tanggal_booking DATE NOT NULL,
    status_booking ENUM('Menunggu','Selesai','Batal') NOT NULL DEFAULT 'Menunggu',
    tanggal_input DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (no),
    KEY fk_layanan (id_layanan),
    CONSTRAINT fk_booking_layanan FOREIGN KEY (id_layanan)
        REFERENCES tb_layanan (id_layanan)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Contoh data booking
INSERT INTO tb_booking (nama_pelanggan, id_layanan, tanggal_booking, status_booking) VALUES
('Siti Aminah', 1, '2026-07-01', 'Menunggu'),
('Rina Wijaya', 2, '2026-07-02', 'Selesai'),
('Dewi Lestari', 4, '2026-07-03', 'Menunggu');

-- =====================================================
-- VIEW (opsional, untuk mempermudah tampilan JOIN)
-- Menampilkan: no, nama_pelanggan, nama_layanan, tanggal, status
-- =====================================================
CREATE OR REPLACE VIEW v_booking_salon AS
SELECT
    b.no,
    b.nama_pelanggan,
    l.nama_layanan AS layanan,
    b.tanggal_booking,
    b.status_booking,
    b.id_layanan
FROM tb_booking b
JOIN tb_layanan l ON b.id_layanan = l.id_layanan;
