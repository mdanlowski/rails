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
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      # @TODO validate if this is necessary
    else
      flash[:alert] = 'Unauthorized. Post you tried to edit is not yours.'
      redirect_to '/posts/new'
      
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(new_post_params)
      flash[:notice] = 'Post updated successfully.'
      redirect_to post_path(@post)
    else
      flash[:edit_post_errors] = @post.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if Post.find(params[:id]).destroy
      flash[:notice] = 'The post has ben deleted.'
      redirect_to '/users/show'

    end
  end

  private
    def new_post_params
      params.require(:post).permit(:title, :body)
      
    end
end
