class Relationship < ActiveRecord::Base
  has_enumeration_for :situation, with: RelationshipSituation, create_helpers: { prefix: true }

  scope :by_situation, -> (param) do
    where(situation: param)
  end
end
