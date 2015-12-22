User.create!(email: "usuario1@cursify.com.br", password: "user1234")
User.create!(email: "usuario2@cursify.com.br", password: "user1234")
User.create!(email: "usuario3@cursify.com.br", password: "user1234")

User.create!(email: "usuario4@cursify.com.br", password: "user1234", is_admin: true)
User.create!(email: "usuario5@cursify.com.br", password: "user1234", is_admin: true)
User.create!(email: "usuario6@cursify.com.br", password: "user1234", is_admin: true, access_level: 1)
