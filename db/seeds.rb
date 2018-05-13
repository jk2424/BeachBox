# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.destroy_all
Product.create! product_name: "Chair", product_price: 5, active: true, product_quantity: 50, product_image_url: 'beachchairTEST.jpg'
Product.create! product_name: "Children Sunscreen", product_price: 10, active: true, product_quantity: 50, product_image_url: 'sunscreenTEST.jpg'
Product.create! product_name: "Adult Sunscreen", product_price: 10, active: true, product_quantity: 50, product_image_url: 'sunscreenadultTEST.jpg'
Product.create! product_name: "Towel", product_price: 15, active: true, product_quantity: 50, product_image_url: 'towelTEST.jpg'

OrderStatus.destroy_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
