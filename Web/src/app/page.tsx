"use client";
import Link from 'next/link';


export default function HomePage() {

  return (
    <div className="min-h-screen flex flex-col">
      {/* Menu Section */}
      <header className="bg-gray-800 text-white p-4">
        <nav className="container mx-auto flex justify-between items-center">
          <div className="font-bold">Logo</div>
          <ul className="flex space-x-4">
            <li><Link href="/">Home</Link></li>
            <li><Link href="/about">About</Link></li>
            <li><Link href="/contact">Contact</Link></li>
          </ul>
        </nav>
      </header>


      {/* Content Section */}
      <main className="flex-grow container mx-auto p-4">
        <section className="text-center">
          <h1 className="text-4xl font-bold mb-4">Welcome to Our Website</h1>
          <p>This is a simple home page layout with a menu and content section.</p>
        </section>
      </main>

      {/* Footer Section */}
      <footer className="bg-gray-700 text-white p-4 text-center">
        © 2023 Your Website
      </footer>
    </div>
  );
}