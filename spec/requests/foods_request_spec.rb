require 'rails_helper'

RSpec.describe "Foods", type: :request do
  before (:each) do
    @user = User.create!(
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

    @food1 = Food.create!(
      title: "Watermelon",
      image: "https://www.foodimagedb.com/food-images/203ca84e-f101-4e97-adc2-c60e32c53ed9_1024x1024.png",
      serving_size: "1 cup diced",
      calories: 46,
      fats: 0.23,
      carbs: 11.48,
      protein: 0.93
    )

    @food2 = Food.create!(
      title: "Chicken Breast",
      image: "https://www.foodimagedb.com/food-images/bc47e77b-3a5c-4a8e-aa6c-786646a8934a_1024x1024.png",
      serving_size: "100 g",
      calories: 195,
      fats: 7.72,
      carbs: 0,
      protein: 29.55
    )
    Diet.create!(
      user_id: @user.id,
      food_id: @food1.id
    )

    Diet.create!(
      user_id: @user.id,
      food_id: @food2.id
    )
  end
  describe "GET /index" do
    describe "HAPPY path" do
      it "returns a list of all foods assigned to a user" do

        get "/api/v1/users/#{@user.id}/foods"

        expect(response).to be_successful
        foods = JSON.parse(response.body, symbolize_names: true)
        binding.pry
      end
    end

    describe "SAD path" do
      
    end
  end
end
