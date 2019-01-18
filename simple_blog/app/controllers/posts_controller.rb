class PostsController < ApplicationController

  before_action :authorize, only: [:new, :edit]

  def index
    @render_header = true
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @render_header = false
  end

  def create
    @post = Post.new(new_post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to '/users/show'
      flash[:notice] = 'Post saved successfully.'
    else
      flash[:new_post_errors] = @post.errors.full_messages
      redirect_to '/posts/new'
      # render plain: @post.errors.full_messages
    end
  end

  def edit
    
  end

  def destroy
  end

  private
    def new_post_params
      params.require(:post).permit(:title, :body)
      
    end
end
