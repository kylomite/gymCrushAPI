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

ActiveRecord::Schema[7.1].define(version: 2024_12_02_145720) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "food_id", null: false
    t.date "consumed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_diets_on_food_id"
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.string "serving_size"
    t.integer "calories"
    t.float "fats"
    t.float "carbs"
    t.float "protein"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "sex"
    t.float "weight_lbs"
    t.integer "height_ft"
    t.integer "height_in"
    t.integer "age"
    t.integer "activity_level"
    t.integer "target_calories"
    t.integer "target_fats"
    t.integer "target_carbs"
    t.integer "target_protein"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "diets", "foods"
  add_foreign_key "diets", "users"
end
