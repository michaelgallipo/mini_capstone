json.id @order.id
json.user_id @order.user_id
json.subtotal @order.subtotal
json.tax @order.tax
json.total @order.total

json.invoice do
  json.customer @order.customer
  json.customer_email @order.customer_email
  json.subtotal number_to_currency(@order.subtotal)
  json.tax number_to_currency(@order.tax)
  json.total number_to_currency(@order.total)
  json.order_date @order.friendly_order_date
end