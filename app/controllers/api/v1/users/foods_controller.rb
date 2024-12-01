class Api::V1::Users::FoodsController < ApplicationController
    def index
        user = User.find(params[:user_id].to_i)
        foods = user.foods

        render json: FoodSerializer.new(foods)
    end

    def show

    end

    def destroy

    end
end
