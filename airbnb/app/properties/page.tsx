"use client"
import React, { useEffect, useState } from "react";
import NavBar from "../components/NavBar";
import BreadCrumbs from "../components/BreadCrumbs";
import PropertyCard from "./PropertyCard";
import Footer from "../components/Footer";
import prisma from "@/prisma/client";

const Properties = () => {
  const [properties, setproperties] = useState([]);

  useEffect(() => {
    const fetchUsers = async () => {
      const response = await fetch('/api/properties');
      const data = await response.json();
      setproperties(data);
      console.log(data.propertiy_type);
    };

    fetchUsers();
  }, []);

// const Properties = async () => {
//   const properties = await prisma.properties.findMany();



  // var result = Object.keys(properties).map((key) => [key, properties[key]]);
  console.log(properties);
  return (
    <div>
      <NavBar />
      <div className="container mx-auto">
        <BreadCrumbs />
        {/* <div>{properties[0]}</div> */}

        <div className="grid grid-cols-4 place-items-center gap-5 gap-y-5 m-10">
          {properties.map((property: any) => (
            <PropertyCard key={property.property_id} properties={property} />
          ))} 
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default Properties;
  function setUsers(data: any) {
    throw new Error("Function not implemented.");
  }

