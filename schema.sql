-- Lise Cozinha: cole TUDO isto no Supabase (SQL Editor) e clique em Run.
create table if not exists public.kv (
  key text primary key,
  value jsonb not null,
  by text,
  updated_at timestamptz not null default now()
);
alter table public.kv enable row level security;
drop policy if exists "usuarias logadas" on public.kv;
create policy "usuarias logadas" on public.kv for all to authenticated using (true) with check (true);
alter publication supabase_realtime add table public.kv;
