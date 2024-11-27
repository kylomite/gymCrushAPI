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

  def update 

  end

  def delete

  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
