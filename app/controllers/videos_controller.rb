# I'm pretty sure I'm a top-level class documentation comment
class VideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_video, except: [:new, :create, :index]

  def index
    @user = current_user
    @videos = current_user.videos.search(params).page(params[:page]).per(9).order(created_at: :desc)
    authorize Video.new
  end

  def new
    @video = current_user.videos.new
    authorize @video
  end

  def create
    authorize @video
    @video = current_user.videos.create(video_params)
    respond_with @video, location: -> { videos_url }
  end

  def show
    @comment = current_user.comments.new
    @comments = @video.comments.by_locale(I18n.locale).order(created_at: :desc)
  end

  def edit
    authorize @video
  end

  def update
    authorize @video
    @video.update(video_params)
    respond_with @video, location: -> { videos_url }
  end

  def destroy
    authorize @video
    @video.destroy
    respond_with @video, location: -> { videos_url }
  end

  private

  def video_params
    params.require(:video).permit(
      :url, :title_pt, :title_es, :tags_pt, :tags_es
    )
  end

  def set_user
    @user = current_user
  end

  def set_video
    @video = Video.friendly.find(params[:id])
  end
end
