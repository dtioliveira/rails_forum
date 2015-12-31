class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
    @posts = Post.all
    @videos = Video.all
  end

  def profile
    @user = User.friendly.find(params[:user_id])
    @posts = @user.posts
    @relationship = @user.has_relationship?(current_user).first
  end

  def videos
    @user = current_user
    @videos = Video.all
  end

  def posts
    @user = current_user
    @posts = Post.all
  end
end
