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

ActiveRecord::Schema[7.0].define(version: 2023_04_21_103533) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "cep"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "status", default: "active"
    t.bigint "county_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_addresses_on_county_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.string "id_ibge"
    t.string "state"
    t.string "status", default: "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "full_name"
    t.string "cpf"
    t.string "cns"
    t.string "email"
    t.date "birthday", default: "2023-04-22"
    t.string "phone"
    t.string "status", default: "active"
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_people_on_address_id"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["full_name"], name: "index_people_on_full_name", unique: true
  end

  add_foreign_key "addresses", "counties"
  add_foreign_key "people", "addresses"
end
