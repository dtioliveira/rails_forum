class Relationship < ActiveRecord::Base

  scope :accepted, -> { where(situation: 'accepted')  }
end
