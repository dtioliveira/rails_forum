# I'm pretty sure I'm a top-level class documentation comment
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  ratyrate_rater

  has_enumeration_for :status,
  with: UserStatus, create_helpers: { prefix: true }

  has_many :videos, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify

  def friends
    Relationship.where(
      'adder_id = :id OR added_id = :id', id: id
    ).by_situation('accepted')
  end

  def relationship?(user)
    Relationship.where(
      'adder_id = :user_id AND added_id = :id OR
      adder_id = :id AND added_id = :user_id',
      id: id, user_id: user.id
    )
  end

  def active_for_authentication?
    super && self.status_active?
  end

  def self.search(params)
    users = User.order(created_at: :desc)
    users = users.where('lower(name) LIKE :term || lower(email) LIKE :term',
            term: "%#{params[:term].downcase}%") if params[:term].present?
    users
  end
end
