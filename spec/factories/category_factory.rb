FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.word }
    color { Faker::Color.name }
    icon { Faker.letterify('fa-????????') }
  end
end
