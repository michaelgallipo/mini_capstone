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
end