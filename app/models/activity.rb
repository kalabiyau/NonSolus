class Activity < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_one :creator, class_name: User
  validates_presence_of :name
  validates_uniqueness_of :name
end

