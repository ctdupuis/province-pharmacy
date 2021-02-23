# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_22_032022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "check_entries", force: :cascade do |t|
    t.string "patient_name"
    t.string "rx_num"
    t.integer "original_amt"
    t.integer "adjusted_amt"
    t.bigint "check_log_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["check_log_id"], name: "index_check_entries_on_check_log_id"
  end

  create_table "check_logs", force: :cascade do |t|
    t.boolean "demo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "post_id"
    t.boolean "edited"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string "title"
    t.boolean "demo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "delivery_entries", force: :cascade do |t|
    t.bigint "delivery_log_id", null: false
    t.bigint "user_id"
    t.float "miles"
    t.string "patient_name"
    t.string "patient_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_log_id"], name: "index_delivery_entries_on_delivery_log_id"
    t.index ["user_id"], name: "index_delivery_entries_on_user_id"
  end

  create_table "delivery_logs", force: :cascade do |t|
    t.boolean "demo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.boolean "demo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "product_name"
    t.integer "quantity"
    t.string "unit_of_measurement"
    t.string "category"
    t.bigint "inventory_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.bigint "conversation_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "demo"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "schedule_id"
    t.bigint "user_id"
    t.string "date"
    t.string "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_shifts_on_schedule_id"
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.boolean "demo"
  end

  add_foreign_key "check_entries", "check_logs"
  add_foreign_key "delivery_entries", "delivery_logs"
  add_foreign_key "delivery_entries", "users"
  add_foreign_key "items", "inventories"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
end
