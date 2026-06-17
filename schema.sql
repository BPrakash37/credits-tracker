-- ================================================================
-- CREDITS TRACKER — Supabase Database Setup
-- Run this entire file in: Supabase → SQL Editor → New Query
-- ================================================================

-- 1. CREDITS (money received from Dad)
create table credits (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users not null,
  date date not null,
  amount numeric not null,
  note text default '',
  created_at timestamptz default now()
);

-- 2. DISBURSEMENTS (money paid out to people)
create table disbursements (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users not null,
  date date not null,
  name text not null,
  amount numeric not null,
  note text default '',
  created_at timestamptz default now()
);

-- 3. BILLS (monthly electricity, house tax, etc.)
create table bills (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users not null,
  month text not null,           -- format: 2026-01
  current_bill numeric default 0,
  other_bills text default '[]', -- JSON array: [{label, amount}]
  created_at timestamptz default now()
);

-- 4. CC BILLS (credit card outstanding)
create table cc_bills (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users not null,
  name text not null,
  amount numeric not null,
  created_at timestamptz default now()
);

-- 5. INFLOWS (money received from Abhi, Navi, Splits)
create table inflows (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users not null,
  name text not null,
  amount numeric not null,
  created_at timestamptz default now()
);

-- 6. USER META (slice balance and other single values)
create table user_meta (
  user_id uuid references auth.users primary key,
  slice_balance numeric default 0,
  updated_at timestamptz default now()
);

-- ================================================================
-- ROW LEVEL SECURITY — Each user sees ONLY their own data
-- ================================================================

alter table credits        enable row level security;
alter table disbursements  enable row level security;
alter table bills          enable row level security;
alter table cc_bills       enable row level security;
alter table inflows        enable row level security;
alter table user_meta      enable row level security;

-- Credits policies
create policy "credits: own rows" on credits
  for all using (auth.uid() = user_id);

-- Disbursements policies
create policy "disbursements: own rows" on disbursements
  for all using (auth.uid() = user_id);

-- Bills policies
create policy "bills: own rows" on bills
  for all using (auth.uid() = user_id);

-- CC Bills policies
create policy "cc_bills: own rows" on cc_bills
  for all using (auth.uid() = user_id);

-- Inflows policies
create policy "inflows: own rows" on inflows
  for all using (auth.uid() = user_id);

-- User meta policies
create policy "user_meta: own rows" on user_meta
  for all using (auth.uid() = user_id);

-- ================================================================
-- Done! Your database is ready.
-- ================================================================
