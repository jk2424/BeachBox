

Product.destroy_all
Product.create! product_name: "Chair", product_price: 12.99, active: true, product_quantity: 50, product_image_url: 'Chair_1.png'
Product.create! product_name: "Towel", product_price: 14.99, active: true, product_quantity: 50, product_image_url: 'towel-01.png'
Product.create! product_name: "Umbrella", product_price: 14.99, active: true, product_quantity: 50, product_image_url: 'umbrella.png'
Product.create! product_name: "Children Sunscreen", product_price: 7.99, active: true, product_quantity: 50, product_image_url: 'sunscreen_children-01.png'
Product.create! product_name: "Adult Sunscreen", product_price: 5.99, active: true, product_quantity: 50, product_image_url: 'sunscreen_adult-01.png'

OrderStatus.destroy_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"
