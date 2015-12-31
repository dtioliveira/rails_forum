# I'm pretty sure I'm a top-level class documentation comment
class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, polymorphic: true
end
