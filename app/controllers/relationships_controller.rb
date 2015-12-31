class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @relationships = Relationship.where('adder_id = :id OR added_id = :id', id: current_user.id)
  end

  def create
    @user = User.find(params[:relationship][:user_id])
    Relationship.create(adder_id: current_user.id, added_id: @user.id)
    @relationship = @user.has_relationship?(current_user).first
  end

  def destroy
    @user = User.find(params[:user_id])
    Relationship.where(adder_id: [current_user.id, @user.id], added_id: [@user.id, current_user.id]).destroy_all
    @relationship = @user.has_relationship?(current_user).first
  end
end
