FactoryGirl.define do

  factory :activity do
    sequence(:name) { Faker::Movie.title }
  end

end
