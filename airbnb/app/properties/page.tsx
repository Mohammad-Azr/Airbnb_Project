import React from "react";
import NavBar from "../components/NavBar";
import BreadCrumbs from "../components/BreadCrumbs";
import PropertyCard from "./PropertyCard";
import Footer from "../components/Footer";

const Properties = () => {
  return (
    <div>
      <NavBar />
      <div className="container mx-auto">
        <BreadCrumbs />

        <div className="grid grid-cols-4 place-items-center gap-5 gap-y-5 m-10">
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
          <PropertyCard />
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default Properties;
