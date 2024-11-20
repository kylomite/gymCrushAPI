class User < ApplicationRecord
    has_many :diets
    has_many :foods, through: :diets
  end
