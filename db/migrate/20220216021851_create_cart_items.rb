class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :end_user_id, null: false
      t.integer :product_id, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
