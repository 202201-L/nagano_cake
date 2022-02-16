class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false
      t.integer :intax_price, null: false
      t.integer :production_status, default: 0, null: false

      t.timestamps
    end
  end
end
