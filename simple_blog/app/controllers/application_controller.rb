class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception # auth stuff

	helper_method :current_user # symbol

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	# @TIPS
	# ||= ensures caching instead poking the db

	def authorize
		if current_user.nil?
			redirect_to '/sessions/new'
			flash[:alert] = "Unauthorized. You must log in to see this page"
		end
	end
	
end
