class AdminController < ApplicationController
  def index
  	@user_count = Users.count
  end
end
