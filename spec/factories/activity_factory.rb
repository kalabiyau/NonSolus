FactoryGirl.define do

  factory :activity do
    sequence(:name) { Faker::Movie.title }
    sequence(:description) { Faker::Lorem.word }
  end
end
