class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @user = current_user
  end

  def profile
    @user = User.find(params[:user_id])
  end
end
