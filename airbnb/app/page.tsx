import NavBar from "./components/NavBar";
import BreadCrumbs from "./components/BreadCrumbs";
import PropertyCard from "./properties/PropertyCard";
import Footer from "./components/Footer";

export default function Home() {
  return (
    <main>
      <NavBar />

      <div className="container mx-auto">
        <BreadCrumbs />

        <div className="grid grid-cols-4 place-items-center gap-1 gap-y-5 m-10">
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
    </main>
  );
}
