class UserStatus < EnumerateIt::Base
  associate_values :banned, :active
end
