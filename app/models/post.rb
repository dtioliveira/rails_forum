class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :tags, :text, presence: true
end
