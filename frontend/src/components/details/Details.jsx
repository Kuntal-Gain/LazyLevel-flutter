import React from "react";
import "./Details.css";

const features = [
  {
    icon: "🛒",
    title: "Free Delivery",
    description: "Enjoy fast and free shipping on all orders, no matter the size or location.",
  },
  {
    icon: "🛡️",
    title: "Secure Payment",
    description: "Shop with confidence knowing your transactions are safe and protected.",
  },
  {
    icon: "🎖️",
    title: "Quality Guarantee",
    description: "We ensure top-notch quality in every product to meet your expectations.",
  },
  {
    icon: "💲",
    title: "Daily Offer",
    description: "Discover amazing deals and discounts every day on your favorite items.",
  },
];

const Details = () => {
    return (
        <div className="features-section">
          {features.map((feature, index) => (
            <div className="feature-card" key={index}>
              <div className="feature-icon">{feature.icon}</div>
              <h3 className="feature-title">{feature.title}</h3>
              <p className="feature-description">{feature.description}</p>
            </div>
          ))}
        </div>
      )
}

export default Details;
