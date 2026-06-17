/* ============================================================
   KONFIGURASI — isi nilai di bawah, lalu simpan.
   index.html otomatis membaca file ini. Tidak perlu sentuh index.html.

   Ambil dua nilai pertama dari dashboard Supabase:
   Project Settings (ikon gerigi) -> API
     • SUPABASE_URL      = "Project URL"      (contoh: https://abcd1234.supabase.co)
     • SUPABASE_ANON_KEY = key baris "anon public" (panjang, mulai "eyJ...")

   Catatan:
   - JANGAN pakai key "service_role". Cukup "anon".
   - anon key aman tampil di web; keamanan dijaga RLS (lihat supabase-setup.sql).
   - Username/password akun Supabase TIDAK dipakai di sini —
     itu hanya untuk login ke dashboard supabase.com.
   ============================================================ */
window.APP_CONFIG = {
  SUPABASE_URL: 'https://vvehlssdwgazkcqzvkup.supabase.co',
  SUPABASE_ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ2ZWhsc3Nkd2dhemtjcXp2a3VwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODE2Mzc4ODIsImV4cCI6MjA5NzIxMzg4Mn0.zHe_Foyz3bwj4XGMjAAFVrPw_R2xwSGTF7szoMX9ZPg',
  DATASET_URL: './data.json'
};