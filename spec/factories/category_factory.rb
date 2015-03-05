FactoryGirl.define do
  factory :category do
    sequence(:name) { Faker::Lorem.word }
  end
end
