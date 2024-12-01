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

  def create
    user = User.find(params[:user_id].to_i)
    food = Food.new(food_params)
    if food.save
      user.diets.create(food: food)
      render json: FoodSerializer.new(food), status: :created
    else
      #RENDER ERROR render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    food = Food.find(params[:id].to_i)
    user = User.find(params[:user_id].to_i)

    user.diets.where(food: food).destroy_all

    render json: Food.destroy(params[:id]), status: 204
  end

  private

  def food_params
    params.permit(:title, :image, :serving_size, :calories, :fats, :carbs, :protein)
  end
end
