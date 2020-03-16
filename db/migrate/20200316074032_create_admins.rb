class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :first_name, null: false
      t.integer :first_name_kana, null: false
      t.string :family_name, null: false
      t.string :family_name_kana, null: false
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
    add_index :id
  end
end
