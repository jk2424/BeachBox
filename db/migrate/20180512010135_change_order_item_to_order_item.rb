class ChangeOrderItemToOrderItem < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_items, :OrderItem
  end
end
