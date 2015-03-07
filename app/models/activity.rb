class Activity < ActiveRecord::Base

  include ActivityConcern

  has_and_belongs_to_many :users
  belongs_to :creator, class_name: User
  belongs_to :category

  delegate :color, to: :category, allow_nil: true
  delegate :icon, to: :category, allow_nil: true

  validates :creator, :name, :description, :category, presence: true
  validates :name, uniqueness: true

  scope :name_like, lambda{|l|  where('lower(name) LIKE :l', l: "%#{l}%")}
  default_scope { order(id: :desc) }

end

