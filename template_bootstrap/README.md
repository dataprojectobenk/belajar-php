# Template Bootstrap 5 - Latihan CRUD PHP

Template HTML dasar menggunakan **Bootstrap 5 (CDN)** dipadukan dengan `style.css` untuk layout admin panel. Sangat cocok untuk latihan membuat aplikasi web PHP dengan tampilan standar industri yang rapi dan responsif.

## Daftar File

- `login.html` : Halaman login
- `register.html` : Halaman pendaftaran akun
- `dashboard.html` : Dashboard ringkasan stok dan statistik transaksi
- `products.html` : Tabel data barang lengkap dengan modal Bootstrap (tambah, edit, konfirmasi hapus)
- `product-form.html` : Formulir barang halaman penuh (alternatif untuk form tambah / edit barang)
- `style.css` : Kustomisasi sidebar, topbar, dan wrapper layout
- `database.sql` : Skema tabel MySQL (`users`, `barang`, `kategori`, `transaksi`) dan data dummy

## Catatan Pengerjaan untuk Siswa

1. **Atribut `name` pada Form**:
   Semua tag `<input>`, `<select>`, dan `<textarea>` pada template ini sengaja dikosongkan atribut `name`-nya. Silakan isi atribut `name` sesuai kolom database yang akan diproses di script PHP (misalnya `$_POST['nama_barang']`):
   ```html
   <input type="text" name="nama_barang" id="nama_produk" class="form-control" required>
   ```

2. **Komponen Modal & Interaktivitas**:
   Halaman `products.html` menggunakan modal bawaan Bootstrap 5 via atribut data (`data-bs-toggle="modal"` dan `data-bs-target="#modalId"`), sehingga tidak memerlukan library JavaScript pihak ketiga.

3. **Koneksi CDN**:
   Template ini menggunakan Bootstrap 5 via jsDelivr CDN. Pastikan terdapat koneksi internet saat pertama kali membuka halaman untuk memuat CSS dan JS Bootstrap.

