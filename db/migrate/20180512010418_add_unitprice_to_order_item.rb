class AddUnitpriceToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :OrderItem, :unit_price, :decimal
    add_column :OrderItem, :total_price, :decimal

  end
end
