# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Idea.destroy_all

25.times do 

    created_at = Faker::Date.backward(60)

    i = Idea.create(
        title: Faker::Lorem.sentence(1, true, 2),
        description: Faker::Lorem.paragraph(3, true, 3),
        created_at: created_at,
        updated_at: created_at
    )

end

ideas = Idea.all

puts Cowsay.say("Generated #{ideas.count} ideas", :dragon)