import React from 'react';
import { motion } from 'framer-motion';
import './Herosection.css';

const Herosection = () => {
  return (
    <motion.div
      className="herosection"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }} 
      transition={{ duration: 1 }} 
    >
      <motion.div
        className="hero_content"
        initial={{ y: -100, opacity: 0 }} 
        animate={{ y: 0, opacity: 1 }} 
        transition={{ duration: 1, delay: 0.3 }} 
      >
        <h1>Elevate Your Style with LazyLevel</h1>
        <p>
          Discover the perfect blend of comfort and fashion with our exclusive collection of T-shirts. Whether you're lounging at home or out with friends, LazyLevel has something for every occasion. Browse our latest designs and find your new favorite tee today!
        </p>
      </motion.div>

      <motion.div
        className="hero_button"
        initial={{ opacity: 0 }} 
        animate={{ opacity: 1 }} 
        transition={{ duration: 1, delay: 0.6 }} 
      >
        <button>Start Shopping</button>
      </motion.div>
    </motion.div>
  );
};

export default Herosection;