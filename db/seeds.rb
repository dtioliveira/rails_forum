10.times.each_with_index do |i|
  User.create!(email: "usuario#{i+1}@cursify.com.br", password: "user1234")
end
