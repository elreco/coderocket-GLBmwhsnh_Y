export default function Footer() {
  return (
    <footer className="border-t border-gray-200 bg-white mt-20">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="text-center space-y-4">
          <p className="text-sm text-gray-600">
            Copyright © 2025 Stablo. All rights reserved.
          </p>
          <p className="text-xs text-gray-500">
            Made by Web3Templates • GitHub
          </p>
          <div className="flex items-center justify-center space-x-4 pt-4">
            <button className="px-4 py-2 bg-black text-white text-xs rounded-md hover:bg-gray-800 transition-colors flex items-center space-x-2">
              <span>▲</span>
              <span>Powered by Vercel</span>
            </button>
            <div className="flex items-center space-x-2">
              <span className="text-sm text-gray-600">☀️</span>
              <select className="text-sm text-gray-600 border border-gray-300 rounded-md px-2 py-1 bg-white">
                <option>Light</option>
                <option>Dark</option>
                <option>System</option>
              </select>
            </div>
          </div>
          <div className="pt-4">
            <a href="#" className="text-xs text-blue-600 hover:text-blue-700 bg-blue-50 px-3 py-1.5 rounded-md inline-block">
              Purchase Pro Version
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
}