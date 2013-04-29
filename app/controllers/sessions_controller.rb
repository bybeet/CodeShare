class SessionsController < ApplicationController

	skip_before_filter :authorize
  skip_before_filter :isAdmin

  def new
    Rails.logger.info "Session new"
  end

  def create
  	user = User.find_by_name(params[:name])
    Rails.logger.info "Session create"
    puts "authenticating user"
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		if user.isAdmin
  			redirect_to admin_url
  		else
  			redirect_to user_path(user.id)
  		end
  	else
  		redirect_to login_url, alert: "Invalid user/password combination"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, notice: "Logged out"
  end
end