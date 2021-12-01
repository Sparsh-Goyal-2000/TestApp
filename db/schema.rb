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

ActiveRecord::Schema.define(version: 2021_12_01_162333) do

  create_table "branch_products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "product_id"
    t.integer "price_in_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "available", default: true
    t.index ["branch_id"], name: "index_branch_products_on_branch_id"
    t.index ["product_id"], name: "index_branch_products_on_product_id"
  end

  create_table "branches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "address"
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "line_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "reservation_id"
    t.bigint "branch_product_id"
    t.integer "quantity"
    t.integer "buying_price_in_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_product_id"], name: "index_line_items_on_branch_product_id"
    t.index ["reservation_id"], name: "index_line_items_on_reservation_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.bigint "customer_id"
    t.integer "person_count"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "total_amount_in_cents"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_reservations_on_branch_id"
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
  end

  create_table "reservations_tables", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "table_id", null: false
    t.index ["reservation_id"], name: "index_reservations_tables_on_reservation_id"
    t.index ["table_id"], name: "index_reservations_tables_on_table_id"
  end

  create_table "tables", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "branch_id"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_id"], name: "index_tables_on_branch_id"
  end

end
