# USERS
User.create!(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com",
  password: "password123"
#   sex: "male",
#   weight_lbs: 180.5,
#   height_ft: 5,
#   height_in: 10,
#   age: 30,
#   activity_level: 3, 
#   target_calories: 2500,
#   target_fats: 70,
#   target_carbs: 300,
#   target_protein: 150
)

User.create!(
  first_name: "Kyle",
  last_name: "Lastname",
  email: "kyle.lastname@example.com",
  password: "password",
  sex: "male",
  weight_lbs: 180.5,
  height_ft: 5,
  height_in: 10,
  age: 30,
  activity_level: 3, 
  target_calories: 2500,
  target_fats: 70,
  target_carbs: 300,
  target_protein: 150
)
# FOODS
Food.create!(
  title: "Watermelon",
  image: "https://www.foodimagedb.com/food-images/203ca84e-f101-4e97-adc2-c60e32c53ed9_1024x1024.png",
  serving_size: "1 cup diced",
  calories: 46
  fats:
  carbs:
  protein:
)
# DIETS

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
  t.integer "fats"
  t.integer "carbs"
  t.integer "protein"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

