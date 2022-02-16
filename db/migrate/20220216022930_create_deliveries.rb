class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.integer :end_user_id, null: false
      t.string :address_name, null: false
      t.string :address, null: false
      t.string :post_code, null: false

      t.timestamps
    end
  end
end
