var productTemplate = document.querySelector('#product-card');
var productRow = document.querySelector(".row");

/* global sxios */
axios.get("http://localhost:3000/api/products").then(function(response) {
  var products = response.data;
  console.log(products);


  products.forEach(function(product) {
    var productClone = productTemplate.content.cloneNode(true);
    productClone.querySelector(".card-img-top").src = product.images[0].url;
    productClone.querySelector(".card-title").innerText = product.name;
    productClone.querySelector(".price").innerText = `Price: ${ product.price }`;
    productClone.querySelector(".description").innerText = product.description;
    productClone.querySelector(".color").innerText = `Color: ${product.color}`;
    product.categories.forEach(function(category) {
      productClone.querySelector(".category").innerText = category.name;      
    })

    productRow.appendChild(productClone);
  });

})