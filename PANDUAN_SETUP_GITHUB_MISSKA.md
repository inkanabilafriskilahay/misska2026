# Panduan MISSKA v4.2 — GitHub Pages + Supabase

## A. Buat repository GitHub
1. Masuk ke GitHub dan buat repository baru, misalnya `misska`.
2. Pilih repository Public atau Private sesuai kebutuhan.
3. Upload:
   - `index.html`
   - `.nojekyll`
   - `README.md`
   - `MISSKA_v4_1_supabase_setup.sql`
   - `PANDUAN_SETUP_GITHUB_MISSKA.md`
   - `PANDUAN_MISSKA_v4_1_CLOUD_SYNC.md`

## B. Aktifkan GitHub Pages
Di repository:
1. Buka **Settings**.
2. Pilih **Pages**.
3. Pada **Build and deployment**, pilih **Deploy from a branch**.
4. Branch: `main`.
5. Folder: `/ (root)`.
6. Simpan.
7. Tunggu GitHub selesai menerbitkan situs.
8. URL biasanya berbentuk:
   `https://USERNAME.github.io/NAMA-REPOSITORY/`

## C. Aktifkan database cloud
Gunakan project Supabase yang sudah dibuat sebelumnya.
1. Buka SQL Editor.
2. Jalankan isi `MISSKA_v4_1_supabase_setup.sql`.
3. Pastikan Email/Password Auth aktif.
4. Ambil **Project URL** dan **Publishable/Anon Key**.
5. Jangan gunakan `service_role`/secret key di browser.

## D. Hubungkan MISSKA
Buka URL GitHub Pages.
Di menu pengaturan MISSKA, bagian **Cloud Sync**:
- Project URL = URL project Supabase.
- Publishable/Anon Key = key browser Supabase.
- ID Sinkronisasi = ID yang sama di semua perangkat, misalnya `guru-utama`.

Klik:
**Simpan Konfigurasi → Tes Koneksi**

## E. Pakai laptop dan HP
Laptop:
1. Login MISSKA.
2. Input/perbarui data.
3. Klik **Simpan & Sinkronkan**.

HP:
1. Buka URL GitHub Pages yang sama.
2. Login dengan akun MISSKA yang sama.
3. Masukkan konfigurasi cloud yang sama.
4. Klik **Ambil Data Cloud**.

## Catatan sinkronisasi
Versi ini menyimpan satu snapshot database MISSKA per akun + ID sinkronisasi.
Jangan mengedit data yang sama secara bersamaan di dua perangkat lalu melakukan sync bergantian, karena perubahan terakhir dapat menimpa snapshot sebelumnya.

## Jika GitHub Pages belum tampil
Pastikan `index.html` berada di root repository dan tunggu beberapa menit setelah mengaktifkan Pages.
