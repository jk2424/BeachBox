class ChangeOrderitemToOrderitems1 < ActiveRecord::Migration[5.2]
  def change
    rename_table :OrderItem, :OrderItems
  end
end
