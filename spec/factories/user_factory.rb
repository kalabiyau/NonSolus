FactoryGirl.define do

  factory :user do
    sequence(:first_name) { Faker::Name.first_name }
    sequence(:last_name) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    sequence(:username) {|n| "#{Faker::Internet.user_name}#{n}" }
    sequence(:workforceid) { Faker.numerify('#######') }
    sequence(:subscriber) { false }
  end
end
