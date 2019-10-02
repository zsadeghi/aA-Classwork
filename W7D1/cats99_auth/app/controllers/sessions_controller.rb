class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if user
      login(user)
      redirect_to cats_url
    else
      render json: ["Invalid username/pw"], status: 401
      user.errors.full_messages
    end

  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
