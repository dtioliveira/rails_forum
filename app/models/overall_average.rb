# I'm pretty sure I'm a top-level class documentation comment
class OverallAverage < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
end
