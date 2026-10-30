-- 1. ŞUBELER TABLOSU
create table public.branches (
    id uuid default gen_random_uuid() primary key,
    grade text not null,
    branch_name text not null,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. ÖĞRENCİLER TABLOSU
create table public.students (
    id uuid default gen_random_uuid() primary key,
    grade text not null,
    branch text not null,
    school_no integer not null,
    name text not null,
    plus integer default 0,
    minus integer default 0,
    quiz jsonb default '{}'::jsonb,
    scale jsonb default '{}'::jsonb,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 3. ÜNİTELER VE BÖLÜMLER TABLOSU
create table public.units_sections (
    id uuid default gen_random_uuid() primary key,
    grade text not null,
    unit_name text not null,
    section_name text not null,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 4. ETKİNLİKLER VE ÖLÇEKLER TABLOSU
create table public.activities (
    id uuid default gen_random_uuid() primary key,
    grade text not null,
    unit_name text not null,
    section_name text not null,
    activity_name text not null,
    criteria jsonb default '[]'::jsonb,
    scale_type text default '1-4',
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 5. RESMİ RAPOR ŞABLONLARI TABLOSU
create table public.report_templates (
    id uuid default gen_random_uuid() primary key,
    grade text not null,
    unit_name text not null,
    section_name text not null,
    report_text text not null,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 6. ÖĞRETMENLER TABLOSU
create table public.teachers (
    id uuid default gen_random_uuid() primary key,
    email text not null unique,
    name text not null,
    created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- RLS (Satır Düzeyi Güvenlik) Korumalarını Devre Dışı Bırakma (Ekleme/Düzenleme Hatalarını Önlemek İçin)
alter table public.branches disable row level security;
alter table public.students disable row level security;
alter table public.units_sections disable row level security;
alter table public.activities disable row level security;
alter table public.report_templates disable row level security;
alter table public.teachers disable row level security;