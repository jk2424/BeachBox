class ChangeOrderStatusesToOrderStatuses < ActiveRecord::Migration[5.2]
  def change
    rename_table :OrderStatus, :OrderStatuses
  end
end
