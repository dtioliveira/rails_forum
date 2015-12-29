class Post < ActiveRecord::Base
  ratyrate_rateable "like"

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :tags, :text, presence: true
end
