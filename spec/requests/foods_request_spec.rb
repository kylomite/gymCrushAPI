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
  describe "GET all foods" do
    describe "HAPPY path" do
      it "returns a list of all foods assigned to a user" do

        get "/api/v1/users/#{@user.id}/foods"

        expect(response).to be_successful
        foods = JSON.parse(response.body, symbolize_names: true)

        expect(foods).to be_a(Hash)

        foods[:data].each do |food|
          expect(food).to have_key(:id)
          expect(food[:type]).to eq("food")

          attributes = food[:attributes]
          
          expect(attributes[:title]).to be_a(String)
          expect(attributes[:image]).to be_a(String)
          expect(attributes[:serving_size]).to be_a(String)
          expect(attributes[:calories]).to be_a(Integer)
          expect(attributes[:fats]).to be_a(Float)
          expect(attributes[:carbs]).to be_a(Float)
          expect(attributes[:protein]).to be_a(Float)
        end
      end
    end

    describe "SAD path" do
      
    end
  end
  describe "GET single food" do
    describe "HAPPY path" do
      it "returns an object containing one instance of a specified food" do
        get "/api/v1/users/#{@user.id}/foods/#{@food1.id}"

        expect(response).to be_successful
        food = JSON.parse(response.body, symbolize_names:true)[:data]

        expect(food[:id].to_i).to eq(@food1.id)
        expect(food[:type]).to eq("food")
        
        attributes = food[:attributes]

        expect(attributes[:title]).to eq(@food1.title)
        expect(attributes[:image]).to eq(@food1.image)
        expect(attributes[:serving_size]).to eq(@food1.serving_size)
        expect(attributes[:calories]).to eq(@food1.calories)
        expect(attributes[:fats]).to eq(@food1.fats)
        expect(attributes[:carbs]).to eq(@food1.carbs)
        expect(attributes[:protein]).to eq(@food1.protein)

      end
    end

    describe "SAD path" do
      
    end
  end

  describe "DELETE single food" do
    describe "HAPPY path" do
      it "destroys food based on the specified id" do
        food3 = Food.create!(
          title: "Broccoli",
          image: "https://www.foodimagedb.com/food-images/262ee4f2-13df-4a62-ad07-75f993adc04e_1024x1024.png",
          serving_size: "1 cup chopped",
          calories: 31,
          fats: 0.34,
          carbs: 6.04,
          protein: 2.57
        )

        Diet.create!(
          user_id: @user.id,
          food_id: food3.id
        )

        expect(@user.foods.count).to eq(3)
        delete "/api/v1/users/#{@user.id}/foods/#{food3.id}"

        expect(response).to be_successful

        expect(@user.foods.count).to eq(2)
      end
      it "only destroys the specific instance of a food from a users" do
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
          title: "Broccoli",
          image: "https://www.foodimagedb.com/food-images/262ee4f2-13df-4a62-ad07-75f993adc04e_1024x1024.png",
          serving_size: "1 cup chopped",
          calories: 31,
          fats: 0.34,
          carbs: 6.04,
          protein: 2.57
        )

        Diet.create!(
          user_id: @user.id,
          food_id: food3.id
        )

        Diet.create!(
          user_id: @user.id,
          food_id: food4.id
        )

        expect(@user.foods.count).to eq(4)
        delete "/api/v1/users/#{@user.id}/foods/#{food3.id}"

        expect(response).to be_successful

        expect(@user.foods.count).to eq(3)
      end
    end

    describe "SAD path" do
      
    end
  end
end
