import { Link } from 'react-router-dom';
export default function Header() {
  return (
    <header className="border-b border-gray-200 bg-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          <nav className="flex items-center space-x-8">
            <Link to="/" className="text-sm text-gray-600 hover:text-gray-900">Home</Link>
            <Link to="/about" className="text-sm text-gray-600 hover:text-gray-900">About</Link>
            <Link to="/contact" className="text-sm text-gray-600 hover:text-gray-900">Contact</Link>
          </nav>
          <Link to="/" className="flex items-center">
            <img 
              src="https://stablo-template.vercel.app/_next/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fcijrdavx%2Fproduction%2Fe8fa4f57a95067e838d7aa5a4f80042137d9f5b6-132x52.svg%3Fw%3D132%26auto%3Dformat&w=3840&q=75" 
              alt="Stablo" 
              className="h-8"
            />
          </Link>
          <nav className="flex items-center">
            <a 
              href="https://www.coderocket.app" 
              target="_blank" 
              rel="noopener noreferrer"
              className="text-sm text-gray-600 hover:text-gray-900 flex items-center space-x-2"
            >
              <span>Visit CodeRocket</span>
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
              </svg>
            </a>
          </nav>
        </div>
      </div>
    </header>
  );
}