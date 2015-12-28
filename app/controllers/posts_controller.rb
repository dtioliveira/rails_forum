class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_post, except: [:new, :create, :index]

  def index
    @user = current_user
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    respond_with @post, location: -> { posts_url }
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    respond_with @post, location: -> { posts_url }
  end

  def destroy
    @post.destroy
    respond_with @post, location: -> { posts_url }
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :tags)
  end

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
