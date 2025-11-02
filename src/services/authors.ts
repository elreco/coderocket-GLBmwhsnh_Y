import { supabase } from '@/lib/supabase'
export interface Author {
  id: string
  name: string
  email?: string
  avatar_url?: string
  bio?: string
  created_at: string
  updated_at: string
}
export async function getAuthors(): Promise<Author[]> {
  const { data, error } = await supabase
    .from('authors')
    .select('*')
    .order('name')
  if (error) {
    console.error('Error fetching authors:', error)
    return []
  }
  return (data || []) as any[]
}
export async function getAuthorById(id: string): Promise<Author | null> {
  const { data, error } = await supabase
    .from('authors')
    .select('*')
    .eq('id', id)
    .single()
  if (error) {
    console.error('Error fetching author:', error)
    return null
  }
  return data as any
}
export async function createAuthor(author: Partial<Author>): Promise<Author | null> {
  const { data, error } = await supabase
    .from('authors')
    .insert(author)
    .select()
    .single()
  if (error) {
    console.error('Error creating author:', error)
    return null
  }
  return data as any
}