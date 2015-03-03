class Activity < ActiveRecord::Base

  include ActivityConcern

  has_and_belongs_to_many :users
  has_one :creator, class_name: User
  validates :name, presence: true
  validates :name, uniqueness: true

  scope :name_like, lambda{|l|  where('name LIKE :l', l: "%#{l}%")}
  default_scope { order(id: :desc) }

end

