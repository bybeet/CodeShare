class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize, :current_user

  protected

  	def authorize
  		unless User.find_by_id(session[:user_id])
  			redirect_to login_url, notice: "Please log in"
  		end
  	end

  	def current_user
  		@current_user = User.find_by_id(session[:user_id])
  	end

end
