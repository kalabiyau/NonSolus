FactoryGirl.define do

  factory :user do
    sequence(:first_name) { Faker::Name.first_name }
    sequence(:last_name) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    sequence(:novell_username) {|n| "#{Faker::Internet.user_name}#{n}" }
    sequence(:webid) { Faker.numerify('#######') }
  end

end
