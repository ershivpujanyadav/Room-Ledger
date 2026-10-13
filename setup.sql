-- Room Ledger cloud sync setup (Supabase SQL Editor)
-- IMPORTANT: This simple shared-room design uses a room code as a shared secret.
-- Anyone who knows the room code and has your public anon/publishable key can read/write that room.
-- For sensitive use, add Supabase Auth and stricter per-user policies instead.

create table if not exists public.room_ledgers (
  room_code text primary key,
  payload jsonb not null default '{"roommates":["You","Roommate 2","Roommate 3"],"expenses":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.room_ledgers enable row level security;

-- Remove these policies first if rerunning the script:
drop policy if exists "room ledger read shared room" on public.room_ledgers;
drop policy if exists "room ledger insert shared room" on public.room_ledgers;
drop policy if exists "room ledger update shared room" on public.room_ledgers;

-- This policy is intentionally broad for a small private shared ledger.
-- The room code is not a password-grade access control mechanism.
create policy "room ledger read shared room"
on public.room_ledgers for select to anon, authenticated
using (true);

create policy "room ledger insert shared room"
on public.room_ledgers for insert to anon, authenticated
with check (true);

create policy "room ledger update shared room"
on public.room_ledgers for update to anon, authenticated
using (true) with check (true);

grant select, insert, update on public.room_ledgers to anon, authenticated;
