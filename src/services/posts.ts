import { supabase } from '@/lib/supabase'
export interface Post {
  id: string
  title: string
  slug: string
  excerpt?: string
  content?: string
  image_url: string
  author_id: string
  category_id: string
  published: boolean
  featured: boolean
  published_at?: string
  created_at: string
  updated_at: string
  author?: {
    id: string
    name: string
    avatar_url: string
  }
  category?: {
    id: string
    name: string
    slug: string
    color: string
  }
}
export async function getFeaturedPosts(): Promise<Post[]> {
  const { data, error } = await supabase
    .from('posts')
    .select(`
      *,
      author:authors(*),
      category:categories!posts_category_id_fkey(*)
    `)
    .eq('published', true)
    .eq('featured', true)
    .order('published_at', { ascending: false })
    .limit(2)
  if (error) {
    console.error('Error fetching featured posts:', error)
    return []
  }
  return (data || []) as any[]
}
export async function getPosts(limit?: number): Promise<Post[]> {
  let query = supabase
    .from('posts')
    .select(`
      *,
      author:authors(*),
      category:categories!posts_category_id_fkey(*)
    `)
    .eq('published', true)
    .order('published_at', { ascending: false })
  if (limit) {
    query = query.limit(limit)
  }
  const { data, error } = await query
  if (error) {
    console.error('Error fetching posts:', error)
    return []
  }
  return (data || []) as any[]
}
export async function getPostBySlug(slug: string): Promise<Post | null> {
  const { data, error } = await supabase
    .from('posts')
    .select(`
      *,
      author:authors(*),
      category:categories!posts_category_id_fkey(*)
    `)
    .eq('slug', slug)
    .eq('published', true)
    .single()
  if (error) {
    console.error('Error fetching post:', error)
    return null
  }
  return data as any
}
export async function createPost(post: Partial<Post>): Promise<Post | null> {
  const { data, error } = await supabase
    .from('posts')
    .insert({
      ...post,
      published_at: post.published ? new Date().toISOString() : null
    })
    .select()
    .single()
  if (error) {
    console.error('Error creating post:', error)
    return null
  }
  return data as any
}
export async function updatePost(id: string, updates: Partial<Post>): Promise<Post | null> {
  const { data, error } = await supabase
    .from('posts')
    .update(updates)
    .eq('id', id)
    .select()
    .single()
  if (error) {
    console.error('Error updating post:', error)
    return null
  }
  return data as any
}
export async function deletePost(id: string): Promise<boolean> {
  const { error } = await supabase
    .from('posts')
    .delete()
    .eq('id', id)
  if (error) {
    console.error('Error deleting post:', error)
    return false
  }
  return true
}