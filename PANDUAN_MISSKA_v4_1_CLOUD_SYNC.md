# MISSKA v4.1 — Cloud Sync

## 1. Buat project Supabase
Buat project baru di Supabase.

## 2. Jalankan SQL
Buka SQL Editor, tempel seluruh isi `MISSKA_v4_1_supabase_setup.sql`, lalu Run.

## 3. Aktifkan Email/Password
Di Supabase Authentication, aktifkan provider Email.
Jika ingin login langsung tanpa verifikasi email untuk tahap awal, matikan Confirm email.
Untuk penggunaan nyata, lebih baik email verification tetap aktif.

## 4. Ambil URL dan key
Dari Project API Settings, ambil:
- Project URL
- Publishable key (`sb_publishable_...`) atau legacy `anon` key

Jangan pernah memakai `service_role` / secret key di HTML.

## 5. Di MISSKA
Buka Pengaturan > Cloud Sync:
- Supabase Project URL
- Supabase Publishable / Anon Key
- ID Sinkronisasi, misalnya `guru-firhan`

Klik:
1. Simpan Konfigurasi
2. Tes Koneksi
3. Simpan & Sinkronkan

## 6. Di HP
Buka MISSKA versi yang sama.
Login memakai email/password MISSKA yang sama.
Masukkan URL + key yang sama dan ID Sinkronisasi yang sama.
Klik `Tes Koneksi`, lalu `Ambil Data Cloud`.

## Cara kerja
Laptop:
  isi nilai -> Simpan & Sinkronkan -> Cloud

HP:
  buka -> Ambil Data Cloud -> data laptop muncul

Jika offline:
  MISSKA tetap menyimpan data lokal.
Saat internet kembali, perubahan lokal ditandai untuk sinkronisasi.

## Penting
- `ID Sinkronisasi` bukan password.
- Untuk keamanan, data cloud dibatasi dengan Supabase Auth + Row Level Security.
- Jika dua perangkat mengubah data yang sama secara bersamaan, gunakan `Simpan & Sinkronkan` setelah perubahan terakhir. Versi ini memakai model snapshot: sinkronisasi terakhir dapat menggantikan snapshot sebelumnya.
- Backup JSON MISSKA tetap disarankan.
