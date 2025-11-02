export default function About() {
  return (
    <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
      <div className="prose prose-lg max-w-none">
        <h1 className="text-4xl font-bold text-gray-900 mb-8">About Stablo</h1>
        <div className="aspect-video w-full mb-8 overflow-hidden rounded-lg">
          <img 
            src="https://images.unsplash.com/photo-1499750310107-5fef28a66643?w=1200&auto=format&fit=crop" 
            alt="About Stablo"
            className="w-full h-full object-cover"
          />
        </div>
        <div className="space-y-6 text-gray-600">
          <p className="text-xl leading-relaxed">
            Stablo is a minimal blog website template built with Next.js, Tailwind CSS & Sanity CMS by 
            <a href="https://web3templates.com" className="text-blue-600 hover:text-blue-700 mx-1">Web3Templates</a>.
          </p>
          <p className="leading-relaxed">
            This template is a perfect starter for any blog or content-based website. It comes with a clean and modern design, 
            and is fully responsive. It's also optimized for performance and SEO.
          </p>
          <h2 className="text-2xl font-bold text-gray-900 mt-12 mb-4">Features</h2>
          <ul className="space-y-3 list-disc list-inside">
            <li>Built with Next.js & TypeScript</li>
            <li>Styled with Tailwind CSS</li>
            <li>Content management with Sanity CMS</li>
            <li>Fully responsive design</li>
            <li>SEO optimized</li>
            <li>Dark mode support</li>
            <li>Fast and performant</li>
            <li>Easy to customize</li>
          </ul>
          <h2 className="text-2xl font-bold text-gray-900 mt-12 mb-4">Our Mission</h2>
          <p className="leading-relaxed">
            We believe that everyone should have access to beautiful, functional website templates. 
            Our mission is to provide high-quality, modern templates that are easy to use and customize, 
            helping creators and businesses establish their online presence.
          </p>
          <h2 className="text-2xl font-bold text-gray-900 mt-12 mb-4">Get Started</h2>
          <p className="leading-relaxed">
            Ready to create your own blog? Download the Stablo template and start building today. 
            If you need help getting started, check out our documentation or reach out to our support team.
          </p>
          <div className="mt-8 pt-8 border-t border-gray-200">
            <p className="text-sm text-gray-500">
              Have questions? Feel free to <a href="/contact" className="text-blue-600 hover:text-blue-700">contact us</a>.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}