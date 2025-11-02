-- Migration: Create blog schema with posts, categories, and authors
-- Generated at: 2025-06-07
-- Enable UUID extension
create extension if not exists "uuid-ossp";
-- Create categories table
create table if not exists public.categories (
  id uuid primary key default uuid_generate_v4(),
  name text not null unique,
  slug text not null unique,
  color text not null default 'text-gray-600',
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);
-- Create authors table
create table if not exists public.authors (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  email text unique,
  avatar_url text,
  bio text,
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);
-- Create posts table
create table if not exists public.posts (
  id uuid primary key default uuid_generate_v4(),
  title text not null,
  slug text not null unique,
  excerpt text,
  content text,
  image_url text not null,
  author_id uuid references public.authors(id) on delete cascade,
  category_id uuid references public.categories(id) on delete set null,
  published boolean default false,
  featured boolean default false,
  published_at timestamptz,
  created_at timestamptz default now() not null,
  updated_at timestamptz default now() not null
);
-- Create post_categories junction table for multiple categories
create table if not exists public.post_categories (
  post_id uuid references public.posts(id) on delete cascade,
  category_id uuid references public.categories(id) on delete cascade,
  primary key (post_id, category_id)
);
-- Create indexes for better query performance
create index if not exists idx_posts_published on public.posts(published, published_at desc);
create index if not exists idx_posts_featured on public.posts(featured, published_at desc);
create index if not exists idx_posts_category on public.posts(category_id);
create index if not exists idx_posts_author on public.posts(author_id);
create index if not exists idx_posts_slug on public.posts(slug);
-- Enable Row Level Security
alter table public.categories enable row level security;
alter table public.authors enable row level security;
alter table public.posts enable row level security;
alter table public.post_categories enable row level security;
-- RLS Policies for categories
create policy "Anyone can view categories"
  on public.categories for select
  using (true);
create policy "Authenticated users can create categories"
  on public.categories for insert
  with check (auth.role() = 'authenticated');
create policy "Authenticated users can update categories"
  on public.categories for update
  using (auth.role() = 'authenticated');
-- RLS Policies for authors
create policy "Anyone can view authors"
  on public.authors for select
  using (true);
create policy "Authenticated users can create authors"
  on public.authors for insert
  with check (auth.role() = 'authenticated');
create policy "Authors can update their own profile"
  on public.authors for update
  using (auth.uid()::text = id::text);
-- RLS Policies for posts
create policy "Anyone can view published posts"
  on public.posts for select
  using (published = true);
create policy "Authenticated users can view all posts"
  on public.posts for select
  using (auth.role() = 'authenticated');
create policy "Authenticated users can create posts"
  on public.posts for insert
  with check (auth.role() = 'authenticated');
create policy "Authors can update their own posts"
  on public.posts for update
  using (auth.uid()::text = author_id::text);
create policy "Authors can delete their own posts"
  on public.posts for delete
  using (auth.uid()::text = author_id::text);
-- RLS Policies for post_categories
create policy "Anyone can view post categories"
  on public.post_categories for select
  using (true);
create policy "Authenticated users can manage post categories"
  on public.post_categories for all
  using (auth.role() = 'authenticated');
-- Insert default categories
insert into public.categories (name, slug, color) values
  ('Technology', 'technology', 'text-blue-600'),
  ('Lifestyle', 'lifestyle', 'text-purple-600'),
  ('Travel', 'travel', 'text-orange-600'),
  ('Design', 'design', 'text-blue-600'),
  ('Personal Growth', 'personal-growth', 'text-green-600')
on conflict (slug) do nothing;
-- Insert sample authors
insert into public.authors (name, email, avatar_url) values
  ('Mario Sanchez', 'mario@example.com', 'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F4a21e3f085ed310d00fbbd294eb2392cde7f9acc-3648x3648.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75'),
  ('Joshua Wood', 'joshua@example.com', 'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2Fcd477178ed12f28ef668adaf9fcae6b8fc351a08-4480x6415.jpg%3Frect%3D0%2C0%2C4480%2C3760%26w%3D2000%26auto%3Dformat&w=3840&q=75'),
  ('Erika Oliver', 'erika@example.com', 'https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2F4e20f048a69ac41ab7a6b5f1687f0547379b7469-3648x5472.jpg%3Fw%3D2000%26auto%3Dformat&w=3840&q=75')
on conflict (email) do nothing;
-- Function to update updated_at timestamp
create or replace function update_updated_at_column()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;
-- Triggers for updated_at
create trigger update_categories_updated_at before update on public.categories
  for each row execute function update_updated_at_column();
create trigger update_authors_updated_at before update on public.authors
  for each row execute function update_updated_at_column();
create trigger update_posts_updated_at before update on public.posts
  for each row execute function update_updated_at_column();