-- Lise Cozinha: cole TUDO isto no Supabase (SQL Editor) e clique em Run.
-- Pode rodar quantas vezes quiser: nada é apagado e nada dá erro se já existir.

-- 1) Dados do sistema
create table if not exists public.kv (
  key text primary key,
  value jsonb not null,
  by text,
  updated_at timestamptz not null default now()
);
alter table public.kv enable row level security;
drop policy if exists "usuarias logadas" on public.kv;
create policy "usuarias logadas" on public.kv for all to authenticated using (true) with check (true);

-- 2) Respostas do questionário de preferências (o cliente envia sem login; só as usuárias logadas leem)
create table if not exists public.respostas (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  nome text not null check (char_length(nome) between 1 and 120),
  tel text check (char_length(tel) <= 40),
  dados jsonb not null check (pg_column_size(dados) < 20000),
  resumo text not null check (char_length(resumo) < 6000),
  visto boolean not null default false
);
alter table public.respostas enable row level security;
drop policy if exists "qualquer um envia" on public.respostas;
create policy "qualquer um envia" on public.respostas for insert to anon, authenticated with check (visto = false);
drop policy if exists "logadas leem" on public.respostas;
create policy "logadas leem" on public.respostas for select to authenticated using (true);
drop policy if exists "logadas atualizam" on public.respostas;
create policy "logadas atualizam" on public.respostas for update to authenticated using (true) with check (true);
drop policy if exists "logadas apagam" on public.respostas;
create policy "logadas apagam" on public.respostas for delete to authenticated using (true);

-- 3) Atualização em tempo real (só liga se ainda não estiver ligado)
do $$
declare t text;
begin
  foreach t in array array['kv','respostas'] loop
    if not exists (select 1 from pg_publication_tables where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = t) then
      execute format('alter publication supabase_realtime add table public.%I', t);
    end if;
  end loop;
end $$;
