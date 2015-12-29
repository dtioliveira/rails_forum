class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ratyrate_rater

  has_enumeration_for :status, with: UserStatus, create_helpers: { prefix: true }

  has_many :videos, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify

  def friends
    Relationship.where('adder_id = :id OR added_id = :id', id: self.id).by_situation('accepted')
  end

  def has_relationship?(user)
    Relationship.where('adder_id = :user_id AND added_id = :id OR adder_id = :id AND added_id = :user_id',
    id: self.id, user_id: user.id)
  end

  def active_for_authentication?
    super && self.status_active?
  end
end
