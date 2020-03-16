class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id,  null: false
      t.integer :post_code,    null: false
      t.string :addressee,     null: false
      t.string :address,       null: false
      t.timestamps
    end
    add_index :addresses, :customer_id
  end
end
