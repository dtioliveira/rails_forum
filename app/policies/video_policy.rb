class VideoPolicy
  attr_reader :user, :video

  def initialize(user, video)
    @user = user
    @video = video
  end

  def index?
    user.is_admin
  end

  def new?
    user.is_admin
  end

  def create?
    user.is_admin
  end

  def edit?
    user.is_admin and video.user == user
  end

  def update?
    user.is_admin and video.user == user
  end

  def destroy?
    user.is_admin and video.user == user
  end
end
