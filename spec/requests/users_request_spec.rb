require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do
    @user1 = User.create!(
      first_name: "John",
      last_name: "Doe",
      email: "john.doe@example.com",
      password: "password123"
    )

    @user2 = User.create!(
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
  end
  describe "GET all users" do
    describe "HAPPY path" do
      it "returns a hash of all users with attributes" do
        get "/api/v1/users"

        expect(response).to be_successful
        users = JSON.parse(response.body, symbolize_names: true)

        expect(users).to be_a(Hash)

        users[:data].each do |user|
          expect(user).to have_key(:id)
          expect(user[:id]).to be_a(String)

          expect(user).to have_key(:type)
          expect(user[:type]).to eq("user")

          attributes = user[:attributes]

          expect(attributes).to have_key(:first_name)
          expect(attributes[:first_name]).to be_a(String)
          
          expect(attributes).to have_key(:last_name)
          expect(attributes[:last_name]).to be_a(String)
          
          expect(attributes).to have_key(:email)
          expect(attributes[:email]).to be_a(String)
          
          expect(attributes).to have_key(:password)
          expect(attributes[:password]).to be_a(String)
          
          expect(attributes).to have_key(:sex)
          expect(attributes[:sex]).to be_a(String).or be_nil
          
          expect(attributes).to have_key(:weight_lbs)
          expect(attributes[:weight_lbs]).to be_a(Float).or be_nil
          
          expect(attributes).to have_key(:height_ft)
          expect(attributes[:height_ft]).to be_a(Integer).or be_nil
          
          expect(attributes).to have_key(:height_in)
          expect(attributes[:height_in]).to be_a(Integer).or be_nil
          
          expect(attributes).to have_key(:age)
          expect(attributes[:age]).to be_a(Integer).or be_nil
          
          expect(attributes).to have_key(:activity_level)
          expect(attributes[:activity_level]).to be_a(Integer).or be_nil
          
          expect(attributes).to have_key(:target_calories)
          expect(attributes[:target_calories]).to be_a(Integer).or be_nil
          
          expect(attributes).to have_key(:target_fats)
          expect(attributes[:target_fats]).to be_a(Integer).or be_nil
          
          expect(attributes).to have_key(:target_carbs)
          expect(attributes[:target_carbs]).to be_a(Integer).or be_nil
          
          expect(attributes).to have_key(:target_protein)
          expect(attributes[:target_protein]).to be_a(Integer).or be_nil
          
        end
      end
    end

    describe "SAD path" do
      
    end
  end

  describe "GET single users" do
    describe "HAPPY path" do
      it "returns an object containing one instance of specified user" do
        get "/api/v1/users/#{@user1.id}"

        expect(response).to be_successful
        user = JSON.parse(response.body, symbolize_names: true)

        expect(user).to be_a(Hash)

        expect(user[:data][:attributes][:first_name]).to eq(@user1.first_name)
      end
    end

    describe "SAD path" do
      
    end
  end

  describe "CREATE single users" do
    describe "HAPPY path" do
      it "creates a new instance of a user" do
        user_params = {
          first_name: "Test",
          last_name: "User",
          email: "FakeUser@gmail.com",
          password: "qwertyuiop"
        }

        post "/api/v1/users", params: user_params

        new_user = JSON.parse(response.body, symbolize_names: true)

        expect(new_user[:data][:attributes][:first_name]).to eq("Test")
        expect(new_user[:data][:attributes][:last_name]).to eq("User")
      end
    end

    describe "SAD path" do
      
    end
  end

  describe "PATCH single users" do
    describe "HAPPY path" do
      it "updates the attributes of the specified user" do

      end

      it "correctly calls the calculateNutritionNeeds() to updated nutrition attributes" do

      end
    end

    describe "SAD path" do
      
    end
  end

  describe "DELETE single users" do
    describe "HAPPY path" do

    end

    describe "SAD path" do
      
    end
  end
end
