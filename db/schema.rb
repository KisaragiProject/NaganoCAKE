# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_16_074200) do

  create_table "customers", force: :cascade do |t|
    t.boolean "is_active"
    t.string "first_name"
    t.string "first_name_kana"
    t.string "family_name"
    t.string "family_name_kana"
    t.string "post_code"
    t.string "address"
    t.string "tel"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["family_name"], name: "index_customers_on_family_name"
    t.index ["family_name_kana"], name: "index_customers_on_family_name_kana"
    t.index ["first_name"], name: "index_customers_on_first_name"
    t.index ["first_name_kana"], name: "index_customers_on_first_name_kana"
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["tel"], name: "index_customers_on_tel"
  end

  create_table "genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id"
    t.string "name"
    t.text "introduction"
    t.boolean "status"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name"
  end

end
