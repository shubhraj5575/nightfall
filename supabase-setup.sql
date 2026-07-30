-- Nightfall · sync schema
-- Paste this whole file into Supabase → SQL Editor → New query → Run.
-- Safe to run more than once.

create table if not exists public.entries (
  user_id    uuid        not null references auth.users(id) on delete cascade,
  date       text        not null,              -- 'YYYY-MM-DD' (local date key)
  data       jsonb       not null,              -- the whole entry object
  updated_at timestamptz not null default now(),
  primary key (user_id, date)
);

create table if not exists public.weeks (
  user_id    uuid        not null references auth.users(id) on delete cascade,
  week       text        not null,              -- '2026-W31'
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, week)
);

-- Row Level Security: every query is automatically filtered to the signed-in
-- user. Without this, one account could read another's journal.
alter table public.entries enable row level security;
alter table public.weeks   enable row level security;

drop policy if exists "own entries" on public.entries;
create policy "own entries" on public.entries
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

drop policy if exists "own weeks" on public.weeks;
create policy "own weeks" on public.weeks
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
