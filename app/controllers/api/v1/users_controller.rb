class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  def show
    user = User.find_by(id: params[:id].to_i)
    if user.nil?
      #RENDER ERROR
    else
      render json: UserSerializer.new(user)
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: :created
    else
      #RENDER ERROR render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      render json: UserSerializer.new(user)
    else
      render json: { errors: ['Invalid email or password'] }, status: :unauthorized
    end
  end

  def update 
    user = User.find_by(id: params[:id].to_i)
    if user.nil?
      #RENDER ERROR
    elsif params[:calculate_nutrition_needs] == "true"
      user.calculateNutritionNeeds
      render json: UserSerializer.new(user), status: :ok
    else
      user.update!(user_params)
      render json: UserSerializer.new(user), status: :ok
    end
  end

  def destroy
    render json: User.destroy(params[:id]), status: 204
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :sex, :weight_lbs, :height_ft, :height_in, :age, :activity_level, :target_calories, :target_fats, :target_carbs, :target_protein)
  end

  def login_params
    params.permit(:email, :password)
  end
end
