class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to posts_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
  end
end