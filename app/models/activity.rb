class Activity < ActiveRecord::Base

  include ActivityConcern
  include Filterable

  has_and_belongs_to_many :users
  belongs_to :creator, class_name: User
  belongs_to :category

  delegate :color, to: :category, allow_nil: true
  delegate :icon, to: :category, allow_nil: true

  validates :creator, :name, :description, :category, presence: true
  validates :name, uniqueness: true

  scope :name_like, lambda{|l|  where('lower(name) LIKE :l or lower(description) LIKE :l', l: "%#{l}%")}
  scope :urgent, lambda { |u| where(urgent: true) }
  scope :category, lambda {|c| joins(:category).where(categories: { name: c})}

  default_scope { includes(:creator, :category).order(id: :desc) }

end

