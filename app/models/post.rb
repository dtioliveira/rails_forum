# I'm pretty sure I'm a top-level class documentation comment
class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  ratyrate_rateable 'like'

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title_pt, :tags_pt, :text_pt,
            :title_es, :tags_es, :text_es,
            presence: true

  def title
    I18n.locale == :'pt-BR' ? 'title_pt' : 'title_es'
  end

  def tag_list(locale)
    send('tags_' + locale).delete(';').split(',').reject(&:blank?)
  end

  def self.search(params)
    posts = Post.order(created_at: :desc)
    posts = posts.where('lower(title_pt) LIKE :term || lower(tags_pt) LIKE :term',
            term: "%#{params[:term].downcase}%") if params[:term].present?
    posts
  end
end
