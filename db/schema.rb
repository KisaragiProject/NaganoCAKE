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

ActiveRecord::Schema.define(version: 2020_03_19_103008) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "post_code", null: false
    t.string "addressee", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cart_items_on_customer_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.boolean "is_active", default: true, null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.string "family_name", null: false
    t.string "family_name_kana", null: false
    t.string "post_code", null: false
    t.string "address", null: false
    t.string "tel", null: false
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
    t.string "name", null: false
    t.boolean "validity", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.integer "quantity", null: false
    t.integer "order_price", null: false
    t.integer "make_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_order_items_on_customer_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "addressee", null: false
    t.string "post_code", null: false
    t.string "send_to_address", null: false
    t.boolean "how_to_pay", default: true, null: false
    t.integer "deliver_fee", null: false
    t.integer "order_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.boolean "status", default: true, null: false
    t.string "image_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_products_on_name"
  end

end
