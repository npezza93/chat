# frozen_string_literal: true

admin = User.create(
  first_name: "Nick",
  last_name: "Pezza",
  password: "password",
  email: "admin@admin.com",
  image: open(Faker::Avatar.image)
)

def create_user
  name = Faker::StarWars.character

  User.create(
    first_name: name.split(" ")[0],
    last_name: name.split(" ")[1],
    password: "password",
    email: "#{name.parameterize}@chat.com",
    image: open(Faker::Avatar.image)
  ).id
end

5.times do |i|
  conversation = Chat::Conversation.create(user_ids: [create_user, admin.id])

  i.times do
    conversation.reload.sessions.create(user_id: create_user)
  end
end
