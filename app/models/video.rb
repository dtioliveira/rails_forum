class Video < ActiveRecord::Base
  belongs_to :user

  validates :url, :title, presence: true

  def parse_url
     regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
     url.match(regex)[1]
  end
end
