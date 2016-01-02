class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
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
    user.is_admin and post.user == user
  end

  def update?
    user.is_admin and post.user == user
  end

  def destroy?
    user.is_admin and post.user == user
  end
end
