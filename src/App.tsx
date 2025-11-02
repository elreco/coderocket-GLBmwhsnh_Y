import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Header from './components/Header';
import Hero from './components/Hero';
import BlogGrid from './components/BlogGrid';
import About from './components/About';
import Contact from './components/Contact';
import PostPage from './components/PostPage';
import Footer from './components/Footer';
import './globals.css';
function App() {
  return (
    <Router>
      <div className="min-h-screen bg-white">
        <Header />
        <Routes>
          <Route path="/" element={
            <>
              <Hero />
              <BlogGrid />
            </>
          } />
          <Route path="/about" element={<About />} />
          <Route path="/contact" element={<Contact />} />
          <Route path="/post/:slug" element={<PostPage />} />
        </Routes>
        <Footer />
      </div>
    </Router>
  );
}
export default App;