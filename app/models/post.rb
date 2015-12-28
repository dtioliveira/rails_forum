class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :tags, :text, presence: true
end
