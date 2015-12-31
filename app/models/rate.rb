# I'm pretty sure I'm a top-level class documentation comment
class Rate < ActiveRecord::Base
  belongs_to :rater, class_name: 'User'
  belongs_to :rateable, polymorphic: true

  # attr_accessible :rate, :dimension

end
