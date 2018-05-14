class ChangeOrderitemToOrderitems2 < ActiveRecord::Migration[5.2]
  def change
    rename_table :OrderItems, :order_items
  end
end
