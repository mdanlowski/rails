class UsersController < ApplicationController
# @TIPS
# You can restrict more than one page by using comma separated values:
# before_action :authorize, only: [:secret, :index, :edit]
# or all pages except those listed:
# before_action :authorize, except: [:index, :show]

  before_action :authorize, only: [:show]

  def new
    @render_header = true

    # @user = User.new
  	# flash[:reg_errors] = ['ayylmao']
    if current_user
      redirect_to root_path
      flash[:alert] = "You must log out to register a new account"
    end
  end

  def create
    @render_header = true

  	@user = User.new(user_register_params)
    # render plain: params[:user].inspect
  	if @user.save
        session[:user_id] = @user.id
  		# puts session[:user_id], @user.id
  	    redirect_to '/users/show'
        flash[:notice] = 'Success. You have registered!'
  	else
  		flash[:register_errors] = @user.errors.full_messages
  		redirect_to '/users/new'
  	end
  	

  end

  def show
    @render_header = false
    @current_user_posts = current_user.posts.all

  	# @user = current_user
  end

  private
  	def user_register_params
  		params.require(:user).permit(:email, :username, :password, :password_confirmation)
  	end


end
