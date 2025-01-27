import React from 'react'
import Navbar from './navbar/Navbar'
import Herosection from './herosection/Herosection'
import Footer from './footer/Footer'
import Details from './details/Details'
import Arrivals from './arrivals/Arrivals'

const Home = () => {
  return (
    <div>
      <Navbar />
      <Herosection />
      <Details />
      <Arrivals />
      {/* <Footer /> */}
    </div>
  )
}

export default Home
