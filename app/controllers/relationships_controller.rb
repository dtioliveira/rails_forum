# I'm pretty sure I'm a top-level class documentation comment
class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @relationships = Relationship.where(
      'adder_id = :id OR added_id = :id', id: current_user.id
    )
  end

  def create
    @user = User.find(params[:relationship][:user_id])
    Relationship.create(adder_id: current_user.id, added_id: @user.id)
    @relationship = @user.relationship?(current_user).first
  end

  def accept
    @user = current_user
    @relationship = Relationship.find(params[:relationship_id])
    @relationship.update(situation: 'accepted')
    @relationships = Relationship.where(
      'adder_id = :id OR added_id = :id', id: current_user.id
    )
  end

  def reject
    @user = current_user
    @relationship = Relationship.find(params[:relationship_id])
    @relationship.destroy
    @relationships = Relationship.where(
      'adder_id = :id OR added_id = :id', id: current_user.id
    )
  end

  def destroy
    @user = User.find(params[:user_id])
    Relationship.where(
      adder_id: [current_user.id, @user.id],
      added_id: [@user.id, current_user.id]
    ).destroy_all
    @relationship = @user.relationship?(current_user).first
  end
end
