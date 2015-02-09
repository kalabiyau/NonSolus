class Activity < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_one :creator, class_name: "User"
end

