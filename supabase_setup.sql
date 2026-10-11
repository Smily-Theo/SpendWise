-- Run this once in Supabase Dashboard > SQL Editor.
-- The policy ensures each authenticated user can access only their own workspace.
create table if not exists public.finance_workspace (
  user_id uuid primary key references auth.users(id) on delete cascade,
  workspace jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.finance_workspace enable row level security;

drop policy if exists "Users can read their own finance workspace" on public.finance_workspace;
create policy "Users can read their own finance workspace"
on public.finance_workspace for select to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert their own finance workspace" on public.finance_workspace;
create policy "Users can insert their own finance workspace"
on public.finance_workspace for insert to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own finance workspace" on public.finance_workspace;
create policy "Users can update their own finance workspace"
on public.finance_workspace for update to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

grant select, insert, update on public.finance_workspace to authenticated;
