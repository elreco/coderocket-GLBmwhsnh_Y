import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { getFeaturedPosts } from '@/services/posts'
import type { Post } from '@/services/posts'
export default function Hero() {
  const [featuredPosts, setFeaturedPosts] = useState<Post[]>([])
  const [loading, setLoading] = useState(true)
  useEffect(() => {
    loadFeaturedPosts()
  }, [])
  async function loadFeaturedPosts() {
    setLoading(true)
    const posts = await getFeaturedPosts()
    setFeaturedPosts(posts)
    setLoading(false)
  }
  if (loading) {
    return (
      <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {[1, 2].map((i) => (
            <div key={i} className="animate-pulse">
              <div className="aspect-video bg-gray-200 rounded-lg mb-4"></div>
              <div className="h-4 bg-gray-200 rounded w-1/4 mb-2"></div>
              <div className="h-8 bg-gray-200 rounded mb-2"></div>
              <div className="h-4 bg-gray-200 rounded w-3/4"></div>
            </div>
          ))}
        </div>
      </section>
    )
  }
  if (featuredPosts.length === 0) {
    return null
  }
  return (
    <section className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        {featuredPosts.map((post) => (
          <Link key={post.id} to={`/post/${post.slug}`} className="group cursor-pointer">
            <article>
              <div className="relative aspect-video overflow-hidden rounded-lg mb-4">
                <img 
                  src={post.image_url} 
                  alt={post.title}
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                />
              </div>
              <div className="space-y-2">
                {post.category && (
                  <span className={`text-xs font-medium uppercase ${post.category.color}`}>
                    {post.category.name}
                  </span>
                )}
                <h2 className="text-2xl font-bold text-gray-900 group-hover:text-blue-600 transition-colors">
                  {post.title}
                </h2>
                <div className="flex items-center space-x-2 text-sm text-gray-600">
                  {post.author && (
                    <>
                      <img 
                        src={post.author.avatar_url} 
                        alt={post.author.name}
                        className="w-5 h-5 rounded-full"
                      />
                      <span>{post.author.name}</span>
                      <span>•</span>
                    </>
                  )}
                  <span>{new Date(post.published_at || post.created_at).toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })}</span>
                </div>
              </div>
            </article>
          </Link>
        ))}
      </div>
    </section>
  )
}