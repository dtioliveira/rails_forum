class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all.reject{ |u| u == current_user }
  end
end
