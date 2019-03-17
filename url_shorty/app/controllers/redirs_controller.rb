class RedirsController < ApplicationController
  before_action :get_redir, only: [:show]

  def new; end

  def create
    #[@TODO] @DONE add a layer of validation where Ruby goes to the url to check if it returns sth
    url_from = redir_params[:source]
    # just one microservice, so it got placed in the model
    result = Redir.get_unique_hash(url_from)
    if result[:msg]
      puts result[:msg]
      flash[:alert] = result[:msg]
      redirect_to root_path
      return false
    
    elsif result[:already_in_database]
      flash[:lnk] = root_url.to_s + result[:hashed].to_s
      flash[:notice] = "We already have that! - "
      redirect_to root_path
      return false
    
    elsif !result[:already_in_database]
      @redir = Redir.new(redir_params)
      @redir.hashed = result[:hashed]

      if @redir.save
        respond_to do |format|
          format.html {
            flash[:lnk] = root_url.to_s + result[:hashed].to_s
            flash[:notice] = "Shortcut created!"
            redirect_to root_path
            }
          format.js
        end
              
      else
        flash[:alert] = redir.errors.full_messages
        redirect_to root_path
      end
      
    end

  end

  def show
    target_ = @redir.source
    if not target_.include?('http')
      target_ = 'http://' + target_
    end
    redirect_to target_

  end

  private
    def redir_params
      params.require(:redir).permit(:source)
    end

    def get_redir
      @redir = Redir.find_by(hashed: params[:id])
    end

end
