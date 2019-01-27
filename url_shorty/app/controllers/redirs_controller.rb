class RedirsController < ApplicationController
  def new
    @all_links = Redir.all.paginate(page: params[:page], per_page: 10)
  end

  def create
    rdr = Redir.new(redir_params)
    #@TODO add a layer of validation where Ruby goes to the url to check if it returns anyth. or Python
    if rdr.save
      # redirect_to '/redirs/track/' + rdr.id.to_s
      redirect_to root_path
      flash[:notice] = "Shorty created!"
      flash[:newly_created_redir] =  root_url.to_s + rdr.id.to_s

    else
      flash[:alert] = rdr.errors.full_messages
      redirect_to root_path
    end


  end

  def track
    target_ = Redir.find(params[:id]).from
    if not target_.include?('http')
      target_ = 'http://' + target_
    end
    redirect_to target_

  end

  private
    def redir_params
      params.require(:redir).permit(:from, :hashed, :visited, :last_visited)
    end

end
