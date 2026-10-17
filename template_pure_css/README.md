# Template Pure CSS - Latihan CRUD PHP

Template HTML dasar menggunakan **100% CSS Murni (Vanilla CSS)** tanpa framework (tanpa Tailwind dan tanpa Bootstrap). Sangat cocok untuk memahami konsep dasar styling, responsive web, dan integrasi PHP Native.

## Daftar File

- `login.html` : Halaman login
- `register.html` : Halaman pendaftaran user baru
- `dashboard.html` : Dashboard utama dengan ringkasan statistik
- `products.html` : Tabel data barang lengkap dengan modal tambah, edit, dan hapus
- `product-form.html` : Form barang halaman penuh (untuk tambah.php atau edit.php)
- `style.css` : Seluruh style komponen dan layout murni
- `database.sql` : Struktur database MySQL dan data dummy

## Catatan Pengerjaan untuk Siswa

1. **Atribut `name` pada Form**:
   Semua tag input, select, dan textarea pada template ini sengaja belum memiliki atribut `name`. Tambahkan atribut `name` sesuai nama field di tabel `barang`:
   ```html
   <input type="text" name="nama_barang" id="nama_produk" class="form-input">
   ```

2. **Tanpa Ketergantungan Internet (Offline Ready)**:
   Template ini dapat dibuka langsung secara offline tanpa koneksi internet karena tidak memuat CDN eksternal apapun.

