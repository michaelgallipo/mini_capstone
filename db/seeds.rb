User.create!([
  {name: "Peter", email: "peter@email.com", password_digest: "$2a$10$IzE9L0.ErGCsL5rPKCK7vu683ohNk.Pn7Bu8RL/GsX7xpXxSkAYSy", admin: false},
  {name: "Minerva McGonagall", email: "mmcgonagall@hogwarts.edu", password_digest: "$2a$10$7xLoB7vka4onWdcK7Hdyp.RJ0nWWNHLRkGUkTsYol3tPagLZuJCA2", admin: false},
  {name: "Ron Weasley", email: "ron.weasley@owlmail.com", password_digest: "$2a$10$XnnFd575JCAANuDwZiwYOuDipAelc9mRt.W7tcNIkn4t/fRyFRJmu", admin: false},
  {name: "Ginny Potter", email: "ginny.potter@magicsoft.com", password_digest: "$2a$10$DXzkLP6k5xXDjkJdSo.pEOffX1qUNLJlp0mRqh11pkpUQgJ/PXYyu", admin: false},
  {name: "Cho Chang", email: "cho@olivanders.com", password_digest: "$2a$10$KtwF2Swf9O3oDO4/uTkJKedEUceH5WNIKXwZF5DotcxhAnj0cDroy", admin: false},
  {name: "Draco Malfoy", email: "draco@diagonalley.net", password_digest: "$2a$10$Jrr7rkH4HiRsAuyXBad6iuyFEd2S07u9v5fVw8VMuJQ9PfmVB4xYa", admin: false},
  {name: "Harry Potter", email: "h_potter@minofmagic.gov", password_digest: "$2a$10$5jPK7ews5qn7aBE6W6SkK.MjptcEx4M/uIqwR2Ja4e9StkzadI7f.", admin: true}
])
Supplier.create!([
  {name: "STX", email: "stx_products@gmail.com", phone_number: "(602) 555-5555"},
  {name: "Cascade", email: "orders@cascade.com", phone_number: "(802) 555-1234"},
  {name: "Nike", email: "cust_orders@nike.com", phone_number: "(978) 555-6969"},
  {name: "Warrior", email: "orders@warriorlax.com", phone_number: "(212) 555-4444"},
  {name: "Epoch", email: "cust_svc@epoch.com", phone_number: "(212) 555-3322"}
])
Category.create!([
  {name: "Stick"},
  {name: "Protective"},
  {name: "Helmet"},
  {name: "Shoulder Pads"},
  {name: "Gloves"},
  {name: "Shaft"},
  {name: "Arm Guards"}
])
Product.create!([
  {name: "STX Cell III", price: "59.0", description: "Great intermediate/advanced level glove", color: "Navy", image_url: "", availability: true, supplier_id: 1},
  {name: "Cascade S Helmet", price: "259.0", description: "Casacade's latest and greatest helmet", color: "Matte Black", image_url: "", availability: true, supplier_id: 2},
  {name: "Warrior EVO Warp Next", price: "99.0", description: "This lacrosse stick is designed to teach new players how to catch and throw better with amazing consistency.", color: "Black", image_url: "", availability: true, supplier_id: 4},
  {name: "Nike Vapor 2.0 Shoulder Pads", price: "129.0", description: "These are attackman and offensive middie pads that have a softer feel but maintain a snug fit", color: "Gray", image_url: "", availability: true, supplier_id: 3},
  {name: "STX Cell IV Arm Guards", price: "139.0", description: "STX's top of the line Arm Guards. Provides the highest level of protection combined with a snug fit and excellent flexibility", color: "White", image_url: nil, availability: true, supplier_id: 1},
  {name: "Epoch Dargonfly 8 E60", price: "199.0", description: "Top of the line carbon fiber defensive shaft", color: "Black", image_url: nil, availability: true, supplier_id: 5},
  {name: "Test Stick", price: "75.0", description: "Test stick", color: "Blue", image_url: nil, availability: nil, supplier_id: 1},
  {name: "Test Stick II", price: "100.0", description: "Test stick", color: "Black", image_url: nil, availability: true, supplier_id: 5},
  {name: "Test Stick III", price: "65.0", description: "Test Stick", color: "Red", image_url: nil, availability: true, supplier_id: 1}
])
CartedProduct.create!([
  {user_id: 3, product_id: 2, quantity: 2, status: "carted", order_id: nil},
  {user_id: 3, product_id: 4, quantity: 3, status: "carted", order_id: nil},
  {user_id: 2, product_id: 8, quantity: 1, status: "carted", order_id: nil},
  {user_id: 2, product_id: 2, quantity: 2, status: "carted", order_id: nil},
  {user_id: 6, product_id: 3, quantity: 3, status: "purchased", order_id: 17},
  {user_id: 6, product_id: 1, quantity: 3, status: "purchased", order_id: 17},
  {user_id: 3, product_id: 1, quantity: 1, status: "removed", order_id: nil}
])

Image.create!([
  {url: "https://images-na.ssl-images-amazon.com/images/I/51Zld%2BcTxZL._SY463_.jpg", product_id: 1},
  {url: "http://cdn7.bigcommerce.com/s-vq9emsiqq7/images/stencil/1280x1280/products/5251/2150/STX%20Cell%20100%20Jr%20Glove__36198.1507324973.png", product_id: 1},
  {url: "https://cdn-sportsunlimitedinc.scdn2.secure.raxcdn.com/mod_productImagesDownload/images/4-agc4-black-l_mainProductImage_MediumLarge.jpg", product_id: 5},
  {url: "https://photos.lax.com/media/catalog/product/c/a/cascadeshelmetmatteblackcage.jpg", product_id: 2},
  {url: "https://lacrossemonkey.nexcesscdn.net/media/catalog/product/cache/2/image/1000x/9df78eab33525d08d6e5fb8d27136e95/w/a/warrior-lacrosse-complete-stick-evo-universal.jpg", product_id: 3},
  {url: "https://s7d2.scene7.com/is/image/dkscdn/16STXMNKVPR20SHLDLXP_Black_is/", product_id: 4},
  {url: "https://photos.lax.com/media/catalog/product/cache/1/image/984x984/9df78eab33525d08d6e5fb8d27136e95/n/i/nikevapor2.0shoulderpad_2.jpg", product_id: 4},
  {url: "https://lacrossemonkey.nexcesscdn.net/media/catalog/product/cache/2/image/1000x/9df78eab33525d08d6e5fb8d27136e95/e/p/epoch-lacrosse-mens-shafts-dragonfly-8-c30-atk.jpg", product_id: 8},
  {url: "https://www.sportstop.com/ImagesForSCA/EPOCH18DF8C30IQ5NF-mainbig8.jpg?resizeid=5&resizeh=1000&resizew=1000", product_id: 8},
  {url: "https://bsbproduction.s3.amazonaws.com/portals/5297/images/lacrosse.jpg", product_id: 15},
  {url: "https://bsbproduction.s3.amazonaws.com/portals/5297/images/lacrosse.jpg", product_id: 16},
  {url: "https://bsbproduction.s3.amazonaws.com/portals/5297/images/lacrosse.jpg", product_id: 17}
])
Order.create!([
  {user_id: 4, subtotal: 118.0, tax: 5.9, total: 123.9},
  {user_id: 4, subtotal: nil, tax: nil, total: nil},
  {user_id: 4, subtotal: nil, tax: nil, total: nil},
  {user_id: 4, subtotal: nil, tax: nil, total: nil},
  {user_id: 5, subtotal: nil, tax: nil, total: nil},
  {user_id: 5, subtotal: 258.0, tax: 23.22, total: 281.22},
  {user_id: 5, subtotal: 796.0, tax: 71.64, total: 867.64},
  {user_id: 7, subtotal: nil, tax: nil, total: nil},
  {user_id: 7, subtotal: nil, tax: nil, total: nil},
  {user_id: 7, subtotal: nil, tax: nil, total: nil},
  {user_id: 6, subtotal: 398.0, tax: 35.82, total: 433.82},
  {user_id: 6, subtotal: 417.0, tax: 37.53, total: 454.53},
  {user_id: 6, subtotal: nil, tax: nil, total: nil},
  {user_id: 2, subtotal: 518.0, tax: 46.62, total: 564.62},
  {user_id: 4, subtotal: 198.0, tax: 17.82, total: 215.82},
  {user_id: 2, subtotal: 717.0, tax: 64.53, total: 781.53},
  {user_id: 6, subtotal: 474.0, tax: 42.66, total: 516.66}
])

ProductCategory.create!([
  {product_id: 2, category_id: 3},
  {product_id: 1, category_id: 2},
  {product_id: 1, category_id: 5},
  {product_id: 3, category_id: 1},
  {product_id: 4, category_id: 2},
  {product_id: 5, category_id: 2},
  {product_id: 5, category_id: 7},
  {product_id: 8, category_id: 6},
  {product_id: 11, category_id: 2},
  {product_id: 11, category_id: 3},
  {product_id: 15, category_id: 1},
  {product_id: 16, category_id: 1},
  {product_id: 17, category_id: 1}
])

