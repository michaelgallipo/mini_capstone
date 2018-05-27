json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.category product.category
  json.price product.price
  json.description product.description
  json.color product.color
  
end