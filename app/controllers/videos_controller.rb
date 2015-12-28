class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_video, except: [:new, :create, :index]

  def index
    @user = current_user
    @videos = current_user.videos
  end

  def new
    @video = current_user.videos.new
  end

  def create
    @video = current_user.videos.create(video_params)
    respond_with @video, location: -> { videos_url }
  end

  def show
    @comment = current_user.comments.new
  end

  def edit
  end

  def update
    @video.update(video_params)
    respond_with @video, location: -> { videos_url }
  end

  def destroy
    @video.destroy
    respond_with @video, location: -> { videos_url }
  end

  private
  def video_params
    params.require(:video).permit(:url, :title, :tags)
  end

  def set_user
    @user = current_user
  end

  def set_video
    @video = Video.find(params[:id])
  end
end
