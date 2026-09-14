-- MISSKA v4.1 — Supabase Cloud Sync
-- Jalankan seluruh script ini di Supabase Dashboard > SQL Editor.
-- Script membuat satu tabel cloud untuk menyimpan snapshot database MISSKA per akun + workspace.
-- Jangan pernah memasukkan service_role/secret key ke file HTML.

create table if not exists public.misska_cloud (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  workspace_id text not null,
  user_email text,
  payload jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  created_at timestamptz not null default now(),
  unique (owner_id, workspace_id)
);

alter table public.misska_cloud enable row level security;

revoke all on table public.misska_cloud from anon, authenticated;
grant select, insert, update, delete on table public.misska_cloud to authenticated;

drop policy if exists "MISSKA select own data" on public.misska_cloud;
create policy "MISSKA select own data"
on public.misska_cloud
for select
to authenticated
using ((select auth.uid()) = owner_id);

drop policy if exists "MISSKA insert own data" on public.misska_cloud;
create policy "MISSKA insert own data"
on public.misska_cloud
for insert
to authenticated
with check ((select auth.uid()) = owner_id);

drop policy if exists "MISSKA update own data" on public.misska_cloud;
create policy "MISSKA update own data"
on public.misska_cloud
for update
to authenticated
using ((select auth.uid()) = owner_id)
with check ((select auth.uid()) = owner_id);

drop policy if exists "MISSKA delete own data" on public.misska_cloud;
create policy "MISSKA delete own data"
on public.misska_cloud
for delete
to authenticated
using ((select auth.uid()) = owner_id);

-- Opsional: index untuk pencarian workspace milik akun.
create index if not exists idx_misska_cloud_owner_workspace
on public.misska_cloud(owner_id, workspace_id);

-- Catatan:
-- 1. Gunakan Publishable key (sb_publishable_...) atau legacy anon key di browser.
-- 2. JANGAN gunakan service_role/secret key di HTML.
-- 3. Supabase Auth harus mengizinkan Email/Password.
-- 4. Jika Email confirmation aktif, akun cloud perlu memverifikasi email
--    sebelum sinkronisasi pertama berhasil.
