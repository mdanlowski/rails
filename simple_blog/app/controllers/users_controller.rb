class UsersController < ApplicationController
# @TIPS
# You can restrict more than one page by using comma separated values:
# before_action :authorize, only: [:secret, :index, :edit]
# or all pages except those listed:
# before_action :authorize, except: [:index, :show]

  before_action :authorize, only: [:show]

  def new
    # @header_text = "The Simple Blog Project"

    # @user = User.new
  	# flash[:reg_errors] = ['ayylmao']
    if current_user
      redirect_to root_path
      flash[:alert] = "You must log out to register a new account"
    end
  end

  def create
  	user = User.new(user_register_params)
    # render plain: params[:user].inspect
    user.voted_for = []
  	if user.save
        session[:user_id] = user.id
  		# puts session[:user_id], @user.id
  	    redirect_to '/users/show'
        flash[:notice] = 'Success. You have registered!'
  	else
  		flash[:register_errors] = user.errors.full_messages
  		redirect_to '/users/new'
  	end
  	

  end

  def show
    # @user = User.find(params[:id])
    @current_user_posts = current_user.posts.all

  	# @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_edit_params)
      flash[:notice] = 'Update successful.'
      redirect_to users_show_path
    else
      flash[:edit_user_errors] = @user.errors.full_messages
      render 'edit'
    end
    # current_user.update_attributes(user_edit_params)
  end

  private def user_register_params
  		params.require(:user).permit(:email, :username, :password, :password_confirmation)
  	end
  private def user_edit_params
      # params.require(:user).permit(:photo, :password, :password_confirmation)
      params.require(:user).permit(:photo, :password, :password_confirmation)
    end

end
