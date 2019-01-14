FactoryBot.define do
  factory :idea do

    title { Faker::Space.launch_vehicule }
    description { Faker::Lorem.paragraph(1, true, 3) }
  end
end
