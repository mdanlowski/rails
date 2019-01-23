class SessionsController < ApplicationController


  def new
    # @header_text = "The Simple Blog Project"
  	
    # flash[:login_errors] = ['ayylmao']
    if current_user
      redirect_to root_path
      flash[:alert] = "You are already logged in"
    end
  end

  def create
    @user = User.find_by(username: user_login_params[:username])
    if @user and @user.authenticate(user_login_params[:password])
      session[:user_id] = @user.id
      redirect_to '/users/show'
      flash[:notice] = 'Login successful.'
    else
      flash[:login_errors] = ['Username and password combination invalid']
      redirect_to '/sessions/new'
    end

  end

  def destroy
    # @TODO is this ok for logout?
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = 'Signed out successfully.'
  end

  private
    def user_login_params
      # @TIPS
      # :session corresponds to form field names on the login page: session[username] etc
      params.require(:session).permit(:username, :password)
    end

end
