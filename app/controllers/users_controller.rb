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
end
