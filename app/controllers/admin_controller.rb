class AdminController < ApplicationController
  def index
  	@user_count = User.count
  	@user = User.find_by_id(session[:user_id])
  end
end
