class UsersController < ApplicationController
    def index
        render json: User.all
        # render plain: "I'm in the index action!"
    end

    def create
        # render json: params
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user, status: :created
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

    end
end
