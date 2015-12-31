# I'm pretty sure I'm a top-level class documentation comment
class RaterController < ApplicationController
  before_action :authenticate_user!
  def create
    obj = params[:klass].classify.constantize.find(params[:id])
    obj.rate params[:score].to_f, current_user, params[:dimension]
    render json: true
  end
end
