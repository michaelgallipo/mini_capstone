json.id @order.id
json.user_id @order.user_id
json.product_id @order.product_id
json.quantity @order.quantity
json.subtotal @order.subtotal
json.tax @order.tax
json.total @order.total

json.invoice do
  json.customer @order.customer
  json.customer_email @order.customer_email
  json.product_name @order.product_name
  json.subtotal number_to_currency(@order.subtotal)
  json.product_price number_to_currency(@order.product.price)
  json.tax number_to_currency(@order.tax)
  json.total number_to_currency(@order.total)
  json.image @order.product.images.first.url
  json.order_date @order.friendly_order_date
end