import React, { useEffect, useState } from 'react';
import logo from './logo.svg';
import './App.css';

type Product = {
  name: string;
  price: number;
}

const jsonObject = [
  { name: "Samsung", price: 27000 },
  { name: "Iphone", price: 29000 },
  { name: "Xiaomi", price: 11000 },
  { name: "LG", price: 21000 },
  { name: "Huawei", price: 25000 },
  { name: "Nokia", price: 2000 },
];

function App() {
  let backendURL: string; 
  const [productData, setProductData] = useState<Product[]>(jsonObject);

  if (process.env!.NODE_ENV === "production") {
    backendURL = 'http://localhost:5640/api/v1/products';
  } else if (process.env!.NODE_ENV === "development") {
    backendURL = 'http://localhost:5000/api/v1/products';
  } else {
    console.log("ERROR!")
  }

  useEffect(() => {
    fetch(backendURL)
    .then(response => response.json())
    .then(data => setProductData(data));
  },[])

  return (
    <div className="grid">
      <header>
        <h1>
          Choose from the variety of our products
        </h1>
      </header>

      <nav>
        Navigation
      </nav>

      <article style={{overflow:"scroll"}}>
        {productData.map(obj => 
          <div className="product--card"> 
            <img className="product--card-image" src="/iphone.jpg" />
            <div className="product--card-info" >
              <h1>{obj.name}</h1>
              <p>{obj.price},-CZK</p>
              <button>Show more</button>
            </div>
          </div>

        )}
      </article >

      <aside>
        Right Sidebar
      </aside>

      <footer>
        Footer
      </footer>
    </div >
  );
}

export default App;
