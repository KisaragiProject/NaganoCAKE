class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :addressee, null: false
      t.string :post_code, null: false
      t.string :send_to_address, null: false
      t.boolean :how_to_pay, null: false, default: true
      t.integer :deliver_fee, null: false, default: 800
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
    add_index :orders, :customer_id
  end
end
