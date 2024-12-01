# USERS
user1 = User.create!(
  first_name: "John",
  last_name: "Doe",
  email: "john.doe@example.com",
  password: "password123"
)

user2 = User.create!(
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
food1 = Food.create!(
  title: "Watermelon",
  image: "https://www.foodimagedb.com/food-images/203ca84e-f101-4e97-adc2-c60e32c53ed9_1024x1024.png",
  serving_size: "1 cup diced",
  calories: 46,
  fats: 0.23,
  carbs: 11.48,
  protein: 0.93
)

food2 = Food.create!(
  title: "Chicken Breast",
  image: "https://www.foodimagedb.com/food-images/bc47e77b-3a5c-4a8e-aa6c-786646a8934a_1024x1024.png",
  serving_size: "100 g",
  calories: 195,
  fats: 7.72,
  carbs: 0,
  protein: 29.55
)

food3 = Food.create!(
  title: "Broccoli",
  image: "https://www.foodimagedb.com/food-images/262ee4f2-13df-4a62-ad07-75f993adc04e_1024x1024.png",
  serving_size: "1 cup chopped",
  calories: 31,
  fats: 0.34,
  carbs: 6.04,
  protein: 2.57
)

food4 = Food.create!(
  title: "Orange",
  image: "https://www.foodimagedb.com/food-images/0602d920-3c59-4c63-8b92-fbba14539750_1024x1024.png",
  serving_size: "1 fruit",
  calories: 62,
  fats: 0.16,
  carbs: 15.39,
  protein: 1.23
)

# DIETS

Diet.create!(
  user_id: user1.id,
  food_id: food1.id
)

Diet.create!(
  user_id: user1.id,
  food_id: food2.id
)

Diet.create!(
  user_id: user2.id,
  food_id: food1.id
)

Diet.create!(
  user_id: user2.id,
  food_id: food2.id
)

Diet.create!(
  user_id: user2.id,
  food_id: food3.id
)

Diet.create!(
  user_id: user2.id,
  food_id: food4.id
)


