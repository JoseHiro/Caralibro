# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# accounts


20.times do |n|
  select_name = Faker::Sports::Football.player
  address = "#{Faker::Sports::Football.team.split(" ")[0]}@com"

  while User.exists?(name: select_name)
    select_name = Faker::Sports::Football.player
  end

  while User.exists?(email: address)
    address = "#{Faker::Sports::Football.team.split(" ")[0]}@com"
  end

  user_now = User.new(
    name: select_name,
    email: address,
    password: "111111"
  )

  user_now.save

  3.times do |t|
    Post.create(
      content: Faker::Quote.famous_last_words,
      user_id: user_now.id
    )
  end
end
