FactoryGirl.define do

  factory :activity do
    sequence(:name) { Faker::Lorem.word  }
  end

end
