class Video < ActiveRecord::Base
  ratyrate_rateable "like"
  
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :url, :title, presence: true
  validates :url, format: { with: /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/, multiline: true }

  def parse_url
     regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
     url.match(regex)[1]
  end
end
