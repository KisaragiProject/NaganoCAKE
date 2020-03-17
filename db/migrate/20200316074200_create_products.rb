class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string  :name, null: false
      t.text    :introduction, null: false
      t.boolean :status, null: false
      t.string	:image_id, null:false
      t.integer :price, null: false

      t.timestamps
    end
   add_index :products, :name
  end
end
