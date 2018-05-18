# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.destroy_all
Product.create! product_name: "Chair", product_price: 10, active: true, product_quantity: 50, product_image_url: 'Chair_1.png'
Product.create! product_name: "Towel", product_price: 10, active: true, product_quantity: 50, product_image_url: 'towel-01.png'
Product.create! product_name: "Umbrella", product_price: 25, active: true, product_quantity: 50, product_image_url: 'umbrella.png'
Product.create! product_name: "Children Sunscreen", product_price: 5, active: true, product_quantity: 50, product_image_url: 'sunscreen_children-01.png'
Product.create! product_name: "Adult Sunscreen", product_price: 6, active: true, product_quantity: 50, product_image_url: 'sunscreen_adult-01.png'

OrderStatus.destroy_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
