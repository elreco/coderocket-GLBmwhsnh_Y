import { supabase } from '@/lib/supabase'
export interface Category {
  id: string
  name: string
  slug: string
  color: string
  created_at: string
  updated_at: string
}
export async function getCategories(): Promise<Category[]> {
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .order('name')
  if (error) {
    console.error('Error fetching categories:', error)
    return []
  }
  return (data || []) as any[]
}
export async function getCategoryBySlug(slug: string): Promise<Category | null> {
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .eq('slug', slug)
    .single()
  if (error) {
    console.error('Error fetching category:', error)
    return null
  }
  return data as any
}
export async function createCategory(category: Partial<Category>): Promise<Category | null> {
  const { data, error } = await supabase
    .from('categories')
    .insert(category)
    .select()
    .single()
  if (error) {
    console.error('Error creating category:', error)
    return null
  }
  return data as any
}