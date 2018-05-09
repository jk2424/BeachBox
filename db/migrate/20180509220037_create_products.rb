class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :product_quantity
      t.integer :product_weight
      t.string :product_dimension
      t.string :product_description
      t.string :product_image_url
      t.string :product_group
      t.integer :product_price

      t.timestamps
    end
  end
end
