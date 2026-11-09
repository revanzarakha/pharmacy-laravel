# Sistem Informasi Apotek (Pharmacy E-Commerce)

Aplikasi web e-commerce apotek full-stack berbasis **Laravel 11**, **MySQL**, dan **Tailwind CSS**. Sistem ini menyediakan katalog obat/produk kesehatan, keranjang belanja, checkout transaksi dengan unggah bukti bayar, dan dashboard admin dengan otorisasi berbasis peran (**Spatie Permission**) untuk memisahkan hak akses antara pembeli (*buyer*) dan pemilik apotek (*owner*).

Proyek ini dibangun sebagai bagian dari kelas online / tugas akhir praktikum (2025).

---

## Fitur Utama

### Pengguna / Pembeli (Buyer)
- **Katalog & Pencarian**: Menjelajahi produk berdasarkan kategori (Diabetes, Fitness, Vitamins, Surgicals) atau kata kunci pencarian.
- **Detail Produk**: Informasi indikasi/deskripsi obat, harga, dan kategori.
- **Keranjang Belanja**: Tambah item ke keranjang dan kelola daftar belanjaan.
- **Checkout & Transaksi**: Pengisian alamat pengiriman, perhitungan otomatis subtotal, pajak PPN 11%, dan biaya kirim flat, serta unggah bukti pembayaran.
- **Riwayat Pesanan**: Melihat status transaksi (`is_paid`).

### Administrator / Pemilik (Owner)
- **Role-Based Access Control (RBAC)**: Otorisasi menggunakan Spatie Permission (`role:owner` vs `role:buyer`).
- **Kelola Produk (CRUD)**: Tambah produk dengan foto, ubah deskripsi dan harga, hapus produk.
- **Kelola Kategori (CRUD)**: Kelola kategori produk beserta ikonnya.
- **Kelola Pesanan**: Tinjau pesanan masuk, cek bukti pembayaran, dan konfirmasi status pembayaran.

---

## Teknologi

- **Backend**: PHP 8.2+, Laravel 11
- **Role & Permission**: `spatie/laravel-permission`
- **Database**: MySQL 8.0 / SQLite (testing)
- **Frontend**: Blade Templating, Tailwind CSS, Alpine.js, Flickity
- **Autentikasi**: Laravel Breeze

---

## Skema Basis Data

- `users`: Data pengguna (admin/owner & pembeli).
- `roles`, `permissions`, `model_has_roles`: Manajemen peran dari Spatie.
- `categories`: Kategori produk obat beserta slug dan ikon.
- `products`: Informasi obat (nama, slug, foto, deskripsi, harga, relasi kategori).
- `carts`: Keranjang belanja pengguna.
- `product_transactions`: Data transaksi pesanan, alamat pengiriman, total nominal, status bayar, dan bukti bayar.
- `transaction_details`: Relasi one-to-many produk yang dibeli per transaksi.

SQL dump skema dan data awal tersedia di [`database/pharmacy_schema_and_seed.sql`](database/pharmacy_schema_and_seed.sql).

---

## Panduan Instalasi Lokal

### Prasyarat
- PHP >= 8.2 (ekstensi: `pdo_mysql`, `mbstring`, `openssl`, `fileinfo`)
- Composer
- MySQL Server (Laragon / XAMPP)
- Node.js & NPM (opsional, untuk build frontend)

### Langkah Setup

```bash
# 1. Clone repositori
git clone https://github.com/revanzarakha/pharmacy-laravel.git
cd pharmacy-laravel

# 2. Install dependensi composer
composer install

# 3. Salin file environment & generate app key
cp .env.example .env
php artisan key:generate

# 4. Konfigurasi database di file .env
# Sesuaikan DB_DATABASE, DB_USERNAME, dan DB_PASSWORD

# 5. Jalankan migrasi & seeder peran
php artisan migrate --seed

# 6. Buat symbolic link untuk media storage
php artisan storage:link

# 7. Jalankan server lokal
php artisan serve
```

Aplikasi dapat diakses di `http://127.0.0.1:8000`.

---

## Akun Default (Hasil Seeder)

- **Role**: `owner`
- **Email**: `rakha@owner.com`
- **Password**: `123456`

---

## Lisensi & Portofolio

Proyek ini dikembangkan oleh **Rakha Revanza Putra Effendy** sebagai bagian dari portofolio personal.
Live Portfolio: [revanzarakha.github.io/Portfolio_RakhaRevanza](https://revanzarakha.github.io/Portfolio_RakhaRevanza/pharmacy.html)
