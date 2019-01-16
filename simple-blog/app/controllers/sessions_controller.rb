class SessionsController < ApplicationController

  def new
    render('users/login')
    
  end

  def create # db interaction after form submission
    # render plain: params[:user].inspect
    @s = Session.new(user_log_params)
    @s.save
    # redirect_to root_path
    render plain: params[:session].inspect
  end


  private def user_log_params
    params.require(:session).permit(:username, :password )
  end

end
