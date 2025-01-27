import React from "react";
import roundneck from "../../assets/roundneck.jpg";
import fullsleeve from "../../assets/fullsleeve.jpg";
import printed from "../../assets/printed.jpg";
import sweatshirts from "../../assets/sweatshirts.jpg";
import "./arrivals.css";

const tshirts = [
  {
    id: 1,
    name: "Round Neck T-Shirt",
    price: 150,
    image: roundneck,
  },
  {
    id: 2,
    name: "Full Sleeve T-Shirt",
    price: 300,
    image: fullsleeve,
  },
  {
    id: 3,
    name: "Printed T-Shirt",
    price: 200,
    image: printed,
  },
  {
    id: 4,
    name: "Sweatshirts",
    price: 400,
    image: sweatshirts,
  },
];

const Arrivals = () => {
  return (
    <div className="arrivals_section">
      <h1>New Arrivals</h1>
      <div className="tshirts">
        {tshirts.map((tshirt) => (
          <div className="tshirt" key={tshirt.id}>
            <img src={tshirt.image} alt={tshirt.name} />
            <div className="overlay">
              <h3>{tshirt.name}</h3>
              <p>Price: ₹{tshirt.price}</p>
              <button>ADD TO CART</button>
            </div>
          </div>
        ))}
      </div>
      <button className="view_btn">View All Products</button>
    </div>
  );
};

export default Arrivals;