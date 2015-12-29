class Post < ActiveRecord::Base
  ratyrate_rateable "like"

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, :tags, :text, presence: true

  def tag_list
    tags.gsub(";","").split(",").reject{|t| t.blank?}
  end
end
