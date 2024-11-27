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

  end

  def update 

  end

  def delete

  end
end
