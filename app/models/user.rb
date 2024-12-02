class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :diets
  has_many :foods, through: :diets

  def convertToKg(lbs)
    return (lbs * 0.45359237).round(2)
  end

  def convertToCm(feet, inches)
    total_height_in_inches = (feet * 12) + inches
    return (total_height_in_inches * 2.54).round(2)
  end

  def calculateBMR(sex, weight, height, age)
    if sex == "male"
      return 66.47 + (13.75 * weight) + (5.003 * height) - (6.755 * age)
    else
      return 655.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age)
    end
  end

  def calculateAMR(bmr, activity_level)
    case activity_level
    when 0
      (bmr * 1.2).to_i
    when 1
      (bmr * 1.375).to_i
    when 2
      (bmr * 1.55).to_i
    when 3
      (bmr * 1.725).to_i
    when 4
      (bmr * 1.9).to_i
    else
      raise ArgumentError, "Invalid activity level: #{activity_level}"
    end
  end

  def calculateAndUpdateMacros(calories)
    update!(target_carbs: (calories * 0.5) / 4)
    update!(target_fats: (calories * 0.2) / 9)
    update!(target_protein: (calories * 0.2) / 4)
  end

  def calculateNutritionNeeds
    metricWeight = convertToKg(weight_lbs)
    metricHeight = convertToCm(height_ft, height_in)
    bmr = calculateBMR(sex, metricWeight, metricHeight, age)
    amr = calculateAMR(bmr, activity_level)
    calculateAndUpdateMacros(amr)
    update!(target_calories: amr)
  end
end
