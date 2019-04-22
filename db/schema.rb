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

ActiveRecord::Schema.define(version: 2019_04_22_214944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "duration"
    t.bigint "serie_id"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serie_id"], name: "index_episodes_on_serie_id"
  end

  create_table "identities", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "rating"
    t.integer "duration"
    t.integer "price"
    t.integer "status"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "paid_price"
    t.string "rentable_type"
    t.bigint "rentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rentable_type", "rentable_id"], name: "index_rentals_on_rentable_type_and_rentable_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "series", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "rating"
    t.integer "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "episodes", "series", column: "serie_id"
  add_foreign_key "identities", "users"
  add_foreign_key "providers", "users"
end
