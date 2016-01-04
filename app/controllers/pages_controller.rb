# I'm pretty sure I'm a top-level class documentation comment
class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
    @posts = Post.last(5).reverse
    @videos = Video.last(5).reverse
  end

  def profile
    @user = User.friendly.find(params[:user_id])
    @posts = @user.posts.search(params).page(params[:page]).per(10)
    @relationship = @user.relationship?(current_user).first
  end

  def videos
    @user = current_user
    @videos = Video.search(params).page(params[:page]).per(10)
  end

  def posts
    @user = current_user
    @posts = Post.search(params).page(params[:page]).per(10)
  end
end
