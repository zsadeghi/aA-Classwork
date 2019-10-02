class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(helper_user)
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to users_url
    else
      render :new, status: 422
    end
  end


  private
  def helper_user
    params.require(:user).permit(:user_name, :password, :password_digest, :session_token)
  end
end
