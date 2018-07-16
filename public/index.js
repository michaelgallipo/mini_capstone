/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Lacrosse Equipment Emporium",
      products: [],
      currentProduct: {},
      productSearch: "",
      categorySearch: "",
      sortAscending: true
    };
  },
  created: function() {
    axios.get("/api/products").then(function(response) {
      this.products = response.data;
      console.log(this.products);
    }.bind(this));
  },
  methods: {
    setCurrentProduct: function(product) { 
      this.currentProduct = product;
      console.log(this.currentProduct);
      },
    validProduct: function(product) {
      return product.name.toLowerCase().includes(this.productSearch.toLowerCase());
      },
    cheapProduct: function(product) {
        return product.price < 100;
      },
    sortedPrice: function() {
      return this.products.sort(function(product1, product2) {
        return product1.price - product2.price
      })
    }     
    },
  computed: {
     sortedProducts: function() {
      return this.products.sort(function(product1, product2) {
        var lowerProductName1 = product1.name.toLowerCase();
        var lowerProductName2 = product2.name.toLowerCase();
        if (this.sortAscending) {
          return lowerProductName1.localeCompare(lowerProductName2);
        } else { 
          return lowerProductName2.localeCompare(lowerProductName1);
        }
        this.SortAscending = !this.sortAscending;
        }.bind(this))
    }   
  },
};

var ProductShowPage = {
  template: "#product-show-page",
  data: function() {
    return {
      message: "Lacrosse Equipment Emporium",
      product: {}
    };
  },
  created: function() {
    axios.get("/api/products/" + this.$route.params.id ).then(function(response) {
      this.product = response.data;
      console.log(this.product);
    }.bind(this));
  },
  methods: {},
  computed: {}
};


var SamplePage = {
  template: "#sample-page",
  data: function() {
    return {
      message: "Lacrosse Equipment Emporium Sample Page"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
    data: function() {
      return {
        name: "",
        email: "",
        password: "",
        passwordConfirmation: "",
        errors: []
      };
    },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var ProductNewPage = {
  template: "#product-new-page",
    data: function() {
      return {
        name: "",
        price: 0.00,
        description: "",
        color: "",
        availability: true,
        supplier_id: "",
        errors: []
      };
    },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
        color: this.color,
        availability: this.availability,
        supplier_id: this.supplier_id
      };
      axios
        .post("/api/products", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};
var ProductEditPage = {
  template: "#product-edit-page",
  data: function() {
    return {  
        name: "",
        price: "",
        description: "",
        color: "",
        availability: "",
        supplier_id: "",
        errors: []
    };
  },
  created: function() {
    axios.get("/api/products/" + this.$route.params.id ).then(function(response) {
      this.name = response.data.name;
      this.price = response.data.price;
      this.description = response.data.description;
      this.color = response.data.color;
      this.availability = response.data.availability;
      this.supplier_id = response.data.supplier_id;
    }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
        color: this.color,
        availability: this.availability,
        supplier_id: this.supplier_id
      };
      axios
        .patch("/api/products/" +this.$route.params.id, params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
  },
}

};


var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};


var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/sample", component: SamplePage},
  { path: "/signup", component: SignupPage },
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage },
  { path: "/products/new", component: ProductNewPage},
  { path: "/products/:id", component: ProductShowPage},
  { path: "/products/:id/edit", component: ProductEditPage}, 
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }

});