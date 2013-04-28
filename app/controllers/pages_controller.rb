class PagesController < ApplicationController
	skip_before_filter :authorize
	#Show some random projects from users.
	def index
	end
end
