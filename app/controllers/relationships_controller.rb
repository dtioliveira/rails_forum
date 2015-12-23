class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:relationship][:user_id])
    Relationship.create(adder_id: current_user.id, added_id: @user.id)
  end

  def destroy
    @user = User.find(params[:relationship][:user_id])
    Relationship.where(adder_id: current_user.id, added_id: @user.id).destroy_all
  end
end
