class Food < ApplicationRecord
    has_many :diets
    has_many :users, through: :diets
  end