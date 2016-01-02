# I'm pretty sure I'm a top-level class documentation comment
class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  ratyrate_rateable 'like'

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :url, :title_pt, :title_es, :tags_pt, :tags_es, presence: true
  validates :url, format: {
    with: /^(?:https?:\/\/)?(?:www.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/,
    multiline: true
  }

  def title
    I18n.locale == :'pt-BR' ? 'title_pt' : 'title_es'
  end

  def parse_url
    regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
    url.match(regex)[1]
  end

  def tag_list(locale)
    send('tags_' + locale).delete(';').split(',').reject(&:blank?)
  end

  def self.search(params)
    videos = Video.order(created_at: :desc)
    videos = videos.where('lower(title_pt) LIKE :term || lower(tags_pt) LIKE :term',
            term: "%#{params[:term].downcase}%") if params[:term].present?
    videos
  end
end
