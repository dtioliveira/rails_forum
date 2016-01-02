# I'm pretty sure I'm a top-level class documentation comment
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_post, except: [:new, :create, :index]

  def index
    @user = current_user
    @posts = current_user.posts.search(params).page(params[:page]).per(9).order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    respond_with @post, location: -> { posts_url }
  end

  def show
    @comment = current_user.comments.new
    @comments = @post.comments.by_locale(I18n.locale).order(created_at: :desc)
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
    params.require(:post).permit(
      :title_pt, :title_es,
      :text_pt, :text_es,
      :tags_pt, :tags_es
    )
  end

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
