# I'm pretty sure I'm a top-level class documentation comment
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :text, presence: true

  before_create :set_locale

  scope :by_locale, -> (param) { where(locale: param) }

  private

  def set_locale
    self.locale = I18n.locale
  end
end
