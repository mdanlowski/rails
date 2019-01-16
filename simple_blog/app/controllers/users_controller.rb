class UsersController < ApplicationController
  def new
  	# flash[:reg_errors] = ['ayylmao']

  end

  def create
  	user = User.new(user_register_params)
  	if user.save
  	# @u.save
  		session[:user_id] = user.id
  		redirect_to '/users/show'
  	else
  		flash[:reg_errors] = user.errors.full_messages
  		redirect_to '/users/new' 
  	end
  	

  end

  def show
  	# @u = User.find(id: session[:user_id])
  end

  private
  	def user_register_params
  		params.require(:user).permit(:email, :username, :password, :confirm_password)
  	end


end
