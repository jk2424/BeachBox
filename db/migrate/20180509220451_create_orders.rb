class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :status
      t.string :shipment_method
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
