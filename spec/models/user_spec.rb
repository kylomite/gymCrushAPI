require 'rails_helper'

RSpec.describe User, type: :model do
  before (:each) do
    @test_user = User.create!(
      first_name: "Test",
      last_name: "User",
      email: "FakeUser@gmail.com",
      password: "password",
      sex: "male",
      weight_lbs: 165,
      height_ft: 5,
      height_in: 10,
      age: 25,
      activity_level: 0
    )
  end
  describe "convertToKg()" do
    it "converts pounds to kilograms" do
      result = @test_user.convertToKg(@test_user.weight_lbs)
      expect(result).to eq(74.84)
    end
  end

  describe "convertToCm()" do
    it "converts height in feet and inches into centimeters" do
      result = @test_user.convertToCm(@test_user.height_ft, @test_user.height_in)
      expect(result).to eq(177.8)
    end
  end

  describe "calculateBMR()" do
    it "returns a users Basil Metabolic Rate" do
      metricWeight = @test_user.convertToKg(@test_user.weight_lbs)
      metricHeight = @test_user.convertToCm(@test_user.height_ft, @test_user.height_in)
      
      bmr = @test_user.calculateBMR(@test_user.sex, metricWeight, metricHeight, @test_user.age)
      expect(bmr).to eq(1816.1784)
    end
  end

  describe "calculateAMR()" do
    it "returns a users Active Metabolic Rate" do
      metricWeight = @test_user.convertToKg(@test_user.weight_lbs)
      metricHeight = @test_user.convertToCm(@test_user.height_ft, @test_user.height_in)
      bmr = @test_user.calculateBMR(@test_user.sex, metricWeight, metricHeight, @test_user.age)
      
      amr = @test_user.calculateAMR(bmr, @test_user.activity_level)
      expect(amr).to eq(2179)
    end
  end

  describe "calculateAndUpdateMacros" do
    it "calculates a user's macro needs and updates the user's macro attributes" do
      @test_user.calculateAndUpdateMacros(2179)

      expect(@test_user.target_carbs).to eq(272)
      expect(@test_user.target_fats).to eq(48)
      expect(@test_user.target_protein).to eq(108)
    end
  end

  describe "calculateNutritionNeeds" do
    it "updates a users target nutrition values based on their metrics" do
      # @test_user.calculateNutritionNeeds
      @test_user.calculateNutritionNeeds

      expect(@test_user.target_calories).to eq(2179)
      expect(@test_user.target_carbs).to eq(272)
      expect(@test_user.target_fats).to eq(48)
      expect(@test_user.target_protein).to eq(108)
    end
  end
end
