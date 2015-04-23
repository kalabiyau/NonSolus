class Activity < ActiveRecord::Base

  CAPACITY_OPTIONS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 25, 50, 100]

  include ActivityConcern
  include Filterable

  has_many :participations
  has_many :users, through: :participations
  has_many :comments

  belongs_to :creator, class_name: User
  belongs_to :category

  delegate :color, to: :category, allow_nil: true
  delegate :icon, to: :category, allow_nil: true

  validates :creator, :name, :description, :category, presence: true
  validates :urgent, inclusion: { in: [true, false] }
  validates :capacity, numericality: true

  validates :name, uniqueness: true

  scope :name_like, lambda{|l|  where('lower(name) LIKE :l or lower(description) LIKE :l', l: "%#{l}%")}
  scope :urgent, lambda { |u| where(urgent: true) }
  scope :category, lambda {|c| joins(:category).where(categories: { name: c})}
  scope :creator, lambda {|c| joins(:creator).where(creator_id: c)}

  default_scope { order(id: :desc) }

  def full?
    capacity > 0 && capacity == users.count
  end

end

