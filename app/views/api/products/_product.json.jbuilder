  json.id product.id
  json.name product.name
  json.category product.category
  json.price product.price
  json.description product.description
  json.color product.color
  json.availability product.availability
  json.images product.images

json.supplier do
  json.partial! product.supplier, partial: "api/suppliers/supplier", as: :supplier
end

  json.formatted do 
    json.discounted product.is_discounted?
    json.sales_tax product.sales_tax
    json.total_price product.total_price
    json.sales_message product.sales_message
  end
  