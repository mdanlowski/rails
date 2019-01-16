class UsersController < ApplicationController
 
  def new
    render('users/register') # registration form
  end

  def create # db interaction after form submission
    # render plain: params[:user].inspect
    @u = User.new(user_reg_params)
    @u.save
    redirect_to root_path
  end


  private def user_reg_params
    params.require(:user).permit(:username, :password, :email )
  end

end
