# 💇 Salon Booking — Aplikasi Booking/Reservasi Salon

Aplikasi desktop berbasis **Java Swing** untuk mengelola booking/reservasi pelanggan salon, terintegrasi dengan basis data **MySQL** melalui **XAMPP**. Dibangun menggunakan **NetBeans IDE**.

## Fitur

- Login Admin
- Booking pelanggan (nama, layanan, tanggal, status)
- CRUD Lengkap (Tambah, Lihat, Ubah, Hapus)
- Manajemen data layanan/treatment (tersimpan di database)
- Pantau status booking: Menunggu / Selesai / Batal

## Teknologi

| Komponen | Teknologi |
|---|---|
| Bahasa | Java (Swing) |
| IDE | NetBeans |
| Database | MySQL (via XAMPP) |
| Konektor DB | JDBC — MySQL Connector/J |

## Struktur Database

| Tabel | Keterangan |
|---|---|
| tb_user | Akun login admin |
| tb_layanan | Data layanan/treatment salon (nama, durasi, harga) |
| tb_booking | Data booking — no, nama_pelanggan, layanan (FK), tanggal, status |

## Cara Menjalankan

1. Nyalakan Apache & MySQL di XAMPP
2. Import database_salon.sql lewat phpMyAdmin
3. Download MySQL Connector/J, taruh di folder lib/
4. Buka project di NetBeans, tambahkan jar ke Libraries
5. Jalankan dengan F6
6. Login: admin / admin123

Panduan detail tersedia di BACA_SAYA.txt
