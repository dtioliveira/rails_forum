class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all.reject{ |u| u == current_user }
  end

  def ban
    @user = User.find(params[:user_id])
    @user.status_banned? ? @user.status_active! : @user.status_banned!
    @user.save
    @users = User.all.reject{ |u| u == current_user }
  end

  def became_admin
    @user = User.find(params[:user_id])
    @user.is_admin = @user.is_admin ? false : true
    @user.save
    @users = User.all.reject{ |u| u == current_user }
  end
end
