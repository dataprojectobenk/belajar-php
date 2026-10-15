# Template V1 - Latihan CRUD PHP

Template HTML dasar untuk latihan membuat aplikasi kasir atau inventaris toko menggunakan PHP Native dan MySQL.

## Daftar File

- `login.html` : Halaman login
- `register.html` : Halaman daftar akun baru
- `dashboard.html` : Dashboard utama dengan ringkasan statistik
- `products.html` : Tabel data barang lengkap dengan modal tambah, edit, dan hapus
- `product-form.html` : Alternatif form barang halaman penuh (untuk tambah.php atau edit.php)
- `style.css` : File CSS utama komponen (tombol, input, tabel, card, badge)
- `database.sql` : Struktur tabel dan data dummy MySQL

## Cara Import Database

1. Buka phpMyAdmin (`http://localhost/phpmyadmin`).
2. Buat database baru bernama `db_toko` atau langsung gunakan menu **Import**.
3. Pilih file `database.sql`, lalu klik **Kirim / Go**.
4. Database siap dihubungkan dengan script PHP koneksi (`mysqli_connect`).

## Catatan Pengerjaan untuk Siswa

1. **Atribut `name` pada Form**
   Semua tag input, select, dan textarea pada template ini sengaja belum diberi atribut `name`. Silakan tambahkan atribut `name` sesuai nama field di tabel `barang`:
   - `kode_barang`
   - `nama_barang`
   - `kategori`
   - `harga_beli`
   - `harga_jual`
   - `stok`
   - `deskripsi`
   - `foto`

2. **Pemisahan File (Modular)**
   Untuk mempermudah maintenance, potong bagian yang berulang menjadi file include:
   - `header.php` (tag `<head>`, navbar atas)
   - `sidebar.php` (menu samping)
   - `footer.php` (copyright dan penutup script)

3. **Daftar Class CSS Siap Pakai**
   - **Tombol**: `.btn`, `.btn-primary`, `.btn-outline`, `.btn-danger`, `.btn-secondary`, `.btn-sm`
   - **Form**: `.form-group`, `.form-label`, `.form-input`, `.form-select`, `.form-textarea`
   - **Tabel**: `.table-responsive`, `.table`, `.table-th`, `.table-td`
   - **Status & Info**: `.badge-success`, `.badge-warning`, `.badge-danger`, `.alert-success`, `.alert-danger`
