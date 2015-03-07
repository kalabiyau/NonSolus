class Activity < ActiveRecord::Base

  include ActivityConcern

  has_and_belongs_to_many :users
  has_one :creator, class_name: User
  belongs_to :category

  delegate :color, to: :category, allow_nil: true
  delegate :icon, to: :category, allow_nil: true

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :category, presence: true

  scope :name_like, lambda{|l|  where('name LIKE :l', l: "%#{l}%")}
  default_scope { order(id: :desc) }

end

