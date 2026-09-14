# MISSKA v4.2 — GitHub Pages + Cloud Sync

MISSKA (Manajemen Kelas & Nilai Guru) versi web yang dapat dijalankan dari GitHub Pages.
Data tetap disimpan lokal pada perangkat dan dapat disinkronkan ke Supabase agar laptop dan HP dapat memakai data yang sama.

## Struktur
- `index.html` — aplikasi MISSKA.
- `MISSKA_v4_1_supabase_setup.sql` — SQL untuk membuat tabel + RLS di Supabase.
- `PANDUAN_SETUP_GITHUB_MISSKA.md` — panduan lengkap publikasi GitHub Pages dan cloud sync.
- `.nojekyll` — membantu GitHub Pages menyajikan file statis apa adanya.

## Penting
Jangan pernah memasukkan `service_role` atau secret key Supabase ke HTML.
Untuk aplikasi browser, gunakan Publishable/Anon Key dengan RLS aktif.

## Alur penggunaan
1. Upload seluruh isi folder ini ke repository GitHub.
2. Aktifkan GitHub Pages dari branch utama (`main`) dan folder `/root`.
3. Buka URL GitHub Pages yang diberikan GitHub.
4. Di MISSKA, isi Project URL + Publishable/Anon Key + ID Sinkronisasi.
5. Tes koneksi.
6. Gunakan **Simpan & Sinkronkan** di laptop dan **Ambil Data Cloud** di HP.
