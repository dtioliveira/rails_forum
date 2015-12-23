class RelationshipSituation < EnumerateIt::Base
  associate_values :pending, :accepted, :rejected
end
