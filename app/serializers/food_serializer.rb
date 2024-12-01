class FoodSerializer
  include JSONAPI::Serializer
  attributes :title,
             :image,
             :serving_size,
             :calories,
             :fats,
             :carbs,
             :protein
end