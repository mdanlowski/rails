class PostsController < ApplicationController

  before_action :authorize, only: [:new, :edit]
  # before_action :voted?, only: [:show]

  def index
    # @render_header = true
    @header_text = "The Simple Blog Project"
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
    @voted = current_user.voted_for.include?(params[:id].to_i) if current_user
  end

  def new
    # @render_header = false
  end

  def featured
    # @render_header = true
    @header_text = "Top Ten Posts"
    @posts = Post.all.sort_by(&:vote_points).reverse[0..10]
    @voted = current_user.voted_for.include?(params[:id].to_i) if current_user

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

  #
  def process_vote
    # a bit of security:
    @post = Post.find(params[:id])
    if current_user and @post.user_id != current_user.id and not current_user.voted_for.include?(@post.id)
      @post.vote_points += params[:vote_value].to_i
      @post.save
      u = current_user
      u.voted_for.push(@post.id)
      u.save
      flash[:notice] = 'Thanks for your vote!'
      # redirect_to post_path
      redirect_back(fallback_location: root_path)

    elsif @post.user_id == current_user.id
      flash[:alert] = 'You cannot rate your own post.'
      # redirect_to post_path
      redirect_back(fallback_location: root_path)
        
    elsif current_user.voted_for.include?(@post.id)
      flash[:alert] = 'You have already voted for this post.'
      # redirect_to post_path
      redirect_back(fallback_location: root_path)

    else
      flash[:alert] = 'Only registered users can rate posts.'
      # redirect_to post_path
      redirect_back(fallback_location: root_path)

    end
  end

  private def new_post_params
      params.require(:post).permit(:title, :body)
  end

  
end
