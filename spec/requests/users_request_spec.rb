require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do
    @user1 = User.create!(
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
      it "returns an array of all users with attributes" do
        get "/api/v1/users"

        expect(response).to be_successful
        users = JSON.parse(response.body, symbolize_names: true)

        expect(users[:data]).to have_length(2)
      end
    end

    describe "SAD path" do
      
    end
  end

  describe "GET single users" do
    describe "HAPPY path" do

    end

    describe "SAD path" do
      
    end
  end

  describe "PATCH single users" do
    describe "HAPPY path" do

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
