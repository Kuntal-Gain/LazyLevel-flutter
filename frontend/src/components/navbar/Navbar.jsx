import React, { useState } from 'react';
import { FaHeart, FaShoppingCart, FaUser, FaBars, FaTimes } from "react-icons/fa";
import './Navbar.css';

const Navbar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <div className='navbar'>
      <div className="nav_left">
        <div className="nav_logo">
            <h1>LazyLevel</h1>
        </div>
      </div>
      <div className={`nav_items ${isMenuOpen ? 'active' : ''}`}>
        <ul>
          <li>Home</li>
          <li>Pages</li>
          <li>Shop</li>
          <li>T-shirts</li>
          <li>Hoodies</li>
          <li>Get Pro</li>
        </ul>
      </div>
      <div className="nav_icons">
        <p><FaUser /></p>
        <p><FaHeart /></p>
        <p><FaShoppingCart /></p>
      </div>
      <div className="hamburger" onClick={toggleMenu}>
        {isMenuOpen ? <FaTimes /> : <FaBars />}
      </div>
    </div>
  );
};

export default Navbar;
