class ChangeOrderStatusesToOrderStatuse2 < ActiveRecord::Migration[5.2]
  def change
    rename_table :OrderStatuses, :Order_Statuses
  end
end
