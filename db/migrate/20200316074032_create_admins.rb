class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :first_name
      t.integer :first_name_kana
      t.string :family_name
      t.string :family_name_kana
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
