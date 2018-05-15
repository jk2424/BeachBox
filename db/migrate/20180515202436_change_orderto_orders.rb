class ChangeOrdertoOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :Order, :orders
  end
end
