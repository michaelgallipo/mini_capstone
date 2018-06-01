require 'unirest'


# puts "Enter Product name"
# name = gets.chomp
# puts "Enter Category"
# category = gets.chomp
# puts "Enter Price"
# price = gets.chomp
# puts "Enter description"
# description = gets.chomp
# puts "Enter color"
# color = gets.chomp


# params = {
#   name: name,
#   category: category,
#   price: price.to_i,
#   description: description,
#   color: color
# }

# response = Unirest.post("http://localhost:3000/api/products", parameters: params).body

# puts JSON.pretty_generate(response)

# puts "Enter the ID of the product you would like to update"
# product_id = gets.chomp

# params = {
#   #price: 99
#   color: "Red"
# }

# response = Unirest.patch("http://localhost:3000/api/products/#{product_id}", parameters: params).body

# puts JSON.pretty_generate(response)

puts "Enter the ID of the product you would like to delete"
product_id = gets.chomp

response = Unirest.delete("http://localhost:3000/api/products/#{product_id}")

puts response