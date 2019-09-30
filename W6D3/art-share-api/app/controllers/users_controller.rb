class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save 
      render json:user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params.require(:id))
    if user.destroy
      render json:user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    render json: User.all
  end

  def show
    render json: User.find(params.require(:id))
  end

  def update
    user = User.find(params.require(:id))
    if user.update(user_params)
      render json:user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:username)
  end
end
