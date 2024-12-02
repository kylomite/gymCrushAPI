class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name,
             :last_name,
             :email,
             :sex,
             :weight_lbs,
             :height_ft,
             :height_in,
             :age,
             :activity_level,
             :target_calories,
             :target_fats,
             :target_carbs,
             :target_protein
end
