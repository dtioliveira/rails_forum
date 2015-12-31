# I'm pretty sure I'm a top-level class documentation comment
class AverageCache < ActiveRecord::Base
  belongs_to :rater, class_name: 'User'
  belongs_to :rateable, polymorphic: true
end
