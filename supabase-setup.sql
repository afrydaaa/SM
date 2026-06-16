-- =============================================================
--  QA Pairs Verification — Supabase setup
--  Cara pakai:
--   1. Buka proyek Supabase kamu -> menu "SQL Editor" -> "New query"
--   2. Tempel SELURUH isi file ini, klik "Run"
--   3. Salin Project URL + anon key dari Project Settings -> API
--      ke bagian CONFIG di index.html
-- =============================================================

-- 1) Tabel anotasi. qa_id jadi PRIMARY KEY => satu QA hanya bisa
--    dinilai SATU kali. Inilah yang mengunci data secara permanen.
create table if not exists public.annotations (
  qa_id                       text primary key,
  item_id                     text not null,
  document                    text,
  page                        int,
  query                       text,
  answer                      text,
  category                    text,
  source_pages                text,           -- contoh: "4|6"
  is_multi_page               boolean default false,
  c_query_clarity             text,           -- pass | fail | na
  c_answer_correctness        text,
  c_category_appropriateness  text,
  c_multipage_correctness     text,
  decision                    text not null,  -- retain | revise | discard
  revised_query               text,
  revised_answer              text,
  revised_category            text,
  notes                       text,
  annotator                   text not null,
  created_at                  timestamptz not null default now()
);

create index if not exists annotations_item_idx on public.annotations (item_id);

-- 2) Aktifkan Row Level Security
alter table public.annotations enable row level security;

-- 3) Kebijakan akses untuk pengunjung anonim (tanpa login).
--    - boleh BACA semua (agar lock terlihat oleh semua annotator)
--    - boleh INSERT (menyimpan penilaian baru)
--    - TIDAK ada policy UPDATE / DELETE  => keduanya otomatis DITOLAK,
--      jadi data yang sudah masuk tidak bisa diubah / dihapus dari web.
drop policy if exists "read all"    on public.annotations;
drop policy if exists "insert only" on public.annotations;

create policy "read all"
  on public.annotations for select
  to anon, authenticated
  using (true);

create policy "insert only"
  on public.annotations for insert
  to anon, authenticated
  with check (true);

-- Selesai. Untuk melihat hasil kapan saja: Table Editor -> annotations,
-- atau Export ke CSV langsung dari Supabase.
