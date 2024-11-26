class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        render json: UserSerializer.new(users)
    end

    def show

    end

    def create

    end

    def update 

    end

    def delete

    end
end
