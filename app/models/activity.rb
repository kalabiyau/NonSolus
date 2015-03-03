class Activity < ActiveRecord::Base

  include ActivityConcern

  has_and_belongs_to_many :users
  has_one :creator, class_name: User
  validates :name, presence: true
  validates :name, uniqueness: true

end

