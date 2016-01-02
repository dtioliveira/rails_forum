# I'm pretty sure I'm a top-level class documentation comment
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorized?, except: :change_photo

  def index
    @user = current_user
    @users = User.search(params).page(params[:page]).per(9).
             where.not(id: current_user.id)
  end

  def ban
    @user = User.find(params[:user_id])
    @user.status_banned? ? @user.status_active! : @user.status_banned!
    @user.save
    @users = User.all.reject { |u| u == current_user }
  end

  def became_admin
    @user = User.find(params[:user_id])
    @user.is_admin = @user.is_admin ? false : true
    @user.save
    @users = User.all.reject { |u| u == current_user }
  end

  def change_photo
    @user = current_user
    @user.update(avatar: params[:avatar])
    redirect_to :back
  end

  private

  def authorized?
    if !current_user.is_admin
      flash[:alert] = t("You are not authorized to perform this action")
      redirect_to(request.referrer || root_path)
    end
  end
end
