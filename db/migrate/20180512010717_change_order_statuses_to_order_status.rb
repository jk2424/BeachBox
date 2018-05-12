class ChangeOrderStatusesToOrderStatus < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_statuses, :OrderStatus
  end
end
