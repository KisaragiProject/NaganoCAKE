class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :customer_id, null: false
      t.integer :product_id, null: false
      t.integer :order_id #一度nullfalseを解除
      t.integer :quantity, null: false
      t.integer :order_price, null: false
      t.integer :make_status, null: false ,default: 0

      t.timestamps
    end
    add_index :order_items, :product_id
    add_index :order_items, :customer_id
  end
end
