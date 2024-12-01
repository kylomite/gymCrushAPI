class Api::V1::Users::FoodsController < ApplicationController
  def index
    user = User.find(params[:user_id].to_i)
    foods = user.foods

    render json: FoodSerializer.new(foods)
  end

  def show
    user = User.find(params[:user_id].to_i)
    food = Food.find(params[:id].to_i)

    render json: FoodSerializer.new(food)
  end

  def destroy

  end
end
