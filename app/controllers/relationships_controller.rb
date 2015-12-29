class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:relationship][:user_id])
    Relationship.create(adder_id: current_user.id, added_id: @user.id)
    @relationship = @user.has_relationship?(current_user).first
  end

  def destroy
    @user = User.find(params[:user_id] || params[:relationship][:user_id])
    Relationship.where(adder_id: current_user.id, added_id: @user.id).destroy_all
    @relationship = @user.has_relationship?(current_user).first
  end
end
