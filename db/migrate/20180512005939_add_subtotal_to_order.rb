class AddSubtotalToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :order, :subtotal, :decimal
    add_column :order, :tax, :decimal
    add_column :order, :shipping, :decimal
    add_column :order, :total, :decimal
  end
end
