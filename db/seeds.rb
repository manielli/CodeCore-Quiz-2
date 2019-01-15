# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all
User.destroy_all

PASSWORD = "supersecret"

super_user = User.create(
    first_name: "Jon",
    last_name: "Snow",
    email: "js@winterfell.gov",
    password: "daenerystargaryen",
    admin: true
)

10.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}-#{last_name.downcase}@example.com",
        password: PASSWORD
    )
end

users = User.all

25.times do 

    created_at = Faker::Date.backward(60)

    i = Idea.create(
        title: Faker::Lorem.sentence(1, true, 3),
        description: Faker::Lorem.paragraph(3, true, 3),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )

end

ideas = Idea.all

puts Cowsay.say("Generated #{ideas.count} ideas", :dragon)
puts Cowsay.say("Generated #{users.count} users", :dragon)
puts Cowsay.say("Login with #{super_user.email} and password: daenerystargaryen", :dragon)