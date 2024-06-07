'use client'
import React from "react";

interface Property {
  property_id: number;
  host_id: number;
  location_id: number;
  property_type: string;
  categories: string[];
  num_bedrooms: number;
  num_bathrooms: number;
  max_guests: number;
  area: string;
  price_per_night: number;
  availability: boolean;
}

interface Props {
  properties: Property;
}

const PropertyCard = (properties: any) => {
  console.log(properties)
  return (
    <div className="card w-fit bg-base-100 shadow-xl">
      <figure>
        <img
          src="https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.jpg"
          alt="Shoes"
        />
      </figure>
      <div className="card-body">
        <h2 className="card-title">{properties}</h2>
        <p>If a dog chews shoes whose shoes does he choose?</p>
        <div className="card-actions justify-end">
          <button className="btn btn-primary">Buy Now</button>
        </div>
      </div>
    </div>
  );
};

export default PropertyCard;
