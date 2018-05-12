class ChangeOrdersToOrder < ActiveRecord::Migration[5.2]
  def change
  rename_table :orders, :Order
end
end
