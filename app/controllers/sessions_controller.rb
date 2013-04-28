class SessionsController < ApplicationController

	skip_before_filter :authorize

  def new
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		if user.isAdmin
  			redirect_to admin_url
  		else
  			redirect_to users_url
  		end
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Logged out"
  end
end