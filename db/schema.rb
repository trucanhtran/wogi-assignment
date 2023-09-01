# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_01_094604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_controls", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_access_controls_on_product_id"
    t.index ["user_id"], name: "index_access_controls_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website"
    t.integer "established_year"
    t.string "location"
    t.boolean "availability"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_brands_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.decimal "value", precision: 10, scale: 2, null: false
    t.string "code", null: false
    t.string "purchase_details_pin"
    t.boolean "cancelled", default: false
    t.datetime "cancelled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cards_on_product_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.integer "stock_quantity"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.decimal "discount_percentage", precision: 5, scale: 2
    t.float "rating"
    t.boolean "availability", default: true
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "payout_rate"
    t.boolean "admin", default: false
  end

  add_foreign_key "access_controls", "products"
  add_foreign_key "access_controls", "users"
  add_foreign_key "brands", "users"
  add_foreign_key "cards", "products"
  add_foreign_key "cards", "users"
  add_foreign_key "products", "brands"
end
