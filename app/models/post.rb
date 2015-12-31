class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  ratyrate_rateable "like"

  belongs_to :user
  has_many :comments, as: :commentable

  validates :title_pt, :tags_pt, :text_pt,
            :title_es, :tags_es, :text_es,
             presence: true

  def title
    I18n.locale == :'pt-BR' ? 'title_pt' : 'title_es'
  end

  def tag_list(locale)
    send("tags_" + locale).gsub(";","").split(",").reject{|t| t.blank?}
  end
end
