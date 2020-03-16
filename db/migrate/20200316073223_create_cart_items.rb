class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :quanitity
      t.timestamps
    end
    add_index :cart_items, :product_id
    add_index :cart_items, :customer_id
  end
end