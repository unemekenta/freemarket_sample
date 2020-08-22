class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :shipping_fee, null: false
      t.timestamps
    end
  end
end
