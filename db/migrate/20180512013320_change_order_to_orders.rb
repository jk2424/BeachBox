class ChangeOrderToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :Order, :Orders
  end
end
