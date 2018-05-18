class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :orderitems_quantity
      t.belongs_to :order, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.timestamps
    end
  end
end