FactoryGirl.define do

  factory :activity do
    sequence(:name) { Faker::Movie.title }
    sequence(:description) { Faker::Lorem.word }
    category { Category.limit(1).order('RANDOM()').first || create(:category)}
    association :creator, factory: :user
    urgent false
    capacity 0
  end

end
