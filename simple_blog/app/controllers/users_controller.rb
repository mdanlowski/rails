class UsersController < ApplicationController
  def new
    # @user = User.new
  	# flash[:reg_errors] = ['ayylmao']

  end

  def create
  	@user = User.new(user_register_params)
    # render plain: params[:user].inspect
  	if @user.save
      session[:user_id] = @user.id
  		  puts session[:user_id], @user.id
  		redirect_to '/users/show'
      flash[:notice] = 'Success. You have registered!'
  	else
  		flash[:register_errors] = @user.errors.full_messages
  		redirect_to '/users/new'
  	end
  	

  end

  def show
  	@user = User.find(session[:user_id])
  end

  private
  	def user_register_params
  		params.require(:user).permit(:email, :username, :password, :password_confirmation)
  	end


end
