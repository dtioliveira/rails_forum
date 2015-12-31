class Relationship < ActiveRecord::Base
  has_enumeration_for :situation, with: RelationshipSituation, create_helpers: { prefix: true }

  scope :by_situation, -> (param) do
    where(situation: param)
  end

  def adder_user
    User.find(adder_id)
  end

  def added_user
    User.find(added_id)
  end

  def displaying_for(user)
    user == adder_user ? added_user : adder_user
  end
end
